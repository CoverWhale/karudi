CREATE VIEW IF NOT EXISTS cw_migration_wip.fees_agg AS(
SELECT
  SubmissionNumber,
  sum(toFloat64(AutoLiabilityFeeAmount)) AS AutoLiabilityFeeAmount,
  sum(toFloat64(AutoPhysicalDamageFeeAmount)) AS AutoPhysicalDamageFeeAmount,
  sum(toFloat64(MotorTruckCargoFeeAmount)) AS MotorTruckCargoFeeAmount,
  sum(toFloat64(TruckersGeneralLiabilityFeeAmount)) AS TruckersGeneralLiabilityFeeAmount,
  sum(toFloat64(NonTruckingLiabilityFeeAmount)) AS NonTruckingLiabilityFeeAmount
FROM cw_migration_wip.fees
GROUP BY SubmissionNumber
);