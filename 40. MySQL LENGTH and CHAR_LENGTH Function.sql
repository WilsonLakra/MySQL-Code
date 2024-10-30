# MySQL LENGTH() and CHAR_LENGTH() Function

# MySQL LENGTH() Function
-- The LENGTH() function returns the length of a string (in bytes).
-- The LENGTH function only works on string columns.
-- The MySQL LENGTH function is similar to the LEN function of SQL Server.

-- Syntax
/*
LENGTH(string)
*/


# MySQL CHAR_LENGTH() Function
-- The CHAR_LENGTH() function return the length of a string (in characters).
-- The CHAR_LENGTH function only works on string columns.
-- Note: This function is equal to the CHARACTER_LENGTH() function.

-- Syntax
/*
CHAR_LENGTH(string)
*/


# Examples: MySQL LENGTH Function

# Example: Passing NULL to the LENGTH function and it will return NULL as output

SELECT LENGTH(NULL);		-- O/P 	NULL


# Example: Passing an empty string to the LENGTH function and it will return 0 as the output

SELECT LENGTH('');		-- O/P 	0


# Example: Passing a single space to the LENGTH function and will return 1 as the output.

SELECT LENGTH(' ');		-- O/P 	1


# Example: Passing string with space to the LENGTH function and it will return the number of characters including space present in the string as output.

SELECT LENGTH('DOT NET TUTORIALS'); 		-- O/P 	17


# Example: Passing string without space to the LENGTH function and will return the number of characters present in the string as the output.

SELECT LENGTH('DOTNETTUTORIALS'); 		-- O/P 	15




# Examples: MySQL CHAR_LENGTH Function

# Example: Passing NULL to the CHAR_LENGTH function and it will return NULL as output

SELECT CHAR_LENGTH(NULL); 		-- O/P 	NULL


# Example: Passing an empty string to the CHAR_LENGTH function and it will return 0 as the output

SELECT CHAR_LENGTH('');			-- O/P 	0


# Example: Passing a single space to the CHAR_LENGTH function and will return 1 as the output.

SELECT CHAR_LENGTH(' '); 		-- O/P 	1


# Example: Passing string with space to the CHAR_LENGTH function and it will return the number of characters
-- including space present in the string as output.

SELECT CHAR_LENGTH('DOT NET TUTORIALS'); 		-- O/P 	17


# Example: Passing string without space to the CHAR_LENGTH function and it will return the number of characters present in the string as the output.

SELECT CHAR_LENGTH('DOTNETTUTORIALS'); 		-- O/P 	15


# Working with Database Table:
-- The LENGTH and CHAR_LENGTH functions only work on string columns.

-- Syntax
/*
SELECT LENGTH(columnname) FROM tablename;
SELECT CHAR_LENGTH(columnname) FROM tablename;
*/


# Understanding LENGTH and CHAR_LENGTH Functions with Database Table:
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


# Now, we need to calculate the length of the Employee name using LENGTH and CHAR_LENGTH functions 

SELECT Name, LENGTH(Name) AS Length, CHAR_LENGTH(Name) AS Char_Length FROM Employee;

-----------------------------------------------------------------------------------------------------------

/*
Here are some examples of using MySQL LENGTH() and CHAR_LENGTH() functions with your Employee table. 
These functions are used to calculate the length of a string in bytes (LENGTH()) and the number of characters (CHAR_LENGTH()).(ChatGPT)
*/

-- 1. Find the Length of Employee Names Using LENGTH()
-- This query calculates the length of each employee's name in bytes.

SELECT Name, length(Name) AS NameLength FROM Employee;


-- 2. Find the Character Length of Employee Names Using CHAR_LENGTH()
-- This query calculates the number of characters in each employee's name.

SELECT Name, CHAR_LENGTH(Name) AS CharNameLength  FROM Employee;


-- 3. Find the Length of City Names Using LENGTH()
-- This query returns the length of the city names in bytes.

SELECT City, LENGTH(City) AS CityLength FROM Employee;


-- 4. Find the Character Length of City Names Using CHAR_LENGTH()
-- This query returns the number of characters in the city names.

SELECT City, CHAR_LENGTH(City) AS CharCityLength  FROM Employee;


-- 5. Find the Length of Department Names Using LENGTH()
-- This query calculates the length of the department names in bytes.

SELECT Department, LENGTH(Department) AS DeptLength FROM Employee;


-- 6. Find the Character Length of Department Names Using CHAR_LENGTH()
-- This query returns the number of characters in the department names.

SELECT Department, CHAR_LENGTH(Department) AS CharDeptLength FROM Employee;


-- 7. Find the Length of Employee Names and Gender Using LENGTH()
-- This query calculates the length of the employee names and their gender in bytes.

SELECT Name, LENGTH(Name) AS NameLength, Gender, LENGTH(Gender) AS GenderLength FROM Employee;

SELECT Name, Gender, LENGTH(Name) AS NameLength, LENGTH(Gender) AS GenderLength FROM Employee;


-- 8. Find the Difference Between LENGTH() and CHAR_LENGTH()

SELECT Name, LENGTH(Name) AS ByteLength, Name, CHAR_LENGTH(Name) AS CharLength FROM Employee;

SELECT Name, LENGTH(Name) AS ByteLength, CHAR_LENGTH(Name) AS CharLength 
FROM Employee;

/*
This query compares the byte length and character length of each employee's name. 
For ASCII characters, both LENGTH() and CHAR_LENGTH() will return the same result, 
but for multi-byte characters, LENGTH() returns a larger value.
*/


-- 9. Filter Employees Where Name Length is Greater Than 10 Characters
-- This query returns employees whose names have more than 10 characters.

SELECT Name, CHAR_LENGTH(Name) AS CharNameLength  FROM Employee WHERE CHAR_LENGTH(Name) > 10;


-- 10. Find the Total Length of Employee Names and Department Combined
-- This query concatenates the Name and Department fields and calculates the total length of the combined string.

SELECT Name, Department, LENGTH(CONCAT(Name, Department)) AS TotalLength 
FROM Employee;


