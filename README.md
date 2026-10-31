# CareWell Healthcare Analytics

## Project Overview

CareWell Healthcare Analytics is a data analytics project designed to explore hospital admission patterns, departmental workloads, bed capacity, insurance claim statuses, and financial indicators.

The project transforms raw healthcare records into structured information that can support operational review and data-informed planning.

The workflow combines Python and Pandas for data inspection and cleaning, SQL for querying and aggregation, Microsoft Excel for summaries, and Microsoft Power BI for interactive dashboards and data visualization. Google Colab is used as the cloud-based environment for Python development and analysis.

**Data Note:** The datasets used in this project are supplied project files. Unless independently verified, this repository does not claim that the data was officially published or provided by a real-world CareWell Hospital.

## Problem Statement

Healthcare datasets can contain duplicate records, missing values, inconsistent formats, and large volumes of information that are difficult to interpret manually.

Without a structured analysis process, it can be challenging to identify admission trends, compare hospital and department workloads, review insurance claim statuses, and examine financial indicators.

This project addresses these challenges by cleaning and analysing the supplied hospital dataset and presenting the results as summaries and visualizations that can be reviewed by stakeholders.

## Objectives

- Inspect and prepare the supplied hospital admission data.
- Identify duplicate records and assess missing values.
- Standardize relevant fields and derive analytical columns.
- Analyse monthly admissions and admission types.
- Compare admission counts across hospitals and departments.
- Summarize insurance claim statuses and financial fields.
- Review bed-capacity information alongside admission patterns.
- Perform data analysis using Python and SQL.
- Create summary tables and charts using Microsoft Excel.
- Develop interactive dashboards using Microsoft Power BI.
- Present key findings and recommendations for operational review.

## Tools and Technologies

| Technology | Purpose |
|---|---|
| Python | Data processing and analysis |
| Pandas | Data manipulation and cleaning |
| SQL / MySQL | Data queries, grouping and aggregations |
| Microsoft Excel | Summary tables, PivotTables and charts |
| Microsoft Power BI | Interactive dashboards and data visualization |
| Google Colab | Cloud-based Python development and analysis |

## Dataset Files

| File Name | Description |
|---|---|
| `carewell_raw_data(1).csv` | Raw hospital admission dataset |
| `carewell_cleaned final sql.csv` | Processed dataset prepared for analysis |
| `carewell_bed_capacity(1).csv` | Hospital- and department-level bed capacity data |
| `Da03_summaries(2).xlsx` | Excel workbook containing cleaned data and summary tables |

## Dataset Information

The supplied raw dataset was reported as containing:

- **Rows:** 5,235
- **Columns:** 21
- **Reported duplicate rows:** 35

The processed dataset was reported as containing:

- **Rows:** 5,200
- **Columns:** 28

These figures should be revalidated whenever the source data or cleaning logic changes.

Duplicate handling should be validated using admission identifiers as well as complete-row duplicates. Missing values should be handled according to the meaning of each field.

## Project Workflow

### 1. Data Loading
- Load the supplied CSV files using Pandas.
- Read the datasets into Google Colab.
- Organize the datasets for further analysis.

### 2. Data Inspection
- Check dataset dimensions.
- Review column names and data types.
- Identify missing values.
- Check duplicate records.
- Understand the structure of the supplied datasets.

### 3. Data Cleaning
- Handle duplicate records.
- Assess missing values.
- Standardize inconsistent formats.
- Validate dates and numeric fields.
- Check admission identifiers.

### 4. Feature Engineering
- Derive admission month.
- Calculate length of stay when valid admission and discharge dates are available.
- Create additional analytical columns where appropriate.

### 5. Python Analysis
- Analyse monthly admission trends.
- Compare emergency and planned admissions.
- Examine hospital and department workloads.
- Review financial indicators.
- Analyse readmission records.

### 6. SQL Analysis
- Create the MySQL database and tables.
- Import the cleaned dataset.
- Perform filtering, grouping and aggregation.
- Generate hospital-wise and department-wise summaries.
- Analyse insurance claim statuses.
- Examine financial indicators and bed capacity.

### 7. Excel Analysis
- Import cleaned data.
- Create PivotTables.
- Prepare summary tables.
- Develop charts.
- Present important findings.

### 8. Power BI Dashboard
- Connect the processed dataset to Power BI.
- Create suitable data models and relationships where required.
- Develop interactive visualizations.
- Present admission trends and hospital workloads.
- Visualize financial and insurance claim indicators.
- Build dashboards for analytical reporting.

### 9. Insights and Recommendations
- Identify important patterns.
- Highlight areas requiring further investigation.
- Provide evidence-based recommendations for operational review.

## Key Analysis Areas

### Admission Analysis

- Monthly admission counts.
- Emergency versus planned admissions.
- Hospital-wise admission counts.
- Department-wise admission counts.

### Financial and Insurance Claims Analysis

- Total billed amounts.
- Insurance claim amounts.
- Amounts received.
- Claim-status distribution.
- Review of the `revenue_lost` field.

**Note:** The definition and calculation of `revenue_lost` must be validated before treating it as confirmed financial loss. Billing, claim and receipt amounts represent different measures.

### Bed Capacity Analysis

- Hospital-wise bed capacity.
- Department-wise bed capacity.
- Comparison of bed capacity with admission patterns.

Admission counts alone do not measure occupancy. Accurate occupancy analysis requires admission and discharge dates and a defined method for counting simultaneous inpatients.

### Readmission Analysis

- Summarize records marked as readmitted within 30 days.
- Compare readmission indicators across hospitals or departments, where appropriate.

Readmission results are descriptive and do not independently establish clinical quality or the causes of readmission.

## SQL Examples

The following queries demonstrate the planned analysis. Table and column names should be adapted to the actual database schema.

```sql
USE carewell_db;

-- Total number of records
SELECT COUNT(*) AS total_records
FROM carewell_cleaned;

-- Monthly admission analysis
SELECT
    admission_month,
    COUNT(*) AS total_admissions
FROM carewell_cleaned
GROUP BY admission_month
ORDER BY admission_month;

-- Hospital-wise admission analysis
SELECT
    hospital,
    COUNT(*) AS total_admissions
FROM carewell_cleaned
GROUP BY hospital
ORDER BY total_admissions DESC;

-- Insurance claim status analysis
SELECT
    claim_status,
    COUNT(*) AS record_count,
    SUM(claim_amount) AS total_claim_amount
FROM carewell_cleaned
GROUP BY claim_status;
```

## How to Run the Python Workflow

### Prerequisites

- Python 3
- Pandas
- MySQL
- Microsoft Excel
- Microsoft Power BI
- Google Colab account

### Install Pandas

```bash
python -m pip install pandas
```

### Using Google Colab

1. Open Google Colab.
2. Create a new notebook.
3. Upload the supplied CSV datasets.
4. Import the Pandas library.
5. Load the datasets.
6. Perform inspection, cleaning and validation.
7. Analyse the processed data.
8. Export the cleaned dataset for SQL, Excel and Power BI.

### Load the Dataset

```python
import pandas as pd

df = pd.read_csv("carewell_raw_data(1).csv")

print("Dataset Shape:", df.shape)

print(df.head())

print(df.isnull().sum())

print("Duplicate Rows:", df.duplicated().sum())
```

The above code performs initial dataset inspection. Additional cleaning, validation and analysis steps are required to complete the workflow.

## Expected Deliverables

- Inspected and processed hospital dataset.
- Python-based data-cleaning workflow.
- Python analysis and derived analytical fields.
- MySQL database and analytical queries.
- Excel summary workbook.
- PivotTables and charts.
- Interactive Power BI dashboard.
- Project findings and recommendations.
- Final project documentation.

## Limitations

- Results depend on the completeness and accuracy of the supplied datasets.
- Admission counts should not be interpreted as unique patients unless patient-level uniqueness is verified.
- Bed capacity does not directly indicate real-time occupancy.
- Financial indicators, including `revenue_lost`, require documented definitions and validation.
- Observed trends describe the supplied records and do not establish causal relationships.

## Conclusion

CareWell Healthcare Analytics demonstrates a structured approach to preparing and analysing healthcare data using Python, Pandas, SQL, Microsoft Excel and Microsoft Power BI.

By converting raw records into organized summaries and interactive visualizations, the project helps identify admission patterns, workload differences, insurance claim distributions and financial indicators for further investigation and data-informed planning.

---

**Project Name:** CareWell Healthcare Analytics  
**Domain:** Healthcare Data Analytics  
**Technologies:** Python | Pandas | MySQL | Microsoft Excel | Microsoft Power BI | Google Colab
