# Self Join in MySQL
# What is Self-Join in MySQL?
/*
The Self Join in MySQL is nothing but joining a table by itself. 
We need to use Self Join in MySQL when we have some relations between the columns of the same table.

When you are implementing the self-join mechanism in MySQL, then you have to create the alias for the table name. 
You can create any number of aliases for a single table name in MySQL. Aliases are nothing but the alternative name given to a table. 
The Self Join is not a different kind of join. The Self Join is like any other join except that the two instances of the same table will be joined.
*/


 # How to implement Self Join in MySQL?
 -- Self Join Syntax
/*
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
*/
 
 
 # When to Use Self JOIN:
/*
When you need to compare rows within the same table.
When you're dealing with hierarchical data (e.g., employees and managers, parent-child relationships).
When you're finding relationships or gaps between records in the same table.

Self JOIN is a versatile tool when you need to analyze, compare, or query data within the same table under different contexts.
*/


# Understanding Self Join in MySQL with Examples
-- Please use the following SQL script to create the database company and Employee table and populate the Employee table with the required test data.

CREATE DATABASE Company;
USE Company;

-- Create the Employee table
CREATE TABLE Employee
(
  EmployeeID INT PRIMARY KEY,
  FullName VARCHAR(50),
  Gender VARCHAR(50),
  ManagerID INT
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


-- Insert the following records
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Employee VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Employee VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Employee VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Employee VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Employee VALUES(7, 'Hina', 'Female', 3);


SELECT * FROM Employee;


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE Company;


/*
The Employee table contains information for both normal employees as well as managers of that employee which is the ManagerId. 
So, in order to find out the managers of each employee, we need a Self-Join because both Manager and Employee exist in the same table.
*/


# Left Self-Join Example:
/*
A MANAGER is also an EMPLOYEE. Both the NORMAL EMPLOYEE and MANAGER records are present in the same Employee table. 
So, here we need to join the table Employee with itself using different alias names, let say, E for Employee and M for Manager.
 Here we are going to use the Left Outer Join which will get the records with ManagerId NULL.
 You can see in the output that Preety’s record is also retrieved, but the MANAGER is NULL.
*/

SELECT * FROM Employee;

SELECT e.FullName AS Employee, m.FullName AS Manager
FROM Employee e 
LEFT JOIN Employee m 
ON e.ManagerID = m.EmployeeID;


# Inner Self Join Example:
/*
Now, we are going to use the Inner Self Join to join two instances of the same Employee table which will not 
retrieve the records with ManagerId NULL. You can see in the output that Preety’s record is not retrieved.
*/

SELECT * FROM Employee;

SELECT e.FullName AS Employee, m.FullName AS Manager
FROM Employee e 
INNER JOIN Employee m 
ON e.ManagerID = m.EmployeeID;


# Cross Self Join Example in MySQL:
/*
Now, we are going to use the Cross Self Join to join two instances of the same Employee table. 
In this case, each record of instance will be multiplied with each other of other instances.
*/

SELECT * FROM Employee;

SELECT e.FullName AS Employee, m.FullName AS Manager
FROM Employee e 
CROSS JOIN Employee m;

------------------------------------------------------------------------------------------------

CREATE DATABASE Comp;
USE Comp;

-- let us create a CUSTOMERS table containing the customer details like their names, age, address and the salary they earn.

-- CUSTOMERS Table

CREATE TABLE CUSTOMERS (
   ID INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);


SELECT DATABASE();
SHOW TABLES;
DESC CUSTOMERS;


-- Now insert values into this table using the INSERT statement as follows −

INSERT INTO CUSTOMERS VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 ),
(4, 'Chaitali', 25, 'Mumbai', 6500.00 ),
(5, 'Hardik', 27, 'Bhopal', 8500.00 ),
(6, 'Komal', 22, 'Hyderabad', 4500.00 ),
(7, 'Muffy', 24, 'Indore', 10000.00 );


SELECT * FROM CUSTOMERS;


-- Self Join Query.
-- Our aim is to establish a relationship among the said customers on the basis of their earnings. We are doing this with the help of WHERE clause.

SELECT * FROM CUSTOMERS;

SELECT a.ID, b.Name AS EARNS_HIGHER, a.NAME AS EARNS_LESS, a.SALARY AS LOWER_SALARY
FROM CUSTOMERS a, CUSTOMERS b
WHERE a.SALARY < b.SALARY;




-- Self Join with ORDER BY Clause
/*
In this example, executing the query below will join the CUSTOMERS table with itself using self join on a WHERE clause.
 Then, arrange the records in an ascending order using the ORDER BY clause with respect to a specified column.
 Here, we are arranging the records based on the salary column
*/

SELECT * FROM CUSTOMERS;

SELECT a.ID, b.NAME AS EARNS_HIGHER, a.NAME AS EARNS_LESS, a.SALARY AS LOWER_SALARY
FROM CUSTOMERS a, CUSTOMERS b
WHERE a.SALARY < b.SALARY 
ORDER BY a.SALARY;






