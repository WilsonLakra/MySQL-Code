# MySQL AVG() Function
-- The AVG() function returns the average value of a numeric column. 

-- AVG() Syntax
/*
SELECT AVG(column_name)
FROM table_name
WHERE condition;
*/


# Understanding AVG Function in MySQL:
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


# MySQL AVG Function
-- The MySQL AVG or AVERAGE function returns the average value of the given numeric column. The AVG function will only work on numeric columns.

# Example: AVG Function with Numeric Column in MySQL
-- Our requirement is to find the Average age from the Employees table. To do so, we need to pass the Age column to the AVG function 

SELECT AVG(Age) AS AVG_Age FROM Employee;


# Example: AVG function with GROUP by Clause in MySQL
/*
Now we need to find the average salary of each department. To do the same, we need to pass the salary column to the AVG function 
as well as we need to group the employees by the department by using the GROUP by clause
*/

SELECT Department, AVG(Salary) AS AVG_Salary
FROM Employee
GROUP BY Department;


# Example: AVG Function with WHERE Clause in MySQL
/*
Now we need to find the average salary of all Female Employees. To do so, we need to pass the Salary column to the AVG function 
as well as filter the Female employees by using the WHERE Filter clause 
*/

SELECT AVG(Salary) AS AVG_Salary
FROM Employee 
WHERE Gender = 'Female';


# Example: AVG Function with String Values in MySQL
-- If we pass the string column value to the AVG function, then we will get 0 as the result.

SELECT AVG(Name) AS AVG_Name FROM Employee;

----------------------------------------------------------------------------------------------

-- Here are some examples of using the MySQL AVG() function with your Employee table:(ChatGPT)

-- 1. Find the Average Salary of All Employees
-- This query calculates the average salary across all employees.

SELECT AVG(Salary) AS AvgSalary FROM Employee;


-- 2. Find the Average Salary by Department
-- This query returns the average salary for each department (IT, HR, Finance).

SELECT Department, AVG(Salary) AS AvgSalary 
FROM Employee 
GROUP BY Department;


-- 3. Find the Average Salary by City
-- This query calculates the average salary for employees in each city (London and Mumbai).

SELECT City, AVG(Salary) AS AvgSalary
FROM Employee 
GROUP BY City;


-- 4. Find the Average Salary by Gender
-- This query returns the average salary for male and female employees.

SELECT Gender, AVG(Salary) AS AvgSalary 
FROM Employee
GROUP BY Gender;


-- 5. Find the Average Age of All Employees
-- This query calculates the average age of all employees.

SELECT AVG(Age) AS AvgAge FROM Employee;


-- 6. Find the Average Salary of Employees in the IT Department
-- This query calculates the average salary of employees in the IT department.

SELECT AVG(Salary) AS AvgITSalary 
FROM employee
WHERE Department = 'IT';


-- 7. Find the Average Age of Employees by Department
-- This query returns the average age of employees in each department.

SELECT Department, AVG(Age) AS AvgAge
FROM Employee
GROUP BY Department;


-- 8. Find the Average Salary of Employees Above Age 25
-- This query calculates the average salary of employees who are older than 25 years.

SELECT AVG(Salary) AS AvgSalaryAbove25
FROM Employee 
WHERE Age > 25;


