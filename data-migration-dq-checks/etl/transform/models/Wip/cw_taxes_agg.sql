CREATE VIEW IF NOT EXISTS cw_migration_wip.taxes_agg AS(
SELECT
  SubmissionNumber,
  sum(toFloat64(AutoLiabilityTaxAmount)) AS AutoLiabilityTaxAmount,
  sum(toFloat64(AutoPhysicalDamageTaxAmount)) AS AutoPhysicalDamageTaxAmount,
  sum(toFloat64(MotorTruckCargoTaxAmount)) AS MotorTruckCargoTaxAmount,
  sum(toFloat64(TruckersGeneralLiabilityTaxAmount)) AS TruckersGeneralLiabilityTaxAmount,
  sum(toFloat64(NonTruckingLiabilityTaxAmount)) AS NonTruckingLiabilityTaxAmount
FROM cw_migration_wip.taxes
GROUP BY SubmissionNumber
);