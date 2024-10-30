# MySQL UCASE() and LCASE() Function

#  MySQL UCASE() Function
-- The UCASE() function converts a string to upper-case.

-- Note: This function is equal to the UPPER() function.

-- Syntax
/*
UCASE(text)
*/


# MySQL LCASE() Function
-- The LCASE() function converts a string to lower-case.

-- Note: The LOWER() function is a synonym for the LCASE() function.

-- Syntax
/*
LCASE(text)
*/


# Understanding UCASE and LCASE Function in MySQL:
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


# MySQL UCASE() Function
-- The MySQL UCASE function converts string data values to uppercase. The UCASE function only works on string columns.
-- The changes will only affect the result set, it will not affect the original data present in the database table.

-- Syntax
/*
SELECT UCASE(columnname) FROM tablename;
SELECT UCASE(‘String Value’);
*/


# Example: Converting Employee Name and City to Upper Case
-- Let us see an example that will convert the employee’s name and city to upper case.

SELECT UCASE(Name) AS Name, UCASE(City) AS City FROM Employee;

SELECT Id, UCASE(Name) AS Name, Department, Salary, UCASE(City) AS City FROM Employee;


# UPPER Function in MySQL:
/*
The UCASE function is the synonym for the UPPER function. That means both the functions are going to do the same task i.e.
 going to convert the given string into upper case
 */
 
 SELECT Id, UCASE(Name) AS Name, Department, Salary, UCASE(City) AS City FROM Employee;




# MySQL LCASE() Function
-- The MySQL LCASE function converts the string data row values to lowercase. The LCASE function only works on string columns. 

-- Syntax
/*
SELECT LCASE(columnname) FROM tablename;
SELECT LCASE(‘String Value’);
*/


# Example: Converting Employee Name and City to Lower Case
-- Let us see an example that will convert the employee’s name and city to lower case.

SELECT LCASE(Name) AS Name, LCASE(City) AS City FROM Employee;

SELECT Id, LCASE(Name) AS Name, Department, Salary, LCASE(City) AS City FROM Employee;


# LOWER Function in MySQL:
/*
The LCASE function is the synonym for the LOWER function. That means both the functions are going to do the same task i.e. 
going to convert the given string into lower case.
*/

SELECT Id, LCASE(Name) AS Name, Department, Salary, LCASE(City) AS City FROM Employee;

--------------------------------------------------------------------------------------------------

-- Here are some examples of using the MySQL UCASE() (uppercase) and LCASE() (lowercase) functions with your Employee table:(ChatGPT)

-- 1. Convert Employee Names to Uppercase (UCASE)
-- This query converts all employee names to uppercase.

SELECT UCASE(Name) AS UpperCaseName FROM Employee;


-- 2. Convert Employee Names to Lowercase (LCASE)
-- This query converts all employee names to lowercase.

SELECT LCASE(Name) AS LowerCaseName from Employee;


-- 3. Display Departments in Uppercase (UCASE)
-- This query displays all department names in uppercase.

SELECT UCASE(Department) AS UpperCaseDepartment FROM Employee;


-- 4. Display Cities in Lowercase (LCASE)
-- This query converts all city names to lowercase.

SELECT LCASE(City) AS LowerCaseCity FROM Employee;


-- 5. Convert Gender to Uppercase for All Employees
-- This query converts the Gender field to uppercase while displaying the names of employees.

SELECT Name, UCASE(Gender) AS UpperCaseGender FROM Employee;


-- 6. Convert Name and City to Uppercase
-- This query converts both the employee names and city names to uppercase.

SELECT UCASE(Name) AS UpperCaseName, UCASE(City) AS UpperCaseCcity FROM Employee;


-- 7. Convert Department to Lowercase for Employees in HR
-- This query converts the department names to lowercase, but only for employees in the HR department.

SELECT Name, LCASE(Department) AS LowerCaseDepartment 
FROM Employee 
WHERE Department = 'HR';


-- 8. Combine UCASE and LCASE Functions
-- This query converts employee names to uppercase and city names to lowercase in the same result set.

SELECT UCASE(Name) AS UpperCaseName, LCASE(City) AS LowerCaseCity FROM Employee;


