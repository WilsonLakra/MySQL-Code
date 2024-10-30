# MySQL PRIMARY KEY Constraint
/* The PRIMARY KEY constraint uniquely identifies each record in a table.
Primary keys must contain UNIQUE values, and cannot contain NULL values.
A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).
*/


# Understanding the Primary Key Constraint in MySQL:
-- In MySQL, a table can have only one primary. Let us prove this.
-- Please try to execute the below SQL Script where we used the Primary key on more than one column (Id and Email).

CREATE TABLE Employee (
Id INT PRIMARY KEY,
Name VARCHAR(500),
Email VARCHAR(50) PRIMARY KEY,
Department VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE EmployeeDB;


/*
When you try to execute the above Create Table SQL query, you will get the following error. 
The error message clearly tells us that we are trying to create multiple primary keys which are not possible.
*/

-- 	Error Code: 1068. Multiple primary key defined	0.062 sec


# To overcome the above error, remove one primary key and execute the CREATE TABLE SQL statement

CREATE TABLE Employee (
Id INT PRIMARY KEY,
Name VARCHAR(500),
Email VARCHAR(50),
Department VARCHAR(50)
);


# Here, we marked the Id column as the primary key. let us verify the Employee table structure by executing the below SQL Statement.

DESCRIBE Employee;


#  Insert statement to insert a record into the Employee table

INSERT INTO Employee (Id, Name, Email, Department) VALUES (1, 'Sambit', 'Sambit@dotnettutorials.net','IT');

SELECT * FROM Employee;




# Adding Duplicate value in the Primary Key Column:
--  In our Employee table, one record exists with the Id 1. Now. Let us try to insert another employee with the same ID 1.

INSERT INTO Employee (Id, Name, Email, Department) VALUES (1, 'Anurag', 'Anurag@dotnettutorials.net','IT');

-- When we try to execute the above SQL statement, it gives us the below error. 
-- That means the Primary Key constraint will not accept duplicate values in it.

-- Error Code: 1062. Duplicate entry '1' for key 'employee.PRIMARY'	0.062 sec




# Inserting NULL in Primary Key Column in MySQL:
-- Let us try to insert a NULL value into the primary key column i.e. Id column 
INSERT INTO Employee (Id, Name, Email, Department) VALUES (NULL, 'Anurag', 'Anurag@dotnettutorials.net','IT');

/*
When we try to execute the above Insert SQL statement, it gives us the following error which clearly states that 
the Id value cannot be the null value which proves that Primary Key will not accept NULL.
*/

--	Error Code: 1048. Column 'Id' cannot be null	0.000 sec

-- Note: So, the Primary key neither accepts NULL Values or Duplicate Values in MySQL.




# Imposing PRIMARY KEY Constraint at Column Level:
--  Create Table statement, we have specified PRIMARY KEY Constraints directly at the column level for the Id Column.

CREATE TABLE Student (
Id INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(10)
);


-- To see the table structure
DESCRIBE Student;




# Imposing PRIMARY KEY Constraint at Table Level:
-- Create Table statement, first, we created all the three columns and then we created the PRIMARY KEY constraints 
-- and while creating the PRIMARY KEY constraint we specified the column name to which the constraint belongs.

CREATE TABLE StudentAddress (
Id INT,
Name VARCHAR(50),
Email VARCHAR(10),
PRIMARY KEY (Id)
);


/*
Note: There is no difference in behavior whether we imposed the PRIMARY KEY Constraint at the table level or at the column level but
 if we imposed the Constraint at the table level, then we have the chance to impose the composite PRIMARY KEY constraints. 
*/




# Creating PRIMARY KEY Constraint with Custom name in MySQL:
-- Here we create the StudentDetails table and created the PRIMARY KEY constraints by giving our own names such as ID_PRIMARY.

CREATE TABLE StudentDetails (
Id INT,
Name VARCHAR(30),
Email VARCHAR(100),
CONSTRAINT ID_PRIMARY PRIMARY KEY (Id)
);


-- To see the table structure
DESCRIBE StudentDetails;




# What is the Composite Primary key in MySQL?
/*
It is also possible in MySQL to create the Primary Key constraint on more than one column and when we do so,
 it is called a Composite Primary Key. It is only possible to impose the Composite Primary Key at the table level, 
 it is not possible at the column level. In a composite primary key in MySQL, 
 each column can accept duplicate values but the combination should not be duplicated.
*/


# Examples to Understand MySQL Composite Primary Key:
/*
Here, we impose the Primary Key Constraint at the table level i.e. after all the columns are created. 
While creating the primary key we are providing two columns i.e. Name and Email. 
As the Primary Key is created based on more than one column, it is termed as a composite primary key.
*/


CREATE TABLE EmployeeDetails (
Id INT,
Name VARCHAR(50),
Email VARCHAR(50),
PRIMARY KEY (Name, Email)
);


-- To see the table structure
DESCRIBE EmployeeDetails;


# Now, execute the below INSERT SQL Statements.

INSERT INTO EmployeeDetails (Id, Name, Email) VALUES (1, 'Sambit', 'Sambit@dotnettutorials.net');

INSERT INTO EmployeeDetails (Id, Name, Email) VALUES (2, 'Sambit', 'Sambit1@dotnettutorials.net'); 

INSERT INTO EmployeeDetails (Id, Name, Email) VALUES (3, 'Sambit1', 'Sambit1@dotnettutorials.net'); 

/*
Once you execute the above SQL Statements, three records are inserted into the EmployeeDetails table. 
Here, if you notice. In the second and third SQL Statements, we have some duplicate values. In Statement2, 
the Name is duplicate and in Statement3, the Email is duplicate. But all these records are inserted, 
this is because the combination of Name and Email is not duplicated.
*/

SELECT * from EmployeeDetails;

-- Now, try to execute the below SQL Statement.

INSERT INTO EmployeeDetails (Id, Name, Email) VALUES (4, 'Sambit', 'Sambit@dotnettutorials.net');

/* When we try to execute the above INSERT Statement, we will get the below error. 
This is because the combination of the above Name and Email is already existing in the database.
*/

-- Error Code: 1062. Duplicate entry 'Sambit-Sambit@dotnettutorials.net' for key 'employeedetails.PRIMARY'	0.015 sec




# How to add PRIMARY KEY Constraints to the existing table in MySQL?
/*
It is also possible to add PRIMARY KEY Constraints to the existing table in MySQL But the condition is, 
on the column(s) on which we are going to apply the Primary Key Constraint should not contain any NULL or 
Duplicate Values else it will not allow you to create the Primary Key Constraint.
*/

-- First, create the table without using the Primary Key Constraint.

CREATE TABLE Test (
Id INT,
Name VARCHAR(30),
Email VARCHAR(100)
);


-- Once you created the Test table, now we want to apply the Primary Key Constraint on the Id column
ALTER TABLE Test ADD PRIMARY KEY (Id);


-- To see the table structure
DESCRIBE Test;




# How to DELETE PRIMARY Constraints in MySQL?
-- Delete the PRIMARY Constraint from the Id column of the Test table.

ALTER TABLE Test DROP PRIMARY KEY;


-- To see the table structure
DESCRIBE Test;




# When do we need to choose Primary Key?
/*
When we need the following features on a column, then we need to make that column Primary Key in MySQL

NULLs should not be allowed.
It should be unique
It should not be modified.
*/

-------------------------------------------------------------------------------------------

-- PRIMARY KEY on CREATE TABLE
--  Creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
PRIMARY KEY (ID)
);


-- To see the table structure
DESCRIBE Persons;


-- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
CONSTRAINT PK_Persons PRIMARY KEY(ID, LastName)
);


-- To see the table structure
DESCRIBE Persons;


/*
 Note: In the example above there is only ONE PRIMARY KEY (PK_Person).
 However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).
*/




-- PRIMARY KEY on ALTER TABLE
-- To create a PRIMARY KEY constraint on the "ID" column when the table is already created,

ALTER TABLE Persons ADD PRIMARY KEY (ID);


-- To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns,

ALTER TABLE Persons 
ADD CONSTRAINT PK_Persons PRIMARY KEY (ID, LastName);


/*
Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been 
declared to not contain NULL values (when the table was first created).
*/




-- DROP a PRIMARY KEY Constraint
ALTER TABLE Persons DROP PRIMARY KEY;

