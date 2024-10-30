# MySQL CREATE INDEX Statement
/*
The CREATE INDEX statement is used to create indexes in tables.

Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, 
they are just used to speed up searches/queries.

Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). 
So, only create indexes on columns that will be frequently searched against.
*/


# CREATE INDEX Syntax
-- Creates an index on a table. Duplicate values are allowed:
/*
CREATE INDEX index_name
ON table_name (column1, column2, ...);
*/


# CREATE UNIQUE INDEX Syntax
-- Creates a unique index on a table. Duplicate values are not allowed:
/*
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
*/


SELECT DATABASE();
SHOW TABLES;
DESC Persons;
SHOW DATABASES;
USE EmployeeDB;


# MySQL CREATE INDEX Example
-- Creates "Persons" table without INDEX

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255),
FirstName VARCHAR(255)
);


-- To see the table structure
DESCRIBE Persons;


-- To view the complete table structure,
SHOW CREATE TABLE Persons;


-- Creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:

CREATE INDEX idx_lastname
ON Persons (LastName);




-- If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);




# DROP INDEX Statement
-- The DROP INDEX statement is used to delete an index in a table.

ALTER TABLE Persons
DROP INDEX idx_lastname;


ALTER TABLE Persons
DROP INDEX idx_pname;

-----------------------------------------------------------------------------------------

-- Creating Indexes on New Table
-- If we want to define an index on a new table, we use the CREATE TABLE statement.

-- Syntax
/*
CREATE TABLE(
 column1 datatype PRIMARY KEY,
 column2 datatype,
 column3 datatype,
 ...
 INDEX(column_name)
);
*/


--  we are create a new table CUSTOMERS and adding an index to one of its columns

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR(25),
SALARY DECIMAL(18, 2),
INDEX (ID)
);


-- To see the table structure
DESCRIBE CUSTOMERS;


-- To view the complete table structure,
SHOW CREATE TABLE CUSTOMERS;




-- Creating Indexes on Existing Table
/*
To create an index on existing table, we use the following SQL statements −

With CREATE INDEX Statement
With ALTER Command
*/


-- CREATE INDEX Statement
-- Syntax
/*
CREATE INDEX index_name ON table_name;
*/


-- Let us create an index on CUSTOMERS table. We are using CREATE INDEX statement here −

CREATE INDEX NAME_INDEX ON CUSTOMERS (Name);


-- To see the table structure
DESCRIBE CUSTOMERS;

DESC CUSTOMERS;




-- ALTER... ADD Command
-- Syntax
/*
ALTER TABLE tbl_name ADD INDEX index_name (column_list);
*/


-- Example to add an index to the CUSTOMERS table −

ALTER TABLE CUSTOMERS ADD INDEX AGE_INDEX (AGE);




-- Simple and Unique Index
-- A unique index is the one which cannot be created on two rows at once. 
-- Syntax of Unique Index
/*
CREATE UNIQUE INDEX index_name ON table_name ( column1, column2,...);
*/


-- Example creates a unique index on the CUSTOMERS table 

CREATE UNIQUE INDEX unique_index ON CUSTOMERS (Name);




-- Composite Indexes
-- We can also create an index on more than one column and it is called a composite index.
-- Syntax 
/*
CREATE INDEX index_name
on table_name (column1, column2);
*/


-- Creates a composite index on the ID and Name columns of the above created table −

CREATE INDEX composite_index ON CUSTOMERS (ID, Name);



