CREATE TABLE IF NOT EXISTS cw_migration_wip.taxes (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    AutoLiabilityTaxTaxable String,
    AutoPhysicalDamageTaxTaxable String,
    MotorTruckCargoTaxTaxable String,
    TruckersGeneralLiabilityTaxTaxable String,
    NonTruckingLiabilityTaxTaxable String,
    AutoliabilityTaxCode String,
    AutoLiabilityTaxType String,
    AutoLiabilityTaxName String,
    AutoLiabilityTaxDescription String,
    AutoLiabilityTaxRate String,
    AutoLiabilityTaxRateType String,
    AutoLiabilityTaxAmount String,
    AutoLiabilityTaxOrderIndex String,
    AutoLiabilityTaxAppliedTo String,
    AutoLiabilityTaxAppliedDate String,
    AutoPhysicalDamageTaxCode String,
    AutoPhysicalDamageTaxType String,
    AutoPhysicalDamageTaxName String,
    AutoPhysicalDamageTaxDescription String,
    AutoPhysicalDamageTaxRate String,
    AutoPhysicalDamageTaxRateType String,
    AutoPhysicalDamageTaxAmount String,
    AutoPhysicalDamageTaxOrderIndex String,
    AutoPhysicalDamageTaxAppliedTo String,
    AutoPhysicalDamageTaxAppliedDate String,
    MotorTruckCargoTaxCode String,
    MotorTruckCargoTaxType String,
    MotorTruckCargoTaxName String,
    MotorTruckCargoTaxDescription String,
    MotorTruckCargoTaxRate String,
    MotorTruckCargoTaxRateType String,
    MotorTruckCargoTaxAmount String,
    MotorTruckCargoTaxOrderIndex String,
    MotorTruckCargoTaxAppliedTo String,
    MotorTruckCargoTaxAppliedDate String,
    TruckersGeneralLiabilityTaxCode String,
    TruckersGeneralLiabilityTaxType String,
    TruckersGeneralLiabilityTaxName String,
    TruckersGeneralLiabilityTaxDescription String,
    TruckersGeneralLiabilityTaxRate String,
    TruckersGeneralLiabilityTaxRateType String,
    TruckersGeneralLiabilityTaxAmount String,
    TruckersGeneralLiabilityTaxOrderIndex String,
    TruckersGeneralLiabilityTaxAppliedTo String,
    TruckersGeneralLiabilityTaxAppliedDate String,
    NonTruckingLiabilityTaxCode String,
    NonTruckingLiabilityTaxType String,
    NonTruckingLiabilityTaxName String,
    NonTruckingLiabilityTaxDescription String,
    NonTruckingLiabilityTaxRate String,
    NonTruckingLiabilityTaxRateType String,
    NonTruckingLiabilityTaxAmount String,
    NonTruckingLiabilityTaxOrderIndex String,
    NonTruckingLiabilityTaxAppliedTo String,
    NonTruckingLiabilityTaxAppliedDate String,
    AutoLiabilityMinimumTaxAmount String,
    AutoPhysicalDamageMinimumTaxAmount String,
    MotorTruckCargoMinimumTaxAmount String,
    TruckersGeneralLiabilityMinimumTaxAmount String,
    NonTruckingLiabilityMinimumTaxAmount String,
    AutoLiabilityIsFullyEarned String,
    AutoPhysicalDamageIsFullyEarned String,
    MotorTruckCargoIsFullyEarned String,
    TruckersGeneralLiabilityIsFullyEarned String,
    NonTruckingLiabilityIsFullyEarned String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;