# What is a data type in MySQL?
-- The data type of a column defines what value the column can hold: integer, character, money, date and time, binary, and so on.
-- In MySQL, data types is categorized into three main groups −

-- Numeric Data Types
-- String Types Data Types or Character data types
-- Date and Time Data Types or Temporal Data Types


-- Numeric Data Types:
/* Numeric data types store only numeric values. Depending upon the values, the numeric data types can be Integer Numeric, Fixed-Point Numbers, 
and Floating-point Numbers. The Example of numeric data values is price, rating, salaries, etc.

TINYINT 
SMALLINT 
MEDIUMINT 
INT 
BIGINT 
FLOAT(M,D)
DOUBLE(M,D)
DECIMAL(M,D)
*/


-- String Types Data Types or Character data types:
/* Character data types can be store in alphabets, symbols, and also numbers. 
The Example of character data values are names, description, alphanumeric string, etc.

CHAR(M)
VARCHAR(M) 
BLOB or TEXT
TINYBLOB or TINYTEXT
MEDIUMBLOB or MEDIUMTEXT
LONGBLOB or LONGTEXT
ENUM
SET
*/


-- Date and Time Data Types or Temporal Data Types:
/* Temporal data types store date, time, and date-time together. 
Data type’s name and size can be different in a different database management system

DATE
DATETIME 
TIMESTAMP 
TIME 
YEAR(M)
*/

------------------------------------------------------------------------------

-- Please execute the following SQL script to create and populate the Employee with the required sample data.
-- Create Employee Table

CREATE TABLE Employee
(
  EmployeeId INT PRIMARY KEY,
  Name VARCHAR(50),
  Salary INT,
  DOB Date
);


-- Populate Employee table
INSERT INTO Employee(EmployeeId, Name, Salary, DOB) VALUES(1001, 'Pranaya', 10000, '1988-02-29');
INSERT INTO Employee(EmployeeId, Name, Salary, DOB) VALUES(1002, 'Anurag', 20000, '1992-06-22');
INSERT INTO Employee(EmployeeId, Name, Salary, DOB) VALUES(1003, 'Sambit', 30000, '1978-04-12');


SELECT * FROM Employee;


SELECT AVG(Salary) AS AverageSalary FROM Employee;
SELECT COUNT(EmployeeId) AS NumberOfEmpoloyee FROM Employee;

-- Find the higest salary of employee is employee table
SELECT MAX(Salary) AS Higest_Salary from Employee;

-- Find the lowest salary of employee is employee table
SELECT MIN(Salary) AS Lowest_Salary from Employee;




SELECT CHAR_LENGTH("Anurag") AS LengthOfString FROM Employee;
SELECT CONCAT(Name, " ", DOB, " " ) AS EmployeeDOB FROM Employee;

-- Remove leading and trailing spaces from a string:
SELECT TRIM("   SQL Tutorial   ") AS TrimmedString;
-- Convert the text to upper-case:
SELECT UCASE("SQL Tutorial is FUN!");
-- Convert the text to upper-case:
SELECT UPPER("SQL Tutorial is FUN!");




SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURTIME();

SELECT EmployeeId, Name, DOB FROM Employee;


/* To calculate the age of an employee in MySQL, you can use the DATEDIFF function to find the difference between the current date
 and the employee's date of birth, and then divide the result by 365 to convert it into years */
 
SELECT Name, DOB,  FLOOR(DATEDIFF(CURDATE(), DOB) / 365) AS Employee_age FROM Employee;


-- If you need a more precise age calculation that accounts for leap years, you can use the TIMESTAMPDIFF function:

SELECT Name, DOB,TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Employee_age FROM Employee;






