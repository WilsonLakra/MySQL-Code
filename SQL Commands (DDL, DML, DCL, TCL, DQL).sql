# SQL Commands (DDL, DML, DCL, TCL, DQL)

-- In MySQL, SQL commands are categorized into several types based on their functionality. Here are the four main types:

# 1. DDL (Data Definition Language)
-- Purpose: Defines the structure of the database, including tables, indexes, and schemas.

-- Commands:
/*
CREATE: Creates a new database or table.
ALTER: Modifies an existing database or table structure.
DROP: Deletes a database, table, or index.
TRUNCATE: Removes all rows from a table, but the table structure remains.
RENAME: Renames a table or column.
*/

-- Example:
CREATE DATABASE EmployeesDB;
CREATE TABLE employees (id INT, name VARCHAR(100));
ALTER TABLE employees ADD COLUMN salary DECIMAL(10, 2);
DROP TABLE employees;
TRUNCATE TABLE employees;
RENAME TABLE employees TO employee;

USE EmployeesDB;
SHOW TABLES;
DESC employees;
DESC employee;
DROP TABLE employee;


# 2. DML (Data Manipulation Language)
-- Purpose: Manipulates data within tables, such as inserting, updating, deleting, or retrieving records.

-- Commands:
/*
INSERT: Adds new rows to a table.
UPDATE: Modifies existing rows in a table.
DELETE: Removes rows from a table.
SELECT: Retrieves data from a table.
*/

-- Example:
INSERT INTO employees (id, name, salary) VALUES (1, 'John Doe', 50000);
UPDATE employees SET salary = 55000 WHERE id = 1;
DELETE FROM employees WHERE id = 1;
SELECT * FROM employees;


# 3. DCL (Data Control Language)
-- Purpose: Controls access to the data in the database.

-- Commands:
/*
GRANT: Grants specific privileges to users.
REVOKE: Removes specific privileges from users.
*/

-- Syntax:
GRANT SELECT, INSERT ON employees TO 'user'@'localhost';
REVOKE SELECT, INSERT ON employees FROM 'user'@'localhost';

GRANT SELECT, INSERT ON database_name.employees TO 'user'@'localhost';
REVOKE SELECT, INSERT ON database_name.employees FROM 'user'@'localhost';

-- In MySQL, a user must be created first using the CREATE USER statement before you can assign privileges to them with GRANT.
--  1. Create the user first:
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';	-- Syntax
CREATE USER 'Adam'@'localhost' IDENTIFIED BY 'adam123';		-- Example

-- 2. Grant privileges: After creating the user, you can then grant the desired privileges:
GRANT SELECT, INSERT ON EmployeesDB.employees TO 'user'@'localhost';	-- Syntax
GRANT SELECT, INSERT ON EmployeesDB.employees TO 'Adam'@'localhost';	-- Example

-- 3. Flush privileges (optional):
-- After running this command, don't forget to refresh the privileges with:
FLUSH PRIVILEGES;
-- This will ensure that the changes take effect immediately.

-- Verifying privileges
SELECT * FROM employees;
INSERT INTO employees (id, name, salary) VALUES (1, 'John Doe', 50000);
UPDATE employees SET salary = 55000 WHERE id = 1;
DELETE FROM employees WHERE id = 1;

-- To remove privileges from a user in MySQL, you can use the REVOKE statement. Here’s how to do it:
-- 1. Revoke Specific Privileges: To remove specific privileges from a user on a particular table or database, use this syntax:
REVOKE SELECT, INSERT ON EmployeesDB.employees FROM 'user'@'localhost';		-- Syntax
REVOKE SELECT, INSERT ON EmployeesDB.employees FROM 'Adam'@'localhost';		-- Example
-- This command removes SELECT and INSERT privileges on the employees table in the EmployeesDB database from the user 'user'@'localhost'.

-- 2. Revoke All Privileges on a Database: If you want to remove all privileges that a user has on a specific database, use:
REVOKE ALL PRIVILEGES ON EmployeesDB.* FROM 'user'@'localhost';		-- Syntax
-- This will remove all permissions the user has on any table within the EmployeesDB database.

-- 3. Revoke All Global Privileges: To revoke all global privileges from a user (meaning any privileges they have across all databases), use:
REVOKE ALL PRIVILEGES ON *.* FROM 'user'@'localhost';
-- This command removes all privileges across all databases for the specified user.

-- 4. Flush Privileges (Optional): After revoking privileges, you can use FLUSH PRIVILEGES to refresh the privilege tables and 
-- apply the changes immediately:
FLUSH PRIVILEGES;

-- 1, Check all users:
SELECT User, Host FROM mysql.user;
-- This will display a list of all users along with their host information.

-- 2. Check for a specific user: If you want to check if a specific user, such as 'user'@'localhost', exists, you can use this query:
SELECT User, Host FROM mysql.user WHERE User = 'user' AND Host = 'localhost';	-- Syntax
SELECT User, Host FROM mysql.user WHERE User = 'Adam' AND Host = 'localhost';	-- Example
-- Note: If this query returns a row, the user exists; otherwise, the user has not been created.

-- 3. Using SHOW GRANTS: You can also use the SHOW GRANTS command to see if there are any privileges assigned to a particular user:
SHOW GRANTS FOR 'user'@'localhost';		-- Syntax
SHOW GRANTS FOR 'Adam'@'localhost';		-- Example

-- To completely remove a user from the MySQL database, use the DROP USER command. 
-- This will delete the user along with any privileges they may have been granted. Here’s the syntax:
DROP USER 'user'@'localhost';	-- Syntax
DROP USER 'Adam'@'localhost';
-- Note: Replace 'user' and 'localhost' with the specific username and host.

-- To remove a user named 'example_user' who can connect from any host ('%'), you would use:
DROP USER 'example_user'@'%';	-- Syntax


# 4. TCL (Transaction Control Language)
-- Purpose: Manages the changes made by DML statements and ensures data integrity.

-- Commands:
/*
COMMIT: Saves the changes made during the transaction.
ROLLBACK: Undoes the changes made during the transaction.
SAVEPOINT: Sets a point in a transaction to which you can later roll back.
SET TRANSACTION: Configures the transaction settings.
*/

-- Example:
BEGIN;
INSERT INTO employees (id, name, salary) VALUES (2, 'Jane Smith', 60000);
COMMIT;

BEGIN;
DELETE FROM employees WHERE id = 2;
ROLLBACK;
SELECT * FROM employees;

SAVEPOINT savepoint_name;	-- To create a savepoint
SAVEPOINT sp1;
RELEASE SAVEPOINT savepoint_name;	-- To remove a savepoint, use:
RELEASE SAVEPOINT sp1;
ROLLBACK TO SAVEPOINT savepoint_name;	-- Roll back to a specific savepoint within a transaction:

SELECT * FROM employees;

-- Start a transaction using BEGIN or START TRANSACTION.
START TRANSACTION;

-- Perform some operations
INSERT INTO EmployeesDB.employees (id, name, salary) VALUES (3, 'Adam', 70000);

-- Set a savepoint
SAVEPOINT sp1;

-- Perform some more operations
INSERT INTO EmployeesDB.employees (id, name, salary) VALUES (4,'Eve', 80000);

-- If something goes wrong, rollback to the savepoint
ROLLBACK TO SAVEPOINT sp1;

-- Commit the transaction to make changes permanent
COMMIT;
SELECT * FROM employees;


/*
The four standard isolation levels in MySQL are:

READ UNCOMMITTED: Transactions can read uncommitted changes from other transactions.
READ COMMITTED: Transactions can only read committed changes from other transactions.
REPEATABLE READ: Ensures that if you read a value, it remains the same during the transaction.
SERIALIZABLE: Transactions are executed in a way that ensures complete isolation from other transactions.
*/
-- Here's how you might use SET TRANSACTION to set the isolation level for a transaction:
--  1. Set the transaction isolation level to SERIALIZABLE
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Start the transaction
BEGIN;

-- Perform some DML operations (e.g., inserting data)
INSERT INTO employees (id, name, salary) VALUES (4, 'Alice Cooper', 70000);

-- Commit the transaction
COMMIT;


-- 2. Using SET TRANSACTION with READ COMMITTED:
-- Set the transaction isolation level to READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Start the transaction
BEGIN;

-- Perform some DML operations
UPDATE employees SET salary = 75000 WHERE id = 3;

-- Commit the transaction
COMMIT;


-- 3. Using SET TRANSACTION with ACCESS MODE (READ WRITE):
-- You can also set the transaction's access mode, which indicates whether it will allow updates (read-write) or only read operations.
-- Set the transaction to be read-write
SET TRANSACTION READ WRITE;

-- Start the transaction
BEGIN;

-- Perform some DML operations
DELETE FROM employees WHERE id = 3;

-- Commit the transaction
COMMIT;



# 5. DQL (Data Query Language)
-- Purpose: Queries the database to retrieve data, specifically focused on the SELECT statement.

-- Commands:
/*
SELECT: Retrieves data from one or more tables.
*/

-- Example:
SELECT id, name, salary FROM employees WHERE salary > 40000;


-- Summary:
-- DDL: Defines or modifies the structure of the database (e.g., CREATE, ALTER, DROP).
-- DML: Manipulates data (e.g., INSERT, UPDATE, DELETE).
-- DQL: Retrieves data from the database (e.g., SELECT).
-- DCL: Controls user access to data (e.g., GRANT, REVOKE).
-- TCL: Manages database transactions (e.g., COMMIT, ROLLBACK).

-- Note: Data integrity is the accuracy, completeness, and reliability of data.



