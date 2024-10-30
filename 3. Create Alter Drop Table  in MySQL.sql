# How to Create Alter and Drop Database table in MySQL?
-- I created one database called mytestdb by executing the following SQL Script.

CREATE DATABASE mytestdb;
USE  mytestdb;


# Creating Table using SQL Script in MySQL Workbench:

CREATE TABLE mytestdb.studentaddress (
  StudentIdAddress INT PRIMARY KEY,
  StudentId INT NOT NULL,
  AddressLine1 VARCHAR(200),
  AddressLine2 VARCHAR(200),
  MobileNo INT 
);


SHOW TABLES;
DESC studentaddress;


CREATE TABLE mytestdb.students (
StudentId INT NOT NULL AUTO_INCREMENT,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Class VARCHAR(20) NOT NULL,
PRIMARY KEY(StudentId),
UNIQUE INDEX StudentId_UNIQUE (StudentId ASC) VISIBLE);


SHOW TABLES;
DESC students;
DESC studentaddress;
SELECT DATABASE();


# How to Drop a table in MySQL Server using MySQL Workbench?
DROP TABLE mytestdb.students;
DROP TABLE mytestdb.studentaddress;


CREATE DATABASE school;
USE school;
SELECT DATABASE();


-- Creating Table using SQL Script in MySQL
CREATE TABLE Students (
StudentId INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Class VARCHAR(50),
Age INT
);


-- INSERT rows/records in table
INSERT INTO students (StudentId, FirstName, LastName, Class, Age) 
VALUES (1, 'Anurag', 'Mohanty', 'First', 18);
INSERT INTO students (StudentId, FirstName, LastName, Class, Age) 
VALUES (2, 'Priyanka', 'Dewangan', 'Second', 17);
INSERT INTO students (StudentId, FirstName, LastName, Class, Age) 
VALUES (3, 'Hina', 'Sharma', 'First', 19);
INSERT INTO students (StudentId, FirstName, LastName, Class, Age) 
VALUES (4, 'Sambit', 'Monanty', 'Second', 17);


-- Creating Table using SQL Script in MySQL
CREATE TABLE `school`.`studentaddress` (
  AddressId INT PRIMARY KEY,
  StudentId INT NOT NULL,
  City VARCHAR(200),
  State VARCHAR(200)
);


-- INSERT rows/records in table
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State) 
VALUES (1, 1, 'BBSR', 'Odisha');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State)
VALUES (2, 2, 'Mumbai', 'Maharashtra');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State) 
VALUES (3, 3, 'BBSR', 'Odisha');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State)
VALUES (4, 4, 'Mumbai', 'Maharashtra');


SELECT * FROM students;
SELECT * FROM studentaddress;

--------------------------------------------------------------------------------

-- The CREATE TABLE statement is used to create a new table in a database.
-- The DROP TABLE statement is used to drop an existing table in a database.
-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.


 -- Creating Table using SQL Script in MySQL
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);


SHOW TABLES;
DESC Persons;


INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) VALUES
(1, 'Hansen', 'Ola', 'Timoteivn 10', 'Sandnes'),
(2, 'Svendson', 'Tove', 'Borgvn 23', 'Sandnes'),
(3, 'Pettersen', 'Kari', 'Storgt 20', 'Stavanger');	


SELECT * FROM Persons;


# ALTER TABLE - ADD Column
-- Syntax
/*
ALTER TABLE table_name
 ADD column_name datatype;
 */

ALTER TABLE Persons
ADD COLUMN Email varchar(255);


DESC Persons;


# ALTER TABLE - DROP COLUMN
-- Syntax
/*
ALTER TABLE table_name
DROP COLUMN column_name;
*/

ALTER TABLE Persons
DROP COLUMN Email;


DESC Persons;


# ALTER TABLE - MODIFY COLUMN
-- To change the data type of a column in a table

-- Syntax
/*
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
*/


ALTER TABLE Persons
ADD DateOfBirth date;


DESC Persons;


# Change Data Type of the column named "DateOfBirth"

ALTER TABLE Persons
MODIFY COLUMN DateOfBirth year;


DESC Persons;


# DROP COLUMN
ALTER TABLE Persons
DROP COLUMN DateOfBirth;

DESC Persons;










