# Power BI Dashboard Build Guide

## Data source
Import all CSV files from `11_Data` into Power BI Desktop.

## Recommended relationships
- Customer[CustomerID] 1:* Loan_Master[CustomerID]
- Loan_Master[LoanID] 1:* Verification[LoanID]
- Loan_Master[LoanID] 1:* Payment_History[LoanID]
- Loan_Master[LoanID] 1:* Exceptions[LoanID]

## Dashboard pages
1. Executive Overview - total loans, outstanding balance, approval SLA, verification success, reconciliation accuracy.
2. Loan Operations - application volume, average approval days, status and region breakdown.
3. Payment & Reconciliation - matched vs mismatched payments, variance amount, failed payment trend.
4. Exception Management - backlog, priority, owner team and ageing.
5. Investor Reporting - outstanding balance, collection rate, delinquency rate and interest income trend.

## Recruiter note
A native `.pbix` file must be created in Power BI Desktop. This repository includes the model-ready datasets, relationships, DAX measures and dashboard screenshot mockups.
