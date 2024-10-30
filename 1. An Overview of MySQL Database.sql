# How to create and use a Database?
# Syntax: CREATE DATABASE DatabaseName;


# To Create a Database in MySQL 
CREATE DATABASE school;


# To display the list of all the existing databases 
SHOW DATABASES;


/* The SHOW DATABASES; command in MySQL is used to list all the databases that are available on the MySQL server. 
When you execute this command, MySQL returns a list of all databases that the user has privileges to access. */


# Show currently selected database
SELECT DATABASE();


/* The SELECT DATABASE(); command in SQL is used to return the name of the currently selected database in a MySQL session. 
If no database is selected, it returns NULL. */


# To Select a Database in MySQL
USE school;


# How to Drop a Database in MySQL?
DROP DATABASE school;


# MySQL Default Database Type:
# Here mysql is the default existing database name
 -- USE mysql;  


# To Display Existing Tables of the selected Database in MySQL
SHOW tables;


# It will display multiple types of privileges that are granted to the user account
-- SELECT * FROM user;


# How to Create a Table in MySQL?
/*create a table with the Students with Id, Name, Class, and Age columns. */


CREATE TABLE Students (
 Id INT PRIMARY KEY,
 Name VARCHAR(40) NOT NULL,
 Class VARCHAR(20),
 Age INT
);              


# How to see the Structure of a Database in MySQL?
# Below both statements are same
DESCRIBE Students;
DESC Students;  


# It will give you the list of the existing table in the school database.
SHOW TABLES;


# How to add data rows to a database table in MySQL?
# Before adding the data rows to a table, we must first select the database.
USE school;


# Syntax
-- The SQL statement to add data row or add a new record in a database table is,
-- INSERT INTO tablename VALUES (value1, value2, value3, – – -);

-- Another method to insert new row in a table is,
-- INSERT INTO tablename (column1, column2, column3, – – -) VALUES (value1, value2, value3, – – -);

/*In the first method, we must provide all the column values in the sequence. 
While in the second method you can add the values to only selected columns. The second method is more convenient. */


# First method:
INSERT INTO Students VALUES (1, 'Anurag', 'First', 5);

SELECT * FROM Students;


# Second method:
INSERT INTO Students (Id, Name, Class, Age) VALUES (2, 'Priyanka', 'Second', 7);


# Inserting multiple Rows in MySQL:
INSERT INTO Students (Id, Name, Class, Age) VALUES 
(3, 'Hina', 'First', 8),
(4, 'Sambit', 'Second', 7);


# Let’s check if the rows are successfully added to the database table.
SELECT * FROM Students;


# Understands Keywords, Identifiers, Constants, and Clauses
/* Keywords: Just like sentences in the English language are made up of words, the same way the SQL statements are made up of special words Keywords, Identifiers, Constants Clauses. Keywords are SQL standards words used to construct the SQL statements. Some keywords are optional while some of them are mandatory.
Identifiers: Identifiers are the names; we give to the database tables or columns.
Constants: The constants are literals that represent fixed values.
Clauses: A clauses is a portion of a SQL statement. The name of the clause corresponds to the SQL keyword that begins the clause. */


#Example 1: 
SELECT name FROM students WHERE id=5;

/* In this above query, SELECT, FROM, WHERE are Keywords. SELECT and FROM are mandatory while WHERE is optional. 
Equals sign (=) is a special type of keyword called operator. name, students are Identifiers. name, id are column names 
while students is a table name. 5 is numeric constant. And the SQL statement contains the SELECT clause, FROM clause WHERE clause. */


#Example 2: 
SELECT * FROM students WHERE age>6;

/* In this above query, SELECT, FROM WHERE are Keywords. SELECT and FROM are mandatory while WHERE IS optional. 
The “*” (asterisk) is a special type of keyword, while means all the columns from the table. 
Less than sign a special type of keyword called comparison operators. age is a column name while students is a table name.
 6 is a numeric constant, And the SQL statement contains the SELECT clause, FROM clause WHERE clause. */


# How to Delete a table in MySQL?
DROP TABLE Students;
DROP TABLE school.students;


/* # Types of SQL Commands
1.DDL – Data Definition Language (Create, Alter,  Drop, Truncate, Rename, Comment)
2.DQL – Data Query Language (Select)
3.DML – Data Manipulation Language (Insert, Update,, Delete, Lock, Call, Explain Plan)
4.DCL – Data Control Language (Grant, Revoke)
5.TCL – Transaction Control Language (Commit, Rollback, Savepoint, Begin Transaction) */








