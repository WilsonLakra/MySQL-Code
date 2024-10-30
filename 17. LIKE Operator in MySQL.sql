# MySQL LIKE Operator
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column(string).
-- There are two wildcards often used in conjunction with the LIKE operator:

/*
The percent sign (%) represents zero, one, or multiple characters
The underscore sign (_) represents one, single character
*/

-- The percent sign and the underscore can also be used in combinations!

-- LIKE Syntax
/*
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
*/


# Understanding LIKE Operator in MySQL:
-- Please use the following SQL Script to create the company database and employee table with the required records.

DROP TABLE employee;
SHOW TABLES;


CREATE DATABASE company;
USE company;
CREATE TABLE employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC employee;


INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Sara Talour', 'HR', 85000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Pamela Kar', 'Finance', 70000, 'Female', 26, 'London');


# Like Operator Using % in MySQL
-- Fetch all the employees whose names start with P.
SELECT * FROM Employee WHERE Name LIKE 'P%';


# Fetch all the employees whose name ends with ar.
SELECT * FROM Employee WHERE Name LIKE '%ar';


# Fetch all employee whose name contains the word am
SELECT * FROM Employee WHERE Name LIKE '%am%';


# Using NOT LIKE Operator in MySQL
-- Fetch all the employees whose name does not start with P.
SELECT * FROM Employee WHERE Name NOT LIKE 'P%';


# Fetch all the employees whose name does not end with ar.
SELECT * FROM Employee WHERE Name NOT LIKE '%ar';


# Fetch all employee whose name does not contain the word am 
SELECT * FROM Employee WHERE Name NOT LIKE '%am%';


# Like Operator Using _ (underscore) Wildcard Character in MySQL
--  Let’s filter the data more precisely and this time get the employee’s city starting with ‘MUMBA’ but only containing a total of 6 letters.
SELECT * FROM Employee WHERE City LIKE 'MUMBA_';


# Fetch all the employee whose department is having two letters
SELECT * FROM Employee WHERE Department LIKE '__';
SELECT COUNT(*) FROM Employee WHERE Department LIKE '__';

-----------------------------------------------------------------------------

-- Using LIKE Operator with Wildcards
-- Following are the four wildcards used in conjunction with the LIKE operator −
/*
1.	%	The percent sign represents zero, one or multiple characters.

2.	_	The underscore represents a single number or character.

3.	[]	This matches any single character within the given range in the [].

4.	[^]	This matches any single character excluding the given range in the [^].
*/


-- we are retrieving the name of the Employee ending with "nes" using the LIKE operator with wildcards −

SELECT * from Employee WHERE Name LIKE '%nes';


-- Using LIKE Operator with AND/OR Operators
-- Retrieves the Employee whose names start with 'M' and 'L' −

SELECT * FROM Employee WHERE Name LIKE 'M%' OR Name LIKE 'L%';


-- Using NOT Operator with LIKE Operator
-- we are retrieving all the Employee whose name does not start with K −

SELECT * FROM Employee WHERE Name NOT LIKE 'K%';


-- If the search pattern is exactly as provided string, this operator returns 1 −

SELECT  'Sara Talour'  LIKE 'Sara Talour' ;


-- If the search pattern is not exactly same as the string, it returns 0 as output −

SELECT  'Sara Talour'  LIKE 'Sara' ;


-- If either of the first two operands is NULL, this operator returns NULL.

SELECT NULL LIKE 'value';


-- we are providing NULL to the seach pattern operand. this operator returns NULL.

SELECT 'Preety Tiwary' LIKE NULL;



