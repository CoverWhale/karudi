
create view IF NOT EXISTS solartis_policy.additional_insured as (
    SELECT 
        JSONExtractString(json, 'SubmissionNumber') AS SubmissionNumber,
        JSONExtractString(json, 'QuoteNumber') AS QuoteNumber,
        JSONExtractString(json, 'PolicyNumber') AS PolicyNumber,
        JSONExtractString(json, 'PolicySubNumber') AS PolicySubNumber,
        JSONExtractString(json, 'EndorsementNumber') AS EndorsementNumber,
        JSONExtractString(additional_insured, 'Name') AS AdditionalInsuredName,
        JSONExtractString(address, 'StreetNumberAddress1') AS AdditionalInsuredStreetNumberAddress1,
        JSONExtractString(address, 'StreetNameAddress2') AS AdditionalInsuredStreetNameAddress2,
        JSONExtractString(address, 'City') AS AdditionalInsuredAddressCity,
        JSONExtractString(address, 'County') AS AdditionalInsuredAddressCounty,
        JSONExtractString(address, 'StateRegionCode') AS AdditionalInsuredAddressStateRegionCode,
        JSONExtractString(address, 'StateRegion') AS AdditionalInsuredAddressStateRegion,
        JSONExtractString(address, 'CountryCode') AS AdditionalInsuredAddressCountryCode,
        JSONExtractString(address, 'Country') AS AdditionalInsuredAddressCountry,
        JSONExtractString(address, 'Zipcode1') AS AdditionalInsuredAddressZipcode1,
        JSONExtractString(address, 'Zipcode2') AS AdditionalInsuredAddressZipcode2,
        JSONExtractString(address, 'FullAddress') AS AdditionalInsuredAddressFullAddress,
        JSONExtractString(address, 'AddressType') AS AdditionalInsuredAddressType,
        JSONExtractString(additional_insured, 'CoverageStartDate') AS AdditionalInsuredCoverageStartDate,
        JSONExtractString(additional_insured, 'ChangeEffectiveDate') AS AdditionalInsuredChangeEffectiveDate,
        JSONExtractString(additional_insured, 'CoverageStopDate') AS AdditionalInsuredCoverageStopDate,
        JSONExtractString(additional_insured, 'ChangeType') AS AdditionalInsuredChangeType
    FROM solartis_policy.raw_policies
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(json, 'Account'), 'Insured') AS insured
    ARRAY JOIN JSONExtractArrayRaw(insured, 'AdditionalInsured') AS additional_insured
    ARRAY JOIN JSONExtractArrayRaw(additional_insured, 'AdditionalInsuredAddress') AS address
)