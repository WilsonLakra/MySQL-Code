# MySQL EXISTS Operator
-- The EXISTS operator is used to test for the existence of any record in a subquery.
-- The EXISTS operator returns TRUE if the subquery returns one or more records.

-- It can be used in a SELECT, INSERT, UPDATE, or DELETE statement.

-- EXISTS Syntax
/*
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);
*/


# Understanding EXISTS Operator in MySQL with Examples:
-- Please use the below SQL Script to create and populate the Employee and Projects tables with the required data.

DROP TABLE employee;
SHOW TABLES;


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
DESC employee;


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
SELECT COUNT(*) FROM Employee;


CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
      Title VARCHAR(200) NOT NULL,
     ClientId INT,
 EmployeeId INT,
     StartDate DATETIME,
     EndDate DATETIME
);


INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));


SELECT * FROM Projects;
SELECT COUNT(*) FROM Projects;


# EXISTS Operator with SELECT Statement in MySQL
--  Now we need to retrieve only those employees from the employee table who are currently working on any of the active projects. 

SELECT * FROM Employee
WHERE EXISTS ( SELECT * FROM Projects
WHERE Employee.Id = Projects.EmployeeId);


# SQL statement to check whether an employee with ID 1004 Exists in the Employee table or not.

SELECT EXISTS ( SELECT * FROM Employee WHERE Id = 1004 ) AS 'Result';
-- we get 1 as output which means TRUE, which indicates that Id=1004 exists in the employee table.


SELECT EXISTS ( SELECT * FROM Employee WHERE ID = 1024 ) AS 'Result';
-- Here, we get 0 as output which means FALSE, which indicates that Id=1024 does not exist in the employee table.


# Difference Between Exists and IN Operator in MySQL
/*
1.	EXISTS is used to check the existence of data in a subquery whereas IN is used to minimize the multiple OR conditions.
2.	The EXISTS operator stopes its further execution once it finds the first true occurrence whereas 
		IN operator compares all the values present inside it.
3.	EXISTS operator does not perform a comparison between parent query and child query whereas 
		IN operator performs a comparison between parent query and child query.
*/


# NOT EXISTS Operator in MySQL
-- Return all records from the Employee table where there are no records in the Projects table for the matching employee ID column.

SELECT * FROM employee
WHERE NOT EXISTS ( SELECT * FROM Projects WHERE Employee.Id = Projects.EmployeeId);

--  In this case, we are using NOT EXISTS so we will get only the data records from the projects table, where the Id did not match. 


# EXISTS Operator in MySQL with Update SQL Statements
-- Let’s try to update the city of the employee whose client Id is 3.

-- Here SELECT statement used first to check which records would be affected by this UPDATE operation

SELECT * FROM Employee 
WHERE EXISTS ( SELECT * FROM Projects WHERE  ClientId = 3
AND City = "Bangalore" );


SELECT * FROM Projects ;
SELECT * FROM Employee;


SET SQL_SAFE_UPDATES = 0; -- To Enable unsafe mode

-- Here is the UPDATE query: 
UPDATE Employee 
SET City = 'Bangalore'
WHERE EXISTS ( 
    SELECT 1 
    FROM Projects 
    WHERE Projects.ClientId = 3 
    AND Projects.EmployeeId = Employee.Id 
);

-- Note: 
/*
The SELECT 1 just checks if any row exists in the Projects table where ClientId = 3 and Projects.EmployeeId = Employee.Id. 
If at least one such row exists, the EXISTS clause returns TRUE, and the corresponding Employee.City is updated. 
The 1 is used because the query doesn't need to return any specific column; it just needs to know whether a row exists or not.
*/


# EXISTS Operator in MySQL with Delete SQL Statements
-- Let’s delete the employee data that exist in the project table from the employee table. 
-- For this, use EXISTS operator in the WHERE clause of the DELETE statement

-- Here SELECT statement used first to check which records would be affected by this delete operation

SELECT * FROM employee 
WHERE EXISTS ( SELECT * FROM Projects WHERE Projects.EmployeeId = Employee.Id
AND Employee.City = "Bangalore" );


SELECT * FROM Projects;
SELECT * FROM Employee;


-- Here is the DELETE query: 
DELETE FROM  Employee 
WHERE EXISTS ( SELECT 1 FROM Projects WHERE Projects.EmployeeId = Employee.Id 
AND Employee.City = "Bangalore" );

-- Note:
/*
Here 1 , it acts as a simple placeholder. It doesn't actually return any meaningful data.
The 1 is a constant value and is often used in conjunction with EXISTS because the actual value selected is irrelevant.
*/


# EXISTS Operator in MySQL with INSERT SQL Statements
-- Now let’s try to archive employees who don’t have any projects in a separate table. 
-- For this, first, create a new table for archiving the employee by copying the structure from the “employee” table. 

-- The SQL statement is:— only the schema (structure) is copied.
CREATE TABLE Employee_Archive LIKE Employee;

SHOW TABLES;
DESC Employee_Archive;


-- Here SELECT statement used first to check employees who do not have any projects

SELECT * FROM Employee 
WHERE NOT EXISTS ( SELECT * FROM Projects WHERE Projects.EmployeeId = Employee.Id );


SELECT * FROM Employee;
SELECT * FROM Projects;

-- Now inserts employees who do not have any projects into the Employee_Archive table using the following INSERT statement. 

INSERT INTO Employee_Archive
SELECT * FROM Employee 
WHERE NOT EXISTS ( SELECT 1 FROM Projects WHERE Projects.EmployeeId = Employee.Id );


-- SQL Statement, now verify data INSERTED in the Employee_Archive table
SELECT * FROM Employee_Archive;


-- If you want to copy the data as well, you can use an additional query like this:
CREATE TABLE Employee_Archive2 LIKE Employee_Archive;
INSERT INTO Employee_Archive2 SELECT * FROM Employee_Archive;


SELECT * FROM Employee_Archive2;

-----------------------------------------------------------------------------------

-- MySQL Exists Operator
-- Here, we are creating the CUSTOMERS table −

CREATE TABLE CUSTOMERS (
   ID INT AUTO_INCREMENT,
   NAME VARCHAR(20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY DECIMAL (18, 2),
   PRIMARY KEY (ID)
);


-- The following query uses INSERT INTO statement to add 7 records into the above-created table −

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) VALUES 
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00 ),
(2, 'Khilan', 25, 'Delhi', 1500.00 ),
(3, 'Kaushik', 23, 'Kota', 2000.00 ),
(4, 'Chaitali', 25, 'Mumbai', 6500.00 ),
(5, 'Hardik', 27, 'Bhopal', 8500.00 ),
(6, 'Komal', 22, 'Hyderabad', 4500.00 ),
(7, 'Muffy', 24, 'Indore', 10000.00 );


SELECT DATABASE();
SHOW TABLES;
DESC CUSTOMERS;


SELECT * FROM CUSTOMERS;


-- Let us create another table named CARS, which contains the details such as ID of the customer, NAME and PRICE of the car −

CREATE TABLE CARS (
   ID INT NOT NULL,
   NAME VARCHAR(20) NOT NULL,
   PRICE INT NOT NULL,
   PRIMARY KEY (ID)
);


-- The following query inserts 3 records into the above-created table −

INSERT INTO CARS (ID, NAME, PRICE) VALUES
(2, 'Maruti Swift', 450000),
(4, 'VOLVO', 2250000),
(7, 'Toyota', 2400000);


SELECT DATABASE();
SHOW TABLES;
DESC CARS;


SELECT * FROM CARS;


-- EXISTS operator with SELECT statement
-- let us fetch the list of the customers with the price of the car greater than 2,000,000 −

SELECT * FROM CUSTOMERS
WHERE EXISTS (SELECT PRICE FROM CARS 
WHERE CARS.ID = CUSTOMERS.ID AND PRICE > 2000000 );


-- EXISTS Operator with UPDATE statement
-- We are using the EXISTS operator to UPDATE the name 'Kushal' to all of the customers whose ID is equal to the ID of the CARS table −

SELECT * FROM CUSTOMERS
WHERE EXISTS ( SELECT NAME FROM CARS WHERE CARS.ID = CUSTOMERS.ID );


UPDATE CUSTOMERS SET NAME = 'Kushal'
WHERE EXISTS ( SELECT NAME FROM CARS WHERE CARS.ID = CUSTOMERS.ID );


SELECT * FROM CUSTOMERS;
SELECT * FROM CARS;


-- EXISTS Operator with DELETE statement
-- We are deleting all the records from the CUSTOMERS table whose ID is equal to the ID in the CARS table having a price equal to 2,250,000 −

SELECT * FROM CUSTOMERS 
WHERE EXISTS ( SELECT * FROM CARS WHERE CARS.ID = CUSTOMERS.ID
AND CARS.PRICE = 2250000 );


DELETE FROM CUSTOMERS 
WHERE EXISTS ( SELECT * FROM CARS WHERE CARS.ID = CUSTOMERS.ID
AND CARS.PRICE = 2250000 );


-- NOT Operator with EXISTS Operator
-- we are fetching the NAME of the customers who have not bought any car −

SELECT * FROM CUSTOMERS 
WHERE NOT EXISTS ( SELECT * FROM CARS WHERE CUSTOMERS.ID = CARS.ID );




