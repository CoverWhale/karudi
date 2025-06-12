import json
import re
from openpyxl import Workbook

# File paths
input_file = r'D:\Kiran\Py\GLFeedToSage\Old20250611_20250303.json'
output_excel = r'D:\Kiran\Py\GLFeedToSage\invoice_submission_with_amount_Old.xlsx'

# Prefix-to-premium mapping
prefix_to_premium = {
    "CW-AL-": "al_premium",
    "CW-APD-": "apd_premium",
    "CW-MTC-": "mtc_premium",
    "CW-NTL-": "ntl_premium",
    "CW-TGL-": "tgl_premium"
}

# Invoice fields
invoice_fields = [
    "al_invoice_number",
    "apd_invoice_number",
    "tgl_invoice_number",
    "mtc_invoice_number",
    "ntl_invoice_number"
]

# Load JSON
with open(input_file, 'r') as f:
    data = json.load(f).get("data", [])

# Excel setup
wb = Workbook()
ws = wb.active
ws.title = "Invoices"
ws.append(["Invoice Number", "Submission Number", "Invoice Amount"])

# Extract and write
for item in data:
    submission_number = str(item.get("submission_number", "")).strip()

    for field in invoice_fields:
        invoices = item.get(field)
        if not invoices:
            continue

        # Handle list or single value
        if isinstance(invoices, list):
            invoice_list = invoices
        else:
            invoice_list = [invoices]

        for invoice in invoice_list:
            if not invoice:
                continue
            cleaned_invoice = re.sub(r'\d+$', '', invoice)
            invoice = str(invoice).strip()

            # Determine premium key by invoice prefix
            invoice_amount = ""
            for prefix, premium_key in prefix_to_premium.items():
                if cleaned_invoice.startswith(prefix):
                    invoice_amount = item.get(premium_key, "")
                    break

            ws.append([invoice, submission_number, invoice_amount])

# Save workbook
wb.save(output_excel)
print(f"Output saved to: {output_excel}")
