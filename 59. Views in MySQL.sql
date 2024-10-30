# Views in MySQL
# What is a View in MySQL?
/*
VIEW is a database object that can be created like a table. In SQL, a VIEW is similar to a virtual table. 
But unlike tables VIEWS don’t actually store data. VIEWS are complex SELECT statements used as virtual tables for ease of reference and reuse. 
The VIEWS are useful for storing complex SQL statements as a virtual table and request the VIEW as a single table instead of a complex query.

For security purposes, we can restrict users from accessing underlying tables and instead give access to views or virtual tables with limited columns. 
Since, every time user request view, the database engine recreates the result set, which always returns up-to-date data rows from views.

So, in simple words, we can say that the views in MySQL act as an interface between the actual database table(s) and the user.
*/


# What are the differences between a table and a view in MySQL?
/*
When we compared a view with a table, we have the following differences.

The table is physical i.e. it is an actual table whereas the view is logical i.e. it is a virtual table.
A Table is an independent object whereas a view is a dependent object. That is a view depends on the table(s) from which it is going to fetch the data.
The Table stores the actual data of the database whereas View creates a logical subset of data from one or more tables.
When a new table is created from an existing table, the new and old tables are independent themselves, 
that is the changes of one table will not be reflected into the other table whereas if a view is created based on a table, 
any changes that are performed on the table will reflect into the view and any changes performed on the view reflected in the table also
*/


# Examples to understand Views in MySQL
-- Please use the below SQL Script to create and populate the database EmployeeDB, and Gender and Employee table with the required sample data.

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Create Gender Table
CREATE TABLE Gender
(
  Id INT PRIMARY KEY,
  Name VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC Gender;


-- Populate the Gender Table with test data
INSERT INTO Gender VALUES(1, 'Male');
INSERT INTO Gender VALUES(2, 'Female');
INSERT INTO Gender VALUES(3, 'Unknown');

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM Gender;




-- Create Employee Table
CREATE TABLE Employee
(
  Id INT PRIMARY KEY,
  Name VARCHAR(50),
  GenderId VARCHAR(50),
  Salary INT,
  Department VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 1, 20000, 'IT');
INSERT INTO Employee VALUES(2, 'Priyanka', 2, 30000, 'HR');
INSERT INTO Employee VALUES(3, 'Anurag', 1, 40000, 'IT');
INSERT INTO Employee VALUES(4, 'Preety', 2, 25000, 'HR');
INSERT INTO Employee VALUES(5, 'Sambit', 3, 35000, 'INFRA');
INSERT INTO Employee VALUES(6, 'Hina', 2, 45000, 'HR');


-- To verify the records into a table, use the SELECT statement:
SELECT * FROM Employee;


# How to Create a View in MySQL?
-- CREATE VIEW Syntax
/*
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/


# How many types of views are there in MySQL?
/*
There are two types of views in MySQL, they are as follows.

1. Simple view or Updatable views
2. Complex view or non-updatable views.
*/


# What is a simple view or an Updatable view in MySQL?
/*
The view that is created based on the columns of a single table is known as a simple view in MySQL. In the Simple View, 
we can perform all the DML operations, so it is also called an updatable view.
*/


# Simple View with All Columns:
-- Now we will create a view that will retrieve all the column data from the Employee table.
CREATE VIEW vwEmployee AS SELECT * FROM Employee;


-- As the above view is created based on a single table i.e. Employee table, so it is called a Simple view and updatable view. 
-- As we already discussed we can perform all the DML Operations on Simple view. Let us prove this.


# Retrieve Operation on MySQL View:
-- To retrieve the data from a view, we need to use the SELECT statement, in the same way, we used to select the data from a table.
SELECT * FROM vwEmployee;




# Insert Operation on MySQL View:
/*
It is possible in MySQL to perform INSERT Operation on Simple View. In this case, the record actually inserted into the underlying base table. 
Let us try to insert one record using our vwEmployee view by executing the below SQL INSERT Statement.
*/

INSERT INTO vwEmployee VALUES (7, 'Smith', 1, 42000, 'IT');

-- When you execute the above INSERT statement, one record is inserted into the Employee table. To check the same, execute the below SELECT query.
SELECT * FROM Employee;

-- Once you execute the above SQL Statement, you will get the following output and notice the new record with id 7 is there in the Employee table
SELECT * FROM vwEmployee;




# Update Operation on MySQL Views:
/*
It is also possible in MySQL Simple Views to Perform UPDATE DML Operation. 
Let’s try to update the Name and Salary of the employee whose id is 7 using the vwEmployee view by executing the below UPDATE Statement.
*/

UPDATE vwEmployee SET Name = 'Taylor',  Salary = 50000 WHERE Id = 7;

-- To verify whether the data is updated successfully or not make a select query against the Employee table by executing the below SELECT Statement.
SELECT * FROM Employee;




# Delete Operation on MySQL View:
/*
It is also possible in MySQL Simple view to perform the DML DELETE Operation. 
Let’s try to Delete the Employee whose ID is 7 using the vwEmployee view by executing the below DELETE Statement.
*/

DELETE FROM vwEmployee WHERE Id = 7;

-- To verify whether the same, issue a select query against the Employee table by executing the below SELECT Statement.
SELECT * FROM Employee;

-- Note: So, this proofs that we can perform ALL the DML operations on a Simple View in MySQL which is also called an Updatable View.




# Simple View with Required Columns in MySQL:
-- Now we will see how to create a view with specific columns from the Employee table. We want all the columns except the Salary column. 

CREATE VIEW vwEmployee1 
AS 
SELECT Id, Name, GenderId, Department 
FROM Employee;

-- To verify the view with specific columns from the Employee table.
SELECT * FROM vwEmployee1;

-- Note: In this vwEmployee1 view, 
-- we can also perform the SELECT, INSERT, UPDATE, and DELETE operations as the above view is also a simple or you can say updatable view.


# How to DROP a View in MySQL?
-- DROP VIEW Syntax
/*
DROP VIEW view_name;
*/

-- As we have created two views so far, let us delete the vwEmployee view by executing the below statements.
DROP VIEW vwEmployee;


# How to Modify a view in MySQL?
/*
Once the view is created, later if you want to update the view, then you can also do the same in MySQL. 
To modify or update the already created view without dropping it we can use ALTER VIEW statement. Following is the syntax.
*/

/*
ALTER VIEW view_name AS
SELECT * /Required column names
FROM table_name
WHERE condition;
*/

-- MySQL Updating a View
-- A view can be updated with the CREATE OR REPLACE VIEW statement.

-- CREATE OR REPLACE VIEW Syntax
/*
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

-- For example, from our vwEmployee1 view, we also want to remove the GenderId column. 
-- Then we can do the same by executing the below ALTER View Statement.

ALTER VIEW vwEmployee1 
AS
SELECT Id, Name, Department
FROM Employee;

-- To verify view you will see that only three columns’ data are returned from the Employee table.
SELECT * from vwEmployee1;




# What is a complex view in MySQL?
/*
When we create a view based on more than 1 table by using MySQL JOIN, then it is known as a complex view and on a complex view, 
we may or may not perform DML operations. So, a complex view is also called a non-updatable view.
*/

# MySQL Complex View Example:
/*
Let us create a VIEW-based INNER JOIN SELECT statement. We want a view that will retrieve the data from the Employee and Gender table and 
the column the view should include are EmployeeId, Employee Name, Salary, Gender Name, and Department. 
To do so, execute the below CREATE VIEW SQL Statement.
*/

SELECT * FROM Gender;
SELECT * FROM Employee;

CREATE VIEW vwEmployees
AS
SELECT emp.Id, emp.Name, emp.Salary, gen.Name AS Gender, emp.Department
FROM Employee emp
INNER JOIN Gender gen
ON emp.GenderId = gen.Id;

-- To verify complex view  vwEmployees
SELECT * FROM vwEmployees;


/*
A view that is created based on a single table will also be considered as a complex view provided if the query contains Distinct. 
Aggregate Function, Group by Clause, having Clause, calculated columns, and set operations. 

For example, the following is a view based on the single table, but it will be considered as a complex view as it uses the group by clause.
*/

CREATE VIEW vwCountEmployees
AS
SELECT Department, COUNT(*) AS TotalEmployee
FROM Employee GROUP BY Department;

-- To verify complex view vwCountEmployees
SELECT * FROM vwCountEmployees;




# Can we create a view based on other views?
/*
Yes, it is possible in MySQL to create a view based on other views. 
Suppose we want to create a view vwSalaryDetails based on the vwEmployees view to show the name and salary of employees. 
Then we can do the same by executing the below CREATE View Statement
*/

CREATE VIEW vwSalaryDetails
AS
SELECT Name, Salary 
FROM vwEmployees;

-- To verify view based on other views
SELECT * FROM vwSalaryDetails;


# Can we drop a table that has dependent views on it in MySQL?
/*
Yes, it is possible in MySQL to drop a table even if any dependent views are associated with it, 
but the views that are associated with it will not be dropped. They still execute in the database only with the status as inactive object and 
all those views become active and start functioning provided the table is recreated.
*/

----------------------------------------------------------------------------------------------------------

/*
MySQL views are virtual tables that provide a way to simplify complex queries, encapsulate business logic, and enhance data security. 
A view is defined by a SELECT query and can be used just like a table.
*/

#  Creating a View

-- CREATE VIEW Syntax
/*
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/


-- Lets first create and populate the database EmployeeDB, and Products and Employees and Sales table with the required sample data.

CREATE DATABASE CompanyDB;
USE CompanyDB;   

-- 1. products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC products;


-- Insert the following sample data into the products table:
INSERT INTO products (product_id, product_name, price, category) VALUES
(1, 'Laptop', 800.00, 'Electronics'),
(2, 'Smartphone', 600.00, 'Electronics'),
(3, 'Chair', 50.00, 'Furniture');

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM products;




-- 2. employees Table

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100)
);


SHOW TABLES;
DESC employees;


-- Insert the following sample data into the employees table:
INSERT INTO employees (employee_id, name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM employees;




-- 3. sales Table

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


SHOW TABLES;
DESC sales;


-- Insert the following sample data into the sales table:
INSERT INTO sales (sale_id, employee_id, amount) VALUES
(1, 1, 200.00),
(2, 2, 300.00);

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM sales;




# Example 1: Simple View
-- Let's say you have a products table: You can create a view to show only electronics:

SELECT * FROM products;

CREATE VIEW electronics_view AS 
SELECT Product_id, product_name, price 
FROM products 
WHERE category = 'Electronics';

-- You can then query the view like this:
SELECT * FROM electronics_view;


# Example 2: View with Joins
-- Assume you have two tables, employees and sales: You can create a view to show employee sales:

SELECT * FROM employees;
SELECT * FROM sales;

CREATE VIEW employee_sales AS
SELECT e.name, SUM(s.amount) AS total_sales
FROM employees e 
INNER JOIN sales s 
ON e.employee_id = s.employee_id
GROUP BY e.name;

-- Querying this view gives you:
SELECT * FROM employee_sales;


# Example 3: Updating a View
-- Some views can also be updatable. For instance, if you create a view on the products table, 
-- you can update it directly if the view contains all the necessary columns. Here's an example:

SELECT * FROM products;

CREATE VIEW expensive_products AS
SELECT product_id, product_name, price 
FROM products 
WHERE price > 100;

SELECT * FROM expensive_products;


-- You can update the price of products in the view:
UPDATE expensive_products 
SET price = price * 0.9;		-- Apply a 10% discount

-- Querying this view gives you:
SELECT * FROM expensive_products;


# Example 4: Dropping a View
-- To remove a view, use the DROP VIEW statement:

DROP VIEW expensive_products;

