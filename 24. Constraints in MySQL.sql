# MySQL Constraints
-- SQL constraints are used to specify rules for data in a table.

# Create Constraints
-- Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

-- Syntax
/*
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);
*/

-- Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.

/*
The following constraints are commonly used in SQL:

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly
*/

# What is Data Integrity in MySQL?
-- Data integrity means the data contained in the database is accurate, consistent, and reliable. 

# What are Constraints in MySQL?
/*
The MySQL Constraints define specific rules to the column(s) data in a database table. 
While inserting, updating, or deleting the data rows, if the rules of the constraint are not followed, 
the system will display an error message and the action will be terminated. 
The SQL Constraints are defined while creating a new table. We can also alter the table and add new SQL Constraints. 
The MySQL Constraints are mainly used to maintain data integrity.
*/

# Why do we need Constraints?
/*
The Constraints in MySQL are basically used to restrict the insertion of unwanted data in the database.
That means they are mainly used to maintain data integrity. We can create the constraint on single or multiple columns of a table in MySQL
*/

# Understanding NULL in MySQL:
-- NULL represents the absence of data or value in a column of a table in MySQL. It’s neither ZERO nor EMPTY. 

Create database StudentDB;
Use StudentDB;


CREATE TABLE Student (
  StudentId INT NOT NULL,
  FullName VARCHAR(50) NULL,
  RegdNo INT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Student;


INSERT INTO Student(StudentId, FullName, RegdNo) VALUES(1, 'Anurag', '1001');
INSERT INTO Student(StudentId, FullName, RegdNo) VALUES(2, '', '1001');
INSERT INTO Student(StudentId, FullName, RegdNo) VALUES(3, 'Samnit', 0);
INSERT INTO Student(StudentId, FullName, RegdNo) VALUES(4, '', 0);


SELECT * FROM Student;
SELECT COUNT(*) FROM Student;


/*
As you can see in the above result set, for StudentId 2, FullName is empty and for StudentId 3, the RegdNo column Value is 0.
Further, for StudentId 4, the FullName is Empty as well as the RegdNo is 0. Here, zero (0) and 
empty do not represent NULL, you need to consider them as values.
*/

/*
Whenever you don’t have any value, then you have to put it as Null. 
For example, let say we have one student whose RerdNo is not yet generated and 
supposed to come in later. Then, in that case, we can put a NULL in the RegdNo column.
Please execute the below SQL Query which will insert one student with Null RegdNo.
*/

INSERT INTO Student (StudentId, FullName, RegdNo) VAlUES (5, 'Hina', NULL);

SELECT * FROM Student;


# Imposing Constraint in MySQL:
/*
We can impose constraints on a table in two different ways

1. Imposing constraints on Column level
2. Imposing constraints on Table level

In the first case, we need to provide the constraint information next to the column name whereas
in the second case we first define all the columns, and then we need to define the constraints for the columns.

-- Note: We cannot impose a NOT NULL constraint on table level. It is possible only for the rest of the four constraints.
*/


# Imposing MySQL Constraint at Column Level:
-- Let us understand this with an example. As you can see in the following Create Table statement, 
-- we have specified Primary Key, NOT NULL, and UNIQUE Constraints directly at the column level.

CREATE TABLE Employee
(
Id INT PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
EmailId VARCHAR(100) UNIQUE
);


DESC Employee;


# Imposing MySQL Constraint at Table Level:
-- Let us understand how to impose constraint at table level with an example. As you can see in the following Create Table statement,
-- first, we created all the columns and then we created constraints and 
-- while creating the constraint we need to specify the column name to which the constraint belongs.

CREATE TABLE Customer
(
Id INT,
Name VARCHAR(30),
EmailId VARCHAR(100),
PRIMARY KEY(Id),
UNIQUE(EmailId)
);


DESC Customer;

-- Note: There is no difference in behavior whether we imposed the constraint at the table level or at the column level 
-- but if a constraint is imposed at the table level, then we have the advantage of imposing composite constraints. 


# Creating Constraint with user-defined name in MySQL:
/*
In order to understand this, please execute the below SQL Script which will create the Employee table. 
If you further notice, here we created two unique constraints by giving our own names such as ID_ Unique and Email_Unique.
*/

CREATE TABLE Employee
(
Id INT,
Name VARCHAR(30),
Email VARCHAR(100),
CONSTRAINT ID_Unique UNIQUE(Id),
CONSTRAINT Email_Unique UNIQUE(Email)
);


DESC Employee;


# What are Composite Constraints in SQL Server?
-- It is possible in MySQL to create a constraint-based on multiple columns and when we do so, it is called Composite Constraints

/*
As you can see in the following Create table statement, we have imposed the Name_Email_Unique unique constraint at the table level and
here we specified the Name and Email column. That means this Name_Email_Unique constraint is a composite constraint as 
it is created based on two columns (Name and Email).
*/

CREATE TABLE EmployeeAddress
(
Id INT,
Name VARCHAR(50),
Email VARCHAR(100),
CONSTRAINT Name_Email_Unique UNIQUE(Name, Email)
);


DESC EmployeeAddress;

-----------------------------------------------------------------------------------------

# MySQL Constraints
/*
The MySQL constraints can be used to set certain rules to the column(s) in a table. 
These constraints can restrict the type of data that can be inserted or updated in a particular column. 
This helps you to maintain the data accuracy and reliability in a table.
/*
/*
There are two types of MySQL constraints.

Column level constraints: These type of constraints will only apply to a column in a table.
Table level constraints: These constraints will apply to the complete table.
The commonly used constraints in MySQL are NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT, CREATE INDEX, AUTO_INCREMENT, etc.
*/

 -- Syntax
-- Following is the basic syntax to add a constraint for the column(s) in a table −

/*
CREATE TABLE table_name (  
   Column_name1 datatype constraint,  
   Column_name2 datatype constraint,  
   Column_name3 datatype constraint,  
   .........  
)
/*




-- MySQL NOT NULL Constraint
/*
By default, a column in a MySQL table can contain NULL values. 
In some scenarios, we may want a particular column to not accept or contain NULL values. 
To do so, we can use the MySQL NOT NULL constraint.

This constraint enforces a specific field to always contain a value, 
which means that we cannot insert or update a record without adding a value to this field.
*/


-- we are adding the NOT NULL constraint on the ID and NAME columns of the CUSTOMERS table.
-- As a result, the ID and NAME columns will not accept NULL values at the time of record insertion.

SELECT DATABASE();
SHOW TABLES;
DESC Student;
SHOW DATABASES;
Use StudentDB;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT
);

-- Let's try inserting records into this table.
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Nikhil', 18); 


-- To see all inserted records in a table.
SELECT * FROM CUSTOMERS;


-- But, if we try to insert records with NULL values as ID as −
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (NULL, 'Varun', 26);

-- An error will be generated saying "Column 'ID' cannot be null".
-- Error Code: 1048. Column 'ID' cannot be null	0.171 sec


-- In the same way if we try to pass NULLs as values to the NAME column, similar error will be generated.
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (3, NULL, 19);

-- This will generate the following error −
-- Error Code: 1048. Column 'NAME' cannot be null	0.000 sec




-- MySQL UNIQUE Constraint
/*
The UNIQUE constraint in MySQL ensures that every value in a column must be distinct. 
This means the column with the UNIQUE constraint cannot have the same value repeated; each value must be unique.

Note: We can have one or more UNIQUE constraints on a single table.
*/


-- Creates a UNIQUE constraint on the ID column of the CUSTOMERS table −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
UNIQUE (ID)
);


DESC CUSTOMERS;


-- Now, let us insert the following records into the above-created table −
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Nikhil', 18);
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Varun', 26);

/* The second insert statement returned an error saying "Duplicate entry '1' for key 'customers.ID"
 because the ID value we are inserting already exists in the table. Therefore, 
 it is a duplicate and the query generates the following error −
 */
 --	Error Code: 1062. Duplicate entry '1' for key 'customers.ID'	0.422 sec
 
 
 
 
 -- MySQL PRIMARY KEY Constraint
/*
The PRIMARY KEY constraint in MySQL is used to uniquely identify each record in a table. 
This means that, if we define primary key on a particular column in a table, 
it must contain UNIQUE values, and cannot contain NULL values.

Note: We can have only a single primary key on a table.
*/


-- Creates a PRIMARY KEY on the ID column of the CUSTOMERS table −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS(
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
PRIMARY  KEY (ID)
);


DESC CUSTOMERS;


-- Insert the following record into the above-created table −
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Nikhil', 18);


-- Since we added the PRIMARY KEY constraint on the ID column, if you try to insert a record with duplicate ID value or NULL value, 
-- it will generate an error.
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Varun', 26);
-- Error Code: 1062. Duplicate entry '1' for key 'customers.PRIMARY'	0.031 sec


INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (NULL, 'Datta', 19);
-- Error Code: 1048. Column 'ID' cannot be null	0.000 sec


/*
As we can see in the above queries, the first insert statement is successfully inserted into the table.
 Whereas the second and third statements returned an error because they contain a duplicate and 
 a NULL value in the primary key column i.e. (ID).
*/




-- MySQL FOREIGN KEY Constraint
/*
The FOREIGN KEY constraint in MySQL is used to link a field or collection of fields in one table to the primary key of another table.
A table with the foreign key is called a child table and the table with the primary key is called the parent table or referenced table.
*/


-- Creates a FOREIGN KEY on the CUST_ID column when the ORDERS table is created −
-- Table: Customers
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
CUST_ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
PRIMARY KEY (CUST_ID)
);


DESC CUSTOMERS;


-- Table: Orders
CREATE TABLE ORDERS(
ORDER_ID INT NOT NULL,
ORDER_NUMBER INT NOT NULL,
CUST_ID INT,
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMERS (CUST_ID)
);


DESC ORDERS;




-- MySQL CHECK Constraint
/*
The CHECK constraint in MySQL restricts the range of values that can be inserted into a column. 
This constraint ensures that the inserted value in a column must be satisfied with the provided condition.
*/


-- Creates a CHECK constraint on the AGE column of the CUSTOMERS table, where it ensures that the age of the student must be 18 or older −
DROP TABLE CUSTOMERS;
DROP TABLE ORDERS;	-- Delete first child table then parent table


CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
CHECK (AGE >= 18)
);


DESC CUSTOMERS;


-- We can insert the records into the above created table as shown below −
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Nikhil', 18);

INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (3, 'Datta', 19);


/*
Since we added the CHECK constraint on the AGE column such that the age of the CUSTOMERS should be equal or greater than 18.
 If you try to insert a record with age value less than 18, an error will be generated.
*/

INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (2, 'Varun', 16);
-- Error Code: 3819. Check constraint 'customers_chk_1' is violated.	0.078 sec


INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (4,'Karthik', 15);
-- Error Code: 3819. Check constraint 'customers_chk_1' is violated.	0.000 sec


-- Creates a CHECK constraint on multiple columns (AGE and ADDRESS) −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
ADDRESS VARCHAR(40),
CONSTRAINT CHECK_AGE CHECK (AGE>=18 AND ADDRESS = 'Mumbai')
);


DESC CUSTOMERS;


-- Now, let us insert the following records into the above-created table −
INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS) VALUES (1, 'Nikhil', 18, 'Mumbai');

INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS) VALUES (3, 'Datta', 19, 'Delhi');
-- Error Code: 3819. Check constraint 'CHECK_AGE' is violated.	0.000 sec

/*
The second insert statement returned an error because it is violating the condition of the check constraint i.e. (AGE >= 18 AND ADDRESS = "Mumbai").
*/




-- MySQL DEFAULT Constraint
/*
The DEFAULT constraint in MySQL is used to assign a default value to a specific column in a table. 
This default value gets applied to any new records in the DEFAULT specified column when no other value is provided during insertion.
*/


-- we are defining the DEFAULT constraint on the ADDRESS column of the CUSTOMERS table. 
-- We assigned "Mumbai" as default value when no value is inserted. −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
ADDRESS VARCHAR(40) DEFAULT 'Mumbai' -- For Default constraint String literals should be enclosed in single quotes (' '), not double quotes (" "
);

-- Here, we are inserting the first two records without any value in the ADDRESS column. 
-- In the third record, we are inserting the ADDRESS value as 'Delhi'.
INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (1, 'Nikhil', 18);

INSERT INTO CUSTOMERS (ID, NAME, AGE) VALUES (2, 'Varun', 16);

INSERT INTO CUSTOMERS (ID, NAME, AGE, ADDRESS) VALUES (3, 'Datta', 19, "Delhi");

-- Exeucte the following query to display the records inserted in the above-created table −
SELECT * FROM CUSTOMERS;




-- MySQL CREATE INDEX Constraint
/*
The CREATE INDEX constraint in MySQL is used to create indexes for one more columns in a table.
The indexes are used to fetch the data from the database much quicker.
 However, the users cannot see the indexes in action, instead, they are just used to speed up the searches and queries.
*/


-- Creating a table named CUSTOMERS using the query below −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT,
ADDRESS VARCHAR(40),
PRIMARY KEY (ID)
);


-- Ccreates an index named "index_address" on the ADDRESS column of the CUSTOMERS table −
CREATE INDEX index_address ON CUSTOMERS (ADDRESS);




-- MySQL AUTO_INCREMENT Constraint
/*
When a AUTO_INCREMENT constraint is defined on a particular column of a table, 
it will automatically generate a unique number when a new record is inserted into that column.
By default, the starting value is 1, and it will automatically increment its value by 1 for each new record.
*/


-- Adds an AUTO_INCREMENT constraint on the ID column of the CUSTOMERS table −
DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR(20) NOT NULL,
AGE INT,
PRIMARY KEY (ID)
);


-- In the insert statements below, we are not inserting ID values.
INSERT INTO CUSTOMERS (NAME, AGE) VALUES ('Nikhil', 18);
INSERT INTO CUSTOMERS (NAME, AGE) VALUES ('Varun', 16);
INSERT INTO CUSTOMERS (NAME, AGE) VALUES ('Datta', 19);


-- To display the records of the above-created table −
SELECT * FROM CUSTOMERS;


