# Cross Join in MySQL
-- The CROSS JOIN keyword returns all records from both tables (table1 and table2).

-- CROSS JOIN Syntax
/*
SELECT column_name(s)
FROM table1
CROSS JOIN table2;
*/


/*
The CROSS JOIN is created by using the CROSS JOIN keyword. The CROSS JOIN does not contain an ON clause. 
Unlike INNER JOIN, the CROSS-JOIN returns matched data rows as well as unmatched data rows from the table. 
When we combine two or more tables with each other without any condition (where or on) then we call such type of joins as cross join.
In Cross Join, each record of a table is joined with each record of the other table involved in the join.
*/


# Example to Understand CROSS JOIN in MySQL:
/*
A Cross Join in MySQL produces the Cartesian product of the tables involved in the join. 
The Cartesian product means the number of records present in the first table is multiplied by the number of records present in the second table.
*/

CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');


SELECT * FROM Employee;


SELECT DATABASE();
SHOW TABLES;
DESC Employee;
SHOW DATABASES;
USE Company;




CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
 EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);


SELECT DATABASE();
SHOW TABLES;
DESC Projects;


INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('Hosting account is not working', 3, 1001, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1008, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY));


SELECT * FROM Projects;


SELECT DATABASE();
SHOW TABLES;
DESC Projects;
SHOW DATABASES;
USE Company;


-- Please have a look at the below SQL query which is an example of Cross Join for joining the Employee and Projects Table.

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT e.Id  AS EmployeeId, e.Name, e.Department, e.City, p.Title AS Project
FROM Employee e
CROSS JOIN Projects p;

---------------------------------------------------------------------------------------------------

CREATE DATABASE Comp;
USE Comp;

--  let us first create a table named CUSTOMERS, which contains personal details of customers including their name, age, address and salary etc.

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
(2, 'Khilan', 25, 'Delhi', 1500.00 );


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
(100, '2009-10-08 00:00:00', 3, 1500.00),
(101, '2009-11-20 00:00:00', 2, 1560.00);


SELECT * FROM ORDERS;


-- Cross Join Query
-- Now, if we execute the following Cross Join query on these two tables given above, 
-- the cross join combines each row in CUSTOMERS table with each row in ORDERS table.

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.AMOUNT, ORDERS.DATE
FROM CUSTOMERS
CROSS JOIN ORDERS;




# Joining Multiple Tables with Cross Join
-- We can also join more than two tables using cross join.

/*
Let us now combine three tables CUSTOMERS, ORDERS and ORDER_RANGE, to demonstrate combining multiple tables using cross join.
We will create the ORDER_RANGE table using the query below −
*/

-- ORDER_RANGE Table

CREATE TABLE ORDER_RANGE (
   SNO INT NOT NULL,
   ORDER_RANGE VARCHAR (20) NOT NULL
);


SHOW TABLES;
DESCRIBE ORDER_RANGE;


-- Now, we can insert values into this empty tables using the INSERT statement as follows −

INSERT INTO ORDER_RANGE VALUES
(1, '1-100'),
(2, '100-200'),
(3, '200-300');


SELECT * FROM ORDER_RANGE;


-- CROSS JOIN Query
-- Now we use the following cross join query on the given tables,

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_RANGE;

SELECT CUSTOMERS.ID, CUSTOMERS.NAME, ORDERS.AMOUNT, ORDERS.DATE, ORDER_RANGE.ORDER_RANGE
FROM CUSTOMERS
CROSS JOIN ORDERS
CROSS JOIN ORDER_RANGE;



