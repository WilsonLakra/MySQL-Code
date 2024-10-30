# MySQL COUNT() Functions
-- The COUNT() function returns the number of rows that matches a specified criterion.

-- COUNT() Syntax
/*
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
*/

/* 
There are mainly 2 types of functions in SQL, Aggregate Functions and Scalar Functions.

1. Aggregate Functions only work on a group of rows to return a single aggregate result value. 
The Example of Aggregate Functions are: COUNT(), MIN(), MAX(), SUM(), ANG(), etc.


2. Scalar Functions work on single input value to return single result value. 
The Example of Scalar Functions are: LEN(), ROUND(), SUBSTRING(), CASE(), NOW(), etc.


The COUNT function is used to count the data rows returned in the result set. MySQL COUNT function counts distinct or 
all values in data rows returned in a result set. The COUNT function does not count NULL values.


Syntax:
SELECT COUNT(*) AS total_rows FROM tablename;
SELECT COUNT (DISTINCT columnname) AS total_rows FROM tablename;
*/


# Example to Understand MySQL Count Function
-- Please use the following SQL Script to create and populate the Employee and Projects table with the required sample data.


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


CREATE TABLE Projects (
ProjectId INT PRIMARY KEY,
	Title VARCHAR(200) NOT NULL,
	ClientId INT,
EmployeeId INT,
	StartDate DATETIME,
	EndDate DATETIME,
	FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);


-- To see the table structure
DESCRIBE Projects;


INSERT INTO Projects VALUES (1, 'Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));
INSERT INTO Projects VALUES (2, 'WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY));
INSERT INTO Projects VALUES (3, 'Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY));
INSERT INTO Projects VALUES (4, 'Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO Projects VALUES (5, 'MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY));
INSERT INTO Projects VALUES (6, 'Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));
INSERT INTO Projects VALUES (7, 'Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY));
INSERT INTO Projects VALUES (8, 'Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));
INSERT INTO Projects VALUES (9, 'Hosting account is not working', 3, 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO Projects VALUES (10, 'MySQL database from my desktop application', 4, 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY));
INSERT INTO Projects VALUES (11, 'Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));


SELECT * FROM Projects;


# Example: Count the Total Number of employees in the Employee table.
--  let’s count the data rows in the Employee table using the COUNT function 

SELECT COUNT(*) FROM Employee;

-- As the employee table contains 10 rows, so here you will get the output as 10.


# COUNT Function with Alias Name in MySQL
/*
We can also use Alias to give the name to the data column. By default, the column name would be COUNT(*) 
that you can see in the previous example. Instead of COUNT(*), we want to provide the name as Total_Employees.
*/

SELECT COUNT(*) AS Total_Employees FROM Employee;

-- Notice, now the column name is Total_Employees instead of COUNT(*).


# Count Distinct Values in MySQL
/*
 Let us get the number of employees in each department by using the COUNT function. 
 Here, we also need to use the group by clause to group the employees by department and 
 then apply the count function on each department to get the desired result. 
 */

SELECT Department, COUNT(*) AS Total_Employees FROM Employee
GROUP BY Department;


# MySQL COUNT Function with Joins
-- By using left outer join we get matching records from both the tables as well as non-matching records from the left-hand side table. 
-- Let us first left join, the Employee and Projects table

SELECT * FROM Employee;
SELECT * FROM Projects;


SELECT emp.Id AS EmployeeId, emp.Name , prj.Title AS ProjectTitle
FROM Employee emp LEFT OUTER JOIN Projects AS prj
 ON emp.Id = prj.EmployeeId;


-- The COUNT function does not count NULL values. If we try to count the total data rows in the title column, 
-- using the SQL statement, it should only return the 8.

SELECT COUNT(prj.Title) AS TotalProject
FROM Employee AS emp 
LEFT OUTER JOIN Projects AS prj
ON emp.Id = prj.EmployeeId;


SELECT * FROM Employee;
SELECT * FROM Projects;

---------------------------------------------------------------------------------------

-- Here are some examples of SQL queries using the COUNT() function for the provided Employee and Projects tables:(ChatGPT)

-- 1. Count Total Number of Employees
-- This query returns the total number of employees in the Employee table.
SELECT COUNT(*) AS TotalEmployee FROM Employee;


-- 2. Count Employees by Department
-- This query returns the number of employees in each department (e.g., IT, HR, Finance).

SELECT Department, COUNT(*) AS EmployeeCount 
FROM Employee
GROUP BY Department;


-- 3. Count Employees by City
-- This query counts how many employees are in each city (e.g., London, Mumbai).

SELECT City, COUNT(*) EmployeeCount
FROM Employee
GROUP BY City;


-- 4. Count Projects Assigned to Each Employee
SELECT * FROM Employee;
SELECT * FROM Projects;

-- This query shows how many projects are assigned to each employee, excluding projects where EmployeeId is NULL.

SELECT EmployeeId, COUNT(*) AS ProjectCount
FROM Projects
WHERE EmployeeId IS NOT NULL
GROUP BY EmployeeId;


-- 5. Count Total Number of Projects
-- This query returns the total number of projects in the Projects table.

SELECT COUNT(*) AS TotalProjects FROM Projects; 


-- 6. Count Projects without Assigned Employees
-- This query counts the number of projects that are not yet assigned to any employee (i.e., where EmployeeId is NULL).

SELECT COUNT(ProjectId) AS UnassignedProjects FROM Projects WHERE EmployeeId IS NULL;


-- 7. Count Projects by Client
-- This query shows how many projects are associated with each client.

SELECT ClientId, COUNT(*) AS ProjectCount
FROM Projects WHERE ProjectId IS NOT NULL GROUP BY ClientId;

SELECT ClientId, COUNT(*) AS ProjectCount
FROM Projects
GROUP BY ClientId;


-- 8. Count Employees by Gender
SELECT * FROM Employee;

-- This query counts the number of employees based on their gender.

SELECT Gender, COUNT(*) AS EmployeeCount 
FROM Employee 
GROUP BY Gender;


