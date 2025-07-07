#!/bin/bash

# Source the secrets.sh file to load environment variables
source assets/secrets.sh

# Define the log directory and create it if it doesn't exist
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

# Define a timestamped log file
LOG_FILE="$LOG_DIR/pipeline_logs/run_$(date +'%Y%m%d_%H%M%S').log"

# Delete any existing CSV file in the current directory
#rm -f ./*.csv

# Capture the start time
start_time=$(date +%s)
start_timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script started at: $start_timestamp" | tee -a "$LOG_FILE"

# STEP 1: EXTRACT - Cover Whale PV1 Data from Google Drive
python3 etl/extract/extract_drive.py >> "$LOG_FILE" 2>&1

#STEP 2: EXTRACT - Solartis API Migrated Data 
python3 etl/extract/extract_solartis_api.py >> "$LOG_FILE" 2>&1

#STEP 3: LOAD - PV1 CSV Files to Clickhouse
python3 etl/load/csv_load_to_clickhouse.py >> "$LOG_FILE" 2>&1

#STEP 4: LOAD - Solartis JSON Files to Clickhouse
python3 etl/load/json_load_to_clickhouse.py >> "$LOG_FILE" 2>&1

#STEP 5: TRANSFORM - Flatten and normalize JSON Data to match PV1
bash etl/transform/run_transformation_sql.sh >> "$LOG_FILE" 2>&1

#STEP 6: DQ Checks - Run a Diff between PV1 <> Migrated Data for mismatches
python3 dq_checks/execute.py >> "$LOG_FILE" 2>&1

# Capture the end time
end_time=$(date +%s)
end_timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "Script ended at: $end_timestamp" | tee -a "$LOG_FILE"

# Calculate the duration
duration=$((end_time - start_time))
echo "Script execution time: $duration seconds" | tee -a "$LOG_FILE"

echo "Run completed. Log saved to $LOG_FILE"
