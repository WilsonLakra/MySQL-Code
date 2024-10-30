# MySQL SELECT Statement
-- The SELECT statement is used to select data from a database.
-- The data returned is stored in a result table, called the result-set.

-- SELECT Syntax:
/*
SELECT column1, column2, ...
FROM table_name;
*/

-- The SELECT clause is executed after the FROM clause and any optional WHERE, GROUP BY, and HAVING clauses if present.

-- What is the Use of Select Statement in MySQL?
-- The SELECT Statement is used to returns records in the form of a result set (i.e. rows) from one or more database tables or views. 

-- Select Statement Syntax in MySQL:

-- Syntax1: SELECT All Columns
/* If you want to select all the columns of a table or view then you can also use “*” as shown below

SELECT * FROM Table_Name

Note: In the SQL SELECT statement (*) star or asterisk symbol is a special type of keyword that means ALL.
 Whenever you want to retrieve all columns from a table or view in a SQL SELECT Statement, then you can use *.
 */

-- Syntax2: SELECT Specific Columns
/* If you want to select specific columns, then you need to specify such columns before the FROM Clause as shown below.

SELECT Column_List FROM Table_Name

Note: If you want to select all the columns of a table or view then you can also use “*”, 
but for better performance use the column list instead of using “*”.
*/

-- Syntax3: SELECT All Columns with Conditions
/* If you want to select All Columns with WHERE (or any other) conditions then you need to use the select statement as shown below

SELECT * FROM tables [WHERE conditions];
*/

-- Syntax4: SELECT Specified Columns with Conditions
/* If you want to select Specified Columns with WHERE (or any other) conditions then you need to use the select statement as shown below. 
Here, you need to specify the column list that you want to retrieve.

SELECT Column_List FROM tables [WHERE conditions];
*/


-- Examples to Understand SELECT Statement in MySQL:
-- Please use the below SQL Script to create the database company and employees table with the required data.

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


SELECT DATABASE();
SHOW DATABASES;
USE company;
SHOW TABLES;
DESC employee;


# Retrieve all fields from the Employee table 
-- Option1: Use * as follows:
SELECT * FROM employee;


-- Option2: Specify all the Columns in SELECT Class as follows:
SELECT Id, Name, Department, Salary, Gender, Age, City FROM employee;


# Retrieve Specific Columns from Employee table
-- write a SELECT statement to retrieve Name, Department, Gender, and City columns from the Employee table.
SELECT Name, Department, Gender, City FROM employee;


# Retrieve all Columns with Condition in MySQL
-- write a SELECT SQL statement to retrieve all columns from the Employee table with some conditions. 
-- The condition is we need to retrieve those employees whose Department is IT.
-- Option1: Use * as follows
SELECT * FROM employee WHERE Department = 'IT';


-- Option2: Specify all the Columns in SELECT Class as follows:
SELECT Id, Name, Department, Salary, Gender, Age, City FROM Employee;


# SELECT DISTINCT Statement in MySQL
-- The SELECT DISTINCT SQL statement in MySQL is used to return only distinct or different values from a table column.
-- My requirement is to fetch all the distinct departments from the employee table.
SELECT DISTINCT(Department) FROM employee;
SELECT DISTINCT Department FROM employee;


-- Here we are combining Department and Salary column to get distinct values.
SELECT DISTINCT Department, Salary FROM Employee;


# Aliasing a Column in SELECT Statement
SELECT Id AS Identity_Document, Name FROM Employee;


