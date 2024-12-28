SELECT * FROM bank_loan_data;

select DISTINCT loan_status from bank_loan_data

--BANK LOAN REPORT | OVERVIEW-----------------------------------MONTH--------------------------------
SELECT
	MONTH(issue_date) As Month_number,
	DATENAME(MONTH, issue_date) AS Month_name,
	COUNT(id) AS Loan_applicant,
	SUM(loan_amount) AS Total_loan_funded,
	SUM(total_payment) As Total_payment_received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


--BANK LOAN REPORT | OVERVIEW-----------------------------------STATE--------------------------------
SELECT
	address_state AS State,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY Total_applicant

--BANK LOAN REPORT | OVERVIEW-----------------------------------TERM--------------------------------
SELECT
	term AS TERM,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term desc


--BANK LOAN REPORT | OVERVIEW-----------------------------------EMPLOYEE LENGTH--------------------------------
SELECT
	emp_length AS EMP_Length,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length 

--BANK LOAN REPORT | OVERVIEW-----------------------------------Perpose--------------------------------
SELECT
	purpose AS PERPOSE,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY Total_applicant 


--BANK LOAN REPORT | OVERVIEW-----------------------------------HOME OWNERSHIP--------------------------------
SELECT
	home_ownership AS HOME_OWNERSHIP,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY Total_applicant



SELECT
	emp_length AS EMP_Length,
	COUNT(id) AS Total_applicant,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY emp_length
ORDER BY emp_length 

