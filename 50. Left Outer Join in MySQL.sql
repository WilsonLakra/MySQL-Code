# Left Outer Join in MySQL
# What is Left Outer Join in MySQL?
/*
A LEFT OUTER JOIN (or simply LEFT JOIN) in MySQL is used to retrieve all records from the "left" table, 
and the matched records from the "right" table. If there is no match, NULL values are returned for columns from the right table.
*/


# How to implement Left Outer Join in MySQL?
-- LEFT JOIN Syntax
/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
*/


# When do we need to use Left JOIN in MySQL?
/*
If you want to retrieve all the matching rows from both the tables involved in the join and all the non-matching rows 
from the left side table in the result set, then you need to use Left Join in MySQL. In that case, the non-matching rows will take a null value. 
*/


# Example to Understand Left Outer Join in MySQL
/*
To understand Left Outer Join in MySQL, we will use the following Employee, Address, and Projects tables. 
Here, EmployeeId is the common column available in all three tables, and based on this EmployeeId column, 
we will perform the Left Outer Join Operations.
*/

CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY,
  FullName VARCHAR(50) NOT NULL,
  Technology VARCHAR(50) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(50) NOT NULL,
  Age INT NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1001, 'John Doe', 'Java', 35000, 'Male', 25);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1002, 'Mary Smith', 'Java', 45000, 'Female', 27);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1003, 'James Brown', 'Java', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1004, 'Mike Walker', '.NET', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1005, 'Linda Jones', '.NET', 75000, 'Female', 26);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1006, 'Anurag Mohanty', '.NET', 35000, 'Male', 25);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1007, 'Priyanla Dewangan', '.NET', 45000, 'Female', 27);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1008, 'Sambit Mohanty', '.NET', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1009, 'Pranaya Kumar', 'Java', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Technology, Salary, Gender, Age) VALUES (1010, 'Hina Sharma', 'Java', 75000, 'Female', 26);


SELECT * FROM Employee;


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE Company;




CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(200) NOT NULL,
 EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);


SELECT DATABASE();
SHOW TABLES;
DESC Projects;


INSERT INTO Projects (ProjectName, EmployeeId, StartDate, EndDate) VALUES 
('Develop Ecommerse Website from scratch', 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress Website for our company', 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our Company Servers', 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('Hosting account is not working', 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));



SELECT * FROM Projects;


SELECT DATABASE();
SHOW TABLES;
DESC Projects;
SHOW DATABASES;
USE Company;




CREATE TABLE Address
(
    AddressId INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeId INT,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);


SELECT DATABASE();
SHOW TABLES;
DESC Address;


INSERT INTO Address (EmployeeId, Country, State, City) Values (1001, 'India', 'Odisha', 'BBSR');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1002, 'India', 'Maharashtra', 'Mumbai');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1003, 'India', 'Maharashtra', 'Pune');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1004, 'India', 'Odisha', 'Cuttack');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1005, 'India', 'Maharashtra', 'Nagpur');
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'BBSR');


SELECT * FROM Address;


SELECT DATABASE();
SHOW TABLES;
DESC Address;
SHOW DATABASES;
USE Company;


# MySQL Left Outer Join Example:
-- Our requirement is to retrieve the EmployeeId, FullName, Technology, Gender, and ProjectName from the Employee and Projects tables

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName 
FROM Employee e 
LEFT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;


-- We can also use the LEFT JOIN keyword as shown in the below SQL Query, and it will also give you the same result as the previous SQL Query.

SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName 
FROM Employee e 
LEFT  JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;


# Left Outer Join with Where Condition:
-- Our requirement is to retrieve all the EmployeeId, FullName, Technology, Gender, and ProjectName from the Employee and 
-- Projects tables by using the Left Outer Join where the gender is Male. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName 
FROM Employee e 
LEFT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId
WHERE e.Gender = 'Male';


# How to retrieve only the non-matching rows from the left table in MySQL?
/*
There are two employees for which there is no entry in the Projects table, i.e., two employees are not currently assigned any projects.
 So, our requirement is to retrieve only those two employees for which non-matching records exist in the Projects table. 
 So, basically, we want to retrieve only the non-matching records from the left side table. 
*/

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName 
FROM Employee e 
LEFT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId
WHERE p.ProjectName IS NULL;


# Joining three Tables in MySQL using Left Outer Join:
-- It is also possible in MySQL to join more than two tables.

-- LEFT JOIN Syntax for 3 tables
/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name
LEFT JOIN table3
ON table2.column_name = table3.column_name;
*/


# Example: Left Joining Employee, Projects, and Address tables
-- Now, our requirement is to fetch the details of all employees along with the project name and address if they have one.

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Address;


SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName, a.Country, a.State, a.City
FROM Employee e 
LEFT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId 
LEFT OUTER JOIN Address a 
ON p.EmployeeId = a.EmployeeId;


SELECT e.EmployeeId, e.FullName, e.Technology, e.Gender, p.ProjectName, a.Country, a.State, a.City
FROM Employee e 
LEFT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId 
LEFT OUTER JOIN Address a
ON e.EmployeeId = a.EmployeeId;

-- we get all the employees’ records irrespective of whether they have Addresses or are assigned to any projects.

---------------------------------------------------------------------------------------------------------------------

CREATE DATABASE Comp;
USE Comp;

-- Create a table named CUSTOMERS, that contains the personal details of customers including their name, age, address and salary.

-- CUSTOMERS Table --

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
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);


SELECT * FROM CUSTOMERS;


-- Let us create another table ORDERS, containing the details of orders made and the date they are made on.

-- ORDERS Table

CREATE TABLE ORDERS (
   OID INT NOT NULL,
   DATE VARCHAR (20) NOT NULL,
   CUSTOMER_ID INT NOT NULL,
   AMOUNT DECIMAL (18, 2)
);


SHOW TABLES;
DESCRIBE ORDERS;


-- Using the INSERT statement, insert values into this table as follows −

INSERT INTO ORDERS VALUES 
(102, '2009-10-08 00:00:00', 3, 3000.00),
(100, '2009-10-08 00:00:00', 3, 1500.00),
(101, '2009-11-20 00:00:00', 2, 1560.00),
(103, '2008-05-20 00:00:00', 4, 2060.00);


SELECT * FROM ORDERS;


-- Left Join Query:
--  we will retrieve the details of customers who made an order at the specified date. 
-- If there is no match found, the query below will return NULL in that record.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.AMOUNT, ORDERS.DATE 
FROM CUSTOMERS 
LEFT JOIN ORDERS 
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;




# Joining Multiple Tables with Left Join
-- Left Join also joins multiple tables where the first table is returned as a whole and the next tables are matched with
 -- the rows in the first table. If the records are not matched, NULL is returned.

/*
 let us consider the previously created tables CUSTOMERS and ORDERS. In addition to these we will create another table named EMPLOYEE, 
 which consists of the details of employees in an organization and sales made by them, using the following query −
*/

-- EMPLOYEE Table 

CREATE TABLE EMPLOYEE (
   EID INT NOT NULL,
   EMPLOYEE_NAME VARCHAR (30) NOT NULL,
   SALES_MADE DECIMAL (20)
);


SHOW TABLES;
DESCRIBE EMPLOYEE;


-- Now, we can insert values into this empty tables using the INSERT statement as follows −

INSERT INTO EMPLOYEE VALUES
(102, 'SARIKA', 4500),
(100, 'ALEKHYA', 3623),
(101, 'REVATHI', 1291),
(103, 'VIVEK', 3426);


SELECT * FROM EMPLOYEE;


-- Left Join Query:
-- Let us join these three tables using the left join query given below −

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM EMPLOYEE;


SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, EMPLOYEE.EMPLOYEE_NAME
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
LEFT JOIN EMPLOYEE
ON ORDERS.OID = EMPLOYEE.EID;




-- Left Join with WHERE Clause
-- To filter the records after joining two tables, a WHERE clause can be applied.

/*
Records in the combined database tables can be filtered using the WHERE clause. Consider the previous two tables CUSTOMERS and ORDERS; 
and join them using the left join query by applying some constraints using the WHERE clause.
*/

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, ORDERS.AMOUNT
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
WHERE ORDERS.AMOUNT > 2000;




