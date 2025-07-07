import pandas as pd
import requests
import os
import json
import logging
import io
from concurrent.futures import ThreadPoolExecutor, as_completed

# Configure logging to both file and console
LOG_FILE = "script.log"
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler(LOG_FILE),  # Save logs to a file
        logging.StreamHandler()  # Print logs to console
    ]
)

# Configuration
TEMPLATE_DIR = 'assets/template_request_files'
OUTPUT_JSON_FILE = 'data/processed/WIP/solartis_wip_submissions.json'
WIP_CSV_FILE = 'data/processed/WIP/Submissions_WIP_2025-03-07_segment.csv'
QUOTE_CSV_FILE = ''
POLICY_CSV_FILE = ''

API_URLS = {
    "find_submission": "https://gatewayservice.solartis.net/gateway/api/FindSubmission",
    "get_submission": "https://gatewayservice.solartis.net/gateway/api/GetSubmission",
    "find_quote": "https://gatewayservice.solartis.net/gateway/api/FindQuote",
    "get_quote": "https://gatewayservice.solartis.net/gateway/api/GetQuote",
    "find_policy": "https://gatewayservice.solartis.net/gateway/api/FindPolicy",
    "get_policy": "https://gatewayservice.solartis.net/gateway/api/GetPolicy"
}

# Environment variables
admin_user = "admin-fe@coverwhale.com"
admin_password = "h32D3TmVj.!bEntu9"
client_id = "Gg8IlqjbAk1G8zwHbbqcnROApYnJob0m"
client_secret = "WnnGowzxfra0R8Lnx7sxHaZ4hcb_VaTEZ6WQ1oHGZxP2Sdy93ODK3BgtDqjOGEK4"

# Define URLs
TOKEN_URL = "https://prime-coverwhale-dev.us.auth0.com/oauth/token"

def fetch_token(username, password, client_id, audience_url, client_secret):
    """Retrieve an access token."""
    payload = {
        "username": username,
        "password": password,
        "client_id": client_id,
        "audience": audience_url,
        "client_secret": client_secret,
        "grant_type": "password"
    }
    response = requests.post(TOKEN_URL, json=payload)
    response.raise_for_status()
    return response.json()["access_token"]

def load_json_template(filename):
    """Load JSON data from a file."""
    with open(os.path.join(TEMPLATE_DIR, filename), 'r') as file:
        return json.load(file)

def append_json_to_file(json_data, filename):
    """Append a JSON object as a new line in a JSON file."""
    with open(filename, 'a') as file:
        file.write(json.dumps(json_data) + "\n")

def process_submission(submission_number, headers):
    """Process a single submission and return success or failure."""
    try:
        find_submission_payload = load_json_template("find_submission.json")
        find_submission_payload["SubmissionNumber"] = submission_number

        response = requests.post(API_URLS["find_submission"], headers=headers, json=find_submission_payload)
        response.raise_for_status()
        submission_list = response.json().get("Submission", [])
        submission_id = submission_list[0].get("ID") if submission_list else None

        if submission_id:
            get_submission_payload = load_json_template("get_submission.json")
            get_submission_payload["ID"] = submission_id

            response = requests.post(API_URLS["get_submission"], headers=headers, json=get_submission_payload)
            response.raise_for_status()
            json_data = response.json()

            append_json_to_file(json_data, OUTPUT_JSON_FILE)
            return f"✅ Processed: {submission_number}, ID: {submission_id}"
        else:
            return f"⚠️ No data returned for: {submission_number}"

    except Exception as e:
        return f"❌ Error processing {submission_number}: {e}"

def main():
    logging.info("🚀 Starting script execution...")
    token_solartis = fetch_token(admin_user, admin_password, client_id, "https://gatewayservice.uat.solartis.net/gateway/", client_secret)
    logging.info("✅ API token fetched successfully.")

    workflow_header = {
        "Authorization": f"Bearer {token_solartis}",
        "OwnerId": "16033",
        "Mode": "TEST",
        "Environment": "45"
    }

    csv_file = pd.read_csv(CSV_FILE)
    submission_numbers = csv_file['SubmissionNumber'].astype(str).tolist()
    
    total_submissions = len(submission_numbers)
    logging.info(f"📌 Loaded {total_submissions} submission numbers from CSV file.")

    records_added = 0

    # **Use ThreadPoolExecutor to parallelize API calls**
    max_workers = 5  # Adjust the number of threads based on API limits
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        future_to_submission = {executor.submit(process_submission, submission, workflow_header): submission for submission in submission_numbers}

        for future in as_completed(future_to_submission):
            result = future.result()
            logging.info(result)
            if "✅" in result:
                records_added += 1

    logging.info(f"🎉 Script execution complete. Processed {total_submissions} submissions. Total records added: {records_added}")

if __name__ == "__main__":
    main()
