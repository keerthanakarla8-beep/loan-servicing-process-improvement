-- Data Quality Checks
SELECT 'Missing customer id in loans' AS check_name, COUNT(*) AS issue_count FROM loan_master WHERE customer_id IS NULL
UNION ALL
SELECT 'Invalid approval date before application date', COUNT(*) FROM loan_master WHERE approval_date < application_date
UNION ALL
SELECT 'Negative outstanding balance', COUNT(*) FROM loan_master WHERE outstanding_balance < 0
UNION ALL
SELECT 'Payments without loan record', COUNT(*) FROM payment_history ph LEFT JOIN loan_master lm ON ph.loan_id = lm.loan_id WHERE lm.loan_id IS NULL
UNION ALL
SELECT 'KYC failed but approved loans', COUNT(*) FROM loan_master lm JOIN verification v ON lm.loan_id=v.loan_id WHERE v.kyc_status='Failed' AND lm.loan_status='Approved';
