# MySQL DEFAULT Constraint
/*
The DEFAULT constraint is used to set a default value for a column.
The default value will be added to all new records, if no other value is specified.
*/


# Default constraint using CREATE table statement in MySQL:

-- Syntax: The following is the syntax to add Default Constraint using CREATE Table statement.
/*
CREATE TABLE table_name (
column1 column1_defination DEFAULT default_value,
column2 column2_defination,
....
);
*/


# Examples to add Default Constraint using Create Table Statement:
-- Let us, first, create the Employee table

CREATE TABLE Employee (
ID INT NOT NULL,
Name VARCHAR(255) NOT NULL,
Age INT,
Country VARCHAR(255) DEFAULT 'INDIA',
DateOfJoining TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE EmployeeDB;


/*
As you can see in the above CREATE table statement, here, we created the Country and DateOfJoining columns with the Default Constraint.
 So, while inserting the data into the Employee table, if the user does not specify the values for the Country column, 
 then the default value INDIA will be inserted. Similarly, if the user does not specify the value for the DateOfJoining column,
 then the default current timestamp value will be inserted.
*/



-- To see the table structure
DESCRIBE Employee;


-- To view the complete table structure,
SHOW CREATE TABLE Employee;


# Now, execute the following INSERT Statements.

INSERT INTO Employee (ID, Name, Age) VALUES (1, 'Anurag', 30);
INSERT INTO Employee (ID, Name, Age, Country) VALUES (2, 'Sambit', 35, 'UK');
INSERT INTO Employee (ID, Name, Age, DateOfJoining) VALUES (3, 'Priyanka', 30, '2017-04-22 10:05:33');
INSERT INTO Employee (ID, Name, Age, Country, DateOfJoining) VALUES (4, 'Hina', 27, 'USA',  '2015-05-15 10:05:33');
INSERT INTO Employee (ID, Name, Age, Country, DateOfJoining) VALUES (5, 'Rohit', 28, 'INDIA', '2016-06-14 10:05:33');


/*
1.Statement1: In Statement 1, we have not specified the value for Country and DateOfJoining columns, so it will take the default values i.e. 
INDIA and Current timestamp for the Country and DateOfJoining columns.

2.Statement2: In Statement 2, we have not specified the value for the DateOfJoining column, so it will take the default Current timestamp 
value for the DateOfJoining column. In the Country column, it will store the given value i.e. UK.

3.Statement3: In Statement 3, we have not specified the value for the Country column, so it will take the default value i.e.
 INDIA for the Country column. In the DateOfJoining column, it will store the given value.
 
4.Statement4/5: In Statement 4 and 5, it will not insert the default values as we have specified the values for the Country and DateOfJoining columns.
*/


-- To view all Employee table records
SELECT * FROM Employee;




# Default constraint using ALTER table statement in MySQL:
-- The following is the syntax to add Default Constraint using ALTER Table statement.

/*
ALTER TABLE table_name
ALTER column_name SET DEFAULT default_value;
*/


# Examples to add Default Constraint using ALTER Table Statement:
-- let us, first, create the Student table without any default constraints.

CREATE TABLE Student (
ID INT NOT NULL,
Name VARCHAR(255) NOT NULL,
Age INT,
Country VARCHAR(255)
);


-- To see the table structure
DESCRIBE Student;


-- To view the complete table structure,
SHOW CREATE TABLE Student;


# Now, we need to add DEFAULT Constraint for the Country column and need to set the default value to INDIA

ALTER TABLE Student ALTER Country SET DEFAULT 'INDIA';


# Now, insert the following records.

INSERT INTO Student (ID, Name, Age, Country) VALUES (1, 'Anurag', 25, 'USA');
INSERT INTO Student (ID, Name, Age) VALUES (2, 'Hina', 24);
INSERT INTO Student (ID, Name, Age, Country) VALUES (3, 'Sambit', 25, 'India');



-- To view all Student table records
SELECT * FROM Student;




# How to DROP a DEFAULT Constraint in MySQL?
-- The following is the syntax to drop a default constraint in MySQL.

/*
ALTER TABLE table_name
ALTER column_name DROP Defauly; 
)
*/


--  if you want to delete the Default Constraint for the Country column of the Student table,

ALTER TABLE Student ALTER Country DROP DEFAULT;


/*
Note: In a MySQL table, each column must contain a value including a NULL. While inserting data into a table, 
if no value is supplied to a column, then the column gets the value set as DEFAULT.
*/

--------------------------------------------------------------------------------------

-- DEFAULT on CREATE TABLE
-- Sets a DEFAULT value for the "City" column when the "Persons" table is created:

CREATE TABLE Persons  (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
City VARCHAR(255) DEFAULT 'Sandnes'
);


-- The DEFAULT constraint can also be used to insert system values, by using functions like CURRENT_DATE():

CREATE TABLE Orders (
    ID INT NOT NULL,
    OrderNumber INT NOT NULL,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




-- DEFAULT on ALTER TABLE
-- To create a DEFAULT constraint on the "City" column when the table is already created,

ALTER TABLE Persons 
ALTER City SET DEFAULT 'Sandnes';


-- To view the complete table structure,
SHOW CREATE TABLE Persons;




-- DROP a DEFAULT Constraint

ALTER TABLE Persons
ALTER City DROP DEFAULT;



CREATE TABLE Orders (
    ID INT NOT NULL,
    OrderNumber INT NOT NULL,
    OrderDate timestamp DEFAULT CURRENT_TIMESTAMP
);


-- To check your MySQL version using:
SELECT VERSION();


-- To drop the table if it exists 
DROP TABLE IF EXISTS Orders;


-- To view current date
SELECT CURRENT_DATE;



