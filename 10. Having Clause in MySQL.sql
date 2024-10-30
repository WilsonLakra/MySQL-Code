# MySQL HAVING Clause
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

-- HAVING Syntax:
/*
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
*/
-- Another Syntax:
/*
SELECT expression1, expression2, expression_n
		aggregate_function(expression)
FROM tables
[WHERE condition]
GROUP BY expression1, expression2, expression_n
HAVING having_condition;
*/

# What is a Having Clause in MySQL?
-- The Having Clause in MySQL is also used for filtering the data just like the where clause. 
-- Having Clause in MySQL filters the rows from the intermediate result set 
-- that is built by using the FROM, WHERE, or GROUP BY clauses in a SELECT statement.

-- The Having Clause in MySQL is typically used with a GROUP BY clause. 

# Why do we need Having Clause in MySQL?
-- The WHERE clause could not be used with aggregate data rows, hence the HAVING clause was added to SQL.
-- The purpose of the HAVING clause is to filter the group rows produced by the GROUP BY clause.

-- The HAVING clause is the same as the WHERE clause. 
-- The only difference is WHERE clause FILTERS the intermediate data results, while the HAVING clause operates on group rows. 

-- Examples to Understand Having Clause in MySQL:
-- Please use the following SQL Script to create the company database and employee table with the required records.


DROP TABLE employee;
SHOW TABLES;


CREATE DATABASE company;
USE company;
CREATE TABLE employee (
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


INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'Delhi');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Manoj Tripathy', 'HR', 85000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Mitali Rout', 'Finance', 70000, 'Female', 26, 'Mumbai');


SELECT DATABASE();
SHOW DATABASES;
USE company;
SHOW TABLES;
DESC employee;

SELECT * FROM employee;
SELECT COUNT(*) FROM employee;


# Filtering Groups in MySQL:
-- Find the total salary given to all employees who are working in London Here,
-- we can achieve this using two ways i.e. using the Where and Having clause. 
-- The Where clause is used to filter the rows before aggregation, whereas the Having clause is used to filter the groups that mean after aggregations.

-- Filtering rows using WHERE clause
SELECT City, SUM(Salary) AS Total_Salary
FROM employee
WHERE City = 'London'
GROUP BY City = 'London';


-- Filtering groups using the HAVING clause
SELECT City, SUM(Salary) AS Total_Salary
FROM employee
GROUP BY City 
Having City = 'London';

-- Note: from the performance point of view, the HAVING is slower than the WHERE clause, and the having clause should be avoided if possible.


# Having Clause Using SUM Function in MySQL:
-- Our requirement is the find all the departments whose total salary greater than 170000. 
-- So, we need to group the employees by department and 
-- The Having Clause will filter the results so that only departments with a total Salary greater than 140000 will be returned. 

SELECT Department, SUM(Salary) AS Total_Salary
FROM employee
GROUP BY Department
HAVING SUM(Salary) > 170000;


# Having Clause Using COUNT Function in MySQL:
-- Our requirement is the find all the departments whose total number of employees working in that department is greater than 5.

SELECT * FROM Employee;

SELECT Department, COUNT(*) AS "Number of employee"
FROM employee
GROUP BY Department
Having count(*) > 5;


SELECT Department, COUNT(Id) AS "Number of employees"
FROM employee
GROUP BY Department
HAVING COUNT(Department) > 5;


# Having Clause using AVG Function in MySQL:
-- Our requirement is the find all the departments whose average Salary is more than 50000.
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 50000; 

------------------------------------------------------------------------------

-- HAVING clause with ORDER BY clause
-- we are retrieving all the records from the employee table where the sum of their SALARY is less than 45400, 
-- ordered by their name in ascending order −

SELECT * FROM Employee;

SELECT Name, SUM(Salary) AS Total_Salary
FROM Employee
GROUP BY Name
HAVING SUM(Salary) < 45400
ORDER BY Name ASC;


-- HAVING clause with COUNT() function
-- we are fetching a record where the count of similar age is greater than or equal to 2.
SELECT Age
FROM employee
GROUP BY Age
HAVING COUNT(Age) >= 2;

-- There are four record that have simillar age reparted more than or equal to two times.


-- HAVING clause with AVG() function
-- we are trying to return the names of the employee whose AVG salary is greater than 45000 −
SELECT Name, AVG(Salary) AS AVG_Salary
FROM Employee
GROUP BY Name 
HAVING AVG(Salary) > 45000;


-- HAVING clause with MAX() function
-- we are retrieving the employee names whose maximum SALARY is less than 40000 −
SELECT Name, MAX(Salary) AS MAX_Salary
FROM Employee
GROUP BY Name 
HAVING MAX(Salary) < 40000;

