USE PERSONDATABASE

/*********************
Hello! 

Please use the test data provided in the file 'PersonDatabase' to answer the following
questions. All answers should be written using SQL. 

***********************
select * from person
select  * from Risk order by personID



QUESTION 1

The table dbo.Risk contains calculated risk scores for the population in dbo.Person. Write a 
query or group of queries that return the patient name, and their most recent risk level(s). 
Any patients that dont have a risk level should also be included in the results. 

**********************/
select p.PersonName, RiskLevel,max(riskDateTime) from person p
left join risk R
on R.PersonID =P.PersonID
group  by p.PersonName,RiskLevel
order by p.PersonName











/**********************

QUESTION 2


The table dbo.Person contains basic demographic information. The source system users 
input nicknames as strings inside parenthesis. Write a query or group of queries to 
return the full name and nickname of each person. The nickname should contain only letters 
or be blank if no nickname exists.

**********************/

select * from person
--select  * from Risk order by personID

select charindex(PersonName,'(',1) from Person 








/**********************

QUESTION 3

Following the rules in question 1, 
write a query that returns only one level 
per patient, so that Gold > Silver > Bronze


**********************/

 
I would create CTE with row_number partioning by Id

Select * from cte where row_number =1









/**********************

QUESTION 4

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

select * from person P
join dbo.risk R 
on R.PersonID=P.PersonID
where P.DateofBirth<'1/1/1961'
AND P.ISACTIVE = 1






---------Answer B--------------------

select * from person P
join dbo.risk R 
on R.PersonID=P.PersonID
where DATEDIFF(Year,DateofBirth,getdate())>55
AND P.ISACTIVE = '1'








/**********************

QUESTION 5

Create a function that accepts a first and last name and returns a PersonID from the Person table. If no match is found,
the function should return '-1'.

**********************/


Create function Fn_Tblemployee(@FirstName,@LastName)
return nvarchar
As 
Begin
retrun(select  PersonID from Person where FirstName=@FirstName and Last_Name=@LastName


End

select isnull(Person_id,'-1') from Fn_Tblemployee(@FirstName,@LastName)




/**********************

QUESTION 6

Looking at the script 'PersonDatabase', what change(s) could be made to improve the database structure?  

What method(s) could we use to standardize the data allowed in dbo.Person (Sex) to only allow 'Male' or 'Female'?

Assuming these tables will grow very large, what other database tools/objects could we use to ensure they remain
efficient when queried?

**********************/

select * from Per

I would create one more table 

create table Gender(
Id int Primary Key,
Sex nvarchar(25))






