# Insert, Update, Delete Data Rows in MySQL Database table 

SHOW DATABASES;
SELECT DATABASE();
USE school;
SHOW TABLES;
DROP TABLE School.Students;


CREATE DATABASE School;
USE School;


-- Creating Table using SQL Script in MySQL
CREATE TABLE School.Students(
  StudentId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Class VARCHAR(50),
  Age INT
);


DESC Students;


-- How to Insert Data Rows to MySQL Database table
INSERT INTO school.students (StudentId, FirstName, LastName, Class, Age) 
VALUES (1, 'Anurag', 'Mohanty', 'First', 18);
INSERT INTO school.students (StudentId, FirstName, LastName, Class, Age) 
VALUES (2, 'Priyanka', 'Dewangan', 'Second', 17);
INSERT INTO school.students (StudentId, FirstName, LastName, Class, Age) 
VALUES (3, 'Hina', 'Sharma', 'First', 19);
INSERT INTO school.students (StudentId, FirstName, LastName, Class, Age) 
VALUES (4, 'Rakesh', 'Sahoo', 'Second', 17);


SELECT * FROM students;


# How to Update Data Rows in MySQL
UPDATE school.students SET FirstName = 'Suresh' WHERE (StudentId = 3 );
UPDATE school.students SET  LastName = 'Mohanty' WHERE (StudentId = 4 );


-- How to Delete Data Rows in MySQL
DELETE FROM school.students WHERE (StudentId = 3);
Delete  FROM school.students WHERE (StudentId = 4);


SELECT * FROM students;

---------------------------------------------------------------------------

-- The INSERT INTO statement is used to insert new records in a table.
-- INSERT INTO statement in two ways:

-- 1. Specify both the column names and the values to be inserted:
-- INSERT Syntax
/*
 INSERT INTO table_name (column1, column2, column3, ...)
 VALUES (value1, value2, value3, ...);
*/


-- 2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query.
-- However, make sure the order of the values is in the same order as the columns in the table
-- INSERT Syntax
/*
 INSERT INTO table_name
 VALUES (value1, value2, value3, ...);
*/


-- The UPDATE statement is used to modify the existing records in a table.
-- UPDATE Syntax
/*
UPDATE table_name
 SET column1 = value1, column2 = value2, ...
 WHERE condition;
*/
-- If you omit the WHERE clause, all records in the table will be updated!


-- The DELETE statement is used to delete existing records in a table.
-- DELETE Syntax
-- DELETE FROM table_name WHERE condition;
-- If you omit the WHERE clause, all records in the table will be deleted!


-- Delete All Records
-- It is possible to delete all rows in a table without deleting the table. 
-- This means that the table structure, attributes, and indexes will be intact:

-- Syntax: 
-- DELETE FROM table_name;






