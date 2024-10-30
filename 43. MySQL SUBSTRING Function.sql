# MySQL SUBSTRING() Function
-- The SUBSTRING() function extracts a substring from a string (starting at any position).

-- Syntax
/*
SUBSTRING(string, start, length)
*/
-- OR:
/*
SUBSTRING(string FROM start FOR length)
*/

-- Note: The position of the first character in the string is 1.
-- Note: The position of the last character in the string is -1.
-- Note: The SUBSTR() and MID() functions equals to the SUBSTRING() function.


# Extracting a substring from a given string without the length parameter.
SELECT SUBSTRING('MySQL Tutorials', 3) AS SubString;		-- O/P 	SQL Tutorials


# Extracting a substring from a given string with the length parameter.
SELECT SUBSTRING('MySQL Tutorials', 3, 3) AS SubString;		-- O/P	SQL


# Extracting a substring from a given string when the starting position is negative. 
-- In this case, the SUBSTRING function will start from the end of the string and count backward.

SELECT SUBSTRING('MySQL Tutorials', -3)  AS SubString;		-- O/P	als


# Extracting a substring from a given string when the starting position is negative and also length parameter is provided.

SELECT SUBSTRING('MySQL Tutorials', -5, 3) AS SubString;		-- O/P	ria




# Substring Function Using FROM Clause
SELECT SUBSTRING('MySQL Tutorials' FROM 6);		-- O/P  Tutorials


SELECT SUBSTRING('MySQL Tutorials' FROM 1 FOR 5);		-- O/P	MySQL


SELECT SUBSTRING('DotNetTutorials.NET' FROM -3 FOR 3);		-- O/P	NET




# MySQL SUBSTRING Function with Database Table:
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


# Now we will extract a substring from the name column starting from the third position up to 4 characters.

SELECT Id, Name, SUBSTRING(Name, 3, 4) As SubName, Department, City FROM Employee;


-- You can also achieve the above output by using the FROM clause as follows.

SELECT Id, Name, SUBSTRING(Name FROM 3 FOR 4) AS SubName, Department, City FROM Employee;


# Now we will extract a substring from the name column starting from the third position to the remaining characters. 
-- In this case, we don’t require to pass the length parameter to the SUBSTRING function

SELECT Id, Name, SUBSTRING(Name, 3) AS SubName, Department, City FROM Employee;


-- You can also achieve the above output by using the FROM clause as follows.

SELECT Id, Name, SUBSTRING(Name FROM 3) AS SubName, Department, City FROM Employee;

-----------------------------------------------------------------------------------------------------------

/* Here are some examples using the SUBSTRING() function in MySQL based on the Employee table you provided. 
The SUBSTRING() function is used to extract a substring from a given string.(ChatGPT)
*/

-- 1. Extract the First 3 Characters of the Employee Name
-- This query extracts the first 3 characters from the Name column.

SELECT Name, SUBSTRING(Name, 1, 3) AS SubstringName  FROM Employee;


-- 2. Extract Last 4 Characters of the Employee Name
-- This query extracts the last 4 characters of the Name column.

SELECT Name, SUBSTRING(Name, -4) AS LastFourChars  FROM Employee;


-- 3. Extract Department Starting from the 2nd Character
-- This query extracts the substring from the Department column starting at the 2nd character.

SELECT Department, SUBSTRING(Department, 2) AS SubstringDepartment FROM Employee;


-- 4. Extract the First 2 Characters of the City
-- This query extracts the first 2 characters of the City column.

SELECT City, SUBSTRING(City, 1, 2) AS SubstringCity FROM Employee;


-- 5. Extract a Portion of Employee Name (Characters 2 to 5)
-- This query extracts a substring from the Name starting at the 2nd character and extracts the next 4 characters.

SELECT Name, SUBSTRING(Name, 2, 4) AS MiddleChars FROM Employee;


-- 6. Extract Gender Abbreviation (First Letter Only)
-- This query extracts the first letter of the Gender column.

SELECT Gender, SUBSTRING(Gender, 1, 1) AS GenderAbbreviation FROM Employee;


-- 7. Extract Last 2 Digits from Salary
-- This query extracts the last two digits from the Salary.

SELECT Salary, SUBSTRING(Salary, -2, 2) AS LastTwoDigits FROM Employee;

SELECT Salary, SUBSTRING(Salary, -2) AS LastTwoDigits FROM Employee;


-- 8. Extract a Portion of Name from 3rd Character
-- This query extracts the substring of the Name column starting from the 3rd character onward.

SELECT Name, SUBSTRING(Name, 3) AS SubstringFromThirdChar FROM Employee;


