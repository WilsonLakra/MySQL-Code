# MySQL AND, OR and NOT Operators
-- The WHERE clause can be combined with AND, OR, and NOT operators.

-- The AND and OR operators are used to filter records based on more than one condition:
		-- The AND operator displays a record if all the conditions separated by AND are TRUE.
		-- The OR operator displays a record if any of the conditions separated by OR is TRUE.
        
-- The NOT operator displays a record if the condition(s) is NOT TRUE.

-- AND Syntax
/*
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
*/

-- OR Syntax
/*
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
*/

-- NOT Syntax
/*
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
*/


# Logical Operators Examples in MySQL:
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


# Logical AND Operator in MySQL
/*
The Logical AND operator in MySQL compares two conditions and returns TRUE if both of the conditions are TRUE and 
returns FALSE when either is FALSE.

In some cases, there are chances where we will have to use more than one condition to filter the data rows. 
In such a case, we use some special operators that are useful to create such compound conditions.

The AND operator can be written as a word AND or && symbols without space.
*/


# Examples to Understand Logical AND Operator in MySQL:
-- Our requirement is to find all the employees from the Employee table where the Department is IT and the employee age is 28, 
SELECT *  FROM Employee WHERE Department = 'IT' AND Age = 28;

SELECT * FROM Employee WHERE (Department = 'IT' AND Age = 28);		-- Bracket is optional


# Logical NOT Operator Example in MySQL:
-- We can also use the NOT keyword in the statement to revert one of the conditions.
-- Our requirement is to fetch all the employees whose Department is IT and Age does not equal to 28. 
SELECT * FROM Employee WHERE Department = 'IT' AND NOT Age = 28;

SELECT * FROM Employee WHERE Department = 'IT' AND Age != 28;


# False Condition Example using AND Operator in MySQL:
-- As in our employee table, there is no employee in the IT department whose age is 28. 
-- Now, in the below SQL Statement, the second condition becomes false.

SELECT * FROM Employee WHERE Department = 'IT'AND Age = 26;


# Logical OR Operator in MySQL
/*
In some cases, we will have to evaluate only one of the conditions is TRUE to return the result set.
The OR operator is useful to add multiple conditions in a single SQL statement.
The OR operator can be written as a word “OR” or “||” two pipe symbols without space.
*/


# Fetch all the employees whose age is either 25 or 26 from the employee table.
SELECT * FROM Employee WHERE Age = 25 OR Age = 26;

SELECT * FROM Employee WHERE (Age = 25 OR Age = 26);		-- Bracket is optional


--  If all the conditions are false the system won’t return that data row.

SELECT * FROM Employee WHERE Age = 10 OR Age = 15;


# Logical NOT Operator in MySQL:
--  If we want to fetch the Employees who do not belong to the IT Department
SELECT * FROM Employee WHERE NOT Department = 'IT';
	
    
# AND OR Condition in MySQL
-- If we want to select all the employees whose Salary is between 50000 and 60000, or those whose City is Mumbai,     
SELECT * FROM Employee WHERE (Salary >= 50000 AND Salary <= 60000) OR City = 'mumbai';

--------------------------------------------------------------------------------

SELECT * FROM Employee;


-- AND Operator with WHERE
-- let us select all the columns from the Employee table where the CITY is 'Mumbai' and AGE is 25.

SELECT * FROM Employee WHERE City = 'Mumbai' AND Age = 25;

-- The logical AND operator returns the records only if all the conditions separated by AND are true.
-- Here we are providing a false value to one of the AND operands.

SELECT * FROM Employee WHERE City = 'Kerala' AND Age = 27;


-- Multiple AND Operators
-- we are selecting all records from the Employee table where the NAME starts with "M", 
-- AGE is greater than or equal to 22, and SALARY is less than 50000.

SELECT * FROM Employee WHERE Name LIKE 'M%' AND Age >= 22 AND Salary < 50000;


-- AND with UPDATE statement
-- we are updating the SALARY of Employee whose ID is 1005 and CITY is 'London' −

UPDATE Employee SET Salary = 25000 WHERE ID = 1005 AND City = 'London';		-- 75000

SELECT * FROM Employee WHERE ID = 1005 AND City = 'London';

UPDATE Employee SET Salary = 75000 WHERE ID = 1005 AND City = 'London';


-- AND with DELETE Statement
-- we are deleting records from the Employee table where the NAME is equal to 'Hina Sharma' and CITY is equal to 'Mumbai' −		1010

DELETE FROM Employee WHERE Name = 'Hina Sharma' AND City = 'Mumbai';

SELECT * FROM Employee WHERE Name = 'Hina Sharma' AND  City = 'Mumbai';


-- OR operator with WHERE
-- we are selecting all the columns from the Employee table where SALARY is greater than 50000 or CITY = "Hyderabad".

SELECT * FROM Employee WHERE Salary > 50000 OR City = "Hyderabad";

-- The logical OR operator returns the records only if either of the conditions separated by OR is true.
-- we are providing false values to both operands of the OR operator.

SELECT * FROM Employee WHERE Name = 'Mahesh' OR Age = 42;


-- Multiple OR Operators
-- we are returning all the records from the Employee table where the NAME of the employee ends with 'K', 
-- or SALARY is greater than 50000, or AGE is less than 25.

SELECT * FROM Employee WHERE Name LIKE '%K' OR Salary > 50000 OR Age < 25;


-- OR with UPDATE statement
-- we are updating the SALARY of Employee whose CITY is 'Hyderabad' or whose age is greater than 25. 		1001, 	1006 -- 35000

UPDATE Employee SET Salary = 15000 WHERE City = 'Hyderabad' OR Age = 25;

UPDATE Employee SET Salary = 35000 WHERE City = 'Hyderabad' OR Age = 25;


-- OR with DELETE Statement
-- we are trying to DELETE records from the Employee table where the age is less than 26 or the SALARY is less than or equal to 10000.  -- 1001, 1006

DELETE FROM Employee WHERE Age < 26 OR Salary <= 10000;


-- NOT with IN Operator
-- we are fetching all the records from the Employee table where NAME is NOT "Khilan", "Chaital", and "Muffy".

SELECT * FROM Employee WHERE Name NOT IN ("Khilan", "Chaital", "Muffy");


-- NOT with IS NULL Operator
--  we are selecting all the records from the Employee table where the CITY column is not null.

SELECT * FROM Employee WHERE City IS NOT NULL;


-- NOT with LIKE Operator
-- we are fetching all the records from the Employee table where the NAME column does not start with the letter K.

SELECT * FROM Employee WHERE Name NOT LIKE 'K%';


-- NOT with BETWEEN Operator
-- we are selecting all the records from the Employee table where the AGE is not between 25 and 30.

SELECT * FROM Employee WHERE Age NOT BETWEEN 25 AND 30;


-- NOT with UPDATE Statement
-- we are updating the SALARY of the Employee to a value of 12000 where the AGE is not between 25 and 30.

UPDATE Employee SET Salary = 12000 WHERE Age NOT BETWEEN 25 AND 30;

SELECT * FROM Employee WHERE Age NOT BETWEEN 25 AND 30;

SELECT Name, Salary, Age FROM Employee WHERE Age NOT BETWEEN 25 AND 30;


-- NOT with DELETE Statement
-- we are deleting records from the Employee table where the SALARY is not between 30000 and 35000.			

DELETE FROM Employee WHERE Salary NOT BETWEEN 30000 AND 35000;

SELECT COUNT(*) FROM Employee WHERE Salary NOT BETWEEN 30000 AND 35000;

SELECT * FROM Employee;


