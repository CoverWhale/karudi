-- create_table
CREATE TABLE IF NOT EXISTS solartis_quotes.raw_documents (
    json String
) ENGINE = MergeTree()
ORDER BY tuple();