import re

# Define file paths
LOG_FILE = "script.log"  # Path to your log file
OUTPUT_FILE = "failed_submissions.txt"  # File to store failed submission numbers

def extract_failed_submissions(log_file, output_file):
    """Extract submission numbers with 'No data returned' from log file."""
    failed_submissions = []

    # Define regex pattern to find submission numbers
    pattern = re.compile(r"No data returned for:\s(\d+)")

    with open(log_file, "r") as file:
        for line in file:
            match = pattern.search(line)
            if match:
                failed_submissions.append(match.group(1))  # Extract submission number

    # Save failed submissions to a file
    with open(output_file, "w") as output:
        for submission in failed_submissions:
            output.write(submission + "\n")

    print(f"✅ Extracted {len(failed_submissions)} failed submission numbers.")
    print(f"📂 Saved to {output_file}")

# Run the extraction function
extract_failed_submissions(LOG_FILE, OUTPUT_FILE)
