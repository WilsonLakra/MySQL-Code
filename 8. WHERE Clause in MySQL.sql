# MySQL WHERE Clause
-- The WHERE clause is used to filter records.
-- It is used to extract only those records that fulfill a specified condition.

-- WHERE Syntax
/*
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

-- Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!

-- WHERE Clause in MySQL
/* The where clause is an optional clause used in SQL statements. The WHERE clause acts as a filter on the rows of the result set
 produced by the FROM clause. It extracts only those records that fulfill the specified condition. The WHERE clause mainly depends
 upon a condition that evaluates as either be true, false, or unknown. So, if you want to limit the number of rows to be affected 
 by your DML statement (SELECT, INSERT, UPDATE, or DELETE), then you need to use the Where Clause in MySQL. */
 
 -- Examples to Understand WHERE Clause in MySQL:
-- Please use the below SQL Script to create the database company and employees table with the required data.


CREATE DATABASE company;
USE company;
CREATE TABLE employees (
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


INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'Delhi');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employees (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT DATABASE();
SHOW DATABASES;
USE company;
SHOW TABLES;
DESC employees;


# Where clause with a Single condition in MySQL
-- The below Select statement will return all the records from the Employees table whose Department is HR. As we use * before the FROM clause.
SELECT * FROM employees WHERE Department = 'HR';


# Where Clause Using AND Condition in MySQL:
-- Our requirement is to fetch all the employees from the employees table whose Gender is Male AND Salary is greater than 35000. 
SELECT * FROM employees WHERE Gender = 'Male' AND Salary > 35000;

-- Note: When using AND operator, if both the conditions are satisfied then only it returns the records. 
-- If one of the conditions is false then it will not include that records in the result set.


# Where Clause using OR Condition in MySQL:
-- SQL Query will return all the employees whose Gender is Female or Department is IT.
SELECT * FROM employees WHERE Gender = 'Female' OR Department = 'IT';

-- When you execute the above SELECT Statement, then it will return the following result set which includes all Female Employees 
-- as well as all Employees who belong to IT Department.


# Where Clause using both AND & OR Conditions in MySQL
-- SQL Query will return all employees either whose department is IT or Gender is Female and Salary is greater than 35000.
SELECT * FROM employees WHERE (Department = 'IT' OR Gender = 'Female') AND Salary > 35000;


# Where clause with Update Statement in MySQL:
-- Our requirement is to increase the Salary of All IT department employees by 2000.
-- Before updating the Salary of IT Department employees, let’s first have a look at the current Salaries of those employees
--  by executing the below SQL Statement.
SELECT * FROM employees WHERE Department = 'IT';

UPDATE employees SET Salary = Salary + 2000 WHERE Department = 'IT';


-- It might be possible that while executing the above UPDATE statement, you may get the Error Code: 1175.
/*  it is complaining that you are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
That means you are updating the table without using the primary key column in the where clause. To avoid the above error, 
we need to SET SQL_SAFE_UPDATES=0; So, execute the UPDATE statement as shown below.
*/
SET SQL_SAFE_UPDATES=0;
UPDATE employees SET Salary = Salary + 2000 WHERE Department = ‘IT’;


# Where clause with Delete Statement in MySQL:
-- Our requirement is to delete all the HR department employees. 
SELECT * FROM employees WHERE Department = 'HR';
DELETE FROM employees WHERE Department = 'HR';

SELECT * FROM employees;

------------------------------------------------------------------------------

# Operators in The WHERE Clause

# Equal Operator (=)
SELECT * FROM employees WHERE Salary = 50000;


# 	Greater than (>)
SELECT * FROM employees WHERE Salary > 50000;


# Less than	(<)
SELECT * FROM employees WHERE Salary < 50000;


# Greater than or equal (>=)
SELECT * FROM employees WHERE Salary >= 50000;


# Less than or equal (<=)
SELECT * FROM employees WHERE Salary <= 50000;


# Not equal (<>) or (!=)
SELECT * FROM employees WHERE Salary <> 50000;
SELECT * FROM employees WHERE Salary != 50000;


# BETWEEN	(Between a certain range)	
SELECT * FROM employees;
SELECT * FROM employees WHERE Salary BETWEEN 25000 AND 50000;
SELECT * FROM employees WHERE Age BETWEEN 20 AND 25;


# LIKE	(Search for a pattern)
SELECT * FROM employees;
SELECT * FROM employee WHERE Name like 'M%';		-- Finds any values that starts with "M"
SELECT * FROM employee WHERE Name like '%e';     	-- Finds any values that ends with "e"
SELECT * FROM employee WHERE Name like '%bi%';		-- Finds any values that have "bi" in any position
SELECT * FROM employee WHERE Name like '_a%';		-- Finds any values that have "a" in the second position
SELECT * FROM employee WHERE Name like 'a_%_%';		-- Finds any values that starts with "a" and are at least 3 characters in length
SELECT * FROM employee WHERE Name like 'a%y';		-- Finds any values that starts with "a" and ends with "y"


# IN	(To specify multiple possible values for a column)
SELECT * FROM employees WHERE City IN ('Delhi', 'Paris', 'London');
SELECT * FROM employees WHERE City IN ('Paris', 'London');

