# MySQL COALESCE() Function
-- The COALESCE() function returns the first non-null value in a list.

-- Syntax
/*
COALESCE(val1, val2, ...., val_n)
*/

-- Return Value: The COALESCE function returns the first non-null value in a list of expressions or NULL if all the values in a list are NULL.

SELECT COALESCE(null, null, 'Apple', 'Ball');		-- O/P	Apple


SELECT COALESCE('Apple', 'Ball', null, 'Cat', 'Dog');		-- O/P	Apple


SELECT COALESCE(null, 10, 20, 30, null, 40);		-- O/P 	10


SELECT COALESCE(null, 'MySQL Tutorials', 'dotnettutorials.net');		-- O/P 	MySQLTutorials


SELECT COALESCE(null, null, null, null, null);		-- O/P 	null


SELECT COALESCE('dotnettutorials.net', 'Tutorials', 'MySQL Tutorials');		-- O/P 	dotnettutorials.net




# COALESCE Function with Database Table:
-- Please use the following SQL Script to create and populate the Employee table with the required sample data.

CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  FirstName VARCHAR(45),
  MiddleName VARCHAR(45),
  LastName VARCHAR(45),
  Gender VARCHAR(45) NOT NULL,
  AGE INT NOT NULL,
  City VARCHAR(45)
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


INSERT INTO Employee VALUES (1001, 'John', NULL, 'Doe', 'Male', 25, 'London');
INSERT INTO Employee VALUES (1002, 'Mary', 'Smith', NULL, 'Female', 27, NULL);
INSERT INTO Employee VALUES (1003, NULL, 'James', 'Brown', 'Male', 28, 'London');
INSERT INTO Employee VALUES (1004, NULL, NULL, NULL, 'Male', 28, NULL);
INSERT INTO Employee VALUES (1005, 'Anurag', NULL, 'Mohanty', 'Male', 25, NULL);
INSERT INTO Employee VALUES (1006, 'Pranaya', 'Kumar', 'Rout', 'Female', 27, 'Mumbai');
INSERT INTO Employee VALUES (1007, NULL, NULL, 'Sambit', 'Male', 28, 'Mumbai');


SELECT * FROM Employee;


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE Company;


#  we use COALESCE function with First, Middle, and Last Name column values.

SELECT Id, COALESCE(FirstName, MiddleName, LastName) AS Name, Gender, AGE, City FROM Employee;


# we use COALESCE function with the City column. Instead of showing NULL, we are showing NA where the city column value is null.

SELECT Id, 
	COALESCE(FirstName, MiddleName, LastName) AS Name,
    Gender, AGE, COALESCE(City, 'NA') AS City
FROM Employee;


/*
 Note: The COALESCE function accepts one parameter which is the list that can contain various values.
 The value returned by the COALESCE function is the first non-null value or NULL if all the values in a list are NULL.
 */
 
------------------------------------------------------------------------------------------------------

/* The COALESCE() function in MySQL returns the first non-NULL value in the list of expressions. 
If all values are NULL, it returns NULL. You can use COALESCE() to handle cases where columns have NULL values.(ChatGPT)
*/

-- 1. Display Full Name (First, Middle, and Last Names)
-- This query will create a full name by replacing NULL values with empty strings.

SELECT 
	COALESCE(FirstName) AS FirstName,
    COALESCE(MiddleName) AS MiddleName,
    COALESCE(LastName) AS LastName,
    CONCAT(COALESCE(FirstName, " "), " ", COALESCE(MiddleName, " "), " ", COALESCE(LastName, " ")) AS FullName
FROM Employee;


-- 2. Display City Name with Default Value
-- This query will display "Unknown City" if the City value is NULL.

SELECT FirstName,
	COALESCE(City, 'Unknown City') AS City
FROM Employee;


-- 3. Display Middle Name or Default if Middle Name is NULL
-- This query will display "No Middle Name" if MiddleName is NULL.

SELECT FirstName,
	COALESCE(MiddleName, 'No Middle Name') AS MiddleName
FROM Employee;


-- 4. Display Gender and City, Handling NULL City
-- This will display "Unknown" for employees whose City value is NULL.

SELECT FirstName,Gender, 
	COALESCE(City, 'Unknown') AS City
FROM Employee;


-- 5. Handle NULL for First, Middle, and Last Names
-- This query will replace NULL values in the name fields with "Unknown [Name]" values.

SELECT 
	COALESCE(FirstName, 'Unknown First Name') AS FirstName,
    COALESCE(MiddleName, 'Unknown Middle Name') AS MiddleName,
    COALESCE(LastName, 'Unknown Last Name') AS LastName
FROM Employee;


-- 6. Generate FullName with Default for Missing Values
-- You can use COALESCE() to create a complete name even if one or more components are missing.

SELECT 
    COALESCE(FirstName, 'Unknown') AS FirstName, 
    COALESCE(MiddleName, '') AS MiddleName, 
    COALESCE(LastName, 'Unknown') AS LastName, 
    CONCAT(COALESCE(FirstName, 'Unknown'), ' ', COALESCE(MiddleName, ''), ' ', COALESCE(LastName, 'Unknown')) AS FullName
FROM Employee;


-- 7. Calculate Age or Default
-- If age is not available (in cases where you want to allow NULL values in the future), return a default age.
-- This will replace NULL ages with 0.

SELECT FirstName,
	COALESCE(AGE, 0) AS AGE
FROM Employee;

