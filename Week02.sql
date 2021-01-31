-- Week 02 - Filtering, Sorting, and Calculating Data with SQL


--USE Chinook

-- Find the distinct values for the extended step. 

SELECT 
	DISTINCT Extended_step
FROM salary_range_by_job_classification

-- Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 

Select 
MIN(Biweekly_high_Rate)
FROM salary_range_by_job_classification
    WHERE NOT Biweekly_high_Rate = '$0.00';
		

-- What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? 

Select
	job_code, 
	pay_type
FROM salary_range_by_job_classification
	WHERE job_code LIKE '03%';

-- Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? 

SELECT
	grade
	,eff_date
	,sal_end_date
FROM salary_range_by_job_classification
	WHERE grade LIKE '%Q90H0%'

-- Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. 

SELECT 
   Biweekly_Low_Rate 
FROM salary_range_by_job_classification
   ORDER BY Biweekly_Low_Rate ASC;

-- Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? 

SELECT 
	Job_Code 
	,Step 
FROM salary_range_by_job_classification
		WHERE Job_Code = '0110' OR Job_Code = '0400';

--What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
SELECT 
	Job_code,
	,Biweekly_high_rate
	,Biweekly_low_rate 
	(biweekly_high_rate - Biweekly_low_rate) AS CALC
FROM salary_range_by_job_classification
	WHERE Job_code = '0170'

-- What is the Extended Step for Pay Types M, H, and D? 
SELECT 
	 Pay_Type 
	,Extended_Step  
FROM salary_range_by_job_classification
		WHERE  Pay_Type IN('M', 'H', 'D') 

-- What is the step for Union Code 990 and a Set ID of SFMTA or COMMN? 
SELECT 
      Step 
	 ,SetID
     ,Union_Code
FROM salary_range_by_job_classification
		WHERE  Union_Code LIKE '990'
        AND SetID IN ('SFMTA' ,'COMMN');

-- Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT 
   name
  ,milliseconds 
  FROM Tracks
      WHERE milliseconds >= 500000;

-- Find all the invoices whose total is between $5 and $15 dollars
SELECT 
   InvoiceId
  ,Total 
  FROM Invoices
    WHERE Total >= 5.00 
     AND Total <= 15.00;

-- Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT 
   FirstName
   ,Company
   ,State 
  FROM Customers 
     WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

-- Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT 
    InvoiceId
   ,CustomerId
   ,Total 
   ,InvoiceDate
  FROM Invoices
    WHERE CustomerId  IN (56,58) 
    AND Total >= 1.00 
     AND Total <= 5.00;

-- Find all the tracks whose name starts with 'All'.
SELECT 
    Name  
  FROM Tracks
    WHERE Name LIKE 'All%';

-- Find all the customer emails that start with "J" and are from gmail.com.
SELECT 
    Email  
  FROM Customers
    WHERE Email LIKE 'J%@gmail.com';

--Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT 
    InvoiceId
    ,BillingCity  
    ,Total
  FROM Invoices
    WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
        ORDER BY InvoiceId DESC;

-- Show the number of orders placed by each customer 

SELECT
      CustomerId
      ,InvoiceId
      ,Total
      ,count(*) AS TotalOrders     
  FROM Invoices
      GROUP BY CustomerId
      ORDER BY CustomerId DESC;

-- Find the albums with 12 or more tracks.

SELECT  
     AlbumId
    ,TrackId 
    ,count(*) AS TotalTracks
  FROM Tracks
   GROUP BY AlbumId
    HAVING count(*) >=12;

--
