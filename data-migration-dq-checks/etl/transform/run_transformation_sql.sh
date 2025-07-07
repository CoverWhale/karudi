#!/bin/bash

CLICKHOUSE_HOST="localhost"
CLICKHOUSE_PORT="9000"
CLICKHOUSE_USER="default"
SQL_DIR="models/Policy"  # path to your SQL files

# Loop through all .sql files in the directory
for sql_file in "$SQL_DIR"/*.sql; do
    echo "Executing $sql_file..."
    clickhouse-client \
        --host="$CLICKHOUSE_HOST" \
        --port="$CLICKHOUSE_PORT" \
        --user="$CLICKHOUSE_USER" \
        --multiquery \
        < "$sql_file"

    if [ $? -ne 0 ]; then
        echo "Error executing $sql_file"
        exit 1
    fi
done

echo "All SQL files executed successfully."

