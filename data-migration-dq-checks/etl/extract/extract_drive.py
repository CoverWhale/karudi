import os
import zipfile
import logging
import re
import pandas as pd
from collections import defaultdict
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from google.oauth2 import service_account

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Configuration
GOOGLE_DRIVE_FOLDER_ID = '1PVsmoU5KTzM_qSEQcmoDfGFqft3ksh6a'  # Replace with actual folder ID
SERVICE_ACCOUNT_FILE = 'assets/data-migration-dq-checks.json'  # Replace with actual path

ZIP_FILE_PATTERN = re.compile(r"migration_file_(\d{4}-\d{2}-\d{2})_segment_\d+\.zip")

# Define local storage paths
DATA_DIR = "data"
ZIP_DIR = os.path.join(DATA_DIR, "zip")
EXTRACTED_DIR = os.path.join(DATA_DIR, "extracted")
PROCESSED_DIR = os.path.join(DATA_DIR, "processed")

# Ensure necessary directories exist
os.makedirs(ZIP_DIR, exist_ok=True)
os.makedirs(EXTRACTED_DIR, exist_ok=True)
os.makedirs(PROCESSED_DIR, exist_ok=True)

def authenticate_google_drive():
    """Authenticate with Google Drive using a service account."""
    creds = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=["https://www.googleapis.com/auth/drive"]
    )
    return build("drive", "v3", credentials=creds)

def get_latest_zip_files(drive_service, folder_id):
    """Fetch the latest zip files matching the naming convention from Google Drive."""
    query = f"'{folder_id}' in parents and trashed=false"
    results = drive_service.files().list(
        q=query,
        orderBy='name desc',
        fields="files(id, name)",
        supportsAllDrives=True,
        includeItemsFromAllDrives=True
    ).execute()
    files = results.get('files', [])

    # Extract the latest date from filenames
    latest_date = None
    filtered_files = []

    for file in files:
        match = ZIP_FILE_PATTERN.search(file['name'])
        if match:
            file_date = match.group(1)
            if latest_date is None or file_date > latest_date:
                latest_date = file_date

    # Collect all segments for the latest date
    for file in files:
        if latest_date and latest_date in file['name']:
            filtered_files.append(file)

    return latest_date, filtered_files

def download_and_extract_zip(drive_service, file_id, file_name):
    """Download and extract a zip file to the local `data/zip` and `data/extracted` directories."""
    zip_path = os.path.join(ZIP_DIR, file_name)

    # Download ZIP file
    request = drive_service.files().get_media(fileId=file_id)
    with open(zip_path, 'wb') as f:
        f.write(request.execute())

    extract_path = os.path.join(EXTRACTED_DIR, file_name.replace('.zip', ''))
    os.makedirs(extract_path, exist_ok=True)

    # Extract ZIP file
    with zipfile.ZipFile(zip_path, 'r') as zip_ref:
        zip_ref.extractall(extract_path)
        logging.info(f"Extracted {file_name} to {extract_path}")

    return extract_path

def find_csv_files(base_path):
    """
    Find CSV files in the new nested structure:
    data/python/migration/output/YYYY-MM-DD/model_type/*.csv
    Returns a list of tuples: (model_type, csv_file_path)
    """
    csv_files = []

    for root, dirs, files in os.walk(base_path):
        if re.search(r"data/python/migration/output/\d{4}-\d{2}-\d{2}/(WIP|Quotes|Policy)", root):
            model_type = os.path.basename(root)
            for file in files:
                if file.endswith(".csv"):
                    full_path = os.path.join(root, file)
                    csv_files.append((model_type, full_path))

    return csv_files

def extract_shared_subset(file_name):
    """Extract the shared subset of the file name to group related files.
    For filenames with spaces like 'Migration Template.csv', this will use the base name.
    """
    base_name = os.path.splitext(file_name)[0]  # remove .csv
    return base_name.strip()  # Ensure no leading/trailing whitespace  # Remove last segment

def process_csv_files(extracted_paths, latest_date):
    """Process extracted CSV files and save 9 consolidated CSVs locally."""
    data_model_groups = defaultdict(lambda: defaultdict(list))

    for extract_path in extracted_paths:
        csv_files = find_csv_files(extract_path)
        for model_type, file_path in csv_files:
            file_name = os.path.basename(file_path)
            shared_subset = extract_shared_subset(file_name)
            data_model_groups[model_type][shared_subset].append(file_path)

    output_files = []
    for model_type, subsets in data_model_groups.items():
        logging.info(f"Processing Data Model: {model_type}")

        # Add date-based folder structure
        model_output_dir = os.path.join(PROCESSED_DIR, model_type, latest_date)
        os.makedirs(model_output_dir, exist_ok=True)

        for shared_subset, file_list in subsets.items():
            logging.info(f"Processing subset: {shared_subset}")

            dfs = []
            for file_path in file_list:
                try:
                    df = pd.read_csv(file_path)
                    dfs.append(df)
                    logging.info(f"Loaded {file_path} with shape {df.shape}")
                except Exception as e:
                    logging.error(f"Failed to read {file_path}: {e}")

            if dfs:
                combined_df = pd.concat(dfs, ignore_index=True)
                output_file = os.path.join(model_output_dir, f"{shared_subset}.csv")
                combined_df.to_csv(output_file, index=False)
                logging.info(f"Saved processed CSV for {shared_subset} to {output_file}")
                output_files.append(output_file)
            else:
                logging.warning(f"No valid data found for {shared_subset}")

    return output_files

def main():
    logging.info("Starting extraction and processing script...")
    drive_service = authenticate_google_drive()

    # Step 1: Get latest ZIP files from Google Drive
    latest_date, zip_files = get_latest_zip_files(drive_service, GOOGLE_DRIVE_FOLDER_ID)

    if not zip_files:
        logging.info("No matching zip files found.")
        return

    logging.info(f"Processing ZIP files for the latest available date: {latest_date}")

    # Step 2: Download and extract ZIP files locally
    extracted_paths = []
    for zip_file in zip_files:
        file_id = zip_file['id']
        file_name = zip_file['name']
        logging.info(f"Downloading {file_name}...")
        extract_path = download_and_extract_zip(drive_service, file_id, file_name)
        extracted_paths.append(extract_path)

    # Step 3: Process extracted CSVs into 9 final CSVs
    output_files = process_csv_files(extracted_paths, latest_date)

    if output_files:
        logging.info("Final processed CSV files are saved in 'data/processed/' directory:")
        for output_file in output_files:
            logging.info(f" - {output_file}")
    else:
        logging.error("No processed CSV files were generated.")

    logging.info("All matching zip files extracted and processed.")

if __name__ == "__main__":
    main()
