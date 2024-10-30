# Inner Join in MySQL
# What is Inner Join in MySQL?
/*
The Inner Join is used to return only the matching rows from both the tables involved in the join. 
That means it eliminates the non-matching rows. The INNER JOIN is the most common type of join used in real-time applications. 
*/


# How to implement Inner Join in MySQL?
-- INNER JOIN Syntax
/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
*/


# When do we need to use Inner JOIN in MySQL?
/*
 If you want to retrieve all the matching rows from both the tables involved in the join by removing all the non-matching rows 
 in the result set then you need to use the Inner Join. 
*/


# Examples to Understand Inner JOIN:
/*
To understand Inner Join, we are going to use the following Employee, Address, and Projects tables.
 Here, EmployeeId is the common column that is available in all the tables, and based on this column
 we are going to perform the Inner Join Operations.
*/


CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
  EmployeeId INT PRIMARY KEY,
  FullName VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28);
INSERT INTO Employee (EmployeeId, FullName, Department, Salary, Gender, Age) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26);


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
INSERT INTO Address (EmployeeId, Country, State, City) Values (1006, 'India', 'Odisha', 'Cuttack');


SELECT * FROM Address;


SELECT DATABASE();
SHOW TABLES;
DESC Address;
SHOW DATABASES;
USE Company;


# MySQL Inner Join Example:
-- Our requirement is to retrieve the EmployeeId, FullName, Department, Gender, ProjectName from the Employee and Projects tables. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName
FROM Employee e
INNER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;


-- we can also use the JOIN keyword as shown in the below SQL Query and it will also give you the same result as the previous SQL Query.

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName
FROM Employee e
JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;

-- Note: INNER JOIN or JOIN means the same. But it’s always recommended to use INNER JOIN,
-- as it explicitly specifies the type of join operation we are performing.


# MySQL Inner Join with Where Condition:
-- Our requirement is to retrieve all the EmployeeId, FullName, Department, Gender, ProjectName from the Employee and 
-- Projects tables where the gender is Male. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName
FROM Employee e 
INNER JOIN Projects p
ON e.EmployeeId = p.EmployeeId
WHERE e.Gender = 'Male';


# Joining Three Tables in MySQL:
-- It is possible in MySQL to join more than two tables. 

-- INNER JOIN Syntax for 3 tables
/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name
INNER JOIN table3
ON table2.column_name = table3.column_name;
*/


# Example: Inner Joining Employee, Projects, and Address tables
-- Now, our requirement is to fetch the details of such employees who are currently having any projects as well as they must have an address.

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Address;


SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName,  a.Country, a.State, a.City
FROM Employee e
INNER JOIN Projects p
ON e.EmployeeId = p.EmployeeId
INNER JOIN Address a
ON p.EmployeeId = a.EmployeeId;


SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName,  a.Country, a.State, a.City
FROM Employee e
INNER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId 
INNER JOIN Address a 
ON e.EmployeeId = a.EmployeeId;

-- we get only four records, this is because the following four records exist in all three tables.




-- Using UNION to combine and compare
-- To compare the result sets of two queries that involve INNER JOIN across three table

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName,  a.Country, a.State, a.City
FROM Employee e
INNER JOIN Projects p
ON e.EmployeeId = p.EmployeeId
INNER JOIN Address a
ON p.EmployeeId = a.EmployeeId

UNION

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName, a.Country, a.State, a.City
FROM Employee e
INNER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId 
INNER JOIN Address a 
ON e.EmployeeId = a.EmployeeId;


# Joining Multiple Tables with Different Joining Condition in MySQL
/*
It is also possible in MySQL to use Different types of Joins while joining more than two tables. 
For example, in the below SQL Query, the first joining operation (between Employee and Projects) 
is performed using Inner JOIN and the second join operation (between Employee and Address) is performed using LEFT JOIN in MySQL.
*/

SELECT * FROM Employee;
SELECT * FROM Projects;
SELECT * FROM Address;

SELECT e.EmployeeId, e.FullName, e.Department, e.Gender, p.ProjectName, a.Country, a.State, a.City
FROM Employee e 
INNER JOIN Projects p ON e.EmployeeId = p.EmployeeId 		-- Using INNER JOIN (between Employee and Projects) 
LEFT JOIN Address a ON e.EmployeeId = a.EmployeeId;			-- Using LEFT JOIN	(between Employee and Address) 

-------------------------------------------------------------------------------------------------------------

CREATE DATABASE Comp;
USE Comp;

-- Creating a table named CUSTOMERS, which contains the personal details of customers including their name, age, address and salary etc.

-- CUSTOMERS Table −

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

-- ORDERS Table −

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


-- Inner Join Query −
-- Let us now combine these two tables using the Inner Join query

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, ORDERS.AMOUNT
FROM CUSTOMERS
INNER JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;




-- Joining Multiple Tables Using Inner Join
-- Using the Inner Join query, we can also join as many tables as possible.
-- However, only two tables can be joined together on a single condition. This process is done sequentially until all the tables are combined.

/*
let us join three tables including CUSTOMERS and ORDERS along with a new table EMPLOYEE. 
We will first create the EMPLOYEE table using the query below −
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


-- we are combining three tables CUSTOMERS, ORDERS and EMPLOYEE.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM EMPLOYEE;


SELECT ORDERS.OID, ORDERS.DATE, ORDERS.AMOUNT, EMPLOYEE.EMPLOYEE_NAME
FROM CUSTOMERS
INNER JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
INNER JOIN EMPLOYEE
ON ORDERS.OID = EMPLOYEE.EID;




-- Inner Join with WHERE Clause
-- Inner Join uses WHERE clause to apply constraints on the records to be retrieved from a table.
/*
Consider the previous two tables CUSTOMERS and ORDERS; and join them using the inner join query by applying 
some constraints using the WHERE clause.
*/

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, ORDERS.AMOUNT
FROM CUSTOMERS 
INNER JOIN ORDERS 
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
WHERE ORDERS.AMOUNT > 2000;

