# MySQL SUM() Function
-- The SUM() function returns the total sum of a numeric column. 
-- The SUM function will only work on numeric data types. For columns containing string values, 
-- it will always return 0. Following is the syntax to use the SUM Function in MySQL.

-- SUM() Syntax
/*
SELECT SUM(column_name)
FROM table_name
WHERE condition;
*/

/*
SELECT SUM(column) FROM TableName;
*/


# Please use the following SQL Script to create and populate the Employee table with the required sample data.

CREATE DATABASE Company;
USE Company;


CREATE TABLE Employee (
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
DESC Employee;


INSERT INTO Employee VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT * FROM Employee;


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE Company;


# Example: SUM Function with Numeric Data Type
-- Let us calculate the Total Salary of all employees. To do so, use the SUM function and pass Salary as a parameter to the SUM Function 

SELECT * FROM Employee;

SELECT SUM(Salary) AS TotalSalary FROM Employee;


# Example: SUM Function with Group by Clause in MySQL
/* 
Now we will calculate the Total Salary of each department. To do so, we need to pass the Salary column to the SUM function
 as well as we need to group the record by department using the GROUP BY clause 
 */
 
SELECT Department, SUM(Salary) AS TotalSalary 
FROM Employee 
GROUP BY Department;


# Example: SUM Function with WHERE Clause in MySQL
/*
Now we need to calculate the total salary of all Male Employees present in the Employee table. To do so, we need to pass the 
Salary column as a parameter to the SUM function and filter the records by using the WHERE clause 
*/

SELECT * FROM Employee;

SELECT Gender, SUM(Salary) As TotalSalary 
FROM Employee 
WHERE Gender = 'Male';


# Example: SUM with String Values
/* 
If we pass the string column value to the SUM function, then we will get 0 as the result. In the below query, 
we are passing the Name column to the SUM function.
*/

SELECT SUM(Name) As Total FROM Employee;

---------------------------------------------------------------------------------------------

# Here are several examples of MySQL SUM() function queries based on your Employee table:(ChatGPT)

-- 1. Calculate Total Salary of All Employees
-- This query calculates the total salary of all employees.

SELECT SUM(Salary) AS TotalSalary FROM Employee;


-- 2. Calculate Total Salary by Department
-- This query calculates the total salary spent in each department (IT, HR, Finance).

SELECT Department, SUM(Salary) TotalSalary 
FROM Employee 
GROUP BY Department;


-- 3. Calculate Total Salary by City
-- This query shows the total salary of employees based on their city (London, Mumbai).

SELECT * FROM Employee;

SELECT City, SUM(Salary) AS TotalSalary 
FROM Employee 
GROUP BY City;


-- 4. Calculate Total Salary of Male and Female Employees
-- This query calculates the total salary paid to male and female employees.

SELECT Gender, SUM(Salary) AS TotalSalary 
from Employee 
GROUP BY Gender;


-- 5. Calculate Total Salary for Employees in HR Department
-- This query returns the total salary for all employees in the HR department.

SELECT Department, SUM(Salary) AS HRTotalSalary
FROM Employee 
WHERE Department = 'HR';


SELECT SUM(Salary) AS HRTotalSalary
FROM Employee
WHERE Department = 'HR';


-- 6. Calculate Average Salary by Department Using SUM and COUNT
-- This query calculates the average salary in each department by using both SUM() and COUNT() functions.

SELECT Department, SUM(Salary) / COUNT(*) AS AVGSalary 
FROM Employee
GROUP BY Department;


-- 7. Calculate Total Salary for Employees Above Age 26
-- This query calculates the total salary for employees who are older than 26.

SELECT SUM(Salary) AS TotalSalaryOver26
FROM Employee 
WHERE Age > 26;

