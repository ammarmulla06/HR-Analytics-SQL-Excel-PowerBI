# HR Analytics Project — SQL, Excel & Power BI

## Project Overview
This project analyzes employee attrition using SQL, Microsoft Excel, and Power BI. It explores workforce headcount, employee exits, attrition rates, and factors associated with attrition.

## Tools Used
- **SQL:** MySQL database and 15 analysis queries
- **Microsoft Excel:** Data preparation, data-quality review, analysis, and HR dashboard workbook
- **Power BI:** Power BI report file (`.pbix`)

## Dataset and Data Preparation
The Excel workbook documents a merged dataset built from two source files:
- Source 1: 50,000 rows
- Source 2: 50,000 rows
- Rows after merge: 100,000
- Exact duplicate rows removed: 7
- Rows in `Cleaned_Data`: 99,993

## Key Dashboard Metrics
The Excel `HR Dashboard` sheet reports:
- Total employees: **99,993**
- Employees left: **15,944**
- Attrition rate: **15.95%**
- Active employees: **84,049**

## SQL Analysis
The SQL script contains 15 analysis questions, including:
1. Total headcount and overall attrition rate
2. Department-wise attrition
3. Job role-wise attrition
4. Attrition by age group and salary slab
5. Attrition by tenure and distance from home
6. Attrition by overtime
7. Attrition by stock option level
8. Attrition by business travel category
9. Attrition by marital status
10. Attrition by job level and gender
11. Monthly income comparison for employees who left vs. stayed
12. Attrition across monthly income bands
13. Attrition by years since last promotion
14. Age group and salary slab cross-tabulation
15. Attrition by job level and promotion delay

SQL concepts used include `SELECT`, `WHERE`-style conditional logic, `CASE`, aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`), `GROUP BY`, and `ORDER BY`.

## Excel Workbook Contents
The workbook includes sheets for:
- HR Dashboard
- HR_Analysis
- Cleaned_Data
- Data_Quality_Report
- Age Group x Salary Slab
- Missing_Values
- Duplicate_ID_Review
- Read_Me_First
- Data_Quality_Review
- Field_Profile
- Flagged_Records

## Repository Structure
```text
HR-Analytics-SQL-Excel-PowerBI/
├── README.md
├── SQL/
│   └── HR_Analytics_Analysis.sql
├── Excel/
│   └── HR_Analytics_Project.xlsx
├── PowerBI/
│   └── HR_Analytics_Dashboard.pbix
└── Screenshots/
```

## How to Use
1. Review the Excel workbook's `Read_Me_First` and `Data_Quality_Review` sheets.
2. Load the cleaned employee data into a MySQL table named `hr_data` in the `hr_analytics` database before running the SQL analysis script.
3. Open `PowerBI/HR_Analytics_Dashboard.pbix` in Power BI Desktop to inspect the report. If Power BI prompts for a data source, configure it to the appropriate dataset available on your computer.

## Notes
- The SQL script creates and selects the `hr_analytics` database and expects a table named `hr_data` to exist. The uploaded SQL script does not include a `CREATE TABLE` statement or data-loading commands.
- The workbook and Power BI report are included as project artifacts; the README does not claim that every visual or measure has been independently validated.
- Check data-source paths and refresh settings after downloading the repository.

## Author
Ammar Mulla
