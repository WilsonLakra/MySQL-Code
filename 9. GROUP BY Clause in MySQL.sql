# MySQL GROUP BY Statement
 # The GROUP BY statement groups rows that have the same values into summary rows. 
 # The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
 -- The GROUP BY clause in MySQL groups the data together. It aggregates many rows into one. 
 -- The FROM and WHERE clause creates an intermediate tabular result set and the GROUP BY clause systematically groups the data. 
 -- The GROUP BY clause can group the result set by one or more columns. 
 -- If we use group by clause in the query then we should use grouping/aggregate function such as count(), sum(), max(), min(), avg() functions.
 
 -- GROUP BY Syntax
 /* 
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
*/
-- Another Syntax
/*
SELECT expression1, expression2, expression_n,
		aggregate_function(expression)
FROM tables
[WHERE conditions}
GROUP BY expression1, expression2, expression_n;
*/

-- Note: The GROUP BY clause in MySQL should be placed after the FROM and WHERE clauses. 
-- Again there must be at least one column or one expression after the GROUP BY keyword, that you want to use as criteria to group the records or rows.

-- Examples to understand Group by Clause in MySQL
-- Please use the below SQL Script to create the database company and employee table with the required data.


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


SELECT DATABASE();
SHOW DATABASES;
USE company;
SHOW TABLES;
DESC employee;

SELECT * FROM employee;


#  MySQL GROUP BY Clause with the COUNT function
-- Count the total number of employees in the employee table
SELECT COUNT(*) AS TotalEmployees FROM employee;


# Count the total number of employees in each department of the employee table
SELECT Department, COUNT(*) AS TotalEmployee
FROM employee
GROUP BY Department;


# MySQL GROUP BY Clause with the SUM function
-- Find the total salary given to all employees

SELECT SUM(Salary) AS TotalSalary
FROM employee;


# Count the total salary given to each department in the employee table
SELECT Department, SUM(Salary) AS TotalSalary
FROM employee
GROUP BY Department;


# MySQL GROUP BY Clause with MAX and MIN function
-- Find the Highest salary in Each Department of the Organization
SELECT Department, MAX(Salary) AS MaxSalary
FROM employee
GROUP BY Department;


# Find the Lowest salary in Each Department
SELECT Department, MIN(Salary) AS MinSalary
FROM employee
GROUP BY Department;


# GROUP By Clause with Multiple Columns in MySQL:

/* It is also possible to use Group by Columns on Multiple Columns in MySQL. 
In that case, first, data in the table is divided based on the first column of the group by clause and 
then each group is subdivided based on the second column of the group by clause and 
then the group function is applied to each inner group to get the result.
*/


# Find the number of employees working in each Gender per department
SELECT * FROM employee;

SELECT Department, Gender, COUNT(*) AS EmployeeCount
FROM employee
GROUP BY Department, Gender
ORDER BY  Department;

-- what our requirement is, first we need to group the employee by the department and 
-- then we need to group the employee by salary present in each department.

SELECT Department, Salary, COUNT(*) AS EmployeeCount
FROM Employee 
GROUP BY Department, Salary
ORDER BY Department;

# Find the total salaries and the total number of employees by City, and by gender
SELECT  * FROM Employee;

-- Here, we need to group by City first and then by Gender. 
-- Then we need to apply the SUM Aggregate function on the Salary column to calculate the total sum and 
-- the Count Aggregate function on the Id column to find the total number of employees.
SELECT  City, Gender,
SUM(Salary) AS TotalSalary, 
COUNT(Id) AS TotalEmployee
FROM employee 
GROUP BY City, Gender;


# MySQL GROUP BY Clause with AVG function
-- Find the average salary of each department

-- Here first we need to group the employees by department and then we need to execute the AVG Aggregate function on each group. 
-- And to AVG Aggregate function we need to pass the Salary column
SELECT Department, AVG(Salary) AS AverageSalary
FROM employee
GROUP BY Department;

/* Note: When the aggregate function is applied to a group it returns only a single value but each group can return a value. 
Use Group By clause only on a column that contains duplicate values, never applies it on unique columns.
*/

----------------------------------------------------------------------------------

-- Use the GROUP BY query to group the employee based on their age −
SELECT  Age, COUNT(Name)
FROM Employee
GROUP BY Age;


-- MySQL GROUP BY on Single Column
-- let us group the employee by their age and calculate the average salary for each age using the following query −
SELECT Age, AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Age;


-- MySQL GROUP BY on Multiple Columns
--  if you want to know the total amount of salary for each employee age wise, then the GROUP BY query would be as follows −
SELECT Age, ' - ', SUM(Salary) AS Salary_AgeWise
FROM employee
GROUP  BY Age;


-- MySQL GROUP BY with ORDER BY Clause
-- We can use the ORDER BY clause with GROUP BY in MySQL to sort the result set by one or more columns.
-- In here, we are trying to find the highest salary for each age, sorted by high to low −
SELECT Age, MAX(Salary) AS MAX_Salary
FROM employee
GROUP BY Age
ORDER BY MAX(Salary) DESC;


-- MySQL GROUP BY with HAVING Clause
-- We can also use the GROUP BY clause with the HAVING clause to filter the results of a query based on conditions applied to groups of data.

-- we are grouping the employee by their age and calculating the average salary for each group. 
-- The HAVING clause is used to filter the results to show only those groups where the average salary is greater than 8000 −
SELECT Age, AVG(Salary) AS AVG_Salary
FROM employee
GROUP BY Age
HAVING AVG(Salary) > 8000;




