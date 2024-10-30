# Right Outer Join in MySQL
# What is Right Outer Join in MySQL?
/*
The Right Outer Join in MySQL is used to retrieve all the matching records from both the tables
 as well as all the non-matching records from the right-hand side table. In that case, the non-matching data will take a null value.
 The RIGHT OUTER JOIN or RIGHT JOIN keyword is used to perform the right join operation in MySQL.
 */
 
 
 # How to implement Right Outer Join in MySQL?
-- RIGHT JOIN Syntax
/*
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
*/


# When do we need to use Left JOIN in MySQL?
/*
If you want to retrieve all the matching rows from both the tables involved in the join as well as all the non-matching rows from the 
right-hand side table in the result set then you need to use Right Outer Join in MySQL. In that case, the non-matching rows will take a null value.
*/


# Example to Understand Right Outer Join in MySQL
/*
To understand Right Outer Join in MySQL, we are going to use the following Employee, Address, and Projects tables.
 Here, EmployeeId is the common column that is available in all three tables, and based on this EmployeeId column
 we are going to perform the Right Outer Join Operations.
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


# MySQL Right Outer Join Example:
-- Our requirement is to retrieve the EmployeeId, FullName, Technology, Gender, ProjectName from the Employee and Projects tables.
-- we want to retrieve all the Project details from the Projects table irrespective of whether the project is assigned to any employee or not.

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT p.ProjectId, p.ProjectName, e.EmployeeId, e.FullName, e.Technology, e.Gender
FROM Employee e 
RIGHT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;


-- We can also use the RIGHT JOIN keyword as shown in the below SQL Query and it will also give you the same result as the previous SQL Query.

SELECT p.ProjectId, p.ProjectName, e.EmployeeId, e.FullName, e.Technology, e.Gender
FROM Employee e 
RIGHT  JOIN Projects p 
ON e.EmployeeId = p.EmployeeId;


# MySQL Right Outer Join with Where Condition:
-- Our requirement is to retrieve all the Projects along with the Employee details from the Employee and 
-- Projects tables by using the Right Outer Join where the gender is Male. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT p.ProjectId, p.ProjectName, e.EmployeeId, e.FullName, e.Technology, e.Gender
FROM Employee e 
RIGHT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId 
WHERE e.Gender = 'Male';


# How to retrieve only the non-matching rows from the right table in MySQL?
/*
There are three projects which are not assigned to any employee. So, what our requirement is, we want to retrieve only those three projects
 from the Projects table. So, basically, we want to retrieve only the non-matching records from the right-side table. 
*/

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT p.ProjectId, p.ProjectName, e.EmployeeId, e.FullName, e.Technology, e.Gender
FROM Employee e 
RIGHT OUTER JOIN Projects p 
ON e.EmployeeId = p.EmployeeId
WHERE p.EmployeeId IS NULL;

-----------------------------------------------------------------------------------------------------------

CREATE DATABASE Comp;
USE Comp;

-- Assume we are creating a table named CUSTOMERS, which contains the personal details of customers including their name, age, address and salary etc.

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


-- Right join Query
-- Now, let us join these two tables using the Right Join query

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.AMOUNT, ORDERS.DATE
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID;




# Joining Multiple Tables with Right Join
-- Like Left Join, Right Join also joins multiple tables. 
-- However, the contrast occurs where the second table is returned as a whole instead of the first.

/*
Here, let us consider the previously created tables CUSTOMERS and ORDERS; along with the newly created table EMPLOYEE.
We will create the EMPLOYEE table using the query below −
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


-- Right Join Query
-- Let us join these three tables using the Right Join query given below −

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM EMPLOYEE;


SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, EMPLOYEE.EMPLOYEE_NAME
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
RIGHT JOIN EMPLOYEE
ON ORDERS.OID = EMPLOYEE.EID;




# Right Join with WHERE Clause
-- A WHERE Clause is used to filter out records that satisfy the condition specified by it.

/*
Records in the combined database tables can be filtered using the WHERE clause. 
Consider the previous two tables CUSTOMERS and ORDERS; and join them.
*/

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.DATE, ORDERS.AMOUNT
FROM CUSTOMERS
RIGHT JOIN ORDERS
ON CUSTOMERS.ID = ORDERS.CUSTOMER_ID
WHERE ORDERS.AMOUNT > 1000;




