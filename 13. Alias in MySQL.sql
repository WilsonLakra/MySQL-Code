# MySQL Aliases
-- Aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword.

-- Alias Column Syntax
/*
SELECT column_name AS alias_name
FROM table_name;
*/

-- Alias Table Syntax
/*
SELECT column_name(s)
FROM table_name AS alias_name;
*/


/* In MySQL, an Alias means a temporary name given to a table or a column.
 The purpose of Aliases is to make table or column names more readable. 
 The Aliases are more useful when multiple columns or multiple tables are used in a single query. Also, 
 if the table names or column names are big or not readable. The AS keyword is used to define the Alias in SQL statement. */
 
 # Example to understand Alias in MySQL:
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
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'Delhi');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT * FROM employee;
SELECT COUNT(*) FROM employee;


# Giving Alias to the Table name in MySQL
-- Here emp is an Alias for employee table.
SELECT emp.Name, emp.Department, emp.Age, emp.Salary
FROM Employee AS emp;

-- Note: Alias’s use is more common in joins, 
-- where we prefix alias and dot to a column name to avoid conflicts of two similar column names from two different tables.


# Giving Alias to Column Names
-- Let’s execute another SQL statement to display the total number of employees in the table.
SELECT COUNT(* ) AS TotalEmployees FROM Employee;
SELECT COUNT(* ) AS 'Total Employees' FROM Employee;	--  If you are using space for the Alias name you can enter the string using single quotes.
 
 
-- Joining two columns together in MySQL
-- If we are joining two columns together using the CONCAT function to display the name and department of the employees together,
-- we will use, CONCAT(name, ‘_’, department).
SELECT Id,	CONCAT(Name, '_', Department), Gender, Salary, Age FROM Employee;


-- So to make it more readable, we can use an alias 
SELECT Id, CONCAT(Name, '_', Department) AS Name_Department, Gender, Salary, Age FROM Employee;


-- we use Name Department as two words and hence we use a single quote.
SELECT Id, CONCAT(Name, '-', Department) AS 'Name Department', Gender, Salary, Age FROM Employee;

-------------------------------------------------------------------------------

SELECT * FROM employee;

-- Alias Column:
SELECT Id AS EmpId, Name AS EmpName FROM Employee;


-- Alias Table:
SELECT Id, Name FROM Employee AS Emp;


-- Alias for Columns Example
SELECT Id AS EmpId, Name AS EmpName FROM Employee;

SELECT Name AS EmpName, Department AS DeptName FROM Employee;

SELECT Name, CONCAT_WS(', ', Department, Salary, Age, City) AS 'Employee Profile' FROM Employee;


-- Alias for Tables Example
USE school;
SELECT DATABASE();
SHOW TABLES;

SELECT s.FirstName, s.LastName, s.Class,  a.City, a.State FROM students AS s, studentaddress AS a;

SELECT a.City, a.State, s.FirstName, s.Class, s.Age FROM studentaddress AS a, students AS s;

SELECT a.City, a.State, s.FirstName, s.Class, s.Age FROM studentaddress AS a, students AS s
WHERE s.Class = 'fIRST' AND s.Age >= 18;

SELECT a.City, s.FirstName, s.Class, s.Age FROM studentaddress AS a, students AS s
WHERE a.City = 'Mumbai' AND s.Class = 'First';

SELECT  s.FirstName, s.Class, a.City FROM studentaddress AS a, students AS s
WHERE s.StudentId = a.StudentId;


SELECT * FROM students;
SELECT * FROM studentaddress;
