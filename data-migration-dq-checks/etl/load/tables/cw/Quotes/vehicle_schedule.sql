CREATE TABLE IF NOT EXISTS cw_migration_quotes.vehicle_schedule (
    SubmissionNumber String,
    QuoteNumber String,
    PolicyNumber String,
    PolicySubNumber String,
    EndorsementNumber String,
    VehicleNumber String,
    GaragingLocationStreetNumberAddress1 String,
    GaragingLocationStreetNameAddress2 String,
    GaragingLocationCity String,
    GaragingLocationStateRegion String,
    GaragingLocationZipCode1 String,
    GaragingLocationCounty String,
    GaragingLocationZipCode2 String,
    GaragingLocationStateRegionCode String,
    GaragingLocationCountryCode String,
    GaragingLocationCountry String,
    VehicleValueCount String,
    TotalVehicleValue String,
    VehicleScheduleTotalPremium String,
    TrailerOwned String,
    TrailerNonOwned String,
    VehicleType String,
    VehicleValue String,
    VehicleOperation String,
    VehicleClass String,
    VehicleAge String,
    VehicleDeductible String,
    VehiclePremium String,
    Territory String,
    VehicleYear String,
    BodyTypeClass String,
    IsAPDSelected String,
    Make String,
    Model String,
    VehicleIdentificationNumber String,
    BusinessUseType String,
    Density String,
    Cargo String,
    AutoLiabilityBIPDCoverageRatesMinimumPremiumMidRangeFactor String,
    AutoLiabilityBIPDCoverageRatesRadius1 String,
    AutoLiabilityBIPDCoverageRatesRadius2 String,
    AutoLiabilityBIPDCoverageRatesRadius3 String,
    AutoLiabilityBIPDCoverageRatesRadius4 String,
    AutoLiabilityBIPDCoverageRatesRadiusFactor1 String,
    AutoLiabilityBIPDCoverageRatesRadiusFactor2 String,
    AutoLiabilityBIPDCoverageRatesRadiusFactor3 String,
    AutoLiabilityBIPDCoverageRatesRadiusFactor4 String,
    AutoLiabilityBIPDCoverageRatesRadiusFactor String,
    AutoLiabilityBIPDCoverageRatesBaseRateBI String,
    AutoLiabilityBIPDCoverageRatesBaseRatePD String,
    AutoLiabilityBIPDCoverageRatesVehicleWeightClass String,
    AutoLiabilityBIPDCoverageRatesModelYearFactor String,
    AutoLiabilityBIPDCoverageRatesALBIPDBaseRate String,
    AutoLiabilityBIPDCoverageRatesRatedPremium String,
    AutoLiabilityBIPDCoverageRatesModPremium String,
    AutoLiabilityBIPDCoverageRatesMinimumPremium String,
    AutoLiabilityBIPDCoverageRatesFinalVehiclePremium String,
    AutoLiabilityBIPDCoverageRatesPremium String,
    AutoLiabilityBIPDCoverageRatesWrittenPremium String,
    AutoLiabilityBIPDCoverageRatesChangeType String,
    AutoLiabilityBIPDCoverageRatesFullTermPremium String,
    AutoLiabilityBIPDCoverageRatesProratedPremium String,
    AutoLiabilityBIPDCoverageRatesProratedPriorPremium String,
    AutoLiabilityBIPDCoverageRatesChangeProrateFactor String,
    AutoLiabilityBIPDCoverageRatesChangePremium String,
    AutoLiabilityBIPDCoverageRatesProratedChangePremium String,
    AutoLiabilityBIPDCoverageRatesWaivedOffPremium String,
    AutoLiabilityBIPDCoverageRatesTotalWaivedOffPremium String,
    AutoLiabilityBIPDCoverageRatesPremiumPriorToProrata String,
    AutoLiabilityBIPDCoverageRatesBodyTypeBusinessClassFactorToUse String,
    AutoLiabilityBIPDCoverageRatesBodyTypeBusinessClassFactor String,
    AutoLiabilityBIPDCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    AutoLiabilityBIPDCoverageRatesILF String,
    AutoLiabilityBIPDCoverageRatesILFTrailers String,
    AutoLiabilityBIPDCoverageRatesUSDOTFactor String,
    AutoLiabilityBIPDCoverageRatesTotalBaseRate String,
    AutoLiabilityBIPDCoverageRatesBIPDILF String,
    AutoLiabilityBIPDCoverageRatesBIPDModelYear String,
    AutoLiabilityBIPDCoverageRatesModelYearTrailerFactor String,
    AutoLiabilityBIPDCoverageRatesTotalRadiusTerritoryFactor String,
    AutoLiabilityBIPDCoverageRatesVehicleClassFactor String,
    AutoLiabilityBIPDCoverageRatesIncreasedLimitFactor String,
    AutoLiabilityBIPDCoverageRatesPopulationDensityFactor String,
    AutoLiabilityBIPDCoverageRatesTotalMinimumPremium String,
    AutoLiabilityBIPDCoverageRatesFinalPremium String,
    AutoLiabilityBIPDCoverageRatesTotalPremium String,
    AutoLiabilityBIPDCoverageRatesVehicleWeightClassFactor String,
    AutoLiabilityBIPDCoverageRatesILFTrailerFactor String,
    AutoLiabilityUMUIMCoverageRatesRadius1 String,
    AutoLiabilityUMUIMCoverageRatesRadius2 String,
    AutoLiabilityUMUIMCoverageRatesRadius3 String,
    AutoLiabilityUMUIMCoverageRatesRadius4 String,
    AutoLiabilityUMUIMCoverageRatesRadiusFactor1 String,
    AutoLiabilityUMUIMCoverageRatesRadiusFactor2 String,
    AutoLiabilityUMUIMCoverageRatesRadiusFactor3 String,
    AutoLiabilityUMUIMCoverageRatesRadiusFactor4 String,
    AutoLiabilityUMUIMCoverageRatesRadiusFactor String,
    AutoLiabilityUMUIMCoverageRatesBaseRateUMUIM String,
    AutoLiabilityUMUIMCoverageRatesUMUIMILF String,
    AutoLiabilityUMUIMCoverageRatesModPremium String,
    AutoLiabilityUMUIMCoverageRatesPremium String,
    AutoLiabilityUMUIMCoverageRatesWrittenPremium String,
    AutoLiabilityUMUIMCoverageRatesChangeType String,
    AutoLiabilityUMUIMCoverageRatesFullTermPremium String,
    AutoLiabilityUMUIMCoverageRatesProratedPremium String,
    AutoLiabilityUMUIMCoverageRatesProratedPriorPremium String,
    AutoLiabilityUMUIMCoverageRatesChangeProrateFactor String,
    AutoLiabilityUMUIMCoverageRatesChangePremium String,
    AutoLiabilityUMUIMCoverageRatesProratedChangePremium String,
    AutoLiabilityUMUIMCoverageRatesWaivedOffPremium String,
    AutoLiabilityUMUIMCoverageRatesTotalWaivedOffPremium String,
    AutoLiabilityUMUIMCoverageRatesPremiumPriorToProrata String,
    AutoLiabilityUMUIMCoverageRatesRatedPremium String,
    AutoLiabilityUMUIMCoverageRatesVehicleWeightClassFactor String,
    AutoLiabilityUMUIMCoverageRatesTotalPremium String,
    AutoPhysicalDamageCoverageRatesPostLossRatioFactor String,
    AutoPhysicalDamageCoverageRatesBaseRateFactor String,
    AutoPhysicalDamageCoverageRatesRateFactorClass String,
    AutoPhysicalDamageCoverageRatesVehicleAgeFactor String,
    AutoPhysicalDamageCoverageRatesVehicleRate String,
    AutoPhysicalDamageCoverageRatesDeductibleFactor String,
    AutoPhysicalDamageCoverageRatesPopulationDensityFactor String,
    AutoPhysicalDamageCoverageRatesStateFactor String,
    AutoPhysicalDamageCoverageRatesRateToUse String,
    AutoPhysicalDamageCoverageRatesPurePremium String,
    AutoPhysicalDamageCoverageRatesModifiedVehiclePremium String,
    AutoPhysicalDamageCoverageRatesPremium String,
    AutoPhysicalDamageCoverageRatesWrittenPremium String,
    AutoPhysicalDamageCoverageRatesChangeType String,
    AutoPhysicalDamageCoverageRatesFullTermPremium String,
    AutoPhysicalDamageCoverageRatesProratedPremium String,
    AutoPhysicalDamageCoverageRatesProratedPriorPremium String,
    AutoPhysicalDamageCoverageRatesChangeProrateFactor String,
    AutoPhysicalDamageCoverageRatesChangePremium String,
    AutoPhysicalDamageCoverageRatesProratedChangePremium String,
    AutoPhysicalDamageCoverageRatesWaivedOffPremium String,
    AutoPhysicalDamageCoverageRatesTotalWaivedOffPremium String,
    AutoPhysicalDamageCoverageRatesTotalPremium String,
    AutoPhysicalDamageCoverageRatesPremiumPriorToProrata String,
    AutoPhysicalDamageCoverageRatesPostLossRatioPremium String,
    AutoPhysicalDamageCoverageRatesDeductibleCode String,
    AutoPhysicalDamageCoverageRatesWeightPercent String,
    AutoPhysicalDamageCoverageRatesWeightedRate String,
    HiredNonOwnedAutoCoverageRatesPremium String,
    HiredNonOwnedAutoCoverageRatesWrittenPremium String,
    HiredNonOwnedAutoCoverageRatesChangeType String,
    HiredNonOwnedAutoCoverageRatesFullTermPremium String,
    HiredNonOwnedAutoCoverageRatesProratedPremium String,
    HiredNonOwnedAutoCoverageRatesProratedPriorPremium String,
    HiredNonOwnedAutoCoverageRatesChangeProrateFactor String,
    HiredNonOwnedAutoCoverageRatesChangePremium String,
    HiredNonOwnedAutoCoverageRatesProratedChangePremium String,
    HiredNonOwnedAutoCoverageRatesWaivedOffPremium String,
    HiredNonOwnedAutoCoverageRatesTotalWaivedOffPremium String,
    HiredNonOwnedAutoCoverageRatesPremiumPriorToProrata String,
    HiredNonOwnedAutoCoverageRatesBaseRateHNOA String,
    HiredNonOwnedAutoCoverageRatesHNOAILF String,
    HiredNonOwnedAutoCoverageRatesRatedPremium String,
    HiredNonOwnedAutoCoverageRatesHNOACoveragePremium String,
    HiredNonOwnedAutoCoverageRatesHNOACoverageRate String,
    HiredNonOwnedAutoCoverageRatesTotalPremium String,
    MedicalPaymentsCoverageRatesRadiusFactor1 String,
    MedicalPaymentsCoverageRatesRadiusFactor2 String,
    MedicalPaymentsCoverageRatesRadiusFactor3 String,
    MedicalPaymentsCoverageRatesRadiusFactor4 String,
    MedicalPaymentsCoverageRatesRadius1 String,
    MedicalPaymentsCoverageRatesRadius2 String,
    MedicalPaymentsCoverageRatesRadius3 String,
    MedicalPaymentsCoverageRatesRadius4 String,
    MedicalPaymentsCoverageRatesRadiusFactor String,
    MedicalPaymentsCoverageRatesBaseRateMedPay String,
    MedicalPaymentsCoverageRatesVehicleWeightClassFactor String,
    MedicalPaymentsCoverageRatesMedPayModelYearFactor String,
    MedicalPaymentsCoverageRatesMedPayILF String,
    MedicalPaymentsCoverageRatesRatedPremium String,
    MedicalPaymentsCoverageRatesModPremium String,
    MedicalPaymentsCoverageRatesMedPayCoverageFactor String,
    MedicalPaymentsCoverageRatesMedPayState String,
    MedicalPaymentsCoverageRatesMedPayCovered String,
    MedicalPaymentsCoverageRatesMedPayEligiblity String,
    MedicalPaymentsCoverageRatesTotalMedPay String,
    MedicalPaymentsCoverageRatesPremium String,
    MedicalPaymentsCoverageRatesWrittenPremium String,
    MedicalPaymentsCoverageRatesChangeType String,
    MedicalPaymentsCoverageRatesFullTermPremium String,
    MedicalPaymentsCoverageRatesProratedPremium String,
    MedicalPaymentsCoverageRatesProratedPriorPremium String,
    MedicalPaymentsCoverageRatesChangeProrateFactor String,
    MedicalPaymentsCoverageRatesChangePremium String,
    MedicalPaymentsCoverageRatesProratedChangePremium String,
    MedicalPaymentsCoverageRatesWaivedOffPremium String,
    MedicalPaymentsCoverageRatesTotalWaivedOffPremium String,
    MedicalPaymentsCoverageRatesPremiumPriorToProrata String,
    MedicalPaymentsCoverageRatesBodyTypeBusinessClassVehicleFactor String,
    MedicalPaymentsCoverageRatesBodyTypeBusinessClassFactor String,
    MedicalPaymentsCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    MedicalPaymentsCoverageRatesMedPayModelYear String,
    MedicalPaymentsCoverageRatesModelYearTrailerFactor String,
    MedicalPaymentsCoverageRatesModelYearFactor String,
    MedicalPaymentsCoverageRatesMedPayCoverageRate String,
    MedicalPaymentsCoverageRatesUSDOTViolationsFactor String,
    MedicalPaymentsCoverageRatesUSDOTBasicViolationsFactor String,
    MedicalPaymentsCoverageRatesUSDOTFactor String,
    MedicalPaymentsCoverageRatesTotalPremium String,
    PersonalInjuryProtectionCoverageRatesRadius1 String,
    PersonalInjuryProtectionCoverageRatesRadius2 String,
    PersonalInjuryProtectionCoverageRatesRadius3 String,
    PersonalInjuryProtectionCoverageRatesRadius4 String,
    PersonalInjuryProtectionCoverageRatesRadiusFactor1 String,
    PersonalInjuryProtectionCoverageRatesRadiusFactor2 String,
    PersonalInjuryProtectionCoverageRatesRadiusFactor3 String,
    PersonalInjuryProtectionCoverageRatesRadiusFactor4 String,
    PersonalInjuryProtectionCoverageRatesRadiusFactor String,
    PersonalInjuryProtectionCoverageRatesPIPCoverageFactor String,
    PersonalInjuryProtectionCoverageRatesPIPState String,
    PersonalInjuryProtectionCoverageRatesPIPCovered String,
    PersonalInjuryProtectionCoverageRatesPIPEligiblity String,
    PersonalInjuryProtectionCoverageRatesTotalPIP String,
    PersonalInjuryProtectionCoverageRatesPremium String,
    PersonalInjuryProtectionCoverageRatesWrittenPremium String,
    PersonalInjuryProtectionCoverageRatesChangeType String,
    PersonalInjuryProtectionCoverageRatesFullTermPremium String,
    PersonalInjuryProtectionCoverageRatesProratedPremium String,
    PersonalInjuryProtectionCoverageRatesProratedPriorPremium String,
    PersonalInjuryProtectionCoverageRatesChangeProrateFactor String,
    PersonalInjuryProtectionCoverageRatesChangePremium String,
    PersonalInjuryProtectionCoverageRatesProratedChangePremium String,
    PersonalInjuryProtectionCoverageRatesWaivedOffPremium String,
    PersonalInjuryProtectionCoverageRatesTotalWaivedOffPremium String,
    PersonalInjuryProtectionCoverageRatesPremiumPriorToProrata String,
    PersonalInjuryProtectionCoverageRatesBaseRatePIP String,
    PersonalInjuryProtectionCoverageRatesBodyTypeBusinessClassVehicleFactor String,
    PersonalInjuryProtectionCoverageRatesBodyTypeBusinessClassFactor String,
    PersonalInjuryProtectionCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    PersonalInjuryProtectionCoverageRatesRatedPremium String,
    PersonalInjuryProtectionCoverageRatesPIPModelYear String,
    PersonalInjuryProtectionCoverageRatesModelYearTrailerFactor String,
    PersonalInjuryProtectionCoverageRatesModelYearFactor String,
    PersonalInjuryProtectionCoverageRatesPIPCoveragePremium String,
    PersonalInjuryProtectionCoverageRatesPIPCoverageRate String,
    PersonalInjuryProtectionCoverageRatesUSDOTViolationsFactor String,
    PersonalInjuryProtectionCoverageRatesUSDOTBasicViolationsFactor String,
    PersonalInjuryProtectionCoverageRatesUSDOTFactor String,
    PersonalInjuryProtectionCoverageRatesTotalPremium String,
    TowingStorageAndLaborCoverageRatesVehicleValueGreaterThanZero String,
    TowingStorageAndLaborCoverageRatesVehicleRate String,
    TowingStorageAndLaborCoverageRatesWrittenPremium String,
    TowingStorageAndLaborCoverageRatesChangeType String,
    TowingStorageAndLaborCoverageRatesFullTermPremium String,
    TowingStorageAndLaborCoverageRatesProratedPremium String,
    TowingStorageAndLaborCoverageRatesProratedPriorPremium String,
    TowingStorageAndLaborCoverageRatesChangeProrateFactor String,
    TowingStorageAndLaborCoverageRatesChangePremium String,
    TowingStorageAndLaborCoverageRatesProratedChangePremium String,
    TowingStorageAndLaborCoverageRatesWaivedOffPremium String,
    TowingStorageAndLaborCoverageRatesTotalWaivedOffPremium String,
    TowingStorageAndLaborCoverageRatesPremium String,
    TowingStorageAndLaborCoverageRatesPremiumPriorToProrata String,
    TowingStorageAndLaborCoverageRatesTotalPremium String,
    TrailerInterchangeCoverageRatesWrittenPremium String,
    TrailerInterchangeCoverageRatesChangeType String,
    TrailerInterchangeCoverageRatesFullTermPremium String,
    TrailerInterchangeCoverageRatesProratedPremium String,
    TrailerInterchangeCoverageRatesProratedPriorPremium String,
    TrailerInterchangeCoverageRatesChangeProrateFactor String,
    TrailerInterchangeCoverageRatesChangePremium String,
    TrailerInterchangeCoverageRatesProratedChangePremium String,
    TrailerInterchangeCoverageRatesWaivedOffPremium String,
    TrailerInterchangeCoverageRatesTotalWaivedOffPremium String,
    TrailerInterchangeCoverageRatesPremium String,
    TrailerInterchangeCoverageRatesPremiumPriorToProrata String,
    TrailerInterchangeCoverageRatesTotalPremium String,
    UnderinsuredBodilyInjuryCoverageRatesRadius1 String,
    UnderinsuredBodilyInjuryCoverageRatesRadius2 String,
    UnderinsuredBodilyInjuryCoverageRatesRadius3 String,
    UnderinsuredBodilyInjuryCoverageRatesRadius4 String,
    UnderinsuredBodilyInjuryCoverageRatesRadiusFactor1 String,
    UnderinsuredBodilyInjuryCoverageRatesRadiusFactor2 String,
    UnderinsuredBodilyInjuryCoverageRatesRadiusFactor3 String,
    UnderinsuredBodilyInjuryCoverageRatesRadiusFactor4 String,
    UnderinsuredBodilyInjuryCoverageRatesRadiusFactor String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBICoverageFactor String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBIState String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBICovered String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBIEligiblity String,
    UnderinsuredBodilyInjuryCoverageRatesTotalUIMBI String,
    UnderinsuredBodilyInjuryCoverageRatesPremium String,
    UnderinsuredBodilyInjuryCoverageRatesWrittenPremium String,
    UnderinsuredBodilyInjuryCoverageRatesChangeType String,
    UnderinsuredBodilyInjuryCoverageRatesFullTermPremium String,
    UnderinsuredBodilyInjuryCoverageRatesProratedPremium String,
    UnderinsuredBodilyInjuryCoverageRatesProratedPriorPremium String,
    UnderinsuredBodilyInjuryCoverageRatesChangeProrateFactor String,
    UnderinsuredBodilyInjuryCoverageRatesChangePremium String,
    UnderinsuredBodilyInjuryCoverageRatesProratedChangePremium String,
    UnderinsuredBodilyInjuryCoverageRatesWaivedOffPremium String,
    UnderinsuredBodilyInjuryCoverageRatesTotalWaivedOffPremium String,
    UnderinsuredBodilyInjuryCoverageRatesPremiumPriorToProrata String,
    UnderinsuredBodilyInjuryCoverageRatesBaseRateUIMBI String,
    UnderinsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassVehicleFactor String,
    UnderinsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassFactor String,
    UnderinsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    UnderinsuredBodilyInjuryCoverageRatesRatedPremium String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBICoveragePremium String,
    UnderinsuredBodilyInjuryCoverageRatesUIMBICoverageRate String,
    UnderinsuredBodilyInjuryCoverageRatesUSDOTViolationsFactor String,
    UnderinsuredBodilyInjuryCoverageRatesUSDOTBasicViolationsFactor String,
    UnderinsuredBodilyInjuryCoverageRatesTotalPremium String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDCoverageFactor String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDState String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDCovered String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDEligiblity String,
    UnderinsuredPropertyDamageCoverageRatesTotalUIMPD String,
    UnderinsuredPropertyDamageCoverageRatesPremium String,
    UnderinsuredPropertyDamageCoverageRatesWrittenPremium String,
    UnderinsuredPropertyDamageCoverageRatesChangeType String,
    UnderinsuredPropertyDamageCoverageRatesFullTermPremium String,
    UnderinsuredPropertyDamageCoverageRatesProratedPremium String,
    UnderinsuredPropertyDamageCoverageRatesProratedPriorPremium String,
    UnderinsuredPropertyDamageCoverageRatesChangeProrateFactor String,
    UnderinsuredPropertyDamageCoverageRatesChangePremium String,
    UnderinsuredPropertyDamageCoverageRatesProratedChangePremium String,
    UnderinsuredPropertyDamageCoverageRatesWaivedOffPremium String,
    UnderinsuredPropertyDamageCoverageRatesTotalWaivedOffPremium String,
    UnderinsuredPropertyDamageCoverageRatesPremiumPriorToProrata String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDCoveragePremium String,
    UnderinsuredPropertyDamageCoverageRatesUIMPDCoverageRate String,
    UnderinsuredPropertyDamageCoverageRatesBaseRateUIMPD String,
    UnderinsuredPropertyDamageCoverageRatesTotalPremium String,
    UninsuredBodilyInjuryCoverageRatesRadius1 String,
    UninsuredBodilyInjuryCoverageRatesRadius2 String,
    UninsuredBodilyInjuryCoverageRatesRadius3 String,
    UninsuredBodilyInjuryCoverageRatesRadius4 String,
    UninsuredBodilyInjuryCoverageRatesRadiusFactor1 String,
    UninsuredBodilyInjuryCoverageRatesRadiusFactor2 String,
    UninsuredBodilyInjuryCoverageRatesRadiusFactor3 String,
    UninsuredBodilyInjuryCoverageRatesRadiusFactor4 String,
    UninsuredBodilyInjuryCoverageRatesRadiusFactor String,
    UninsuredBodilyInjuryCoverageRatesUMBICoverageFactor String,
    UninsuredBodilyInjuryCoverageRatesUMBIState String,
    UninsuredBodilyInjuryCoverageRatesUMBICovered String,
    UninsuredBodilyInjuryCoverageRatesUMBIEligiblity String,
    UninsuredBodilyInjuryCoverageRatesTotalUMBI String,
    UninsuredBodilyInjuryCoverageRatesPremium String,
    UninsuredBodilyInjuryCoverageRatesWrittenPremium String,
    UninsuredBodilyInjuryCoverageRatesChangeType String,
    UninsuredBodilyInjuryCoverageRatesFullTermPremium String,
    UninsuredBodilyInjuryCoverageRatesProratedPremium String,
    UninsuredBodilyInjuryCoverageRatesProratedPriorPremium String,
    UninsuredBodilyInjuryCoverageRatesChangeProrateFactor String,
    UninsuredBodilyInjuryCoverageRatesChangePremium String,
    UninsuredBodilyInjuryCoverageRatesProratedChangePremium String,
    UninsuredBodilyInjuryCoverageRatesWaivedOffPremium String,
    UninsuredBodilyInjuryCoverageRatesTotalWaivedOffPremium String,
    UninsuredBodilyInjuryCoverageRatesPremiumPriorToProrata String,
    UninsuredBodilyInjuryCoverageRatesBaseRateUMBI String,
    UninsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassVehicleFactor String,
    UninsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassFactor String,
    UninsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    UninsuredBodilyInjuryCoverageRatesRatedPremium String,
    UninsuredBodilyInjuryCoverageRatesUMBICoveragePremium String,
    UninsuredBodilyInjuryCoverageRatesUMBICoverageRate String,
    UninsuredBodilyInjuryCoverageRatesUSDOTViolationsFactor String,
    UninsuredBodilyInjuryCoverageRatesUSDOTBasicViolationsFactor String,
    UninsuredBodilyInjuryCoverageRatesBodyTypeBusinessClassFactorToUse String,
    UninsuredBodilyInjuryCoverageRatesUSDOTFactor String,
    UninsuredBodilyInjuryCoverageRatesTotalPremium String,
    UninsuredPropertyDamageCoverageRatesRadius1 String,
    UninsuredPropertyDamageCoverageRatesRadius2 String,
    UninsuredPropertyDamageCoverageRatesRadius3 String,
    UninsuredPropertyDamageCoverageRatesRadius4 String,
    UninsuredPropertyDamageCoverageRatesRadiusFactor1 String,
    UninsuredPropertyDamageCoverageRatesRadiusFactor2 String,
    UninsuredPropertyDamageCoverageRatesRadiusFactor3 String,
    UninsuredPropertyDamageCoverageRatesRadiusFactor4 String,
    UninsuredPropertyDamageCoverageRatesRadiusFactor String,
    UninsuredPropertyDamageCoverageRatesUMPDCoverageFactor String,
    UninsuredPropertyDamageCoverageRatesUMPDState String,
    UninsuredPropertyDamageCoverageRatesUMPDCovered String,
    UninsuredPropertyDamageCoverageRatesUMPDEligiblity String,
    UninsuredPropertyDamageCoverageRatesTotalUMPD String,
    UninsuredPropertyDamageCoverageRatesPremium String,
    UninsuredPropertyDamageCoverageRatesWrittenPremium String,
    UninsuredPropertyDamageCoverageRatesChangeType String,
    UninsuredPropertyDamageCoverageRatesFullTermPremium String,
    UninsuredPropertyDamageCoverageRatesProratedPremium String,
    UninsuredPropertyDamageCoverageRatesProratedPriorPremium String,
    UninsuredPropertyDamageCoverageRatesChangeProrateFactor String,
    UninsuredPropertyDamageCoverageRatesChangePremium String,
    UninsuredPropertyDamageCoverageRatesProratedChangePremium String,
    UninsuredPropertyDamageCoverageRatesWaivedOffPremium String,
    UninsuredPropertyDamageCoverageRatesTotalWaivedOffPremium String,
    UninsuredPropertyDamageCoverageRatesPremiumPriorToProrata String,
    UninsuredPropertyDamageCoverageRatesBaseRateUMPD String,
    UninsuredPropertyDamageCoverageRatesBodyTypeBusinessClassVehicleFactor String,
    UninsuredPropertyDamageCoverageRatesBodyTypeBusinessClassFactor String,
    UninsuredPropertyDamageCoverageRatesBodyTypeBusinessClassTrailerFactor String,
    UninsuredPropertyDamageCoverageRatesRatedPremium String,
    UninsuredPropertyDamageCoverageRatesUMPDCoveragePremium String,
    UninsuredPropertyDamageCoverageRatesUMPDCoverageRate String,
    UninsuredPropertyDamageCoverageRatesUSDOTViolationsFactor String,
    UninsuredPropertyDamageCoverageRatesUSDOTBasicViolationsFactor String,
    UninsuredPropertyDamageCoverageRatesTotalPremium String,
    AutoLiabilityBIPDCoverageRatesUSDOTViolationsFactor String,
    AutoLiabilityBIPDCoverageRatesUSDOTBasicViolationsFactor String,
    UninsuredPropertyDamageCoverageRatesUSDOTFactor String,
    UnderinsuredBodilyInjuryCoverageRatesUSDOTFactor String,
    AutoPhysicalDamageCoverageRatesRateToUseCount String,
    AutoLiabilityBIPDCoverageRatesTrailerIndicator String,
    AutoLiabilityBIPDCoverageRatesMidRangeFactor0To50 String,
    AutoLiabilityBIPDCoverageRatesMidRangeFactor51To200 String,
    AutoLiabilityBIPDCoverageRatesMidRangeFactor201To500 String,
    AutoLiabilityBIPDCoverageRatesMidRangeFactor501Plus String,
    HiredNonOwnedAutoCoverageRatesTrailerIndicator String,
    AutoLiabilityBIPDCoverageRatesRadiusRange String,
    AutoLiabilityBIPDCoverageRatesRadiusRange1 String,
    AutoLiabilityBIPDCoverageRatesRadiusRange2 String,
    AutoLiabilityBIPDCoverageRatesRadiusRange3 String,
    AutoLiabilityBIPDCoverageRatesRadiusRange4 String,
    AutoLiabilityBIPDCoverageRatesRadiusOne String,
    AutoLiabilityBIPDCoverageRatesRadiusTwo String,
    AutoLiabilityBIPDCoverageRatesRadiusThree String,
    AutoLiabilityBIPDCoverageRatesRadiusFour String,
    TowingStorageAndLaborCoverageRatesVehicleType String,
    AutoLiabilityUMUIMCoverageRatesUSDOTViolationsFactor String,
    DeductiblePreference String,
    MinimumPremium0to50 String,
    MinimumPremium51to200 String,
    MinimumPremium201to500 String,
    CalculatedMinimumPremium0to50 String,
    CalculatedMinimumPremium51to200 String,
    CalculatedMinimumPremium201to500 String,
    CalculatedMinimumPremium501Plus String,
    MinimumPremium501Plus String,
    ZipCode String,
    ALVehiclePremuim String,
    APDVehiclePremuim String,
    IsTrailer String,
    AutoLiabilityBIPDCoverageRatesCoverageOnPolicyIndicator String,
    AutoLiabilityBIPDCoverageRatesMaxPremium String,
    UninsuredBodilyInjuryCoverageRatesCoverageOnPolicyIndicator String,
    UninsuredPropertyDamageCoverageRatesCoverageOnPolicyIndicator String,
    UnderinsuredBodilyInjuryCoverageRatesCoverageOnPolicyIndicator String,
    MedicalPaymentsCoverageRatesCoverageOnPolicyIndicator String,
    PersonalInjuryProtectionCoverageRatesCoverageOnPolicyIndicator String,
    AutoLiabilityUMUIMCoverageRatesCoverageOnPolicyIndicator String,
    UnderinsuredPropertyDamageCoverageRatesCoverageOnPolicyIndicator String,
    HiredNonOwnedAutoCoverageRatesCoverageOnPolicyIndicator String,
    AutoPhysicalDamageCoverageRatesCoverageOnPolicyIndicator String,
    TowingStorageAndLaborCoverageRatesCoverageOnPolicyIndicator String,
    VehicleScheduleCoverageStartDate String,
    VehicleScheduleChangeEffectiveDate String,
    VehicleScheduleCoverageStopDate String,
    VehicleScheduleWrittenPremium String,
    VehicleSchedulePriorChargedPremium String,
    VehicleScheduleChangeType String,
    VehicleScheduleWaivedOffPremium String,
    VehicleScheduleTotalWaivedOffPremium String,
    AutoLiabilityBIPDCoverageRatesPriorChargedPremium String,
    AutoLiabilityBIPDCoverageRatesCoverageStartDate String,
    AutoLiabilityBIPDCoverageRatesChangeEffectiveDate String,
    AutoLiabilityBIPDCoverageRatesCoverageStopDate String,
    UninsuredBodilyInjuryCoverageRatesPriorChargedPremium String,
    UninsuredBodilyInjuryCoverageRatesCoverageStartDate String,
    UninsuredBodilyInjuryCoverageRatesChangeEffectiveDate String,
    UninsuredBodilyInjuryCoverageRatesCoverageStopDate String,
    UninsuredPropertyDamageCoverageRatesPriorChargedPremium String,
    UninsuredPropertyDamageCoverageRatesCoverageStartDate String,
    UninsuredPropertyDamageCoverageRatesChangeEffectiveDate String,
    UninsuredPropertyDamageCoverageRatesCoverageStopDate String,
    UnderinsuredBodilyInjuryCoverageRatesPriorChargedPremium String,
    UnderinsuredBodilyInjuryCoverageRatesCoverageStartDate String,
    UnderinsuredBodilyInjuryCoverageRatesChangeEffectiveDate String,
    UnderinsuredBodilyInjuryCoverageRatesCoverageStopDate String,
    MedicalPaymentsCoverageRatesPriorChargedPremium String,
    MedicalPaymentsCoverageRatesCoverageStartDate String,
    MedicalPaymentsCoverageRatesChangeEffectiveDate String,
    MedicalPaymentsCoverageRatesCoverageStopDate String,
    PersonalInjuryProtectionCoverageRatesPriorChargedPremium String,
    PersonalInjuryProtectionCoverageRatesCoverageStartDate String,
    PersonalInjuryProtectionCoverageRatesChangeEffectiveDate String,
    PersonalInjuryProtectionCoverageRatesCoverageStopDate String,
    AutoLiabilityUMUIMCoverageRatesPriorChargedPremium String,
    AutoLiabilityUMUIMCoverageRatesCoverageStartDate String,
    AutoLiabilityUMUIMCoverageRatesChangeEffectiveDate String,
    AutoLiabilityUMUIMCoverageRatesCoverageStopDate String,
    UnderinsuredPropertyDamageCoverageRatesPriorChargedPremium String,
    UnderinsuredPropertyDamageCoverageRatesCoverageStartDate String,
    UnderinsuredPropertyDamageCoverageRatesChangeEffectiveDate String,
    UnderinsuredPropertyDamageCoverageRatesCoverageStopDate String,
    HiredNonOwnedAutoCoverageRatesPriorChargedPremium String,
    HiredNonOwnedAutoCoverageRatesCoverageStartDate String,
    HiredNonOwnedAutoCoverageRatesChangeEffectiveDate String,
    HiredNonOwnedAutoCoverageRatesCoverageStopDate String,
    AutoPhysicalDamageCoverageRatesPriorChargedPremium String,
    AutoPhysicalDamageCoverageRatesCoverageStartDate String,
    AutoPhysicalDamageCoverageRatesChangeEffectiveDate String,
    AutoPhysicalDamageCoverageRatesCoverageStopDate String,
    TowingStorageAndLaborCoverageRatesPriorChargedPremium String,
    TowingStorageAndLaborCoverageRatesCoverageStartDate String,
    TowingStorageAndLaborCoverageRatesChangeEffectiveDate String,
    TowingStorageAndLaborCoverageRatesCoverageStopDate String,
    AutoLiabilityBIPDCoverageRatesMinimumPremiumApplies String
) ENGINE = MergeTree()
ORDER BY SubmissionNumber;