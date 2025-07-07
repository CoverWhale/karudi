-- create_table
CREATE TABLE IF NOT EXISTS solartis_policy.raw_policies (
    json String
) ENGINE = MergeTree()
ORDER BY tuple();