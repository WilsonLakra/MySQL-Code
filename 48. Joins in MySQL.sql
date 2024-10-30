# MySQL Joins
-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

# Supported Types of Joins in MySQL
/*
INNER JOIN: Returns records that have matching values in both tables
LEFT JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
CROSS JOIN: Returns all records from both tables
SELF JOIN: A self join is a regular join, but the table is joined with itself.
*/


# Examples to Understand Joins in MySQL:
-- Please use the following SQL Script to create the database and tables also populate the database table with the required data.

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


# Inner Join in MySQL
-- The INNER JOIN keyword selects records that have matching values in both tables.

-- INNER JOIN Syntax
/*
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
*/


# Inner Join Example in MySQL:
/*
 Here is an example of MySQL INNER join. We need to retrieve EmployeeId, Name, Department, City, Title as Project, and 
 ClientId from the Employee  and Projects tables.
 */
 
SELECT * FROM Employee;
SELECT * FROM Projects;
 
SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
INNER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;



-- Standard Query of INNER JOIN
SELECT 
    e.Id AS EmployeeId,
    e.Name,
    e.Department,
    e.City,
    p.Title AS Project,
    p.ClientId
FROM 
    Employee e
INNER JOIN 
    Projects p
ON 
    e.Id = p.EmployeeId;


/* 
Instead of using the INNER JOIN keyword, you can also use the JOIN keyword as shown in the below SQL Query, 
and also you will get the same output as the previous one.
*/

SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
JOIN Projects 
ON Employee.Id = Projects.EmployeeId;
 
 
 
 -- Standard Query of JOIN
 SELECT 
    e.Id AS EmployeeId,
    e.Name,
    e.Department,
    e.City,
    p.Title AS Project,
    p.ClientId
FROM 
    Employee e
JOIN 
    Projects p
ON 
    e.Id = p.EmployeeId;

 
 /*
 Note: In MySQL, JOIN or INNER JOIN means the same i,e. they perform the Inner Join Operation. 
 But it recommended to use the INNER JOIN keyword as it explicitly specifies the type of join we are performing.
 */
 
 
 # Outer Join in MySQL
/*
 Outer join is again classified into three types.

1. Left outer join
2. Right outer join
3. Full outer join (MySQL doesn’t support FULL OUTER JOIN; we will achieve the FULL OUTER JOIN using UNION Operator in MySQL)
*/


# Left Outer Join in MySQL
-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records (if any) from the right table (table2).

-- LEFT JOIN Syntax
/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
*/


# Example to Understand Left Outer Join in MySQL
-- Now, we need to write a query to retrieve EmployeeId, Name, Department, City, and Title as Project from the Employee and Projects tables. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT Employee.Id, Name, Department, City, Title AS Project, Projects.EmployeeId
FROM Employee
LEFT OUTER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;


/*
Instead of using the LEFT OUTER JOIN keyword, you can also use the LEFT JOIN keyword as shown in the below SQL Query, 
and also you will get the same output as the previous one.
*/

SELECT Employee.Id, Name, Department, City, Title AS Project, Projects.EmployeeId
FROM Employee
LEFT JOIN Projects 
ON Employee.Id = Projects.EmployeeId;




# Right Outer Join in MySQL
-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records (if any) from the left table (table1).

-- RIGHT JOIN Syntax
/*
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
*/


# Example to Understand Right Outer Join in MySQL
-- Now, we need to write a query to retrieve EmployeeId, Name, Department, City, and Title as Project from the Employee and Projects tables.

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT Employee.Id AS EmployeeId, Name, Department, City, Title AS Project 
FROM Employee
RIGHT OUTER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;


/*
Instead of using the RIGHT OUTER JOIN keyword, we can also use the RIGHT JOIN keyword as shown in the below SQL Query,
 and also you will get the same output as the previous one.
*/

SELECT Employee.Id AS EmployeeId, Name, Department, City, Title AS Project
FROM Employee
RIGHT JOIN Projects
ON Employee.Id = Projects.EmployeeId;




# Full Outer Join in MySQL
/*
The FULL OUTER JOIN retrieves all the matching rows from both the tables as well as non-matching rows from both the tables involved in the Join.
 In this case, the un-matching data will take a null value. MySQL doesn’t support FULL OUTER JOIN; we will achieve the FULL OUTER JOIN using 
 UNION Operator in MySQL. 
*/

-- The syntax to achieve Full Outer Join in MySQL using the UNION operator is given below.
/*
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name

[UNION | UNION ALL]

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
*/


# Example to Understand Full Outer Join in MySQL
--  Now, we need to write a query to retrieve EmployeeId, Name, Department, City, and Title as Project from the Employee and Projects tables. 

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT Employee.Id AS EmployeeId, Name, Department, City, Title AS Project
FROM Employee 
LEFT JOIN  Projects
ON Employee.Id = Projects.EmployeeId
UNION 
SELECT Employee.Id AS EmployeeId, Name, Department, City, Title AS Project
FROM Employee 
RIGHT JOIN  Projects
ON Employee.Id = Projects.EmployeeId;

-- Note:  Further, there is no Full Outer Join Keyword, instead, using the UNION operator we can achieve Full Outer Join.




# Cross Join in MySQL
-- The CROSS JOIN keyword returns all records from both tables (table1 and table2).

-- CROSS JOIN Syntax
/*
SELECT column_name(s)
FROM table1
CROSS JOIN table2;
*/

/*
When we combine two or more tables with each other without any condition (where or on) then we call such type of joins as cross join. 
In Cross Join, each record of a table is joined with each record of the other table involved in the join.

A Cross Join in MySQL produces the Cartesian product of the tables involved in the join. 
The Cartesian product means the number of records present in the first table is multiplied by the number of records present in the second table. 
*/


# Example to Understand CROSS JOIN in MySQL:
-- Please have a look at the below SQL query which is an example of Cross Join for joining the Employee and Projects Table.

SELECT * FROM Employee;
SELECT * FROM Projects;

SELECT Employee.Id AS EmployeeId, Name, Department, City, Title AS Project
FROM Employee 
CROSS JOIN Projects;

