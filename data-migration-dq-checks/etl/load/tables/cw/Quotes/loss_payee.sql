CREATE TABLE IF NOT EXISTS cw_migration_quotes.loss_payee (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    VehicleNumber String,
    LossPayeeName String,
    LossPayeeCity String,
    LossPayeeState String,
    LossPayeePhoneNumber String,
    LossPayeeEmail String,
    LossPayeeZipCode1 String,
    LossPayeeStreetNumber1 String,
    LossPayeeStreetName2 String,
    LossPayeeCoverageStartDate String,
    LossPayeeChangeEffectiveDate String,
    LossPayeeCoverageStopDate String,
    LossPayeeChangeType String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;