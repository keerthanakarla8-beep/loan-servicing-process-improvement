# DAX Measures

```DAX
Total Loans = COUNTROWS(Loan_Master)

Active Loans = CALCULATE([Total Loans], Loan_Master[LoanStatus] = "Active")

Outstanding Balance = SUM(Loan_Master[OutstandingBalance])

Average Approval Days = AVERAGE(Loan_Master[ApprovalDays])

Approval SLA % = DIVIDE(CALCULATE(COUNTROWS(Loan_Master), Loan_Master[ApprovalDays] <= 2), [Total Loans])

Verification Success % = DIVIDE(CALCULATE(COUNTROWS(Verification), Verification[KYCStatus] = "Verified"), COUNTROWS(Verification))

Payment Reconciliation Accuracy % = DIVIDE(CALCULATE(COUNTROWS(Payment_History), Payment_History[ReconciliationStatus] = "Matched"), COUNTROWS(Payment_History))

Failed Payment Rate % = DIVIDE(CALCULATE(COUNTROWS(Payment_History), Payment_History[ReconciliationStatus] <> "Matched"), COUNTROWS(Payment_History))

Exception Backlog = CALCULATE(COUNTROWS(Exceptions), Exceptions[Status] <> "Resolved")

Average Exception Age = AVERAGE(Exceptions[AgeDays])

Monthly Interest Income = SUM(Investor_Reporting[InterestIncome])

Delinquency Rate = AVERAGE(Investor_Reporting[DelinquencyRate])
```
