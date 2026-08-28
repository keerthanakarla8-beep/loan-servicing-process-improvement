# Loan Servicing Process Improvement - Business Analyst Portfolio

## Project Overview
This repository demonstrates a full Business Analyst project for a fictional UK digital lender, **LendWise Finance UK**. The project improves the loan servicing lifecycle from application intake through verification, underwriting, loan setup, payments, servicing exceptions and investor reporting.

## Business Problem
The AS-IS process has manual verification, duplicate data entry, delayed investor reporting, reconciliation discrepancies, long approval cycles, UAT defects and poor exception ownership.

## Target TO-BE Process
Digital Application -> KYC API & Duplicate Check -> Affordability Rules -> Auto Decision / Manual Review -> Automated Loan Setup -> Daily Payment Reconciliation -> Exception Queue with SLA -> Daily Investor Reporting & Power BI.

## Portfolio Deliverables
- Business Case
- BRD and requirements catalog
- FRD
- Stakeholder Matrix
- AS-IS and TO-BE process maps
- Gap Analysis
- User Stories and Acceptance Criteria
- Requirements Traceability Matrix
- UAT Test Cases and Defect Log
- SQL schema, data quality checks and analysis queries
- Power BI dashboard build guide, DAX measures and screenshot mockup
- Executive presentation

## Repository Structure
```text
01_Business_Case/
02_BRD/
03_FRD/
04_Process_Maps/
05_Gap_Analysis/
06_User_Stories/
07_RTM/
08_UAT/
09_SQL/
10_PowerBI/
11_Data/
12_Presentation/
docs/
```

## Dataset
Synthetic, fictional data only:
- 2,500 customer records
- 1,793 loan records
- 19,237 payment records
- 2,809 exception records
- 24 months of investor reporting records

## Skills Demonstrated
Business analysis, requirements documentation, stakeholder analysis, AS-IS / TO-BE process modelling, gap analysis, agile user stories, acceptance criteria, RTM, UAT planning, defect management, SQL, data quality analysis, finance operations reporting and Power BI dashboard design.

## How to Use
1. Review the Business Case, BRD and FRD.
2. Open the AS-IS and TO-BE process maps.
3. Use `02_BRD/BA_Documentation_Workbook.xlsx` for matrix-style BA deliverables.
4. Load CSV files from `11_Data` into PostgreSQL using `09_SQL` scripts.
5. Import CSV files into Power BI Desktop and apply the measures from `10_PowerBI/DAX_Measures.md`.

## Recruiter Summary
This project shows practical evidence of Business Analyst delivery, not only a claim of knowing requirements gathering. It demonstrates how business problems are translated into requirements, process improvements, test evidence, traceability and reporting outputs.
