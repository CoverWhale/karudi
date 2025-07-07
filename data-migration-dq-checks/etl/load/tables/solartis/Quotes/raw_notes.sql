-- create_table
CREATE TABLE IF NOT EXISTS solartis_quotes.raw_notes (
    json String
) ENGINE = MergeTree()
ORDER BY tuple();