# MySQL FOREIGN KEY Constraint
/*
A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.
The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.
*/


# Examples to understand FOREIGN KEY Constraints in MySQL.
/*
First, create a table with the name Department by using the PRIMARY KEY constraint by executing the below CREATE Table query. 
This table is going to be the parent table or master table which contains the reference key column. Here, 
we created the reference column (Id) using the Primary Key constraint.
*/

CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Department (
ID INT PRIMARY KEY,
Name VARCHAR(50),
Location VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC Department;
SHOW DATABASES;
USE EmployeeDB;


# Now insert some master data into this table by executing the below SQL Script.

INSERT INTO Department (ID, Name, Location) VALUES (10, 'IT', 'Hyderabad');
INSERT INTO Department (ID, Name, Location) VALUES (20, 'HR', 'Delhi');
INSERT INTO Department (ID, Name, Location) VALUES (30, 'Finance', 'Mumbai');


SELECT * FROM Department;




# Now create another table with the name Employee by using the FOREIGN KEY constraint.
-- we have marked the DepartmentId column as the FOREIGN KEY which referencing the Id column of the Department table.4

CREATE TABLE Employee (
ID INT PRIMARY KEY,
Name VARCHAR(30),
Salary INT,
DepartmentId INT,
FOREIGN KEY (DepartmentId) REFERENCES Department (ID)
);


INSERT INTO Employee VALUES (101, 'Anurag', 25000, 10);
INSERT INTO Employee VALUES (102, 'Pranaya', 32000, 20);
INSERT INTO Employee VALUES (103, 'Hina', 35000, 30);

SELECT * FROM Employee;


# Here, we are passing the Department Id as 40 which actually does not exist in the Department table.

INSERT INTO Employee VALUES (104, 'Sambit', 52000, 40);


/* Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`employeedb`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`ID`))	0.438 sec
*/




# Rules to Follow while working with Foreign Key in MySQL:

/* Rule1: We cannot insert a value into the foreign key column
 if that value is not existing in the reference key column of the parent (master) table.
*/

INSERT INTO Employee VALUES (104, 'Sambit', 52000, 40);

-- When we try to execute the above INSERT Statement, you will get the following error.

/*Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails
 (`employeedb`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`ID`))	0.406 sec
*/




/*
Rule2: We cannot update the reference key value of a parent table if that the value has a corresponding child record in 
the child table without addressing what to do with the child records.
*/

UPDATE DEPARTMENT SET Id = 100 WHERE Id =10;

/*
As we have a child record with department id 10 in the Employee table, so, 
trying to update the same in the Department table will give you the following error
*/

/*
	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
    (`employeedb`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`ID`))	0.031 sec
*/




/*
Rule3: We cannot delete a record from the parent table provided that the records reference key value has a child record in 
the child table without addressing what to do with the child record.
*/

DELETE FROM Department WHERE Id = 10;

/*
As we have a child record with department id 10 in the Employee table, so, trying to delete the same in the Department table
will give you the following error
*/

/*	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
 (`employeedb`.`employee`, CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`ID`))	0.203 sec
 */
 
 
 
 
 # How to add Foreign Key Constraints to Existing Table?
-- let us first, create a table without Foreign Key 

CREATE TABLE Employee1
(
ID INT PRIMARY KEY,
Name VARCHAR(30),
Salary INT,
DepartmentId INT
);


/* Now, once the table is created, we want to add a Foreign Key on the DepartmentId column which should refer to 
the Id column of the Department table. You can do the same by using the ALTER TABLE statement as shown in the below example.
*/

ALTER TABLE Employee1 ADD FOREIGN KEY ( DepartmentId ) REFERENCES Department ( ID );

-- To see the table structure
DESCRIBE Employee1;




# How to Delete a Foreign Key Constraints in MySQL?
-- MySQL allows the ALTER TABLE statement to remove an existing foreign key from the table. 

-- Syntax
ALTER TABLE table_name DROP FOREIGN KEY fk_constraint_name;


-- Now, to delete this foreign key constraint from the Employee1 table
ALTER TABLE Employee1 DROP FOREIGN KEY employee1_ibfk_1;


-- To view the complete table structure,
SHOW CREATE TABLE Employee1;
/* 
It reveals the table's structure, including columns, data types, indexes, constraints
 (such as primary keys, foreign keys, and unique constraints), and other table options like engine type or default character set.
*/




/*
What is the difference between Primary Key and Foreign Key Constraint in MySQL?

Primary Key in MySQL:
The Primary Key Constraint in MySQL is uniquely identifying a record in a table.
Primary Key constraint neither accepts null values nor duplicate values on the column on which it is applied.
We can create only one Primary Key on a table in MySQL and that primary key constraint can be created either on a single column or multiple columns.


Foreign Key in MySQL:
The Foreign Key in MySQL is a field in a table that is a unique key (either primary or unique key) in another table.
A Foreign Key can accept both null values and duplicate values.
We can create more than one Foreign key on a table in MySQL.
*/

--------------------------------------------------------------------------------------------

-- PRIMARY KEY on CREATE TABLE

CREATE TABLE Persons (
PersonID INT PRIMARY KEY,
LastName VARCHAR(30),
FirstName VARCHAR(30),
Age INT
);


-- To see the table structure
DESCRIBE Persons;


-- To view the complete table structure,
SHOW CREATE TABLE Persons;




-- FOREIGN KEY on CREATE TABLE
-- Creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

CREATE TABLE Orders (
OrderID INT NOT NULL,
OrderNumber INT NOT NULL,
PersonID INT,
PRIMARY KEY (OrderID),
FOREIGN KEY (PersonID) REFERENCES Persons (PersonID)
);


-- To see the table structure
DESCRIBE Orders;


-- To view the complete table structure,
SHOW CREATE TABLE Orders;


-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns,

CREATE TABLE Orders (
OrderID INT NOT NULL,
OrderNumber INT NOT NULL,
PersonID INT,
PRIMARY KEY (OrderID),
CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons (PersonID)
);


-- To view the complete table structure,
SHOW CREATE TABLE Orders;


-- FOREIGN KEY on ALTER TABLE
-- To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created,

ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons (PersonID);


-- To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns,

ALTER TABLE Orders ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons (PersonID);


-- DROP a FOREIGN KEY Constraint
ALTER TABLE Orders DROP FOREIGN KEY FK_PersonOrder;


-- To view the complete table structure,
SHOW CREATE TABLE Orders;



