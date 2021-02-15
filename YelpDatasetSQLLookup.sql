--Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

--This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

--In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

--For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
--In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



--Part 1: Yelp Dataset Profiling and Understanding

--1. Profile the data by finding the total number of records for each of the tables below:
	
--i. Attribute table = 10.000
--ii. Business table = 10.000
--iii. Category table = 10.000
--iv. Checkin table = 10.000
--v. elite_years table = 10.000
--vi. friend table = 10.000
--vii. hours table = 10.000
--viii. photo table = 10.000
--ix. review table =  10.000
--x. tip table = 10.000
--xi. user table = 10.000

--code
SELECT COUNT(*)
FROM nametable
	


--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

--i. Business = PK id = 10.000
--ii. Hours = FK business_id = 1.562
--iii. Category = FK business_id = 2.642
--iv. Attribute = FK business_id = 1.115 
--v. Review = PK id = 10.000 and FK business_id = 8090 
--vi. Checkin = FK business_id = 2.642
--vii. Photo = PK id= 10.000 and FK business_id= 6.493
--viii. Tip = FK user_id = 537 and  FK business_id = 3.979
--ix. User = PK id = 10.000
--x. Friend = FK user_id = 11 
--xi. Elite_years = FK user_id = 2.780

--Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

-- code 
SELECT COUNT(DISTINCT namekey)
from nametable


--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

--	Answer: No 
	
	
--	SQL code used to arrive at answer:
SELECT COUNT(*)
FROM user
WHERE id IS NULL
OR name IS NULL
OR review_count IS NULL
OR yelping_since IS NULL
OR useful IS NULL
OR funny IS NULL
OR cool IS NULL
OR fans IS NULL
OR average_stars IS NULL
OR compliment_hot IS NULL
OR compliment_more IS NULL
OR compliment_profile IS NULL
OR compliment_cute IS NULL
OR compliment_list IS NULL
OR compliment_note IS NULL
OR compliment_plain IS NULL
OR compliment_cool IS NULL
OR compliment_funny IS NULL
OR compliment_writer IS NULL
OR compliment_photos IS NULL
	
	

	
--4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

--	i. Table: Review, Column: Stars
	
--		min: 1		max: 5 		avg: 3.7082
		
	
--	ii. Table: Business, Column: Stars
	
--		min: 1  	max: 5		avg: 3.6549
		
	
--	iii. Table: Tip, Column: Likes
	
--		min: 0	    max:2		avg:0.0144
		
	
--	iv. Table: Checkin, Column: Count
	
--		min: 1		max: 53		avg: 1.9414
		
	
--	v. Table: User, Column: Review_count
	
--		min: 0		max: 2000	 vg:24.2995

-- code

SELECT  MIN (columnname) AS aliasname
       ,MAX (columnname) AS aliasname
       ,AVG (columnname) AS aliasname
from nametable 
		


--5. List the cities with the most reviews in descending order:

--	SQL code used to arrive at answer:

SELECT city
      ,SUM(review_count) AS NumReviews
FROM business
GROUP BY city
ORDER BY NumReviews DESC
	
	
--	Copy and Paste the Result Below:

+-----------------+------------+
| city            | NumReviews |
+-----------------+------------+
| Las Vegas       |      82854 |
| Phoenix         |      34503 |
| Toronto         |      24113 |
| Scottsdale      |      20614 |
| Charlotte       |      12523 |
| Henderson       |      10871 |
| Tempe           |      10504 |
| Pittsburgh      |       9798 |
| Montr�al        |       9448 |
| Chandler        |       8112 |
| Mesa            |       6875 |
| Gilbert         |       6380 |
| Cleveland       |       5593 |
| Madison         |       5265 |
| Glendale        |       4406 |
| Mississauga     |       3814 |
| Edinburgh       |       2792 |
| Peoria          |       2624 |
| North Las Vegas |       2438 |
| Markham         |       2352 |
| Champaign       |       2029 |
| Stuttgart       |       1849 |
| Surprise        |       1520 |
| Lakewood        |       1465 |
| Goodyear        |       1155 |
+-----------------+------------+
(Output limit exceeded, 25 of 362 total rows shown)
	
	
--6. Find the distribution of star ratings to the business in the following cities:

--i. Avon

--SQL code used to arrive at answer:

SELECT SUM(review_count) AS Number_Distribution
,stars
FROM business
WHERE city == "Avon"
GROUP BY stars


--Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+---------------------+-------+
| Number_Distribution | stars |
+---------------------+-------+
|                  10 |   1.5 |
|                   6 |   2.5 |
|                  88 |   3.5 |
|                  21 |   4.0 |
|                  31 |   4.5 |
|                   3 |   5.0 |
+---------------------+-------+

--ii. Beachwood

--SQL code used to arrive at answer:

SELECT SUM(review_count) AS Number_Distribution
,stars
FROM business
WHERE city == "Beachwood"
GROUP BY stars


--Copy and Paste the Resulting Table Below (2 columns – star rating and count):

+---------------------+-------+
| Number_Distribution | stars |
+---------------------+-------+
|                   8 |   2.0 |
|                   3 |   2.5 |
|                  11 |   3.0 |
|                   6 |   3.5 |
|                  69 |   4.0 |
|                  17 |   4.5 |
|                  23 |   5.0 |
+---------------------+-------+
		

--7. Find the top 3 users based on their total number of reviews:
		
--	SQL code used to arrive at answer:
SELECT review_count
      ,name
FROM user
ORDER BY review_count DESC
LIMIT 3
-- or top on SQL SERVER

--	Copy and Paste the Result Below:

+--------------+--------+
| review_count | name   |
+--------------+--------+
|         2000 | Gerald |
|         1629 | Sara   |
|         1339 | Yuri   |
+--------------+--------+
		

--8. Does posing more reviews correlate with more fans?

--	Please explain your findings and interpretation of the results:

--This isn't the unique factor, because can to be see Amy who has the most fans but has 609 reviews. Gerald has 253 fans and has the most reviews than others  

-- code 
SELECT name
      ,review_count
      ,fans
FROM user
ORDER BY fans DESC
	

	
--9. Are there more reviews with the word "love" or with the word "hate" in them?

--	Answer:
Yes there 1780 registers to love and 232 to hate 

	
--	SQL code used to arrive at answer:

SELECT COUNT(*)
FROM review
WHERE text LIKE "%love%";

SELECT COUNT(*)
FROM review
WHERE text LIKE "%hate%";

	
	
--10. Find the top 10 users with the most fans:

--	SQL code used to arrive at answer:

SELECT name
      ,fans
FROM user
ORDER BY fans DESC
LIMIT 10	
	
--	Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
		

--Part 2: Inferences and Analysis

--1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
--Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
--i. Do the two groups you chose to analyze have a different distribution of hours?
-- I choose the cuty Charlotte and categoty Eletronics, in thi case have different distribution of hours on Saturdays(9:00-17:00) than the weekdays(9:00-19:00)


--ii. Do the two groups you chose to analyze have a different number of reviews?
-- No
         
         
--iii. Are you able to infer anything from the location data provided between these two groups? Explain.
--No, all the data has the iqual registers

----SQL code used for analysis:

SELECT B.city
      ,B.stars
      ,B.review_count
      ,B.postal_code
      ,C.category
      ,H.hours
FROM business B 
INNER JOIN category C ON B.id = C.business_id
INNER JOIN hours H ON H.business_id = B.id
WHERE city = 'Charlotte' AND category = 'Electronics'
ORDER BY stars 


		
		
--2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? 
--List at least two differences and the SQL code you used to arrive at your answer.
		
--i. Difference 1:
-- The average to reviews is 23.19 to close and 31.75. 
         
         
--ii. Difference 2:
-- The average by starts to close is 3.52  and to open is 3.67.    
                 
--SQL code used for analysis:

SELECT COUNT(DISTINCT(id))
      ,AVG(review_count)
      ,SUM(review_count)
      ,AVG(stars)
	  ,is_open
FROM business
GROUP BY is_open 
	
	
--3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

--Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, 
--predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, 
--so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
--i. Indicate the type of analysis you chose to do:

--I analysed if the years and amount from the users is significant in your number's stars, in this case the answer is no, Ed has a 904 reviews, only 2 stars and 38 fans
         
         
--ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data
                           
 -- I used the name and fans from the table users and merge with table review to get the stars and years from the table elite_years to validate the influence 
 -- the years in results.
                  
--iii. Output of your finished dataset:

+-------+--------+------+--------------+------+
| stars | name   | fans | review_count | year |
+-------+--------+------+--------------+------+
|     2 | Ed     |   38 |          904 | 2012 |
|     4 | Dixie  |   41 |          503 | 2015 |
|     4 | Nieves |   80 |          178 | 2014 |
+-------+--------+------+--------------+------+
         
         
--iv. Provide the SQL code you used to create your final dataset:

SELECT 
       R.stars
      ,U.name
      ,U.fans 
      ,U.review_count
      ,E.year     
FROM review R 
INNER JOIN user U ON R.user_id = U.id
INNER JOIN elite_years E ON E.user_id = R.user_id
GROUP BY name
ORDER BY review_count DESC