# MySQL ORDER BY Keyword
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

-- ORDER BY Syntax
/*
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
*/
-- Another Syntax
/*
SEELCT expressions
FROM tables
[WHERE conditions]
ORDER BY expression [ASC/DESC]
*/

-- This clause will arrange the data temporarily but not in the permanent store. 
-- The Order by Clause can only be used in Select Statements.

-- Example to understand Order by Clause in MySQL:
-- Please use the following SQL Script to create the company database and employee table with the required records.


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
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Manoj Tripathy', 'HR', 85000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Mitali Rout', 'Finance', 70000, 'Female', 26, 'Mumbai');


SELECT DATABASE();
SHOW DATABASES;
USE company;
SHOW TABLES;
DESC employee;


# Sorting without using ASC/DESC attribute in MySQL:
-- we are using Order By clause on the Name column without specifying the ASC and DESC keywords. 
SELECT * FROM employee
ORDER BY Name;

-- n this case, the records will be sorted in ascending order based on the Name column of the employee table.


# Here, in the below query we explicitly providing the ASC keyword.
SELECT * FROM Employee
ORDER BY Name ASC;


# Sorting in Descending Order using Order By DESC:
SELECT * FROM employee
ORDER BY Name DESC;


# Order by Clause with Where Clause in MySQL:
--  In the below query, first, it filtered the data based on the City column i.e. it fetches all the employees who belong to London and 
-- then applied for the Order by clause on the Name column to sort the employees in ascending order.

SELECT * FROM Employee
WHERE City = 'London'
ORDER BY Name ASC;


# Order by Clause with Multiple Columns in MySQL:
-- Our requirement is, first sort the employee by Department in Descending order and then sort the employees by name in ascending order.

SELECT Id, Department, Name, Salary, City, Age, Gender
FROM Employee
ORDER BY Department DESC, Name ASC;


# Sorting Data in MySQL by the Relative Position
--  So, the relative position will be 1 for Name, 2 for Department, 3 for Gender, and 4 for City. Further,
--  if you notice in the order by clause, we have specified 2 which means the following SQL Query will sort the data based on the Department column.

SELECT Name, Department, Gender, City
FROM Employee
ORDER BY 2 ASC;


# What happens if the relative position does not exist?
-- In that case, it will throw an error. If you specify 0, any negative number, 
-- or a number that is more than the number of columns in the result set then you will get an error
-- In the below example, the select statement contains four columns and we are using 5 as the relative position to sort the data and 
-- hence when you try to execute the below query, you will get an error.

SELECT Name, Department, Gender, City
FROM Employee 
ORDER BY 5 ASC;		-- a number that is more than the number of columns in the result set

-- When you try to execute the above query, it will give you the error as Error Code: 1054. Unknown column ‘5’ in ‘order clause’
-- Relative position should be less then or equal to number of columns in SELECT statement

SELECT Name, Department, Gender, City
FROM Employee 
ORDER BY 0 ASC;		-- If you specify 0, then you will get an error

SELECT Name, Department, Gender, City
FROM Employee 
ORDER BY 4 ASC;

SELECT Name, Department, Gender, City
FROM Employee 
ORDER BY 1 ASC;

-------------------------------------------------------------------------------

-- ORDER BY with DESC
-- we are displaying all the columns from the Employee table, sorted by the NAME column in descending order −
SELECT * FROM employee
ORDER BY Name DESC;


-- ORDER BY with Multiple Columns
-- Here, we are selecting all the columns from the Employee table, sorted by the CITY and NAME columns.
SELECT * FROM Employee 
ORDER BY City, Name;		-- Default SORT in assending


-- ORDER BY with ASC and DESC
-- The column provided first with ASC will be sorted in Ascending order and the column provided second with DESC will be sorted in descending order.
-- we are selecting all the columns from the Employee table, sorted ascending by the AGE and descending by the SALARY column −
SELECT * FROM Employee
ORDER BY Age ASC, Salary DESC;


-- ORDER BY with LENGTH()
-- We can use the LENGTH() function with the ORDER BY clause in MySQL to sort the values present in a particular column based on the length.
-- we are sorting the CITY column based on the length −
SELECT * FROM Employee 
ORDER BY LENGTH ( City ) ASC;

