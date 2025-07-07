import json
import clickhouse_connect
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    handlers=[
        logging.FileHandler("load_to_clickhouse.log"),  # Log to a file
        logging.StreamHandler()  # Log to the console
    ]
)
logger = logging.getLogger(__name__)

# Connect to ClickHouse
client = clickhouse_connect.get_client(
    host='localhost',
    port=8123,
    username='default'
)

# Function to execute SQL from a file
def execute_sql_from_file(file_path):
    try:
        with open(file_path, 'r') as file:
            sql_statement = file.read().strip()  # Read and remove leading/trailing whitespace
            client.command(sql_statement)
            logger.info(f"Executed SQL from {file_path} successfully!")
    except FileNotFoundError:
        logger.error(f"Error: SQL file '{file_path}' not found.")
        exit(1)
    except Exception as e:
        logger.error(f"Error executing SQL from {file_path}: {e}")
        exit(1)

# Step 1: Create the database
execute_sql_from_file("etl/load/tables/solartis/Policy/create_database.sql")

# Step 2: Create the table
execute_sql_from_file("etl/load/tables/solartis/Policy/raw_policies.sql")

# Load JSON file
json_file = "data/processed/Policy/2025-06-20/solartis_policies.json"  # Change to your actual JSON file path

# Initialize counters
records_parsed = 0
records_loaded = 0

# Read the file and parse all JSON objects
json_data = []
with open(json_file, 'r') as file:
    for line in file:
        line = line.strip()  # Remove leading/trailing whitespace
        if line:  # Skip empty lines
            records_parsed += 1  # Increment parsed counter
            try:
                # Parse the JSON object
                record = json.loads(line)
                json_data.append([json.dumps(record)])  # Wrap in a list for batch insert
            except json.JSONDecodeError as e:
                logger.error(f"Failed to parse line: {line}")
                logger.error(f"Error: {e}")

# Step 3: Batch insert all JSON objects
if json_data:
    try:
        client.insert("solartis_policy.raw_policies", json_data, column_names=["json"])
        records_loaded = len(json_data)  # Update loaded counter
        logger.info(f"Successfully loaded {records_loaded} records into ClickHouse.")
    except Exception as e:
        logger.error(f"Failed to insert records into ClickHouse: {e}")

# Log the final counts
logger.info(f"Total records parsed: {records_parsed}")
logger.info(f"Total records loaded: {records_loaded}")

# Close connection
client.close()