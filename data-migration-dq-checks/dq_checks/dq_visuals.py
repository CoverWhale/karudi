import os
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# ------------------------- CONFIG ------------------------- #
EXPORT_DIR = "mismatch_reports/csv_exports"

def get_latest_export_folder(base_dir):
    subdirs = [f for f in os.listdir(base_dir) if os.path.isdir(os.path.join(base_dir, f))]
    if not subdirs:
        raise FileNotFoundError(f"No CSV exports found in: {base_dir}")
    return os.path.join(base_dir, sorted(subdirs)[-1])

CSV_DIR = get_latest_export_folder(EXPORT_DIR)
print(f"📁 Using CSV directory: {CSV_DIR}")

# ------------------------- LOAD FILES ------------------------- #
summary_path = os.path.join(CSV_DIR, "summary.csv")
if not os.path.exists(summary_path):
    raise FileNotFoundError("❌ summary.csv not found in latest export folder.")

summary_df = pd.read_csv(summary_path)

# Load all *_column_stats.csv
column_stat_dfs = {}
for fname in os.listdir(CSV_DIR):
    if fname.endswith("_column_stats.csv"):
        table_name = fname.replace("_column_stats.csv", "")
        column_stat_dfs[table_name] = pd.read_csv(os.path.join(CSV_DIR, fname))

# Load false mismatches if present
false_mismatch_path = os.path.join(CSV_DIR, "false_mismatch_audit.csv")
false_mismatch_df = pd.read_csv(false_mismatch_path) if os.path.exists(false_mismatch_path) else pd.DataFrame()

# ------------------------- PLOT 1: Column Match Ratio ------------------------- #
plt.figure(figsize=(12, 6))
sns.barplot(data=summary_df, x="table_name", y="column_match_ratio", palette="viridis")
plt.title("Column Match Ratio by Table")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.show()

# ------------------------- PLOT 2: Match % vs Column Match Ratio ------------------------- #
plt.figure(figsize=(12, 6))
sns.lineplot(data=summary_df, x="table_name", y="match_percent", label="Row Match %")
sns.lineplot(data=summary_df, x="table_name", y="column_match_ratio", label="Column Match Ratio")
plt.title("Row Match % vs Column Match Ratio")
plt.xticks(rotation=45, ha="right")
plt.ylabel("Percentage")
plt.tight_layout()
plt.show()

# ------------------------- PLOT 3: Matches vs Mismatches ------------------------- #
if "total_column_matches" in summary_df.columns and "total_column_mismatches" in summary_df.columns:
    plt.figure(figsize=(12, 6))
    match = summary_df[["table_name", "total_column_matches"]].set_index("table_name")
    mismatch = summary_df[["table_name", "total_column_mismatches"]].set_index("table_name")
    match_mismatch = pd.concat([match, mismatch], axis=1).fillna(0)
    match_mismatch.plot(kind="bar", stacked=True, figsize=(12, 6), colormap="Set2")
    plt.title("Total Column Matches vs Mismatches by Table")
    plt.ylabel("Count")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    plt.show()

# ------------------------- PLOT 4: Column Match % Heatmap ------------------------- #
if column_stat_dfs:
    column_stats_df = pd.concat([
        df.assign(table_name=table_name)
        for table_name, df in column_stat_dfs.items()
    ])
    heatmap_df = column_stats_df.pivot(index="table_name", columns="column_name", values="match_percent").fillna(0)

    plt.figure(figsize=(14, 8))
    sns.heatmap(heatmap_df, annot=False, cmap="coolwarm", linewidths=0.5)
    plt.title("Column-Level Match Percent Heatmap")
    plt.xlabel("Column Name")
    plt.ylabel("Table Name")
    plt.tight_layout()
    plt.show()

# ------------------------- PLOT 5: False Mismatch Frequency ------------------------- #
if not false_mismatch_df.empty:
    plt.figure(figsize=(12, 6))
    top_false_mismatches = false_mismatch_df.sort_values(by="false_mismatch_count", ascending=False).head(20)
    sns.barplot(
        data=top_false_mismatches,
        x="column_name",
        y="false_mismatch_count",
        hue="table_name"
    )
    plt.title("Top False Mismatches by Column (Grouped by Table)")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    plt.show()
