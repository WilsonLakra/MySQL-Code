# MySQL CHECK Constraint
/*
The CHECK constraint is used to limit the value range that can be placed in a column.
If you define a CHECK constraint on a column it will allow only certain values for this column.
If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row
*/


-- Syntax: Following is the syntax to use CHECK Constraint while creating a table.
/*
CREATE TABLE tablename (
Column1 datatype,
Column2 datatype,
CHECK (column1 > 0)
);
*/


-- Syntax: Following is the syntax to use CHECK Constraint on the existing table.
/*
ALTER TABLE tablename
ADD CONSTRAINT chk_column1 CHECK  (column1 > 0);
*/


/*
The MySQL Check constraints can be created at two different levels

Column-Level Check Constraints: When we create the check constraints at the column level then they are applied only to that column of the table.
Table-level Check Constraints: When we create the check constraints at the table level, then it can be referred from any column(s) within that table.
A table can contain any number of check constraints and will apply to any column data type like integer, character, and decimal, date, etc.
*/


# Column-Level Check Constraints in MySQL

CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Employees (
EmployeeID INT NOT NULL CHECK (EmployeeID BETWEEN 100 AND 1000),
Name VARCHAR(50) NOT NULL,
Age INT NOT NULL CHECK (Age >= 18),
DeptID INT CHECK (DeptID > 0 AND DeptID < 100),
Salary DECIMAL (18,2)
);


SELECT DATABASE();
SHOW TABLES;
DESC Employees;
SHOW DATABASES;
USE EmployeeDB;


-- To see the table structure
DESCRIBE Employees;


-- To view the complete table structure,
SHOW CREATE TABLE Employees;


-- To use CHECK Constraint on the existing table.
ALTER TABLE Employees 
ADD CONSTRAINT CHK_Salary CHECK (Salary < 30000) ;


# Now, let us prove the above three INSERT statements

INSERT INTO Employees VALUES (100, 'Pranaya', 20, 1, 20000);
INSERT INTO Employees VALUES (101, 'Rout', 25, 2, 25000);

/*
When you execute the above two statements, two records are inserted into the Employees table. 
This is because the data we inserted satisfied all the Check Constraints.
*/

SELECT * FROM Employees;


# Now, try to execute the below INSERT Statement.

INSERT INTO Employees VALUES (10, 'Anurag', 25, 1, 20000);

/*
When you try to execute the above SQL INSERT Statement, you will get the following error. 
This is because, here, we trying to INSERT an employee with the EmployeeId value 10 which does not satisfy the CHECK Constraint 
applied on the EmployeeId column.
*/

-- 	Error Code: 3819. Check constraint 'employees_chk_1' is violated.	0.125 sec


# Now, try to execute the below INSERT Statement.

INSERT INTO Employees VALUES (102, 'Anurag', 10, 105, 20000);

/*
When you try to execute the above SQL INSERT Statement, you will get the following error. 
This is because, here, we trying to INSERT an employee with the DeptID value 105 which does not satisfy the CHECK Constraint
 applied on the DeptID column
*/

--	Error Code: 3819. Check constraint 'employees_chk_2' is violated.	0.000 sec




# How to DROP a CHECK Constraint in MySQL?

ALTER TABLE Employees DROP CHECK CHK_Salary;


-- To view the complete table structure,
SHOW CREATE TABLE Employees;


-- Now, try to execute the below INSERT Statement and it should be executed as expected as we remove the CHECK Constraint applied on the Salary column.

INSERT INTO Employees VALUES (104, 'Priyanka', 25, 10, 60000);

 SELECT * FROM Employees;




# Table-level Check Constraints in MySQL
/*
It is also possible in MySQL to create the CHECK Constraint at the table level.
 When we create the check constraints at the table level, then that constraint can be referred from any column(s) within that table.
*/


-- Here, we have applied three CHECK Constraints at the table level on the PersonID, AGE, and DeptID columns.

CREATE TABLE Persons (
PersonID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Age INT NOT NULL,
DeptID INT NOT NULL,
Salary DECIMAL(18, 2),
CONSTRAINT CHK_PersonID CHECK (PersonID BETWEEN 100 AND 1000),
CONSTRAINT CHK_AGE CHECK (AGE >= 18),
CONSTRAINT CHK_DeptID CHECK (DeptID > 0 AND DeptID <100)
);

-- While imposing the Constraint at the table level, it is also possible to create the CHECK Constraints on multiple columns in MySQL


-- To see the table structure
DESCRIBE Employees;


-- To view the complete table structure,
SHOW CREATE TABLE Employees;


-- In the below CREATE TABLE statement, we applied the CHECK Constraint on the AGE and DeptID column.

CREATE TABLE Person (
PersonID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Age INT NOT NULL,
DeptID INT NOT NULL,
Salary DECIMAL (18, 2),
CONSTRAINT CHK_Age_DeptID CHECK (Age >= 18 AND DeptID > 0)
);


-- To see the table structure
DESCRIBE Person;


-- To view the complete table structure,
SHOW CREATE TABLE Person;

-----------------------------------------------------------------------------------------

-- CHECK on CREATE TABLE
-- Creates a CHECK constraint on the "Age" column when the "Persons" table is created. 
-- The CHECK constraint ensures that the age of a person must be 18, or older:

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
CHECK (Age >= 18)
);

DROP TABLE Persons;


-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, 

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
City VARCHAR(255),
CONSTRAINT CHK_Person CHECK (Age >=18 AND City = 'Sandnes')
);


-- To view the complete table structure,
SHOW CREATE TABLE Persons;




-- CHECK on ALTER TABLE

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
City VARCHAR(255)
);


-- To view the complete table structure,
SHOW CREATE TABLE Persons;


-- To create a CHECK constraint on the "Age" column when the table is already created,

ALTER TABLE Persons
ADD CHECK (Age >= 18);


-- To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns,

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age >= 18 AND City= 'Sandnes');




-- DROP a CHECK Constraint
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;


