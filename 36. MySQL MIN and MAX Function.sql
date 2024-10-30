# MySQL MIN() and MAX() Functions
-- The MIN() function returns the smallest value of the selected column.
-- The MAX() function returns the largest value of the selected column.

-- MIN() Syntax
/*
SELECT MIN(column_name)
FROM table_name
WHERE condition;
*/


-- MAX() Syntax
/*
SELECT MAX(column_name)
FROM table_name
WHERE condition;
*/


# Understanding MIN and MAX Functions in MySQL:
-- Please use the following SQL Script to create and populate the Employee table with the required sample data.

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


# MySQL MIN() Function
/*
The MIN or MINIMUM function returns the smallest value of the given column. 
The MIN function works on numeric columns as well as string columns.
*/

-- Example: MySQL MIN() Function with Numeric Data Type
-- Our requirement is to find the MINIMUM age from the Employees table. To do so, we need to pass the Age column to the MIN function

SELECT MIN(Age) AS MIN_Age FROM Employee;


-- Example: MIN function with GROUP by Clause in MySQL
/*
Now we need to find the minimum salary in each department. To find the same, we need to pass the salary column 
to the MIN function as well as we need to group the employees by the department by using the GROUP by clause 
*/

SELECT Department, MIN(Salary) AS MIN_Salary
FROM Employee
GROUP BY Department;


-- Example: MIN Function with WHERE Clause in MySQL
/*
Now we need to find the minimum salary of Male Employees. To do so, we need to pass the Salary column to the MIN function and
 filter the Male employees by using the WHERE clause 
*/

SELECT Gender, MIN(Salary) AS MIN_Salary
FROM Employee 
WHERE Gender = 'mALE';


-- Example: MIN Function with String Values in MySQL
-- We can also use the MIN function on the string column like the below example.

SELECT MIN(Name) AS MIN_Name FROM Employee;




# MySQL MAX() Function
/*
The MAX or MAXIMUM function returns the largest value of the given column. The MAX function works on numeric columns as well as string columns. 
*/

-- Example: MAX Function with Numeric Data Type in MySQL
-- Our requirement is to find the MAXIMUM age from the Employees table. To do so, we need to pass the Age column to the MAX function

SELECT MAX(Age) AS MAX_Age FROM Employee;


-- Example: MAX Function with GROUP by Clause in MySQL
/*
Now we need to find the highest salary in each department. To find the same, we need to pass the salary column to the MAX function 
as well as we need to group the employees by the department by using the GROUP by clause
*/

SELECT Department, MAX(Salary) AS MAX_Salary
FROM Employee
GROUP BY Department;


-- Example: MAX Function with WHERE Clause in MySQL
/*
Now we need to find the highest salary of Male Employees. To do so, we need to pass the Salary column to the MAX function and 
filter the Male employees by using the WHERE clause 
*/

SELECT Gender, MAX(Salary) AS MAX_Salary 
FROM Employee 
WHERE Gender = 'Male';


-- Example: MAX Function with String Values in MySQL
-- We can also use the MySQL MAX function on the string column like the below example.

SELECT MAX(Name) AS MAX_Name FROM Employee;

-----------------------------------------------------------------------------------------------

-- Here are several examples of using MySQL's MIN() and MAX() functions based on your Employee table:(ChatGPT)

-- 1. Find the Minimum and Maximum Salary of All Employees
-- This query returns the minimum and maximum salary across all employees.

SELECT MIN(Salary) AS MinSalary, MAX(Salary) AS Max_Salary FROM Employee;


-- 2. Find the Youngest and Oldest Employee
-- This query returns the youngest and oldest employees by age.

SELECT MIN(Age) AS YoungestEmployee, MAX(Age) AS OldestEmployee FROM Employee;


-- 3. Find the Employee with the Minimum Salary in Each Department
-- This query returns the minimum salary for each department (IT, HR, Finance).

SELECT Department, MIN(Salary) AS MinSalary 
FROM Employee 
GROUP BY Department;


-- 4. Find the Employee with the Maximum Salary in Each City
-- This query returns the maximum salary in each city (e.g., London, Mumbai).

SELECT City, MAX(Salary) AS MaxSalary 
FROM employee
GROUP BY City;


-- 5. Find the Oldest Employee in the HR Department
-- This query returns the oldest employee in the HR department.

SELECT MAX(Age) AS OldestHREmployee 
FROM Employee
WHERE Department = 'HR';


-- 6. Find the Minimum and Maximum Salary by Gender
-- This query shows the minimum and maximum salary for each gender.

SELECT Gender, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary
FROM Employee 
GROUP BY Gender;


-- 7. Find the Employee with the Minimum Age in Each City
-- This query returns the youngest employee in each city.

SELECT City, MIN(Age) AS YoungestEmployee
FROM Employee 
GROUP BY City;


