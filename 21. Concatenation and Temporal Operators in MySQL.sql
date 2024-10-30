# Concatenation Operator in MySQL
/*
The Concatenation Operator in MySQL is the only operator which is used only for strings. 
The concatenation operator joins two strings together. In MySQL, multiple strings are joined together using the CONCAT function.
*/

-- CONCAT function syntax in MySQL:
-- The CONCAT function can take n number of strings as arguments and return a single string as a result by adding all the input strings.
/*
 CONCAT (string1, string2, string3, …)
 
1.	The CONCAT function may take one or more arguments.
2.	It returns a single string as a result by concatenating all arguments.
3. 	The CONCAT function returns a nonbinary string if all arguments are nonbinary strings.
4. 	The CONCAT function returns a binary string if the arguments include any binary strings.
5. 	If the argument is numeric, it is converted to its equivalent nonbinary string form.
6. 	Returns NULL if any argument is NULL.
*/


# Example of MySQL CONCAT Function using One argument
SELECT CONCAT('MySQL');	-- O/P: MySQL


# Example of MySQL CONCAT Function using two arguments
SELECT CONCAT('MySQL',  'Tutorials'); 	-- O/P: MySQLTutorials


# Example of MySQL CONCAT Function using three arguments
SELECT CONCAT('MySQL',' ', 'Totorials'); 	-- O/P: MySQL Totorials


# Example of CONCAT Function using Null Argument
SELECT CONCAT('MySQL', NULL); 	-- O/P: NULL


-- Please use the below SQL Script to create the Company database and the Employee table with the required data.

DROP TABLE employee;
SHOW TABLES;


CREATE DATABASE Company;
USE Company;
CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  FirstName VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC employee;


INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1001, 'John', 'Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary', 'Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1003, 'James', 'Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike', 'Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda', 'Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag', 'Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla', 'Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit', 'Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya', 'Rout', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, FirstName, LastName, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina', 'Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT * FROM Employee;
SELECT COUNT(*) FROM Employee;


# Example: CONCAT using a database table
-- Return the FullName which includes the FirstName and LastName. Here, we are using CONCAT built-in string function to join FirstName and LastName.

SELECT Id, Department, CONCAT(FirstName, ' ',LastName) AS FullName FROM Employee;


# Temporal Operator in MySQL
/*
Intervals are used while using date and time in MySQL. 
For example, A week means today +7 days. Here, the plus sign is used in the temporal calculation and called a temporal operator.
*/

SELECT (CURRENT_DATE - INTERVAL 7 DAY) AS Date; 	-- This query will return the date exactly 7 days before the current date.

SELECT DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY) AS Date;		-- 	This query will return the date exactly 7 days before the current date.

/*
Explanation:
CURRENT_DATE returns the current date without the time part.
DATE_SUB(date, INTERVAL n DAY) subtracts the specified interval (in this case, 7 days) from the given date.
*/


-- The following SQL statement is to display tomorrow’s date.

SELECT(CURRENT_DATE + interval 1 DAY) AS TomorrowDate;	-- This query will return the date for tomorrow, which is one day after the current date.

SELECT DATE_ADD(CURRENT_DATE, INTERVAL 1 DAY) AS TomorrowDate; -- This query will return the date for tomorrow, which is one day after the current date.

/*
Explanation:
CURRENT_DATE returns the current date.
DATE_ADD(date, INTERVAL n DAY) adds the specified interval (in this case, 1 day) to the given date.
*/

-----------------------------------------------------------------------------------------

# MySQL CONCAT() Function
-- The CONCAT() function adds two or more expressions together.

-- Add several strings together:
SELECT CONCAT("SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;


-- Add three columns into one "Address" column:
SELECT CONCAT(FirstName, ' ', LastName, ' ', City) AS Address FROM Employee;




# MySQL CONCAT_WS() Function
-- The CONCAT_WS() function adds two or more expressions together with a separator.

-- Add several expressions together, and add a "-" separator between them:
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;


-- Add three columns (and add a space between them) into one "Address" column:
SELECT CONCAT_WS(" ", FirstName, LastName, City) AS Address FROM Employee;

SELECT * FROM Employee;



























