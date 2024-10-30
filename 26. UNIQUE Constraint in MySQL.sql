# MySQL UNIQUE Constraint
/*
The UNIQUE constraint ensures that all values in a column are different.
Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
A PRIMARY KEY constraint automatically has a UNIQUE constraint.
However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.
*/


# Example to understand MySQL UNIQUE Constraint:
-- Here, we applied the UNIQUE constraint to Id, and Email columns. It means these two columns will not accept the duplicate value.

CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Employee (
Id INT UNIQUE,
Name VARCHAR(50) NOT NULL,
Email VARCHAR(50) UNIQUE,
Department VARCHAR(50) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;


# Let us verify the Employee table structure by executing the below SQL Statement.

DESCRIBE Employee;

-- As we have applied the UNIQUE constraint to the Id and Email column, 
-- so here you can see the key column of these two fields have UNI value which indicates these two columns are the UNIQUE column


# Now try to execute the below SQL Insert statements.
INSERT INTO Employee (Id, Name, Email, Department) VALUES (1, 'Anurag', 'Anurag@dotnettutorials.net', 'IT');


-- Now, try to execute the below SQL Statement.
INSERT INTO Employee (Id, Name, Email, Department) VALUES (1, 'Sambit', 'Sambit@dotnettutorials.net', 'IT');

/*
When we try to execute the above INSERT SQL statement, we will get the following error. 
This is because we are trying to insert duplicate Id values into the Id column
*/

-- Error Code: 1062. Duplicate entry '1' for key 'employee.Id'	0.547 sec


-- Now, try to execute the below SQL Statement.
INSERT INTO Employee (Id, Name, Email, Department) VALUES (2, 'Sambit', 'Anurag@dotnettutorials.net', 'IT');

/*
Now, when you try to execute the above INSERT SQL statement, you should get the following error. 
This is because now we are trying to insert duplicate Email values into the Email column.
*/

--	Error Code: 1062. Duplicate entry 'Anurag@dotnettutorials.net' for key 'employee.Email'	0.063 sec


-- Now, execute the below INSERT Statement.
INSERT INTO Employee (Id, Name, Email, Department) VALUES (NULL, 'Sambit', NULL, 'IT');

-- The above SQL statement will be executed successfully. This is because the UNIQUE Constraint allows null value.

-- To display all the records
SELECT * FROM EMPLOYEE;




# How to add UNIQUE Constraints to existing Columns in MySQL?
-- Let us understand this with an example. First, delete all the data from the Employee table by executing the below TRUNCATE statement.

TRUNCATE TABLE Employee;

/*

The TRUNCATE TABLE statement is used to remove all rows from a table in SQL, resetting any auto-increment counters for columns if applicable.
 Unlike DELETE, it cannot be rolled back in most databases as it does not log individual row deletions.
*/


-- To display the table structure.
DESCRIBE Employee;


# In our Employee table, suppose we want to add UNIQUE Constraint on the Name column.
ALTER TABLE Employee ADD UNIQUE (Name);




# How to DELETE UNIQUE Constraints in MySQL?
-- The following SQL Statement will delete the UNIQUE Constraint from the Name column.

ALTER TABLE Employee DROP INDEX Name;




# Imposing UNIQUE Constraint at Column Level:
-- In the below Create Table statement, we have specified UNIQUE Constraints directly at the column level for the Id and Email Columns.

CREATE TABLE Student (
Id INT UNIQUE,
Name VARCHAR(50),
Email VARCHAR(10) UNIQUE
);




# Imposing UNIQUE Constraint at Table Level:

/*
 In the below Create Table statement, first, we created all the three columns and then we created UNIQUE constraints and 
 while creating UNIQUE constraint we specified the column name to which the constraint belongs.
*/

CREATE TABLE StudentAddress (
Id INT,
Name VARCHAR(50),
Email VARCHAR(10),
UNIQUE (Id),
UNIQUE (Email)
);


/*
Note: There is no difference in behavior whether we imposed the UNIQUE Constraint at the table level or at the column level but 
if we constraint the imposed at the table level, then we have the chance to impose the composite UNIQUE constraints.
*/




# Creating UNIQUE Constraint with Custom name in MySQL:

/*
 Please execute the below SQL Script which will create the StudentDetails table. 
 If you further notice, here we created two unique constraints by giving our own names such as ID_ Unique and Email_Unique.
*/

CREATE TABLE StudentDetails (
Id INT,
Name VARCHAR(30),
Email VARCHAR(100),
CONSTRAINT ID_Unique UNIQUE(Id),
CONSTRAINT Email_Unique UNIQUE(Email)
);




# Composite UNIQUE Constraint in MySQL:
/*
It is also possible in MySQL to apply a single UNIQUE Constraint on multiple columns. 
In this case, duplicate values are allowed on a single column, but the combination of duplicate values is not allowed.
*/


CREATE TABLE Customer (
Id INT,
Name VARCHAR(30),
Email VARCHAR(50),
UNIQUE KEY Unique_Name_Email (Name, Email)
);

-- Here, we have created one UNIQUE Constraint with the name Unique_Name_Email which is applied to the Name and Email Column of the Customer table.


# Now, execute the below INSERT SQL Statements.

INSERT INTO Customer (Id, Name, Email) VALUES (1, 'Sambit', 'Sambit@dotnettutorials.net'); 
INSERT INTO Customer (Id, Name, Email) VALUES (2, 'Sambit', 'Sambit1@dotnettutorials.net'); 
INSERT INTO Customer (Id, Name, Email) VALUES (3, 'Sambit1', 'Sambit1@dotnettutorials.net');


SELECT * FROM Customer;

/*
Once you execute the above SQL Query, three records are inserted into the Customer table. 
Here, if you notice. In the second and third SQL Statements, we have some duplicate values. 
In Statement2, the Name is duplicate and in Statement3, the Email is duplicate. 
But all these records are inserted, this is because the combination of Name and Email is not duplicated.
*/


# Now, try to execute the below SQL Statement.
INSERT INTO Customer (Id, Name, Email) VALUES (4, 'Sambit', 'Sambit@dotnettutorials.net'); 

/*
When you try to execute the above SQL Query, you will get the following error. 
This is because the combination of the above Name and Email is already existing in the database.
*/

--	Error Code: 1062. Duplicate entry 'Sambit-Sambit@dotnettutorials.net' for key 'customer.Unique_Name_Email'	0.031 sec

---------------------------------------------------------------------------------------------------

-- UNIQUE Constraint on CREATE TABLE
-- Creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
ID INT NOT NULL,
LastName  VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
UNIQUE (ID)
);


-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
CONSTRAINT UC_Persons UNIQUE (ID, LastName)
);

DROP TABLE Persons;




-- UNIQUE Constraint on ALTER TABLE
-- To create a UNIQUE constraint on the "ID" column when the table is already created

ALTER TABLE Persons ADD UNIQUE(ID);


-- To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns

ALTER TABLE Persons ADD CONSTRAINT UC_Persons UNIQUE (ID, LastName);




-- DROP a UNIQUE Constraint
-- To drop a UNIQUE constraint

ALTER TABLE Persons
DROP INDEX UC_Persons;


