CREATE TABLE IF NOT EXISTS cw_migration_quotes.solartis_documents (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    SublinePolicyNumber String,
    SolartisDocumentType String,
    SolartisDocumentDisplayName String,
    SolartisRelativePath String,
    SolartisGeneratedBy String,
    SolartisDocumentDescription String,
    SolartisDocumentName String,
    SolartisGeneratedDate String,
    SolartisDocumentUrl String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;