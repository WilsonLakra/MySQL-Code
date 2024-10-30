# What are Comparison Operators in MySQL?
/* 
As the name suggests the Comparison Operators in MySQL are used to compare two values i.e. 
these operators are used for comparing one expression with another expression.
 */
 
 
 # Types of Comparison Operators in MySQL
 /*
1.Equal (=) Operator
2. Not Equal (!= or <>) Operator
3. Greater Than (>) Operator
4. Less Than (<) Operator
5. Greater Than or Equal To (>=) Operator
6. Less Than or Equal To (<=) Operator
*/


# Comparison Operators Examples in MySQL:
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
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Sara Talour', 'HR', 85000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Pamela Kar', 'Finance', 70000, 'Female', 26, 'London');


SELECT * FROM employee;
SELECT COUNT(*) FROM employee;


# Equal (=) Comparison Operator in MySQL
-- The below SQL query will return all the records from the Employee table where the Department is IT.
SELECT * FROM Employee WHERE Department = 'IT';


# Not Equal (!=) Comparison Operator in MySQL
-- The below SQL Statement will return all records from the Employee table except the employees whose department is IT.
SELECT * FROM Employee WHERE Department != 'IT';		-- Note: The != operator is not an ISO standard

-- Not Equal (<>) Comparison Operator in MySQL
SELECT * FROM Employee WHERE Department <> 'IT';


# Greater Than (>) Comparison Operator in MySQL
--  The below SQL query will return all records from the Employee table where the employee age is greater than 26.
SELECT * FROM Employee WHERE Age > 26;


# Less Than (<) Comparison Operator in MySQL
-- The below SQL query will return all records from the Employee table where the employee age is less than 27.
SELECT * FROM Employee WHERE Age < 27;


# Greater Than or Equal To (>=) Operator in MySQL
-- The below SQL Query will return all the records from the Employee table where the Salary is greater than or equal to 50000.
SELECT * FROM Employee WHERE Salary >= 50000;


# Less Than or Equal To (<=) Operator in MySQL
-- The below SQL Query will return all the records from the Employee table where the Salary is less than or equal to 50000.
SELECT * FROM Employee WHERE Salary <= 50000;










