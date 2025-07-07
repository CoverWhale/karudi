CREATE TABLE IF NOT EXISTS cw_migration_wip.notes (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    NotesDescription String,
    Category String,
    CreatedDate String,
    DueDate String,
    IsCarrierNote String,
    AssignedTo String,
    IsPrivate String,
    DashboardReminder String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;