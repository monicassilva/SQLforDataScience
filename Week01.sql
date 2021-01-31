-- Week 01 - Getting Started and Selecting & Retrieving Data with SQL 

--USE Chinook

-- Retrieve all the records from the Employees table.

SELECT * 
FROM Employee;

-- Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.

SELECT 
	 FirstName
	,LastName
	,Birthdate
	,Address
	,City
	,State
FROM Employee;

-- Retrieve all the columns from the Tracks table, but only return 20 rows.

SELECT TOP 20 *
	FROM Track; 






 




