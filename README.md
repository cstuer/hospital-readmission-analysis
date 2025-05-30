# Hospital Readmission Analysis

This project analyzes hospital readmission data from the CMS FY2025 Hospital Readmissions Reduction Program. The goal is to clean and explore the dataset using SQL, then visualize key performance metrics in Tableau to highlight insights related to excess readmission ratios across U.S. healthcare facilities.

## Project Structure
```
hospital-readmission-analysis/
├── data/
│ └── FY_2025_Hospital_Readmissions_Reduction_Program_Hospital.csv
├── sql/
│ ├── clean_and_transform_readmission_data.sql
│ ├── facility_readmission_performance.sql
│ ├── hospital_readmissions_analysis_queries.sql
│ ├── kpis_hospital_readmission.sql
│ └── state_level_avg_readmissions.sql
├── images/
│ ├── Hospital_Readmissions_KPIs.twb
│ └── Hospital_Readmissions_KPIs.pdf
```
## Data Cleaning

Script: clean_and_transform_readmission_data.sql

- Removed invalid values such as "N/A" and "Too Few to Report"
- Cast text columns to appropriate data types (integers, floats, dates)
- Replaced original columns with cleaned versions

## Key Performance Indicators (KPIs)

Script: kpis_hospital_readmission.sql

1. National average excess readmission ratio
2. Total number of facilities analyzed
3. State with the highest average readmission ratio
4. Percentage of facilities with excess ratio above 1.0

## State-Level and Facility-Level Analysis

Scripts:
- state_level_avg_readmissions.sql
- facility_readmission_performance.sql
- hospital_readmissions_analysis_queries.sql

Metrics:
- Average excess readmission ratio by state
- Top 10 facilities with the highest ratios
- Facility performance categories
- Predicted vs. expected readmission rates by state
- Total number of readmissions by state

## Tableau Visualization

File: Hospital_Readmissions_KPIs.twb

Dashboard includes:
- National KPIs and benchmarks
- State-level comparisons
- Exportable views for PDF reporting

A PDF version of the dashboard is also available:
Hospital_Readmissions_KPIs.pdf

## Tools Used

- PostgreSQL for data processing and querying
- Tableau for data visualization and dashboard development
- Excel/CSV for data input

## Data Source

CMS Hospital Readmissions Reduction Program (FY 2025)  
https://data.cms.gov/

## Author

Cody Stuerman  
LinkedIn: https://www.linkedin.com/in/codystuerman  
GitHub: https://github.com/cstuer
