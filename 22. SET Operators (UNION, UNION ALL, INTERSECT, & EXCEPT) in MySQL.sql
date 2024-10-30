# What are SET Operators in MySQL?
/*
The SET Operators in MySQL are basically used to combine the result of more than 1 select statement and return the output as a single result set. In SQL, 4 types of set operators are. They are as follows:

1. UNION: It is used to combine two or more result sets into a single set, without duplicates.
2. UNION ALL: It is used to combine two or more result sets into a single set, including duplicates.
3. INTERSECT: It is used to combine two result sets and returns the data which are common in both the result set.
4. EXCEPT: It is used to combine two result sets and returns the data from the first result set which is not present in the second result set.
*/


# Points to Remember while working with Set Operations:
/*
1. Every SELECT statement involved in the query must have a similar number of columns.
2. The columns in the SELECT statement must be in the same order and have similar data types.
3. In order to sort the result, an ORDER BY clause should be part of the last select statement. 
The column names or aliases must be found out by the first select statement.
*/


# Examples to understand SET Operators in MySQL:
-- Please use the below SQL Script to create the database EmployeeDB and the tables EmployeeUK and EmployeeUSA with the required data.

DROP DATABASE EmployeeDB;
SELECT DATABASE();


CREATE DATABASE EmployeeDB;
USE EmployeeDB;
CREATE TABLE EmployeeUK
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(20)
);


SELECT DATABASE();
SHOW TABLES;
DESC EmployeeUK;


INSERT INTO EmployeeUK VALUES(1, 'Pranaya', 'Rout', 'Male','IT');
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Dewangan', 'Female','IT');
INSERT INTO EmployeeUK VALUES(3, 'Preety', 'Tiwary', 'Female','HR');
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Sahoo', 'Male','HR');
INSERT INTO EmployeeUK VALUES(5, 'Anurag', 'Mohanty', 'Male','IT');
INSERT INTO EmployeeUK VALUES(6, 'Rajesh', 'Pradhan', 'Male','HR');
INSERT INTO EmployeeUK VALUES(7, 'Hina', 'Sharma', 'Female','IT');


SELECT * FROM EmployeeUK;
SELECT COUNT(*) FROM EmployeeUK;


CREATE TABLE EmployeeUSA
(
  EmployeeId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(20)
);


INSERT INTO EmployeeUSA VALUES(1, 'James', 'Pattrick', 'Male','IT');
INSERT INTO EmployeeUSA VALUES(2, 'Priyanka', 'Dewangan', 'Female','IT');
INSERT INTO EmployeeUSA VALUES(3, 'Sara', 'Taylor', 'Female','HR');
INSERT INTO EmployeeUSA VALUES(4, 'Subrat', 'Sahoo', 'Male','HR');
INSERT INTO EmployeeUSA VALUES(5, 'Sushanta', 'Jena', 'Male','HR');
INSERT INTO EmployeeUSA VALUES(6, 'Mahesh', 'Sindhey', 'Female','HR');
INSERT INTO EmployeeUSA VALUES(7, 'Hina', 'Sharma', 'Female','IT');


SELECT * FROM EmployeeUSA;
SELECT COUNT(*) FROM EmployeeUSA;


# UNION Operator in MySQL
/*
The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
*/
-- UNION Syntax
/*
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
*/


# MySQL UNION Operator Example:
-- The following query combines two select statements using the UNION operator.

SELECT FirstName, LastName, Gender, Department FROM EmployeeUK
UNION
SELECT FirstName, LastName, Gender, Department FROM EmployeeUSA;


-- To count the total number of rows from the result of the UNION of two SELECT statements
SELECT COUNT(*)
FROM (
SELECT FirstName, LastName, Gender, Department FROM EmployeeUK
UNION
SELECT FirstName, LastName, Gender, Department FROM EmployeeUSA
) AS CombinedEmployees;


# UNION ALL Operator in MySQL
-- The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

-- UNION ALL Syntax
/*
SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
*/


# MySQL UNION ALL Operator Example:
-- The following query combines two select statements using the UNION ALL operator

SELECT FirstName, LastName, Gender FROM EmployeeUK
UNION ALL
SELECT FirstName, LastName, Gender FROM EmployeeUSA;


-- To count the total number of rows from the result of the UNION ALL of two SELECT statements
SELECT COUNT(*)
FROM (
SELECT FirstName, LastName, Gender FROM EmployeeUK
UNION ALL
SELECT FirstName, LastName, Gender FROM EmployeeUSA
) AS CombinedEmployees;


# Differences between UNION and UNION ALL Operator in MySQL
/*
From the output, it is very clear to us that UNION Operator removes duplicate rows whereas UNION ALL operator does not remove the duplicate rows.
 When we use a UNION operator, in order to remove the duplicate rows from the result set, it has to do a distinct operation which is time-consuming. 
 For this reason, UNION ALL is much faster than UNION Operator in MySQL. 
*/


# UNION/UNION ALL with ORDER BY Clause in MySQL
-- Suppose we want to sort the employees by First Name column values. ORDER BY clause should be part of the last select statement.

SELECT FirstName, LastName, Gender, Department FROM EmployeeUK
UNION
SELECT FirstName, LastName, Gender, Department FROM EmployeeUSA
ORDER BY FirstName;


SELECT FirstName, LastName, Gender, Department FROM EmployeeUK
UNION ALL
SELECT FirstName, LastName, Gender, Department FROM EmployeeUSA
ORDER BY FirstName;


# MySQL EXCEPT Operator:

-- EXCEPT Syntax (Does Not Support in MySQL)
/*
SELECT column_name(s) FROM table1
[WHERE condition]
EXCEPT
SELECT column_name(s) FROM table2
[WHERE condition];
*/

-- Note: But, the EXCEPT Operator is not supported by MYSQL. We can achieve the EXCEPT Operator functionality in MySQL using the following ways.

# Using NOT IN Operator to achieve EXCEPT functionality:
/* Here, we are checking the FirstName column value only. Following is the SQL Query using the NOT IN Operator which returns the employees 
from the first EmployeeUK table that are not present in the EmployeeUSA table.
*/

SELECT * FROM EmployeeUK 
WHERE FirstName NOT IN ( SELECT FirstName FROM EmployeeUSA );


# Using Join to achieve EXCEPT functionality in MySQL:
/*
We can use LEFT JOIN to achieve the functionality of EXCEPT Operator. 
Here, the join clause needs to contain all 4 columns FirstName, LastName, Gender, and Department. 
The where clause picks null values in EmployeeId in EmployeeUSA, which limits to rows that exist in EmployeeUK only.
*/

SELECT t1.* FROM EmployeeUK AS t1
LEFT JOIN EmployeeUSA AS t2
ON t1.FirstName = t2.FirstName
AND t1.LastName = t2.LastName
AND t1.Gender = t2.Gender
AND t1.Department = t2.Department
WHERE t2.EmployeeId IS NOT NULL;


# INTERSECT Operator in MySQL
-- The INTERSECT operator is used to combine two result sets and returns the data which are common in both the result set.

-- INTERSECT Syntax (Does Not Support in MySQL)
/*
SELECT column_name(s) FROM table1
[WHERE condition]
INTERSECT
SELECT column_name(s) FROM table2
[WHERE condition];
*/

 -- Note: But the INTERSECT Operator is not supported by MYSQL. We can achieve the INTERSECT Operator functionality in MySQL using the following ways

# Using IN Operator to achieve INTERSECT functionality:
/*
Here, we are checking the FirstName column value only. Following is the SQL Query using the IN Operator which returns the common employees i.e.
the employees which are present in both t EmployeeUK and EmployeeUSA tables. Here, we are checking common based on the First Name column value.
*/

SELECT * FROM EmployeeUK
WHERE FirstName IN ( SELECT FirstName FROM EmployeeUSA);


# Using Join to achieve INTERSECT functionality in MySQL:
/*
We can use INNER JOIN to achieve the functionality of INTERSECT Operator. 
Here, the join clause needs to contain all 4 columns FirstName, LastName, Gender, and Department.
*/

SELECT t1.* FROM EmployeeUK AS t1
INNER JOIN EmployeeUSA AS t2
ON t1.FirstName = t2.FirstName
AND t1.LastName = t2.LastName
AND t1.Gender = t2.Gender
AND t1.Department = t2.Department;

----------------------------------------------------------------------------------------

-- MySQL UNION Operator
-- Let us first create the prospective customers table named PROSPECT using the following CREATE TABLE query −

CREATE TABLE PROSPECT (
   FNAME CHAR(20) NOT NULL,
   LNAME CHAR(20),
   ADDRESS VARCHAR(100) NOT NULL
);


-- Now, we insert records into this table using INSERT statement below −

INSERT INTO PROSPECT VALUES
('Peter', 'Jones', '482 Rush St., Apt. 402'),
('Bernice', 'Smith', '916 Maple Dr.');


SELECT DATABASE();
SHOW TABLES;
DESC PROSPECT;


SELECT * FROM PROSPECT;


-- We then create an active customers table named ACTIVE using the following CREATE TABLE query −

CREATE TABLE ACTIVE (
   FNAME CHAR(20) NOT NULL,
   LNAME CHAR(20),
   ADDRESS VARCHAR(100) NOT NULL
);


-- Using the following INSERT statement, insert records into the ACTIVE table −

INSERT INTO ACTIVE VALUES
('Grace', 'Peterson', '16055 Seminole Ave.'),
('Bernice', 'Smith', '916 Maple Dr.'),
('Walter', 'Brown', '8602 1st St.');


SELECT * FROM ACTIVE;


-- Now, create a single mailing list by merging names and addresses from all the tables

SELECT Fname, Lname, Address FROM PROSPECT
UNION 
SELECT Fname, Lname, Address FROM ACTIVE;


-- UNION with WHERE clause
-- We can use the WHERE clause with UNION operator to filter the results of each SELECT statement before combining them.

-- Syntax
/*
SELECT column1, column2, column3
FROM table1
WHERE column1 = 'value1'
UNION
SELECT column1, column2, column3
FROM table2
WHERE column1 = 'value2';
*/


--  Retrieve combined records using UNION operator with WHERE clause −

SELECT Fname, Lname, Address FROM PROSPECT WHERE Lname =  'Jones' 
UNION 
SELECT Fname, Lname, Address FROM ACTIVE WHERE Lname =  'Peterson';


-- UNION with ORDER BY clause
-- When we use UNION with ORDER BY clause, it combines the sorted result sets of all SELECT statements and produces a single sorted result set.

-- Syntax
/*
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2
ORDER BY column_name;
*/


-- Let us try to sort the table records in ascending order with respect to values in the 'lname' column of result set

SELECT Fname, Lname, Address FROM PROSPECT 
UNION 
SELECT Fname, Lname, Address FROM ACTIVE
ORDER BY Lname;


-- UNION with Aliases
/*
When using UNION with aliases, it's important to note that the column aliases are determined by the first SELECT statement.
 Therefore, if you want to use different aliases for the same column in different SELECT statements, 
 you need to use column aliases in all SELECT statements to ensure consistent column names in the final result set
*/

-- Syntax
/*
SELECT column1 AS alias1, column2 AS alias2
FROM table1
UNION
SELECT column3 AS alias1, column4 AS alias2
FROM table2;
*/


-- we are trying to combine two tables using aliases to represent the fields in result-set obtained −

SELECT Fname AS FirstName, Lname AS LastName, Address AS Address FROM PROSPECT
UNION 
SELECT Fname AS FirstName, Lname AS LastName, Address AS Address FROM ACTIVE;


-- In a UNION query, the column names from the first SELECT statement will be used for the result set.
-- So even though the second query doesn't use aliases, the final output will use the aliases from the first query.

SELECT Fname AS FirstName, Lname AS LastName, Address AS Address FROM PROSPECT
UNION 
SELECT Fname , Lname , Address  FROM ACTIVE;


-- UNION ALL Operator
-- If you want to select all records, including duplicates, follow the first UNION keyword with ALL −

SELECT Fname , Lname , Address  FROM PROSPECT
UNION ALL
SELECT Fname , Lname , Address  FROM ACTIVE;


