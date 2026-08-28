-- Loan Servicing Process Improvement - PostgreSQL schema
DROP TABLE IF EXISTS investor_reporting, exceptions, payment_history, verification, loan_master, customer CASCADE;
CREATE TABLE customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100), dob DATE, email VARCHAR(150), region VARCHAR(50), annual_income NUMERIC(12,2), risk_band VARCHAR(20)
);
CREATE TABLE loan_master (
    loan_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) REFERENCES customer(customer_id), product VARCHAR(50), region VARCHAR(50), loan_amount NUMERIC(12,2), term_months INT, interest_rate NUMERIC(5,2), application_date DATE, approval_date DATE, approval_days INT, loan_status VARCHAR(30), risk_band VARCHAR(20), outstanding_balance NUMERIC(12,2)
);
CREATE TABLE verification (
    verification_id VARCHAR(20) PRIMARY KEY, loan_id VARCHAR(20) REFERENCES loan_master(loan_id), customer_id VARCHAR(20) REFERENCES customer(customer_id), kyc_status VARCHAR(30), verification_date DATE, document_type VARCHAR(50), verification_method VARCHAR(30)
);
CREATE TABLE payment_history (
    payment_id VARCHAR(20) PRIMARY KEY, loan_id VARCHAR(20) REFERENCES loan_master(loan_id), due_date DATE, paid_date DATE, expected_amount NUMERIC(12,2), paid_amount NUMERIC(12,2), reconciliation_status VARCHAR(30)
);
CREATE TABLE exceptions (
    exception_id VARCHAR(20) PRIMARY KEY, loan_id VARCHAR(20) REFERENCES loan_master(loan_id), category VARCHAR(50), priority VARCHAR(20), status VARCHAR(30), created_date DATE, owner_team VARCHAR(50), age_days INT
);
CREATE TABLE investor_reporting (
    report_date DATE, portfolio_id VARCHAR(30), loan_count INT, outstanding_balance NUMERIC(14,2), collection_rate NUMERIC(8,4), delinquency_rate NUMERIC(8,4), interest_income NUMERIC(14,2)
);
