# MySQL LIMIT Clause
-- The LIMIT clause is used to specify the number of records to return.
-- The LIMIT clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.

-- LIMIT Syntax
/*
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
*/


# LIMIT or TOP Clause in MySQL
-- The LIMIT Clause in MySQL is used to retrieve the records from one or more database tables and 
-- then limit the number of records returned based on a given value.

SELECT * FROM Employee LIMIT 5;


# Example to understand LIMIT Clause in MySQL:
-- Please use the following SQL Script to create the company database and employee table with the required records.


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
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'Delhi');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Manoj Tripathy', 'HR', 85000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Mitali Rout', 'Finance', 70000, 'Female', 26, 'Mumbai');


# Let’s only display TOP 5 data rows from the employee table.
SELECT * FROM Employee LIMIT 5;


# LIMIT Clause with Where Clause in MySQL
-- In the following SQL query, first, it filters the data based on the CITY Column and 
-- then retrieves the top 3 employees using LIMIT Clause from the employee table

SELECT * FROM Employee 
WHERE City = 'Mumbai' LIMIT 3;


# LIMIT Clause with Where and Order by Clause in MySQL
SELECT * FROM Employee 
WHERE City = 'Mumbai'
ORDER BY Name ASC LIMIT 3;

---------------------------------------------------------------------------------

-- What if we want to select records 4 - 6 (inclusive)?
-- MySQL provides a way to handle this: by using OFFSET.
-- The SQL query below says "return only 3 records, start on record 4 (OFFSET 3)"

SELECT * FROM Employee 
LIMIT 3 OFFSET 3;


-- The offset of the first row starts from 0, not from 1 and the count of the first row starts from 1. 
-- Let us understand it better using the below query:
SELECT * FROM Employee 
LIMIT 1, 3;			-- Offset 1, Count 3


-- Now, we are selecting the first four records from the Employee table using the MySQL LIMIT clause in conjunct with SELECT statement −
SELECT * FROM Employee 
LIMIT 4;


-- we are selecting rows from the Employee table starting from the third row (offset 2) from then four rows −
SELECT * FROM Employee 
LIMIT 2, 4;


-- LIMIT with WHERE Clause
-- we are selecting the first two rows from the Employee table where the AGE is greater than 21 −
SELECT * FROM Employee 
WHERE Age > 21 LIMIT 2;


SELECT * FROM Employee 
WHERE Age > 21 LIMIT 0, 2;


-- we are selecting the next 3 records from the Employee table starting from the 2nd record (off set) 
-- where the value of the AGE column is greater than 21:
SELECT * FROM Employee 
WHERE Age > 21 LIMIT 1, 3;


-- LIMIT with ORDER BY clause
-- we are fetching all the records from the Employee table and sorting the SALARY column in descending order. 
-- Then we are fetching 5 rows from the sorted result set.
SELECT * FROM Employee 
ORDER BY Salary DESC
LIMIT 5;


-- we are selecting all the records from the table and sorting the SALARY column in ascending order. 
-- Then we are fetching rows from the sorted result set starting from the second row (offset 1) from then three rows −
SELECT * FROM Employee 
ORDER BY Salary ASC 
LIMIT 1, 3;


