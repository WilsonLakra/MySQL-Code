# MySQL IN Operator
-- The IN operator allows you to specify multiple values in a WHERE clause.
-- The IN operator is a shorthand for multiple OR conditions.

-- IN Syntax
/*
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
*/

-- or

/*
SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);
*/


# MySQL BETWEEN Operator
-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.

-- BETWEEN Syntax
/*
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
*/


# Understanding IN and BETWEEN Operator in MySQL:
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


# IN Operator Example in MySQL:
-- Fetch all the employees from the employee table whose department is either IT or Finance.
SELECT * FROM Employee WHERE Department IN ('IT', 'Finance');


# NOT IN Operator Example in MySQL:
-- Fetch all the employees from the employee table where the Department not in IT and Finance. 
SELECT * FROM Employee WHERE Department NOT IN ('IT', 'Finance');


# Advantages of IN Operator over OR Operator in MySQL
-- Although both IN and OR going to provide the same results, 
-- IN condition is more preferable because it has the minimum number of codes as compared to OR condition

-- SQL query returns all the employees who belong to the IT or HR department using the MySQL OR Operator.
SELECT * FROM Employee WHERE (Department = 'IT' OR Department = 'HR');

-- SQL Query also returns all the employees who belong to the IT or HR department using the MySQL IN Operator.
SELECT * FROM Employee WHERE Department IN ('IT', 'HR');


# Fetch all the employees whose age is either 25 or 26
SELECT * FROM Employee WHERE Age IN(25, 26);




# Between Operator Example in MySQL:
--  Fetch all the employees from the employee table where the employee age is between 25 and 27. 
SELECT * FROM Employee WHERE Age BETWEEN 25 AND 27;


# Points to Remember while working with Between Operator in MySQL:
/*
Between Operator in MySQL returns true if the operand is within a range.
The Between Operator will return records including the starting and ending values.
Between operator support only the AND operator in MySQL.
The BETWEEN Operator takes the values from small to big range in the query.
*/


# NOT BETWEEN Operator Example in MySQL:
-- SQL query will return all the employees from the employee table where the Age not between 25 and 27. 
SELECT * FROM Employee WHERE Age NOT BETWEEN 25 AND 27;

------------------------------------------------------------------------------

-- MySQL In Operator
-- Retrieve the records with the names ‘Hina Sharma’, ‘Pramod Panda’, ‘Sara Talour’, from the Employee table −

SELECT * FROM Employee
WHERE Name IN ('Hina Sharma', 'Pramod Panda', 'Sara Talour');


-- The IN Operator in UPDATE statement
-- let us update the records of the Employee with age ‘25’ or ‘27’ by setting their value to ‘30’ −

UPDATE Employee 
SET Age = 30 WHERE Age IN (25, 27);

SELECT * FROM Employee WHERE Age = 30;

SELECT * FROM Employee;


-- MySQL NOT IN operator
-- we are trying to display all the records from the CUSTOMERS table, where the AGE is NOT equal to '25', '23' and '22' −

SELECT * FROM Employee
WHERE Age NOT IN (25, 23 , 22);


-- Comparing Values Using IN Operator
-- we are trying to select the rows with the values containing SALARY column −

SELECT * FROM Employee
WHERE 70000 IN (Salary);


-- MySQL Subquery with IN operator
/*
We can use a subquery with the IN operator to return records from a single column. 
This means that more than one column in the SELECT column list cannot be included in the subquery specified.
*/

-- we are displaying all the records from the Employee table where the NAME of the Employee is obtained with SALARY greater than 70000 −

SELECT * FROM Employee 
WHERE NAME IN (SELECT Name FROM Employee WHERE Salary > 70000);




-- MySQL - Between Operator
-- Retrieve the details of the Employee whose AGE (numeric data) is between 20 and 25 −

SELECT * FROM Employee WHERE Age 
BETWEEN 20 AND 25;


-- MySQL BETWEEN with IN Operator
/* we are selecting all the Employee whose salary is between 45000 and 50000.
 In addition; we are only retrieving the Employee who are living in Mumbai and London using IN operator in SQL.
*/

SELECT * FROM Employee 
WHERE Salary BETWEEN 45000 AND 50000 
AND City IN ( 'Mumbai', 'London' );


-- MySQL BETWEEN with UPDATE statement
-- Let us update the salaries of the Employee whose age lies between 25 to 27.

SELECT * FROM Employee WHERE Age BETWEEN 25 AND 27;

UPDATE Employee SET Salary = 10000 WHERE 
 Age BETWEEN 25 AND 27;


-- BETWEEN operator with DELETE statement
-- Let us delete the Employee whose age is between 20 and 25 using the DELETE

SELECT * FROM Employee WHERE Age BETWEEN  20 AND 25;

DELETE FROM Employee
 WHERE Age BETWEEN 20 AND 25;


-- MySQL NOT BETWEEN Operator
-- Consider the Employee table to retrieve the details of Employees whose age is not between 25 and 27 (numeric data) 

SELECT * FROM Employee where Age NOT BETWEEN 25 AND 27;


-- NOT BETWEEN operator with IN operator
/*
We are selecting the Employee whose salary is NOT between 5000 and 15000. 
In addition; we are not retrieving the employees who are living in London 
*/

SELECT * from Employee 
WHERE Salary NOT BETWEEN 5000 AND 15000
AND City NOT IN ( 'London');


SELECT * FROM Employee;
