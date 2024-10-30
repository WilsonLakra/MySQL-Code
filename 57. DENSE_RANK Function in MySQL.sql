# DENSE_RANK Function in MySQL
/*
The MySQL DENSE_RANK Function is used to return sequential numbers starting from 1 based on the ordering of rows imposed by the ORDER BY clause. 
When you have two records with the same data, then it will give the same rank to both the rows.
*/

/*
For example, consider the set {25, 25, 50, 75, 75, 100}. For such a set, 
RANK() will return {1, 1, 3, 4, 4, 6} (note that the values 2 and 5 are skipped), whereas DENSE_RANK() will return {1,1,2,3,3,4}.
*/

-- Syntax of DENSE_RANK Function in MySQL
/*
DENSE_RANK()
	OVER (
		PARTITION_BY_clause
        ORDER_BY_clause
    )
*/


-- Parameters:
/*
1. The PARTITION BY clause is used to partition the result set into multiple groups. As it is optional, if you did not specify the 
 PARTITION BY clause, then the DENSE_RANK function will treat the entire result set as a single partition. 
 
2.The ORDER BY clause is also optional and this clause is used to define the sequence in which each row is going to assign their DENSE RANK i.e. number.
*/

-- Note: 
/*
The DENSE RANK function in MySQL returns an increasing unique number for each row starting from 1 and the same for each partition. 
When there are duplicates or ties, the same rank will be assigned to all the duplicate rows, 
but the next row after the duplicate or tie rows have been assigned with the immediate next rank. 
So, the DENSE_RANK function will not skip ranking if there are duplicates or tie rows.
*/


# Examples to understand the Dense Rank function in MySQL:
-- Please use the following SQL Script to create the database and Employees table as well as populate the Employees table with the required sample data.

CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employees
(
    EmployeeId INT PRIMARY KEY,
    EmployeeName VARCHAR(50), 
    Department VARCHAR(10),
    Salary INT
);


SELECT DATABASE();
SHOW TABLES;
DESC Employees;


Insert Into Employees Values (1, 'James', 'IT', 80000);
Insert Into Employees Values (2, 'Taylor', 'IT', 80000);
Insert Into Employees Values (3, 'Pamela', 'HR', 50000);
Insert Into Employees Values (4, 'Sara', 'HR', 40000);
Insert Into Employees Values (5, 'David', 'IT', 35000);
Insert Into Employees Values (6, 'Smith', 'HR', 65000);
Insert Into Employees Values (7, 'Ben', 'HR', 65000);
Insert Into Employees Values (8, 'Stokes', 'IT', 45000);
Insert Into Employees Values (9, 'David', 'IT', 35000);
Insert Into Employees Values (10, 'Smith', 'HR', 65000);
Insert Into Employees Values (11, 'John', 'IT', 68000);


SELECT * FROM Employees;


# MySQL DENSE_RANK Function without PARTITION BY Clause
/*
When we did not specify the PARTITION BY Clause, then the DENSE_RANK function will treat the entire result set as a single partition and 
give consecutive numbering starting from 1 except when there is a tie.
*/

-- Here we use the Order by Clause on the Name column. So, it will give the rank based on the Name column.

SELECT EmployeeId, Department, Salary, EmployeeName,
	DENSE_RANK() OVER (ORDER BY EmployeeName ) AS 'DenseRank'
FROM Employees;
    
-- Explanation
/*
Once you execute the above SQL query, you will get the following output. As you can see in the below output, 
there will be no partition and hence all the rows are assigned with consecutive integer numbers starting from 1 except when 
there is a tie i.e. for the Employee name David, and Smith, it gives the same rank to both the rows.
*/
    



# MySQL DENSE_RANK Function with PARTITION BY clause:
-- When we specify the PARTITION BY Clause, then the result set is partitioned based on the column which we specify in the Partition BY clause.

SELECT EmployeeId, Department, Salary, Department, 
	DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary) AS 'DenseRrank'
FROM Employees;

-- Explanation
/*
As in our Employees table, we have two departments (IT and HR). So, the Partition by Clause will divide the result set into two partitions.
 One partition is for IT department employees and the other partition is for the HR department employees. 
 Then on each partition, the data is sorted based on the Salary column. The MySQL DENSE_RANK function is then applied on each partition and 
 gives an integer sequence number starting from 1 to each record except when there is a tie. In the case of a tie, it gives the same rank and 
 then continues with the sequence without skipping any rank or number.
*/




# What is the difference between Rank and Dense_Rank functions?
-- Rank function skips ranking(s) if there is a tie whereas the Dense_Rank will not skip the ranking in MySQL.


# Real-time Examples of DENSE_RANK Functions in MySQL
/*
The DENSE_RANK functions can be used to find the nth highest salary. Let us understand this with an example.
Suppose, there are 2 employees with the FIRST highest salary, then there might be 2 business scenarios as follows:

1. If your business requirement is not to produce any result for the SECOND highest salary then you have to use the RANK function.

2. If your business requirement is to return the next salary after the tied rows as the SECOND highest Salary, then you have to use the DENSE_RANK function.
*/


# Fetch the 2nd Highest Salary using the DENSE RANK function:
-- As we have 2 Employees with the FIRST highest salary i.e. 80000, 
-- the Dense_Rank() function will return the next Salary after the tied rows as the SECOND highest Salary i.e. 68000.

WITH EmployeeCTE  AS
(
    SELECT Salary,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank_Salary
    FROM Employees
)
SELECT Salary FROM EmployeeCTE WHERE Rank_Salary = 2 LIMIT 1;	

-- O/P	68000




# Example to find the nth Highest Salary Department wise:
-- You can also use the DENSE_RANK functions in MySQL to find the nth highest Salary department-wise.
-- For example, if someone asks you to find the 3rd highest salary of the HR Department.

WITH EmployeeCTE AS
(
	SELECT Salary, Department,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Salary_Rank
    FROM Employees
)
SELECT Salary FROM EmployeeCTE WHERE Salary_Rank = 3 AND Department = 'HR' LIMIT 1;

-- O/P 40000

