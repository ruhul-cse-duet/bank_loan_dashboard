SELECT TOP 10 * FROM bank_loan_data;


--Total Loan Applications------------------------------------------
SELECT COUNT(id) as Total_Applicant FROM bank_loan_data;

--MTD Loan Applications----------------------------------------------------
SELECT COUNT(id) as MTD_Applicant FROM bank_loan_data
where MONTH(issue_date) = 12

--PMTD Loan Applications-----------------------------------------------
SELECT COUNT(id) as PMTD_Applicant FROM bank_loan_data
where MONTH(issue_date) = 11

--Total Funded Amount----------------------------------------------------------
SELECT SUM(loan_amount) as Total_Funded_amount FROM bank_loan_data


--MTD Total Funded Amount------------------------------------------------------------
SELECT SUM(loan_amount) as MTD_Funded_amount FROM bank_loan_data
where MONTH(issue_date) = 12


--PMTD Total Funded---------------------------------------------------
SELECT SUM(loan_amount) as PMTD_Funded_amount FROM bank_loan_data
where MONTH(issue_date) = 11


--Total Amount Received------------------------------------------------------------------
SELECT SUM(total_payment) as Total_Payment_amount FROM bank_loan_data

--MTD Total Amount Received------------------------------------------------------------
SELECT SUM(total_payment) as MTD_Total_Payment_amount FROM bank_loan_data
where MONTH(issue_date) = 12


--PMTD Total Amount Received---------------------------------------------------
SELECT SUM(total_payment) as PMTD_Total_Payment_amount FROM bank_loan_data
where MONTH(issue_date) = 11


--Average Interest Rate--------------------------------------------------------
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data
 

--MTD Average Interest---------------------------------------------------------
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 

--PMTD Average Interest----------------------------------------------------------
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11


--Avg DTI-------------------------------------------------------------------------
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data
 

--MTD Avg DTI--------------------------------------------------------------------
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12
 

--PMTD Avg DTI-------------------------------------------------------------------
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11


--GOOD LOAN ISSUED
--Good Loan Percentage----------------------------------------------------
SELECT
	(COUNT(CASE WHEN loan_status ='Fully Paid' OR loan_status = 'Current' THEN id END) *100.0
	/ COUNT(id)) as Good_loan_percentage
	FROM bank_loan_data



--Good Loan Applications------------------------------------
select count(id) As Good_loan_applicant
from bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'


--Good Loan Funded Amount-------------------------------------------------
SELECT SUM(loan_amount) as Good_loan_Funded_amount FROM bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'


--Good Loan Amount Received-------------------------------------------------
SELECT SUM(total_payment) as Good_loan_Funded_amount FROM bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current'


--Bad Loan Percentage-------------------------------------------------------------
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data
 
--Bad Loan Applications--------------------------------------------------------
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 
--Bad Loan Funded Amount---------------------------------------------------------
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'


--Bad Loan Amount Received-------------------------------------------------
SELECT SUM(total_payment) as Good_loan_Funded_amount FROM bank_loan_data
where loan_status = 'Charged off'


--Loan Status------------------------------------------------------------------
SELECT
	loan_status,
	COUNT(id) AS LoanCount,
	SUM(total_payment) As Total_payment_received,
	SUM(loan_amount) AS Total_Funded_amount,
	AVG(int_rate)*100 AS Avg_Int_Rate,
	AVG(dti)*100 AS Avg_DTI

FROM bank_loan_data
GROUP BY loan_status



