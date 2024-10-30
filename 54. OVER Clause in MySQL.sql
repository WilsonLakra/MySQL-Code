# OVER Clause in MySQL
-- The OVER clause in MySQL is used with the PARTITION BY clause to break the data into partitions.

-- Syntax of OVER clause in MySQL.
/*
< function > OVER (
	[ PARTITION BY clause ]
	[ ORDER BY clause ]
	[ ROWS or RANGE clause ] )
*/


# Example: OVER clause in MySQL
-- Please use the below SQL Script to create the database and Employees table and populate the Employees table with sample data.

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employees
(
     ID INT PRIMARY KEY,
     Name VARCHAR(50),
     Department VARCHAR(50),
     Salary int
);


SELECT DATABASE();
SHOW TABLES;
DESC Employees;


INSERT INTO Employees Values (1001, 'Sambit', 'IT', 15000);
INSERT INTO Employees Values (1002, 'Santosh', 'IT', 35000);
INSERT INTO Employees Values (1003, 'Manoj', 'HR', 15000);
INSERT INTO Employees Values (1004, 'Rakesh', 'Payroll', 35000);
INSERT INTO Employees Values (1005, 'Hina', 'IT', 42000);
INSERT INTO Employees Values (1006, 'Bikash', 'HR', 15000);
INSERT INTO Employees Values (1007, 'Priya', 'HR', 67000);
INSERT INTO Employees Values (1008, 'Preety', 'Payroll', 67000);
INSERT INTO Employees Values (1009, 'Priyanka', 'Payroll', 55000);
INSERT INTO Employees Values (1010, 'Anurag', 'Payroll', 15000);
INSERT INTO Employees Values (1011, 'Rishav', 'HR', 55000);
INSERT INTO Employees Values (1012, 'Dravid', 'IT', 96000);


SELECT * FROM Employees;


/*
Our business requirement is to generate a report that should display the total number of employees in each department. 
Along with the total number of employees in each department, we also need to display the Total Salary, Average Salary, 
Minimum Salary, and Maximum Salary of each department.
*/

SELECT Department, 
	COUNT(*) AS TotalEmployees,
    SUM(Salary) AS TotalSalary,
    AVG(Salary) AS AverageSalary,
    MIN(Salary) AS MinSalary,
    MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department;




# Now our business requirement changes. 
-- Now we also want to show the non-aggregated values (Name and Salary) in the report along with the aggregated values

-- Now, you may be intended to use the below SQL query by adding the Salary, Name column in the select clause. But this is not going to be work

SELECT Name, Salary, Department, 
 COUNT(*) AS TotalEmployees, 
 SUM(Salary) AS TotalSalary,
 AVG(Salary) AS AverageSalary,
 MIN(Salary) AS MinSalary, 
 MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department;

/*
Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 
'employeedb.Employees.Name' which is not functionally dependent on columns in GROUP BY clause; 
this is incompatible with sql_mode=only_full_group_by	0.000 sec
*/


-- How to achieve the desired output?
-- We can get the desired output in two ways.

-- Solution1:
/*
One of the ways to get the desired output is by including all the aggregations in a subquery and
 then JOINING that subquery with the main query. The following example exactly does the same.
*/

SELECT Name, Salary, Employees.Department, 
 Departments.TotalEmployees,
 Departments.TotalSalary, 
 Departments.AverageSalary, 
 Departments.MinSalary, 
 Departments.MaxSalary   
FROM  Employees
INNER JOIN
( SELECT Department, COUNT(*) AS TotalEmployees,
  SUM(Salary) AS TotalSalary,
  AVG(Salary) AS AverageSalary,
  MIN(Salary) AS MinSalary, 
  MAX(Salary) AS MaxSalary
 FROM Employees
 GROUP BY Department) AS Departments
ON Departments.Department = Employees.Department;

-- Note: Now look at the number of SQL statements that we write.


-- Solution2:
/*
The second way is the most preferable way to get the desired output is by using the OVER clause combined with the PARTITION BY clause 
as shown in the below code.
*/

SELECT Name, Salary, Department,
	COUNT(Department) OVER(PARTITION BY Department) AS TotalEmployees,
    SUM(Salary) OVER(PARTITION BY Department) AS TotalSalary,
    AVG(Salary) OVER(PARTITION BY Department) AS AverageSalary,
    MIN(Salary) OVER(PARTITION BY Department) AS MinSalary,
    MAX(Salary) OVER(PARTITION BY Department) AS MaxSalary
FROM Employees;




