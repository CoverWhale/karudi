create view if not exists solartis_wip_submissions.cargo_carried as (
with operations as (

    SELECT 
        JSONExtractString(json, 'SubmissionNumber') AS SubmissionNumber,
        JSONExtractString(json, 'QuoteNumber') AS QuoteNumber,
        JSONExtractString(json, 'PolicyNumber') AS PolicyNumber,
        JSONExtractString(json, 'PolicySubNumber') AS PolicySubNumber,
        JSONExtractString(json, 'EndorsementNumber') AS EndorsementNumber,
        JSONExtractRaw(JSONExtractRaw(insured, 'CommercialAutomobile'), 'Operations') AS operations
    FROM solartis_wip_submissions.raw_submissions
    ARRAY JOIN JSONExtractArrayRaw(JSONExtractRaw(json, 'Account'), 'Insured') AS insured
    )

SELECT 
    SubmissionNumber,
    QuoteNumber,
    PolicyNumber,
    PolicySubNumber,
    EndorsementNumber,
    JSONExtractString(cargo_carried, 'SelectedCargo') AS SelectedCargo
FROM operations
ARRAY JOIN JSONExtractArrayRaw(operations, 'CargoCarried') AS cargo_carried
)