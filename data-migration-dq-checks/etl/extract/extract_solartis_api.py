import pandas as pd
import requests
import os
import json
import logging
import io
import re
import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed

# ------------------------- CONFIG ------------------------- #

PROCESS_SUBMISSIONS = False
PROCESS_QUOTES = False
PROCESS_POLICIES = True

TEMPLATE_DIR = 'assets/template_request_files'
LOG_FILE = "script.log"

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler(LOG_FILE),
        logging.StreamHandler()
    ]
)

API_URLS = {
    "submission": {
        "find": "https://gatewayservice.solartis.net/gateway/api/FindSubmission",
        "get": "https://gatewayservice.solartis.net/gateway/api/GetSubmission"
    },
    "quote": {
        "find": "https://gatewayservice.solartis.net/gateway/api/FindQuote",
        "get": "https://gatewayservice.solartis.net/gateway/api/GetQuote"
    },
    "policy": {
        "find": "https://gatewayservice.solartis.net/gateway/api/FindPolicy",
        "get": "https://gatewayservice.solartis.net/gateway/api/GetPolicy"
    },
    "notes": "https://gatewayservice.solartis.net/gateway/api/GetDiaryNotes",
    "documents": "https://gatewayservice.solartis.net/gateway/api/GetDocuments"
}

# Environment variables
admin_user = "admin-fe@coverwhale.com"
admin_password = "h32D3TmVj.!bEntu9"
client_id = "Gg8IlqjbAk1G8zwHbbqcnROApYnJob0m"
client_secret = "WnnGowzxfra0R8Lnx7sxHaZ4hcb_VaTEZ6WQ1oHGZxP2Sdy93ODK3BgtDqjOGEK4"

TOKEN_URL = "https://prime-coverwhale-dev.us.auth0.com/oauth/token"

# ------------------------- ARGUMENT PARSING ------------------------- #

def parse_args():
    parser = argparse.ArgumentParser(description="Run Solartis data pull.")
    parser.add_argument("--date", help="Override date folder (format: YYYY-MM-DD)")
    return parser.parse_args()

# ------------------------- HELPER FUNCTIONS ------------------------- #

def get_latest_dated_folder(model):
    model_dir = os.path.join('data', 'processed', model)
    if not os.path.isdir(model_dir):
        raise ValueError(f"❌ Directory does not exist: {model_dir}")
    
    folders = [
        name for name in os.listdir(model_dir)
        if re.match(r'\d{4}-\d{2}-\d{2}', name) and os.path.isdir(os.path.join(model_dir, name))
    ]
    if not folders:
        raise ValueError(f"❌ No date folders found in: {model_dir}")
    return sorted(folders)[-1]

def get_date_or_latest(model, override_date):
    if override_date:
        path = os.path.join("data", "processed", model, override_date)
        if not os.path.exists(path):
            raise ValueError(f"❌ Specified date folder does not exist: {path}")
        return override_date
    return get_latest_dated_folder(model)

def get_number_field(model):
    return {
        "wip": "SubmissionNumber",
        "quote": "QuoteNumber",
        "policy": "QuoteNumber"
    }[model]

def fetch_token(username, password, client_id, audience_url, client_secret):
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
    with open(os.path.join(TEMPLATE_DIR, filename), 'r') as file:
        return json.load(file)

def append_json_to_file(json_data, filename):
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, 'a') as file:
        file.write(json.dumps(json_data) + "\n")

def fetch_notes_and_documents(record_id, model, headers, files):
    try:
        notes_payload = {"ID": record_id}
        notes_response = requests.post(API_URLS["notes"], headers=headers, json=notes_payload)
        notes_response.raise_for_status()
        append_json_to_file(notes_response.json(), files[model]['notes'])

        docs_payload = {"ID": record_id}
        docs_response = requests.post(API_URLS["documents"], headers=headers, json=docs_payload)
        docs_response.raise_for_status()
        append_json_to_file(docs_response.json(), files[model]['documents'])
    except Exception as e:
        logging.error(f"❌ Failed to fetch notes/documents for {model} ID {record_id}: {e}")

def process_record(record_number, model, headers, files):
    try:
        find_payload = load_json_template(f"find_{model}.json")
        find_payload[get_number_field(model)] = record_number

        find_url = API_URLS[model]['find']
        get_url = API_URLS[model]['get']

        response = requests.post(find_url, headers=headers, json=find_payload)
        response.raise_for_status()
        result_list = response.json().get(model.capitalize(), [])
        record_id = result_list[0].get("ID") if result_list else None

        if record_id:
            get_payload = load_json_template(f"get_{model}.json")
            get_payload["ID"] = record_id
            response = requests.post(get_url, headers=headers, json=get_payload)
            response.raise_for_status()
            append_json_to_file(response.json(), files[model]['output'])

            fetch_notes_and_documents(record_id, model, headers, files)
            return f"✅ Processed: {record_number}, ID: {record_id}"
        else:
            return f"⚠️ No data returned for: {record_number}"

    except Exception as e:
        return f"❌ Error processing {record_number}: {e}"

def run_model(model, headers, files):
    csv_path = files[model]['csv']
    df = pd.read_csv(csv_path)
    record_column = get_number_field(model)
    record_numbers = df[record_column].astype(str).tolist()
    total = len(record_numbers)
    logging.info(f"📌 Loaded {total} {model} numbers from {csv_path}")

    records_added = 0
    with ThreadPoolExecutor(max_workers=5) as executor:
        futures = {executor.submit(process_record, num, model, headers, files): num for num in record_numbers}
        for future in as_completed(futures):
            result = future.result()
            logging.info(result)
            if "✅" in result:
                records_added += 1

    logging.info(f"🎉 Done processing {model}s. Total: {total}, Added: {records_added}")

# ------------------------- MAIN ------------------------- #

def main():
    args = parse_args()
    override_date = args.date

    try:
        WIP_DATE = get_date_or_latest("WIP", override_date)
        QUOTE_DATE = get_date_or_latest("Quotes", override_date)
        POLICY_DATE = get_date_or_latest("Policy", override_date)
    except ValueError as e:
        logging.error(str(e))
        return

    files = {
        "submission": {
            "csv": os.path.join("data", "processed", "Wip", WIP_DATE, 'submision.csv'),
            "output": os.path.join("data", "processed", "Wip", WIP_DATE, 'solartis_wip.json'),
            "notes": os.path.join("data", "processed", "Wip", WIP_DATE, 'solartis_wip_notes.json'),
            "documents": os.path.join("data", "processed", "Wip", WIP_DATE, 'solartis_wip_documents.json')
        },
        "quote": {
            "csv": os.path.join("data", "processed", "Quotes", QUOTE_DATE, 'Migration Template.csv'),
            "output": os.path.join("data", "processed", "Quotes", QUOTE_DATE, 'solartis_quotes.json'),
            "notes": os.path.join("data", "processed", "Quotes", QUOTE_DATE, 'solartis_quotes_notes.json'),
            "documents": os.path.join("data", "processed", "Quotes", QUOTE_DATE, 'solartis_quotes_documents.json')
        },
        "policy": {
            "csv": os.path.join(f"data", "processed", "Policy", POLICY_DATE, 'Submissions_Policy_2025-03-14_segment.csv'),
            "output": os.path.join("data", "processed", "Policy", POLICY_DATE, 'solartis_policies.json'),
            "notes": os.path.join("data", "processed", "Policy", POLICY_DATE, 'solartis_policies_notes.json'),
            "documents": os.path.join("data", "processed", "Policy", POLICY_DATE, 'solartis_policies_documents.json')
        }
    }

    token = fetch_token(admin_user, admin_password, client_id, "https://gatewayservice.uat.solartis.net/gateway/", client_secret)
    headers = {
        "Authorization": f"Bearer {token}",
        "OwnerId": "16033",
        "Mode": "LIVE",
        "Environment": "15"
    }

    if PROCESS_SUBMISSIONS:
        run_model("submission", headers, files)
    if PROCESS_QUOTES:
        run_model("quote", headers, files)
    if PROCESS_POLICIES:
        run_model("policy", headers, files)

    logging.info("✅ Script completed successfully.")

if __name__ == "__main__":
    main()
