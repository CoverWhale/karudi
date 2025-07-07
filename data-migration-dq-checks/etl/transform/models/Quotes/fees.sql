CREATE VIEW solartis_quotes.fees AS (
    SELECT 
        JSONExtractString(json, 'SubmissionNumber') AS SubmissionNumber,
        JSONExtractString(json, 'QuoteNumber') AS QuoteNumber,
        JSONExtractString(json, 'PolicyNumber') AS PolicyNumber,
        JSONExtractString(json, 'PolicySubNumber') AS PolicySubNumber,
        JSONExtractString(json, 'EndorsementNumber') AS EndorsementNumber,
        NULL AS AutoLiabilityFeeTaxable,
        NULL AS AutoLiabilityFeeName,
        NULL AS AutoLiabilityDescription,
        JSONExtractFloat(JSONExtractString(location, 'AutoLiability'), 'TotalFeeAmount') AS AutoLiabilityFeeAmount,
        NULL AS AutoPhysicalDamageFeeTaxable,
        NULL AS AutoPhysicalDamageFeeName,
        NULL AS AutoPhysicalDamageDescription,
        JSONExtractFloat(JSONExtractString(location, 'AutoPhysicalDamage'), 'TotalFeeAmount') AS AutoPhysicalDamageFeeAmount,
        NULL AS MotorTruckCargoFeeTaxable,
        NULL AS MotorTruckCargoFeeName,
        NULL AS MotorTruckCargoDescription,
        JSONExtractFloat(JSONExtractString(location, 'MotorTruckCargo'), 'TotalFeeAmount') AS MotorTruckCargoFeeAmount,
        NULL AS TruckersGeneralLiabilityFeeTaxable,
        NULL AS TruckersGeneralLiabilityFeeName,
        NULL AS TruckersGeneralLiabilityDescription,
        JSONExtractFloat(JSONExtractString(location, 'TruckersGeneralLiability'), 'TotalFeeAmount') AS TruckersGeneralLiabilityFeeAmount,
        NULL AS NonTruckingLiabilityFeeTaxable,
        NULL AS NonTruckingLiabilityFeeName,
        NULL AS NonTruckingLiabilityDescription,
        JSONExtractFloat(JSONExtractString(location, 'NonTruckingLiability'), 'TotalFeeAmount') AS NonTruckingLiabilityFeeAmount
    FROM raw_submissions
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(json, 'Account'), 'Insured') AS insured
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(insured, 'CommercialAutomobile'), 'Location') AS location
);