CREATE VIEW IF NOT EXISTS cw_migration_policy.fees_agg AS(
SELECT
  SubmissionNumber,
  PolicyNumber,
  sum(toFloat64(AutoLiabilityFeeAmount)) AS AutoLiabilityFeeAmount,
  sum(toFloat64(AutoPhysicalDamageFeeAmount)) AS AutoPhysicalDamageFeeAmount,
  sum(toFloat64(MotorTruckCargoFeeAmount)) AS MotorTruckCargoFeeAmount,
  sum(toFloat64(TruckersGeneralLiabilityFeeAmount)) AS TruckersGeneralLiabilityFeeAmount,
  sum(toFloat64(NonTruckingLiabilityFeeAmount)) AS NonTruckingLiabilityFeeAmount
FROM cw_migration_policy.fees
GROUP BY SubmissionNumber, PolicyNumber
);