# MySQL Arithmetic Operators

-- What are Arithmetic Operators?
/*
Arithmetic Operators are used for performing mathematical calculations such as Addition, Subtraction, Multiplication, Module, and Division 
represented by the expected +, -, *(star or asterisk), %, and / forward slash symbols respectively on the given operand values. 
That is, they are used to perform mathematical operations on two expressions of the same or different data types of numeric data. 
*/

SELECT 150 + 250; -- O/P = 400
SELECT 145 - 75; -- O/P = 70
SELECT 17 * 5; -- O/P = 85
SELECT 49 / 7; -- O/P = 7.0000
SELECT 21 % 5; -- O/P = 1


# Arithmetic Operators in MySQL Complex Queries:
-- Please use the below SQL Script to create the Company database and the Employee table with the required data.

DROP TABLE employee;
SHOW TABLES;


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
DESC employee;


INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT * FROM Employee;
SELECT COUNT(*) FROM Employee;


# Example: Arithmetic Operators
/*
Our requirement is to calculate the salaries of each employee by adding 10% as a bonus. 
The following SQL Query will calculate the employee’s salary after the addition of 10% and 
show it in the Bonus along with the Id, Name, Salary column.
*/

SELECT Id, Name, Salary, Salary * 1.1 AS Bonus FROM Employee;
-- Since we're multiplying the salary by 1.1, the result is the total salary after adding the bonus, not just the bonus itself.


SELECT Id, Name, Salary, ( Salary * 10/100 ) AS Bonus FROM Employee;
-- This query focuses solely on calculating the bonus amount and doesn't modify or display the total salary after adding the bonus.


SELECT Id, Name, Salary, ( Salary * 10/100 + Salary ) AS Salary_After_Bonus FROM Employee;
-- This query calculates the bonus as Salary * 10/100 and then adds it to the original salary to give the total.


SELECT Id, Name, Salary, Salary * 0.10 AS Bonus, Salary + (Salary * 0.10) AS Salary_After_Bonus FROM Employee;
-- This query effectively separates the bonus and the updated salary in the output.

SELECT * FROM Employee;

-------------------------------------------------------------------------------------------

# In MySQL, arithmetic operations follow standard mathematical rules and have specific behaviors and rules to keep in mind:

--  Order of Operations (PEMDAS)
/*
Parentheses: Operations inside parentheses are performed first.
Exponents: MySQL does not support exponentiation directly; use the POW() function.
Multiplication and Division: These are performed next, from left to right.
Addition and Subtraction: These are performed last, from left to right.
*/


-- 1. Addition (+)	Adds two numbers.
SELECT  5 + 3 AS SUM;	-- Result: 8


-- 2. Subtraction (-)	Subtracts one number from another.
select 10 - 4 AS Difference;	-- Result: 6


-- 3. Multiplication (*)	Multiplies two numbers.
SELECT 7 * 6 AS Product;	-- Result: 42


-- 4. Division (/)	Divides one number by another. Note that dividing by zero results in an error.
SELECT 20 / 4 AS Quotient; 	-- Result: 5


-- 5. Modulus (%)	Returns the remainder of a division.
SELECT 11 % 4 AS Reminder; 	-- Result: 3


-- 6. Exponentiation (POW() or POWER())
-- Raises a number to the power of another number. MySQL does not have a direct exponentiation operator but provides POW() and POWER() functions.
SELECT POW(2, 3) AS Power; 	-- Result: 8



