# Rank Function in MySQL
/*
The MySQL RANK Function is used to return sequential numbers starting from 1 based on the ordering of rows imposed by the ORDER BY clause. 
When you have two records with the same data, then it will give the same rank to both the rows.
*/

/*
For example, consider the set {25, 25, 50, 75, 75, 100}. For such a set, 
RANK() will return {1, 1, 3, 4, 4, 6} (note that the values 2 and 5 are skipped), whereas DENSE_RANK() will return {1,1,2,3,3,4}.
*/

-- Syntax of Rank Function in MySQL
/*
RABK()
	OVER (
		PARTITION_BY_clause
        ORDER_BY_clause
    )
*/


-- Parameters:
/*
1. The PARTITION BY clause is used to partition the result set into multiple groups. 
As it is optional, if you did not specify the PARTITION BY clause, then the RANK function will treat the entire result set as a single partition.

 2. The ORDER BY clause is also optional and this clause is used to define the sequence in which each row is going to assign their RANK i.e. number.
*/

-- Note: 
/* 
The RANK function in MySQL returns an increasing unique number for each row starting from 1 and the same for each partition. 
When there are duplicates or ties, the same rank will be assigned to all the duplicate rows or tie rows, 
but the next row after the duplicate or tie rows will have the rank it would have been assigned if there had been no duplicates. 
So, the RANK function skips rankings if there are duplicates or ties.
*/


# Examples to understand Rank function in MySQL:
-- Please use the below SQL Script to create the database and Employees table as well as populate the Employees table with the sample data.

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


# MySQL RANK Function without PARTITION BY Clause
/*
When we did not specify the PARTITION BY Clause, then the RANK function will treat the entire result set as a single partition and
 give consecutive numbering starting from 1 except when there is a tie.
*/

-- Here we use the Order by Clause on the Name column. So, it will give the rank based on the Name column.

SELECT EmployeeId, Department, Salary, EmployeeName,
	RANK() OVER (ORDER BY EmployeeName ASC) AS 'Rank'
FROM Employees;

-- Explanation
/*
Once you execute the above SQL query, you will get the following output. As you can see in the below output, there will be no partition and 
hence all the rows are assigned with consecutive integer numbers starting from 1 except when there is a tie i.e. for the Employee name David, 
and Smith, it gives the same rank to both the rows.
*/




# MySQL RANK Function with PARTITION BY clause:
--  When we specify the PARTITION BY Clause, then the result set is partitioned based on the column which we specify in the Partition BY clause.
-- (1)
SELECT EmployeeId, Department, Salary, EmployeeName,
	RANK() OVER  ( PARTITION BY Department  ORDER BY Salary ) AS 'Rank'
FROM Employees;

-- (2)
SELECT EmployeeId, Department, Salary, EmployeeName,
	RANK() OVER
    (
		PARTITION BY Department
        ORDER BY Salary
	) AS 'Rank'
FROM Employees;

-- Explanation
/*
As you can see, we have specified Department in the Partition By clause and Salary in the Order By clause. 
As in our Employees table, we have two departments (IT and HR). So, the Partition by Clause will divide the result set into two partitions.
 One partition is for IT department employees and the other partition is for the HR department employees. 
 Then on each partition, the data is sorted based on the Salary column. 
 The MySQL RANK function then gives an integer sequence number starting from 1 to each record in each partition except 
 when there is a tie. In the case of a tie, it gives the same rank and then skips the ranking.
*/




# Real-time Examples of RANK Functions in MySQL
/*
The RANK functions can be used to find the nth highest salary. Let us understand this with an example.
Suppose, there are 2 employees with the FIRST highest salary, then there might be 2 business scenarios as follows:

1. If your business requirement is not to produce any result for the SECOND highest salary then you have to use the MySQL RANK function.

2. If your business requirement is to return the next salary after the tied rows as the SECOND highest Salary, 
then you have to use the MySQL DENSE_RANK function and we will discuss the DENSE_RANK function in our next article.
*/


# Fetch the 2nd Highest Salary using the RANK function:
-- In our Employees table, we have 2 employees with the FIRST highest salary (80000), 
-- the Rank() function will not return any data for the SECOND highest Salary
-- (1)
WITH EmployeeCTE AS
(
	SELECT Salary,
    RANK() OVER (ORDER BY Salary DESC) AS Rank_Salary
	FROM Employees
)
SELECT Salary FROM EmployeeCTE WHERE Rank_Salary = 2 LIMIT 1;
-- Note:- Here Rank() function will not return SECOND higest salary because of duplicate or tie salary, skipping ranks

-- (2)
WITH RankedSalaries AS
(
    SELECT 
        Salary, 
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT Salary
FROM RankedSalaries
WHERE SalaryRank = 2;

-- Explanation:
/*
The RANK() function assigns a rank to each distinct salary in descending order.
Using a Common Table Expression (CTE) named RankedSalaries, we calculate the rank of each salary.
Finally, we filter the result where the rank is equal to 2, which will return the second-highest salary.

Note:-
The reason you're not seeing the second-highest salary might be because multiple employees have the same highest salary. 
The RANK() function assigns the same rank to employees with the same salary, skipping ranks. 
So, if the highest salary is repeated multiple times, there may be no distinct second rank.

For example, in your data:

Employees with Salary = 80000 are assigned Rank = 1.
The next salary (65000) will be assigned Rank = 2.
This means that the second highest salary may not appear because of this skip in ranking.
*/


-- To make sure this behavior is clearer, let's print out all ranks for the salaries:

WITH RankedSalaries AS
(
    SELECT 
        Salary, 
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT *
FROM RankedSalaries;




# Fetch the 3rd Highest Salary using the RANK function:

WITH EmployeeCTE AS
(
SELECT Salary,
	RANK() OVER (ORDER BY Salary DESC) AS Rank_Salary
    FROM Employees
)
SELECT Salary FROM EmployeeCTE WHERE Rank_Salary = 3 LIMIT 1;

-- O/P	68000



