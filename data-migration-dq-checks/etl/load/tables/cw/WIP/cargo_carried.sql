CREATE TABLE IF NOT EXISTS cw_migration_wip.cargo_carried (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    SelectedCargo String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;
