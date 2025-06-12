import json
from openpyxl import Workbook

# File paths
file1_path = r'D:\Kiran\Py\GLFeedToSage\Old20250611_20250303.json'
file2_path = r'D:\Kiran\Py\GLFeedToSage\New20250611_20250303.json'
output_excel = r'D:\Kiran\Py\GLFeedToSage\delta_output_11Jun_03Mar25.xlsx'

def is_numeric(val):
    """Helper to check if a value is numeric or numeric string."""
    try:
        float(val)
        return True
    except (ValueError, TypeError):
        return False
    
# Helper to create dictionary key using submission_number + last 12 chars of invoice_number
def get_key(item):
    sub_num = str(item.get("submission_number", "")).strip()
    inv_num = str(item.get("invoice_number", "")).strip()
    return f"{sub_num}_{inv_num[-12:]}" if sub_num and inv_num else None

# Function to flatten nested JSON
def flatten_json(y, prefix=''):
    out = {}
    if isinstance(y, dict):
        for k, v in y.items():
            out.update(flatten_json(v, f'{prefix}{k}.'))
    elif isinstance(y, list):
        for i, v in enumerate(y):
            out.update(flatten_json(v, f'{prefix}{i}.'))
    else:
        out[prefix[:-1]] = y
    return out

# Load and parse JSON files
with open(file1_path, 'r') as f1, open(file2_path, 'r') as f2:
    data1 = json.load(f1).get("data", [])
    data2 = json.load(f2).get("data", [])

# Build records1 using keys from file1
records1 = {
    key: item
    for item in data1
    if (key := get_key(item)) is not None
}

# Build records2 using same keys found in records1
records2 = {
    key: next((item for item in data2 if get_key(item) == key), {})
    for key in records1.keys()
}

# Combine all submission_numbers
all_submission_numbers = records1.keys()

# Create Excel workbook
wb = Workbook()
ws = wb.active
ws.title = "Delta"
ws.append(["Submission No.", "Key", "Old Value", "New Value", "Comments"])

# Compare records
for sub_num in sorted(all_submission_numbers):
    flat1 = flatten_json(records1.get(sub_num, {}))
    flat2 = flatten_json(records2.get(sub_num, {}))
    all_keys = set(flat1.keys()).union(flat2.keys())

    for key in sorted(all_keys):
        val1 = flat1.get(key, "MISSING")
        val2 = flat2.get(key, "MISSING")
        if val2 == 8902.63:
            print("val2 is 8902.63 for key:", key, "in submission number:", sub_num)
        if val1 != val2:
            if val1 == "MISSING": 
                ws.append([sub_num, key, str(val1), str(val2), "Additional Key found in new API"])
            elif val2 == "MISSING":
                ws.append([sub_num, key, str(val1), str(val2), "Key removed in new API"])

            # Handle string vs string mismatch
            elif isinstance(val1, str) and isinstance(val2, str) and val1 != val2:
                ws.append([sub_num, key, str(val1), str(val2), "String value mismatch"])

            # Handle str vs number with numeric string detection and rounding
            elif is_numeric(val1) and is_numeric(val2):
                num1 = float(val1)
                num2 = float(val2)
                diff = abs(num1 - num2)
                if diff <= 0.01:
                    ws.append([sub_num, key, str(val1), str(val2), "Numeric values within tolerance (±0.01)"])
                else:
                    ws.append([sub_num, key, str(val1), str(val2), f"Numeric mismatch (diff: {diff:.2f})"])


            # Catch type mismatches
            elif type(val1) != type(val2):
                ws.append([sub_num, key, str(val1), str(val2), f"Data Type mismatch ({type(val1).__name__} vs {type(val2).__name__})"])

            # Default classification for remaining changes
            else:
                ws.append([sub_num, key, str(val1), str(val2), "Value changed"])

# Save to Excel
wb.save(output_excel)
print(f"Delta saved to {output_excel}")
