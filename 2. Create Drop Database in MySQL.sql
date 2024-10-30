# Using SQL Script to Create MySQL Database using Workbench
CREATE DATABASE testdb1;
CREATE DATABASE testdb2;


# How to Drop a Database in MySQL Server using MySQL Workbench?
-- To drop a database, select the database name, from under ‘SCHEMAS menu, right-click on the database which you want to delete and 
-- then select the Drop Schema option.
-- Once you click on the Drop Schema option, the following popup will open, and here simply click on the Drop Now option 
-- The database including tables and data rows will be deleted from the database server.


# You Can also delete a database using the following SQL Query in MySQL.
DROP DATABASE testdb1;
DROP DATABASE testdb2;


# To display the list of all the existing databases 
SHOW DATABASES;


# Show currently selected database
SELECT DATABASE();


# To Select/Change a Database in MySQL
USE testdb1;

-----------------------------------------------------------------------------------

-- The CREATE DATABASE statement is used to create a new SQL database.
-- Syntax: CREATE DATABASE databasename;

CREATE DATABASE testDB;

-- The DROP DATABASE statement is used to drop an existing SQL database.
-- Syntax: DROP DATABASE databasename;

DROP DATABASE testDB;


