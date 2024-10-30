# Advantages and Disadvantages of Views in MySQL
-- We are going to use the following Department and Employee table to understand the advantages of using views in MySQL.

-- Please use the below SQL Script to create the Company database, Department and Employee database table,s and 
-- populate the Department and Employee table with sample data.

CREATE DATABASE Company;
USE Company;

-- Create Department Table
CREATE TABLE Department
(
 ID INT PRIMARY KEY,
 Name VARCHAR(50)
);


SELECT DATABASE();
SHOW TABLES;
DESC Department;


-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'IT');
INSERT INTO Department VALUES(2, 'HR');
INSERT INTO Department VALUES(3, 'Sales');

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM Department;




-- Create Employee Table
CREATE TABLE Employee
(
 ID INT PRIMARY KEY,
 Name VARCHAR(50),
 Gender VARCHAR(50),
 DOB DATETIME,
 Salary DECIMAL(18,2),
 DepartmentID INT
);


SELECT DATABASE();
SHOW TABLES;
DESC Employee;


-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 25000, 1);
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 30000, 2);
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060',40000, 2);
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 35000, 3);
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 27000, 1);
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 33000, 2);

-- To verify the records into a table, use the SELECT statement:
SELECT * FROM Employee;




-- Remove the Foreign Key Constraint: 
-- Drop the foreign key constraint in the projects table that links it to the employee table.
ALTER TABLE projects DROP FOREIGN KEY projects_ibfk_1;

-- Drop the projects Table First (if you no longer need it): 
-- If the projects table is no longer required, you could drop it first, which would remove any dependencies on the employee table.
DROP TABLE projects;
DROP TABLE employee;

-- To check for foreign key constraints on a table in MySQL, you can use the following methods:
-- Using SHOW CREATE TABLE Command
-- This command displays the table's creation statement, including any foreign key constraints
SHOW CREATE TABLE projects;




# Advantages of views in MySQL
-- Following are the advantages of using Views in MySQL Database.
/*
1. Hiding the complexity of a Complex SQL Query
2. Implementing Row and Column Level Security.
3. Presenting the aggregated data by hiding the detailed data.
*/


# (1).  Hiding the complexity of a Complex SQL Query using View in MySQL
/*
In MySQL, we can use the Views to reduce the complexity of a Complex SQL Query for non-IT users. 
Let us create a view that will retrieve the data from both the Department and Employee table by executing the below SQL Statement.
*/

SELECT * FROM Department;
SELECT * FROM Employee;

CREATE VIEW vwEmployeesByDepartment
AS 
SELECT emp.ID, emp.Name, emp.Salary, emp.Gender, dept.Name AS DepartmentName
FROM Employee emp
INNER JOIN Department dept
ON emp.DepartmentID = dept.ID;

-- As you can see in the above query, the vwEmployeesByDepartment view hides the complexity of MySQL joins. 
-- Now, the Non-IT users find it very easy to query the view as a single table as shown below rather than writing the complex inner joins.

SELECT * FROM vwEmployeesByDepartment;




# (2A). Implementing Row Level Security using MySQL Views:
/*
Let us understand how to implement the Row Level Security using MySQL Views with an example. 
Suppose, we want the end-user to access only the IT Department employees from our Employee and Department table. 
If you grant access to the Employee and Department tables directly, 
then the end-user will be able to access the information of all the department employees. To restrict this, 
what we can do is, we will create a view, which will return only the IT Department employees, 
and then grant the user to access the view rather than the Employee and Department tables. 
Let us create a view in MySQL that only returns the IT department employees from Employee and Department tables:
*/

SELECT * FROM Department;
SELECT * FROM Employee;

CREATE VIEW vwITDepartmentEmployees
AS
SELECT emp.ID, emp.Name, emp.Salary, emp.Gender, dept.Name AS DepartmentName
FROM Employee emp
INNER JOIN Department dept
ON emp.DepartmentID = dept.ID
WHERE dept.Name = 'IT';

-- Now if we query the above vwITDepartmentEmployees view by executing the below SELECT statement, 
-- then you will only get the IT Department employees.

SELECT * FROM vwITDepartmentEmployees;




# (2B). Implementing Column Level Security using Views in MySQL:
/*
As we know for any organization, Salary is a piece of confidential information and should not be disposed. 
So, what we want is, we want to prevent access to the Salary column of the Employee table. 
If we provide direct access to the Employee and Department table, then the user can view the salary of any employees. 
To restrict this, what we can do is, we will create a view by excluding the Salary column, and 
then grant the end-user access to the view rather than the Employee and Department tables. 
Let’s create a view that will return all columns except the Salary column from the Employee and Department tables by executing the below SQL statement.
*/

SELECT * FROM Department;
SELECT * FROM Employee;

CREATE VIEW vwEmployeesWithoutSalary
AS
SELECT emp.ID, emp.Name, emp.Gender, emp.DOB, dept.Name AS DepartmentName
FROM Employee emp
INNER JOIN Department dept
ON emp.DepartmentID = dept.ID;

-- Now if we query the above vwEmployeesWithoutSalary view by executing the below SELECT statement, 
 -- then you will get the employee’s information without Salary detail.

SELECT * FROM vwEmployeesWithoutSalary;




# (3). Presenting Aggregated data by Hiding Detailed data by Using Views:
/*
The Views in MySQL can also be used to present only the aggregated data and hide the detailed information. 
Let’s create a view that will return the total number of employees by the department by executing the below SQL Statement.
*/

SELECT * FROM Department;
SELECT * FROM Employee;

CREATE VIEW vwEmployeesCountByDepartment
AS
SELECT dept.Name AS DepartmentName, COUNT(*) AS TotalEmployees
FROM Employee emp
INNER JOIN Department dept
ON emp.DepartmentID = dept.ID
GROUP BY dept.Name;

/*
Now if we query the above vwEmployeesCountByDepartment view by executing the below SELECT statement, then you will only get aggregated data.
*/

SELECT * FROM vwEmployeesCountByDepartment;




# Limitations and Disadvantages of Views in MySQL
/*
The following are the limitations and Dis-Advantages of Views in MySQL

1. We cannot pass parameters to SQL Server views
2. We cannot use an Order By clause with views without specifying FOR XML, OFFSET or LIMIT
3. The Views cannot be created based on Temporary Tables in MySQL
4. We cannot associate Rules and Defaults with MySQL views
*/
