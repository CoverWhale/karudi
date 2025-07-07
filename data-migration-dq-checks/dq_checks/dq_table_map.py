# dq_table_map.py

def get_solartis_suffix(model):
    return {
        "WIP": "wip_submissions",
        "Quotes": "quotes",
        "Policy": "policy"
    }[model]


def build_table_pairs(model):
    suffix = get_solartis_suffix(model)
    cw_prefix = f"cw_migration_{model.lower()}"
    solartis_prefix = f"solartis_{suffix}"

    return [
            {
        "name": "migration_template",
        "table_a": f"{cw_prefix}.migration_template",
        "table_b": f"{solartis_prefix}.migration_template",
        "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "TransactionType": "TransactionType"},
        "financial_fields": [],
        "filters": {
            "table_a": "TransactionType = 'New Business'",
            "table_b": "TransactionType = 'New Business'"  # Optional
            }
         },
        {
            "name": "additional_insured",
            "table_a": f"{cw_prefix}.additional_insured",
            "table_b": f"{solartis_prefix}.additional_insured",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "AdditionalInsuredName": "AdditionalInsuredName"},
            "financial_fields": []
        },
        {
            "name": "cargo_carried",
            "table_a": f"{cw_prefix}.cargo_carried",
            "table_b": f"{solartis_prefix}.cargo_carried",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "SelectedCargo": "SelectedCargo"},
            "financial_fields": []
        },
        {
            "name": "selected_carriers",
            "table_a": f"{cw_prefix}.selected_carriers",
            "table_b": f"{solartis_prefix}.selected_carriers",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "SelectedCarriersPolicyNumber": "SelectedCarriersPolicyNumber"},
            "financial_fields": []
        },
        {
            "name": "driver_schedule",
            "table_a": f"{cw_prefix}.driver_schedule",
            "table_b": f"{solartis_prefix}.driver_schedule",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "FirstName1": "FirstName1", "LastName2": "LastName2"},
            "financial_fields": []
        },
        {
            "name": "location",
            "table_a": f"{cw_prefix}.location",
            "table_b": f"{solartis_prefix}.location",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "LocationNumber": "LocationNumber"},
            "financial_fields": []
        },
        {
            "name": "loss_payee",
            "table_a": f"{cw_prefix}.loss_payee",
            "table_b": f"{solartis_prefix}.loss_payee",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "LossPayeeName": "LossPayeeName"},
            "financial_fields": []
        },
        {
            "name": "vehicle_schedule",
            "table_a": f"{cw_prefix}.vehicle_schedule",
            "table_b": f"{solartis_prefix}.vehicle_schedule",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber", "VehicleIdentificationNumber": "VehicleIdentificationNumber"},
            "financial_fields": []
        },
                        {
            "name": "taxes",
            "table_a": f"{cw_prefix}.taxes_agg",
            "table_b": f"{solartis_prefix}.taxes",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber"},
            "financial_fields": []
        },
                        {
            "name": "fees",
            "table_a": f"{cw_prefix}.fees_agg",
            "table_b": f"{solartis_prefix}.fees",
            "join_keys": {"SubmissionNumber": "SubmissionNumber", "PolicyNumber": "PolicyNumber"},
            "financial_fields": []
        }
    ]
