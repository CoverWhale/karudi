-- create_table
CREATE TABLE IF NOT EXISTS solartis_wip_submissions.raw_documents (
    json String
) ENGINE = MergeTree()
ORDER BY tuple();