CREATE VIEW solartis_quotes.loss_payee AS (
    SELECT 
        JSONExtractString(json, 'SubmissionNumber') AS SubmissionNumber,
        JSONExtractString(json, 'QuoteNumber') AS QuoteNumber,
        JSONExtractString(json, 'PolicyNumber') AS PolicyNumber,
        JSONExtractString(json, 'PolicySubNumber') AS PolicySubNumber,
        JSONExtractString(json, 'EndorsementNumber') AS EndorsementNumber,
        JSONExtractString(loss_payee, 'Name') AS LossPayeeName,
        JSONExtractString(loss_payee, 'City') AS LossPayeeCity,
        JSONExtractString(loss_payee, 'StateRegion') AS LossPayeeStateRegion,
        JSONExtractString(loss_payee, 'PhoneNumber1') AS LossPayeePhoneNumber1,
        JSONExtractString(loss_payee, 'Email') AS LossPayeeEmail,
        JSONExtractString(loss_payee, 'Zipcode1') AS LossPayeeZipcode1,
        JSONExtractString(loss_payee, 'StreetNumber1') AS LossPayeeStreetNumber1,
        JSONExtractString(loss_payee, 'StreetName2') AS LossPayeeStreetName2,
        JSONExtractString(loss_payee, 'CoverageStartDate') AS LossPayeeCoverageStartDate,
        JSONExtractString(loss_payee, 'ChangeEffectiveDate') AS LossPayeeChangeEffectiveDate,
        JSONExtractString(loss_payee, 'CoverageStopDate') AS LossPayeeCoverageStopDate,
        JSONExtractString(loss_payee, 'ChangeType') AS LossPayeeChangeType
    FROM raw_submissions
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(json, 'Account'), 'Insured') AS insured
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(insured, 'CommercialAutomobile'), 'Location') AS location
    ARRAY JOIN JSONExtractArrayRaw(location, 'VehicleSchedule') AS vehicle_schedule
    ARRAY JOIN JSONExtractArrayRaw(vehicle_schedule, 'LossPayee') AS loss_payee
);