-- Run this from psql with \copy commands after placing CSV files in the 11_Data folder.
\copy customer FROM '../11_Data/Customer.csv' WITH (FORMAT csv, HEADER true);
\copy loan_master FROM '../11_Data/Loan_Master.csv' WITH (FORMAT csv, HEADER true);
\copy verification FROM '../11_Data/Verification.csv' WITH (FORMAT csv, HEADER true);
\copy payment_history FROM '../11_Data/Payment_History.csv' WITH (FORMAT csv, HEADER true);
\copy exceptions FROM '../11_Data/Exceptions.csv' WITH (FORMAT csv, HEADER true);
\copy investor_reporting FROM '../11_Data/Investor_Reporting.csv' WITH (FORMAT csv, HEADER true);
