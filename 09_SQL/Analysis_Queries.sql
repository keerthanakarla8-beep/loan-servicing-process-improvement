-- Loan Servicing SQL Analysis Queries

-- 1. Average approval turnaround time by region
SELECT region, ROUND(AVG(approval_days),2) AS avg_approval_days, COUNT(*) AS loan_count
FROM loan_master
GROUP BY region
ORDER BY avg_approval_days DESC;

-- 2. Verification success rate
SELECT kyc_status, COUNT(*) AS volume,
       ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total
FROM verification
GROUP BY kyc_status;

-- 3. Payment reconciliation accuracy
SELECT ROUND(SUM(CASE WHEN reconciliation_status = 'Matched' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS reconciliation_accuracy_pct
FROM payment_history;

-- 4. Payment mismatches by category
SELECT reconciliation_status, COUNT(*) AS payment_count, ROUND(SUM(expected_amount - paid_amount),2) AS variance_amount
FROM payment_history
WHERE reconciliation_status <> 'Matched'
GROUP BY reconciliation_status
ORDER BY payment_count DESC;

-- 5. Duplicate customer detection pattern
SELECT email, dob, COUNT(*) AS duplicate_count
FROM customer
GROUP BY email, dob
HAVING COUNT(*) > 1;

-- 6. Delinquent and defaulted loans by risk band
SELECT risk_band, loan_status, COUNT(*) AS loans, ROUND(SUM(outstanding_balance),2) AS balance
FROM loan_master
WHERE loan_status IN ('Delinquent','Defaulted')
GROUP BY risk_band, loan_status
ORDER BY balance DESC;

-- 7. Exception backlog and SLA risk
SELECT owner_team, priority, status, COUNT(*) AS exception_count, ROUND(AVG(age_days),2) AS avg_age_days
FROM exceptions
GROUP BY owner_team, priority, status
ORDER BY exception_count DESC;

-- 8. Investor reporting trend
SELECT report_date, loan_count, outstanding_balance, collection_rate, delinquency_rate, interest_income
FROM investor_reporting
ORDER BY report_date;

-- 9. Loans blocked due to failed KYC
SELECT lm.loan_id, lm.customer_id, lm.product, v.kyc_status, lm.loan_status
FROM loan_master lm
JOIN verification v ON lm.loan_id = v.loan_id
WHERE v.kyc_status IN ('Failed','Manual Review');

-- 10. Daily payment collection performance
SELECT paid_date, COUNT(*) AS payments, ROUND(SUM(paid_amount),2) AS collected_amount,
       ROUND(SUM(expected_amount),2) AS expected_amount
FROM payment_history
GROUP BY paid_date
ORDER BY paid_date;
