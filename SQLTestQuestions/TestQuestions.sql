/*********************
Hello! 

Please use the test data provided in the file 'PersonDatabase' to answer the following
questions. All answers should be written using SQL. 

***********************

QUESTION 1

The table dbo.Person contains basic demographic information. The source system users 
input nicknames as strings inside parenthesis. Write a query or group of queries to 
return the full name and nickname of each person. The nickname should contain only letters 
or be blank if no nickname exists.

**********************/








/**********************

QUESTION 2

The table dbo.Risk contains calculated risk scores for the population in dbo.Person. Write a 
query or group of queries that return the patient name, and their most recent risk level(s). 
Any patients that dont have a risk level should also be included in the results. 

Bonus: Write a query that returns only one level per patient, so that High > Medium > Low

**********************/








/**********************

QUESTION 3

The following query returns patients older than 55 and their assigned risk level history. 

A. What changes could be made to this query to improve optimization? Rewrite the query with  
any improvements in the Answer A section below.

B. What changes would we need to make to run this query at any time to return patients over 55?
Rewrite the query with any required changes in Answer B section below. 

**********************/

	SELECT *
	FROM DBO.Person P
	INNER JOIN DBO.Risk R
		ON R.PersonID = P.PersonID

	WHERE P.PersonID IN 
		(
			SELECT personid
			FROM Person
			WHERE DATEOFBIRTH < '1/1/1961'
		)

	AND P.ISACTIVE = '1'


--------Answer A--------------------








---------Answer B--------------------









/**********************

QUESTION 4

Looking at the script 'PersonDatabase', what change(s) could be made to improve the database structure?  

What method(s) could we use to standardize the data allowed in dbo.Person (Sex) to only allow 'Male' or 'Female'?

Assuming these tables will grow very large, what other database tools/objects could we use to ensure they remain
efficient when queried?

**********************/

