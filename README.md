CareWell Healthcare Analytics
Project Overview
CareWell Healthcare Analytics is a data analytics project designed to explore hospital admission patterns, departmental workloads, bed capacity, insurance claim statuses, and financial indicators. The project transforms raw healthcare records into structured information that can support operational review and data-informed planning.

The workflow combines Python and Pandas for data inspection and cleaning, SQL for querying and aggregation, and Microsoft Excel for summaries and presentation of findings.
Data note: The datasets used in this project are supplied project files. Unless independently verified, this repository does not claim that the data was officially published or provided by a real-world CareWell Hospital.

Problem Statement
Healthcare datasets can contain duplicate records, missing values, inconsistent formats, and large volumes of information that are difficult to interpret manually. Without a structured analysis process, it can be challenging to identify admission trends, compare hospital and department workloads, review claim statuses, and examine financial indicators.

This project addresses these challenges by cleaning and analysing the supplied hospital dataset and presenting the results as summaries that can be reviewed by stakeholders.
Objectives
- Inspect and prepare the supplied hospital admission data.
- Identify duplicate records and assess missing values.
- Standardize relevant fields and derive analytical columns.
- Analyse monthly admissions and admission types.
- Compare admission counts across hospitals and departments.
- Summarize insurance claim statuses and financial fields.
- Review bed-capacity information alongside admission patterns.
- Present key findings and recommendations using SQL results and Excel summaries.
Tools and Technologies
- Python — data processing and analysis
- Pandas — tabular data manipulation and cleaning
- SQL / MySQL — data queries, grouping, counts, and aggregations
- Microsoft Excel — summary tables, PivotTables, and charts
- Jupyter Notebook — interactive analysis, if used in the project workflow
Dataset Files
File	Description
carewell_raw_data(1).csv	Raw hospital admission dataset
carewell_cleaned final sql.csv	Processed dataset prepared for analysis
carewell_bed_capacity(1).csv	Hospital- and department-level bed capacity data
Da03_summaries(2).xlsx	Excel workbook containing the cleaned data and summary tables


Dataset dimensions
The supplied raw dataset was reported as containing 5,235 rows and 21 columns. The processed dataset was reported as containing 5,200 rows and 28 columns. These figures should be revalidated whenever the data or cleaning logic changes.

The raw data was reported to contain 35 duplicate rows. Duplicate handling should be validated against the admission identifier as well as complete-row duplicates. Missing values should be handled according to each field's meaning; a missing value should not automatically be treated as zero or as a particular category.
Project Workflow
1. Load the data — read the supplied CSV files into Python using Pandas.
2. Inspect the data — review row and column counts, column names, data types, missing values, and duplicates.
3. Clean and validate — resolve duplicate records, assess missing values, validate dates and numeric fields, and check identifiers.
4. Create analytical fields — derive fields such as admission month and length of stay when supported by valid source dates.
5. Analyse with Python — summarize admissions, hospital and department workloads, financial fields, and readmission indicators.
6. Query with SQL — use aggregation and grouping queries to answer defined business questions.
7. Summarize with Excel — organize findings into summary tables, PivotTables, and charts.
8. Interpret results — identify patterns and areas that warrant further investigation.
9. Communicate recommendations — present evidence-based suggestions for operational review.
Key Analysis Areas
Admission Trends
- Monthly admission counts
- Emergency versus planned admissions
- Hospital-wise admission counts
- Department-wise admission counts
Financial and Claims Analysis
- Total billed amounts
- Claim amounts and amounts received
- Counts by claim status
- Review of the dataset's revenue_lost field
The definition and calculation of revenue_lost should be documented and validated before it is described as confirmed financial loss. Billing, claim, and receipt amounts represent different measures and should not be treated as interchangeable.
Bed Capacity
The bed capacity dataset records hospital, department, and total beds. It can be compared with admission patterns to identify areas for further investigation. Admission counts alone do not measure occupancy; accurate occupancy analysis requires admission and discharge dates and a defined method for counting simultaneous inpatients.
Readmission Indicators
The dataset includes a readmission indicator. This can be used to summarize records marked as readmitted within 30 days. Such results are descriptive and do not, by themselves, establish clinical quality or the cause of readmission.
Example SQL Queries
Adapt table and column names to match the database schema used in your environment.
USE carewell_db;

SELECT COUNT(*) AS total_records
FROM carewell_cleaned;

SELECT
    admission_month,
    COUNT(*) AS total_admissions
FROM carewell_cleaned
GROUP BY admission_month
ORDER BY admission_month;

SELECT
    hospital,
    COUNT(*) AS total_admissions
FROM carewell_cleaned
GROUP BY hospital
ORDER BY total_admissions DESC;

SELECT
    claim_status,
    COUNT(*) AS record_count,
    SUM(claim_amount) AS total_claim_amount
FROM carewell_cleaned
GROUP BY claim_status;
How to Run the Python Workflow
1. Install Python 3 if it is not already installed.
2. Install Pandas:
   python -m pip install pandas
3. Place the CSV files in the project folder, or update the file paths in the code.
4. Load the raw CSV with pd.read_csv(...).
5. Run the inspection, cleaning, validation, and analysis steps.
6. Export the processed data to CSV for use in SQL and Excel.
Example data-loading code:
import pandas as pd

df = pd.read_csv("carewell_raw_data(1).csv")

print("Dataset shape:", df.shape)
print(df.head())
print(df.isnull().sum())
print("Duplicate rows:", df.duplicated().sum())
The commands above demonstrate initial inspection; they do not perform the entire cleaning workflow. Confirm all transformations and validation rules before using the output for reporting.
Key Deliverables
- Inspected and processed hospital dataset
- Python-based data-cleaning and analysis workflow
- SQL queries and aggregated results
- Excel summary workbook
- Findings and recommendations for further review
Limitations
- Results depend on the completeness, accuracy, and definitions in the supplied datasets.
- Admission counts should not be interpreted as unique patients unless patient-level uniqueness has been verified.
- Bed capacity does not directly indicate real-time occupancy.
- Financial indicators, including revenue_lost, require a documented formula and validation.
- Observed trends describe the supplied records and do not prove causal relationships.
Conclusion
CareWell Healthcare Analytics demonstrates a structured approach to preparing and analysing healthcare data with Python, SQL, and Excel. By converting raw records into organized summaries, the project helps surface admission patterns, workload differences, claim-status distributions, and financial indicators for further investigation and data-informed planning.
Author / Team
Add your name, team name, institution, and hackathon details here.
