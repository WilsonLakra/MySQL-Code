# Complex Views in MySQL
# What is a complex view in MySQL?
/*
When we created a view based on multiple tables in MySQL, then it is known as a complex view. 
In MySQL, on a complex view, we may or may not perform all DML operations, 
and more ever the complex view may not update the data correctly on the underlying base tables.
*/


# Example to Understand Complex View in MySQL:
-- Please use the following MySQL Script to create the Company database, Department, and Employee tables and populate these tables with sample data.

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


# Example: Complex View in MySQL
/*
Our business requirement is to create a view that should return the following ID, Name, Salary, DOB, Gender, DepartmentName result set 
by joining the Department and Employee database table.
*/

SELECT * FROM Department;
SELECT * FROM Employee;

CREATE VIEW vwEmployeesByDepartment2
AS
SELECT emp.ID, emp.Name, emp.Salary, CAST(emp.DOB AS Date) AS DOB, emp.Gender, dept.Name AS DepartmentName
FROM Employee emp 
INNER JOIN Department dept 
ON emp.DepartmentID = dept.ID;

--  Here the View is created based on two tables i.e. Department and Employee, thus we can call this view a complex view in MySQL.
SELECT * FROM vwEmployeesByDepartment2;




# Example: Incorrectly Updating data using MySQL Complex View
/*
Now, let us update, Sambit’s department, from IT to HR. You can observe in our database, at the moment, 
we have two employees (Pranaya and Sambit) belongs to the IT department. 
Now, execute the following UPDATE View statement to update Sambit’s department from IT to HR.
*/

SELECT * FROM vwEmployeesByDepartment2;
SELECT * FROM vwEmployeesByDepartment;

-- Once you update the Department Name of the employee Sambit from IT to HR, then make a select query on the view by executing the below statement.
UPDATE vwEmployeesByDepartment2 SET DepartmentName = 'HR' WHERE Name = 'Sambit';


-- In order to understand the reasons for the incorrect UPDATE, have a look at the Department and Employee table data and you will see the following.
SELECT * FROM Employee;
SELECT * FROM Department;

/* As you can see here, the UPDATE statement actually updated the Department Name from IT to HR in the Department table, 
instead of updating the DepartmentId column in the Employee table. */

/*
So, the conclusion is that If a view is created based on multiple tables in MySQL, and if we update the data using the view, then it may not 
update the underlying base tables correctly. To correctly update a view, that is based on multiple tables INSTEAD OF triggers are used.
*/




# Example2: Updating two tables data using MySQL Complex Views
/*
 Before starting the example, first correct the department table data i.e. change the department name to IT where ID is 1 in the Department table 
 by executing the below UPDATE statement.
*/

SELECT * FROM Department;

UPDATE Department SET Name = 'IT' WHERE ID = 1;


/*
Now, let us try to update the Salary and Department name of Priyanka i.e. we are trying the update the data from both the tables. 
Salary from Employee and Department Name from Department table. So, please try to execute the below UPDATE statement.
*/

SELECT * FROM vwEmployeesByDepartment2;

UPDATE vwEmployeesByDepartment2 SET 
Salary = 50000, DepartmentName = 'HR' 
WHERE Name = ' Priyanka';

/*
When you execute the above update statement, it will give you the following error. It clearly says that we cannot modify more than one base table
if the view is created through a join. In our example, the vwEmployeesByDepartment2 view is created through a join and 
we are trying to update the Department Name from the Department table and salary from the Employee table and hence we got the following error.
*/

-- Error Code: 1393. Can not modify more than one base table through a join view 'company.vwemployeesbydepartment2'




# Example3: Updating Data Correctly using MySQL Complex View
-- Now we want to update the Salary of Sambit from 27000 to 60000 using the view. So, execute the below UPDATE statement.

SELECT * FROM vwEmployeesByDepartment2;

UPDATE vwEmployeesByDepartment2 SET Salary = 60000 WHERE Name = 'Sambit';

--  It updates the Salary as expected in the Employee table. 
-- To check, retrieve the data from the Employee table by executing the below SELECT statement.

SELECT * FROM Employee;


-- Summary:
/*
1. In a complex view in MySQL, if your update statement affects one base table, then the update succeeded 
but it may or may not update the data correctly. In our case, Example1 updates the data incorrectly and Example3 updates the data correctly.

2. If your update statement affects more than one base table, then the update failed and you will get an error message. 
In our case, Example2 gives you an error.
*/


