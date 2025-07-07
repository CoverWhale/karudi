import os
import logging
import re
import sys
import time
import argparse
import clickhouse_connect
import pandas as pd  # To count CSV rows before inserting

# Configure logging
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

# ClickHouse Connection Settings
CLICKHOUSE_HOST = "localhost"
CLICKHOUSE_PORT = 8123
CLICKHOUSE_USER = "default"
CLICKHOUSE_PASSWORD = ""

# -------------------- Helpers -------------------- #

def get_client():
    return clickhouse_connect.get_client(
        host=CLICKHOUSE_HOST, port=CLICKHOUSE_PORT, username=CLICKHOUSE_USER, password=CLICKHOUSE_PASSWORD
    )


def get_latest_dated_folder(model):
    model_dir = os.path.join("data", "processed", model)
    if not os.path.isdir(model_dir):
        raise ValueError(f"❌ Directory does not exist: {model_dir}")
    
    folders = [
        name for name in os.listdir(model_dir)
        if re.match(r"\d{4}-\d{2}-\d{2}", name) and os.path.isdir(os.path.join(model_dir, name))
    ]

    if not folders:
        raise ValueError(f"❌ No date folders found in: {model_dir}")
    
    return sorted(folders)[-1]


def drop_database(database_name, client):
    try:
        client.command(f"DROP DATABASE IF EXISTS {database_name}")
        logging.info(f"✅ Dropped existing database `{database_name}`.")
    except Exception as e:
        logging.error(f"❌ Failed to drop database `{database_name}`: {e}")


def create_database(database_name, client):
    try:
        client.command(f"CREATE DATABASE {database_name}")
        logging.info(f"✅ Database `{database_name}` created.")
    except Exception as e:
        logging.error(f"❌ Failed to create database `{database_name}`: {e}")
        exit(1)


def execute_sql_file(database_name, sql_file, table_name, client):
    try:
        with open(sql_file, "r") as f:
            sql_query = f.read()
            sql_query = sql_query.replace("test.", f"{database_name}.")
            client.command(sql_query)
            logging.info(f"🗃️ Created table `{database_name}.{table_name}` from `{sql_file}`.")
    except Exception as e:
        logging.error(f"❌ Failed to execute SQL file `{sql_file}`: {e}")


def count_csv_rows(csv_path):
    try:
        df = pd.read_csv(csv_path)
        return len(df)
    except Exception as e:
        logging.error(f"❌ Failed to count rows in `{csv_path}`: {e}")
        return 0


def insert_csv_data(database_name, table_name, csv_path, client):
    try:
        row_count = count_csv_rows(csv_path)
        query = f"INSERT INTO {database_name}.{table_name} FORMAT CSVWithNames"
        with open(csv_path, "rb") as f:
            client.command(query, data=f.read())
        logging.info(f"📥 Inserted {row_count} rows from `{csv_path}` into `{database_name}.{table_name}`.")
    except Exception as e:
        logging.error(f"❌ Failed to insert `{csv_path}`: {e}")


def extract_table_name_from_csv(csv_filename, model_name):
    """
    Extracts the table name from CSV file based on model. Assumes files are named like:
    - Submissions_WIP_YYYY-MM-DD_segment.csv
    - Drivers_Quotes_YYYY_MM_DD_segment.csv
    - Policies_Policy_YYYY_MM_DD_segment.csv
    """
    base = os.path.basename(csv_filename)
    model_name = model_name.lower()

    # Remove model/date/suffix
    cleaned = re.sub(rf"_{model_name}_\d{{4}}[_-]\d{{2}}[_-]\d{{2}}_segment.*$", "", base, flags=re.IGNORECASE)

    # Remove suffix
    cleaned = re.sub(r'\.[^.]+$','',cleaned)

    # Convert CamelCase to snake_case
    snake_case = re.sub(r'(?<!^)(?=[A-Z])', '_', re.sub(r'\s+', '', cleaned)).lower()

    return snake_case


def load_csvs_to_clickhouse(model_name, date_override=None):
    if model_name == 'wip':
        model_name = model_name.upper()
    else:
        model_name = model_name.capitalize()
    if date_override:
        target_date = date_override
        date_dir = os.path.join("data", "processed", model_name, target_date)
        if not os.path.exists(date_dir):
            logging.error(f"❌ Specified date folder `{date_dir}` does not exist.")
            return
    else:
        try:
            target_date = get_latest_dated_folder(model_name)
        except ValueError as e:
            logging.error(str(e))
            return


    csv_dir = os.path.join("data", "processed", model_name, target_date)
    sql_dir = os.path.join("etl", "load", "tables", "cw", model_name)

    if not os.path.exists(csv_dir):
        logging.error(f"❌ CSV directory `{csv_dir}` does not exist.")
        return

    database_name = f"cw_migration_{model_name.lower()}"
    client = get_client()

    drop_database(database_name, client)
    create_database(database_name, client)

    sql_files = [f for f in os.listdir(sql_dir) if f.endswith(".sql")]
    table_map = {}
    for sql_file in sql_files:
        sql_file_path = os.path.join(sql_dir, sql_file)
        table_name = os.path.splitext(sql_file)[0].lower()
        table_map[table_name] = sql_file_path
        execute_sql_file(database_name, sql_file_path, table_name, client)

    for file_name in os.listdir(csv_dir):
        if file_name.endswith(".csv"):
            table_name = extract_table_name_from_csv(file_name, model_name)
            if table_name not in table_map:
                logging.warning(f"⚠️ No SQL definition found for `{table_name}`, skipping `{file_name}`.")
                continue

            csv_path = os.path.join(csv_dir, file_name)
            insert_csv_data(database_name, table_name, csv_path, client)

    logging.info(f"✅ Done! `{model_name}` data has been loaded into `{database_name}`.")


# -------------------- CLI Entry -------------------- #

def parse_args():
    parser = argparse.ArgumentParser(description="Load CSVs from data model into ClickHouse.")
    parser.add_argument("model", help="Model to process (WIP, Quotes, Policy, or all)")
    parser.add_argument("-d", "--date", help="Optional date override in YYYY-MM-DD format")
    return parser.parse_args()



if __name__ == "__main__":
    args = parse_args()
    model = args.model.lower()
    date_override = args.date

    valid_models = ["wip", "quotes", "policy"]

    if model == "all":
        for m in valid_models:
            logging.info(f"\n🚀 Starting data load for `{m}` model...")
            load_csvs_to_clickhouse(m, date_override)
            time.sleep(1)
    elif model in valid_models:
        logging.info(f"\n🚀 Starting data load for `{model}` model...")
        load_csvs_to_clickhouse(model, date_override)
    else:
        logging.error(f"❌ Invalid model '{model}'. Choose from: WIP, Quotes, Policy, or all.")

