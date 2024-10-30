# MySQL MID() Function
-- The MID() function extracts a substring from a string (starting at any position).

-- Note: The position of the first character in the string is 1.
-- Note: The position of the last character in the string is -1.
-- Note: The MID() and SUBSTR() functions equals the SUBSTRING() function.

-- Syntax
/*
MID(string, start, length)
*/


# Example: Extract a substring from a string starting from position 7 and extract 3 characters

SELECT MID('MySQL Tutorials', 7, 3) AS ExtractString; 		-- O/P 	Tut


# Example: Extract a substring from a string starting from position 3 and extract all characters. Here, we don’t require to pass the length parameter.

SELECT MID('MySQL Tutorials', 3) AS ExtractString; 		-- O/P 	SQL Tutorials


# Example: Extract a substring from a string starting from the end, at position -9 and extract 5 characters

SELECT MID('MySQL Tutorials', -9, 5) AS ExtractString; 			-- O/P 	Tutor




# Using the FROM Clause in MID Function
-- Here’s how to use the FROM Clause to do the same thing, but this time using the MID(string FROM position) syntax:

SELECT MID('DOTNET TUTORIALS' FROM 4) Result; 		-- O/P 	NET TUTORIALS


# Specify Length using the FOR Clause:
-- we use MID(str FROM position FOR length) syntax:

SELECT MID('DOTNET TUTORIALS' FROM 4 FOR 4) AS Result; 		-- O/P 	NET 


# Working with Database Tables:
-- The MID function only works on string columns. Following is the syntax to use the MySQL MID function,

-- Syntax
/*
SELECT MID (columnname, start, length) FROM tablename;
*/

/*
where, Start: starting position, and Length: is optional and returns the number of characters to specified. 
If not defined returns the rest of the characters from start
*/


# Understanding MID Function in MySQL with Database Table:
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


#  Fetch the first three characters from the Name column of the Employee table.

SELECT Id, MID(Name, 1, 3) AS Name , Department, City FROM Employee;

-- In the above SQL statement, we will get the name of each employee starting from first characters and up to only 3 characters long.


# If we don’t define the third parameter that is characters length, the MID function will return all the characters from the starting position.

SELECT Id, MID(Name, 3) as Name, Department, City FROM Employee;

-----------------------------------------------------------------------------------------------

-- Here are some examples of using the MySQL MID() function (which extracts a substring) with your Employee table:(ChatGPT)

-- 1. Extract First Three Letters from Employee Names
-- This query extracts the first three characters from the Name field of each employee.

SELECT MID(Name, 1, 3) AS NameSnippet  FROM Employee;


-- 2. Extract First Two Letters from the City Names
-- This query extracts the first two characters from the City field of each employee.

SELECT MID(City, 1, 2) AS CitySnippet from eMPLOYEE;


-- 3. Extract Last Name from Employee Names
/*
If all employee names follow the "First Last" format, you can extract the last name by specifying the starting point and 
length dynamically. Here's an example assuming all names have a space between first and last name:
*/

SELECT MID(Name, LOCATE(' ', Name) + 1, LENGTH(Name)) AS LastName FROM Employee;

-- This query extracts the last name by finding the space and then extracting the part after it.


-- 4. Extract Substring from Department Names
-- This query extracts four characters starting from the second position in the Department field.

SELECT MID(Department, 2, 4) AS DeptSnippet  FROM Employee;


-- 5. Extract First Letter of Employee Gender
-- This query extracts the first letter (initial) from the Gender field for each employee.

SELECT Name, MID(Gender, 1,1) AS GenderInitial from Employee;


-- 6. Extract Last Three Characters of Employee Names
-- This query extracts the last three characters of each employee's name.

SELECT Name, MID(Name, -3,  3) AS LastThreeChars FROM Employee;

SELECT Name, MID(Name, LENGTH(Name) - 2, 3) AS LastThreeChars FROM Employee;


-- 7. Extract Middle Three Characters of City Names
-- This query extracts three characters starting from the second position of each city name.

SELECT MID(City, 2, 3) AS MidCityChars FROM Employee;


-- 8. Extract Department Starting from the Third Character
-- This query extracts the department name starting from the third character onward (without specifying the length).

SELECT MID(Department, 3) AS DeptFromThirdChar FROM Employee;





