-- Week 03 Subqueries and Joins in SQL

--How many albums does the artist Led Zeppelin have?

SELECT count(*) 
FROM (SELECT *
	FROM Artists
	LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistId)
WHERE Name="Led Zeppelin";

--Create a list of album titles and the unit prices for the artist "Audioslave". 

SELECT A.Title
	 ,T.UnitPrice
	 ,AR.Name
FROM ((Albums A INNER JOIN Artists AR ON A.ArtistId = AR.ArtistId) 
                INNER JOIN Tracks T ON A.AlbumId = T.AlbumId)
WHERE AR.Name = 'Audioslave'

--Find the first and last name of any customer who does not have an invoice. 

SELECT C.FirstName
	  ,C.LastName
	  ,I.InvoiceId
FROM (Customers C LEFT JOIN Invoices I
ON C.CustomerId = I.CustomerId)
WHERE InvoiceId IS NULL

--Find the total price for each album. 

SELECT A.Title
	  ,SUM(T.UnitPrice)
FROM (Albums a INNER JOIN Tracks T 
ON A.AlbumId = T.AlbumId)
WHERE A.Title = 'Big Ones'
GROUP BY A.Title

--How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT I.InvoiceId
FROM Invoices I
CROSS JOIN Invoice_items IT


--Using a subquery, find the names of all the tracks for the album "CalifornicatiON". 

SELECT Tracks.Name,Albums.Title
FROM Tracks
LEFT JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId
WHERE Albums.Title = "Californication";

--Find the total number of invoices for each customer along with the customer's full name, city and email. 

SELECT A.FirstName
	,A.LAStName,A.City
	,A.Email
	,COUNT(A.InvoiceId) AS TotalNum
FROM
(SELECT C.FirstName
		,C.LAStName
		,C.City
		,C.Email
		,I.InvoiceId
FROM Customers C
LEFT JOIN Invoices I
ON C.CustomerId = I.CustomerId) AS A
GROUP BY A.FirstName
HAVING A.FirstName = "František";

--Retrieve the track name, album, artistID, and trackID for all the albums. 

SELECT   T.Name
		,T.TrackId
		,T.Title
		,T.ArtistId
FROM Tracks T
LEFT JOIN Albums A
ON T.AlbumId = A.AlbumId
WHERE A.Title LIKE "For Those About to Rock We Salute You" 
AND T.TrackId=12;

--Retrieve a list with the managers lASt name, and the last name of the employees who report to him or her.  

SELECT  M.LastName AS Manager
	   ,E.LastName AS Employee
FROM Employees E INNER JOIN Employees M
ON E.ReportsTo = M.EmployeeID

--Find the name and id of the artists who do not have albums. 

SELECT  Name AS Artist
	   ,Artists.ArtistId
	    ,Albums.Title AS Album
FROM Artists 
LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistId  
WHERE Album IS NULL 


--Use a union to create a list of all the employee's and customer's first names and last names ordered by the lASt name in descending order. 
SELECT FirstName, 
	   LastName 
FROM Employees
UNION
SELECT FirstName
	   ,LastName 
FROM Customers
ORDER BY LastName DESC

--See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT C.FirstName
	  ,C.City
	  ,I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE C.City != I.BillingCity 