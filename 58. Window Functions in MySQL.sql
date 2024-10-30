# MySQL Window Functions
# What is a MySQL window function?
/*
A window function performs a calculation across a set of table rows that are somehow related to the current row. 
No window function can be defined without an OVER clause; and in the OVER clause, there are the following possibilities:


-- The PARTITION BY clause is used to arrange rows together
-- The ORDER BY clause is used to sort result sets in ascending or descending order
-- ROWS or RANGE: Defines a specific frame relative to the current row, based on physical rows (ROWS) or value ranges (RANGE).
*/


-- Syntax:
-- The basic syntax for a window function in MySQL is as follows:
/*
window_function_name([expression]) OVER (
    [PARTITION BY expression]
    [ORDER BY expression [ASC|DESC]]
    [ROWS or RANGE frame_clause]
)
*/


-- Let us see the syntax of each expression used in the OVER clause:

# Partition Clause
-- This clause is used to divide or breaks the rows into partitions, and the partition boundary separates these partitions.
-- The syntax of this clause is given below:
/*
PARTITION BY <expression>[{,<expression>...}] 
*/
-- Note: In the partition clause, we can define one or more expressions that are separated by commas.


# ORDER BY Clause
-- This clause is used to specify the order of the rows within a partition. 
-- The following are the syntax of ORDER BY clause:
/*
ORDER BY <expression> [ASC|DESC], [{,<expression>...}]  
*/


# Frame Clause
-- A frame is the subset of the current partition in window functions. So we use frame clause to define a subset of the current partition.
-- The syntax of creating a subset of the current partition using frame clause is as follows:
/*
frame_unit {<frame_start>|<frame_between>}  
*/

/* In the syntax, the frame_unit that can be ROWS or RANGE is responsible for defining the type of relationship between 
the frame row and the current row. 
*/

/*
The frame_start and frame_between expressions are used to specify the frame boundary. The frame_start expression has three things:

UNBOUNDED PRECEDING: Here, the frame starts from the first row of a current partition.

N PRECEDING: Here, N is a literal number or an expression that evaluates in numbers. It is the number of rows before the first current row.

CURRENT ROW: It specifies the row of the recent calculation

The frame_between expression can be written as:

BETWEEN frame_boundary_1 AND frame_boundary_2  




The above expression can have one of the following things:

frame_start: We have already explained it previously.

UNBOUNDED FOLLOWING: It specifies the end of the frame at the final row in the partition.

N FOLLOWING: It is the physical N of rows after the first current row.

If the frame_definition is not specified in the OVER clause, then by default MySQL uses the below frame:

RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW  
*/


# Window Function Concept
-- We are going to see how we can use the window function in MySQL. So let us first create a table named "Sales" using the following statement:

CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Sales(  
    Employee_Name VARCHAR(45) NOT NULL,  
    Year INT NOT NULL,  
            Country VARCHAR(45) NOT NULL,  
    Product VARCHAR(45) NOT NULL,  
    Sale DECIMAL(12,2) NOT NULL,  
    PRIMARY KEY(Employee_Name, Year)  
);  


SELECT DATABASE();
SHOW TABLES;
DESC Sales;


-- Next, we have to add records into the table using INSERT statement as below:

INSERT INTO Sales(Employee_Name, Year, Country, Product, Sale)  
VALUES('Joseph', 2017, 'India', 'Laptop', 10000),  
('Joseph', 2018, 'India', 'Laptop', 15000),  
('Joseph', 2019, 'India', 'TV', 20000),  
('Bob', 2017, 'US', 'Computer', 15000),  
('Bob', 2018, 'US', 'Computer', 10000),  
('Bob', 2019, 'US', 'TV', 20000),  
('Peter', 2017, 'Canada', 'Mobile', 20000),  
('Peter', 2018, 'Canada', 'Calculator', 1500),  
('Peter', 2019, 'Canada', 'Mobile', 25000);  


-- To verify the records into a table, use the SELECT statement:

SELECT * FROM Sales;  


# To understand window function, let us first see how an aggregate function works in MySQL. 
-- The aggregate function evaluates multiple rows and produces the result set into one row. 
-- So, execute the below statement that uses the aggregate function "SUM" and returns the total sales of all employees in the given year:

SELECT SUM(Sale) AS Total_Sales FROM Sales; 


-- Again, we use the "SUM" function with the GROUP BY clause that works on the subset of rows. 
-- So, execute the below statement that returns the total sales of all products group by particular years:

SELECT Year, Product, SUM(Sale) AS Total_Sales   
FROM Sales   
GROUP BY Year   
ORDER BY Product;  

-- you can remove ONLY_FULL_GROUP_BY from the current SQL mode:
SET sql_mode = REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', '');

/*
In both examples, we can see that an aggregate function reduces the number of rows into a single row after the execution of the query.

Similar to aggregate function, window function also works with a subset of rows, but it does not reduce the result set into a single row. 
It means window functions perform operations on a set of rows and produces an aggregated value for each row. 
*/




# For example, execute the following statement that returns sales for each product along with total sales of the products by the given year:
-- Window function example

SELECT Year, Product, Sale, SUM(Sale)
	OVER(PARTITION BY Year) AS Total_Sales
FROM Sales;

/*
In the above example, we can see that the window operation uses an OVER clause, which is responsible for partitioning the query rows into groups 
that processed by the window function. Here, the OVER clause partitions rows by year and produces a sum on every partition. 
After successful calculation, it produces this sum corresponding to each partitioning row.
*/


SELECT Year, Product, Sale, SUM(Sale)
	OVER(PARTITION BY Year ORDER BY Product) AS Total_Sales
FROM SalesAnalytical Functions
;




# Types of Window Function
-- We can categorize the window functions mainly in three types that are given below:

-- 1. Aggregate Functions
/*
It is a function that operates on multiple rows and produces the result in a single row. Some of the important aggregate functions are:
COUNT, SUM, AVG, MIN, MAX, and many more.
*/


-- 2. Ranking Functions
/*
It is a function that allows us to rank each row of a partition in a given table. Some of the important ranking functions are:
RANK, DENSE_RANK, PERCENT_RANK, ROW_NUMBER, CUME_DIST, etc.
*/


-- 3. Analytical Functions
/*
It is a function, which is locally represented by a power series. Some of the important analytical functions are:
NTILE, LEAD, LAG, NTH, FIRST_VALUE, LAST_VALUE, etc.
*/


# Example of Analytical Function - NTILE
/*
Here, we are going to use the NTILE window function. 
This function takes an integer value as an argument that divides the group into a number of integer values. 

For example, if we use NTILE(4), then it divides the total records into four groups. 
When the total record is odd, it adds the odd records in the first row. The following query explains it more clearly.
*/

SELECT Year, Product, Sale,
NTILE(4) OVER() AS Total_Sales
FROM Sales;

-- Note: In the above output, we can see that we have a total of 9 rows. 
-- So, the NTILE function divides it into four rows, and one extra row will be added into the first row.


#  Example of Analytical Function - LEAD
/*
Let us see another example using the "LEAD" function. 
This function is used to query more than one row in a table without joining the table itself. 
It means we can access the data of the next row from the current row. It returns the output from the next row.
Execute the following statement to understand it more clearly:
*/

SELECT Year, Product, Sale, 
LEAD(Sale) OVER(ORDER BY Year) AS Total_Sales
FROM Sales;

-------------------------------------------------------------------------------------------------------

-- Here are examples of aggregate functions used with window functions for the provided Sales table:

# 1. SUM() with Window Function
-- This calculates the cumulative sales for each employee over the years:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	SUM(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Cumulative_Sale
FROM Sales;


# 2. AVG() with Window Function
-- This calculates the average sales for each employee up to the current row:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	AVG(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Average_Sales
FROM Sales;


# 3. MAX() with Window Function
-- This returns the maximum sale for each employee up to the current row:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	MAX(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Max_Sale
FROM Sales;


# 4. MIN() with Window Function
-- This calculates the minimum sale for each employee up to the current row:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	MIN(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Min_Sale
FROM Sales;


# 5. COUNT() with Window Function
-- This counts the number of sales for each employee up to the current row:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	COUNT(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Sales_Count
FROM Sales;




-- Here are examples of ranking functions used with window functions for the provided Sales table:

# 1. ROW_NUMBER() with Window Function
-- This assigns a unique row number to each sale for each employee, ordered by year:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	ROW_NUMBER() OVER(PARTITION BY Employee_Name ORDER BY Year) AS Row_Num
FROM Sales;


# 2. RANK() with Window Function
-- This ranks the sales for each employee, ordered by year, allowing for gaps in ranking if there are ties

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	RANK() OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Rank'
FROM Sales;


# 3. DENSE_RANK() with Window Function
-- This ranks the sales for each employee, but unlike RANK(), it does not leave gaps in the ranking:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	DENSE_RANK() OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Dense_Rank'
FROM Sales;


# 4. PERCENT_RANK() with Window Function
-- This calculates the relative rank of each sale for each employee, expressed as a percentage. 
-- The first row has a rank of 0, and the last row has a rank of 1.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	PERCENT_RANK() OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Percent_Rank'
FROM Sales;


# 5. CUME_DIST() with Window Function
-- This calculates the cumulative distribution of a sale for each employee, 
-- showing the proportion of rows that are less than or equal to the current row.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	CUME_DIST() OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Cume_Dist'
FROM Sales;




-- Here are examples of analytical functions used with window functions for the provided Sales table:

# 1. LEAD() with Window Function
-- This returns the sale value from the next row within the same partition (based on year order). 
-- It helps in comparing the current row's sale with the next year's sale for the same employee.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	LEAD(Sale, 1) OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Next_Year_Sale'
FROM Sales;


# 2. LAG() with Window Function
-- This returns the sale value from the previous row within the same partition (based on year order). 
-- It helps in comparing the current row's sale with the previous year's sale for the same employee.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	LAG(Sale, 1) OVER(PARTITION BY Employee_Name ORDER BY Year) AS 'Previous_Year_Sale'
FROM Sales;


# 3. FIRST_VALUE() with Window Function
-- This returns the first sale value in the current partition, which is useful for referencing the first sale for each employee over the years.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	FIRST_VALUE(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year) AS First_Sale
FROM Sales;


# 4. LAST_VALUE() with Window Function
-- This returns the last sale value in the current partition based on the order specified, showing the last sale for each employee.

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	LAST_VALUE(Sale) OVER(PARTITION BY Employee_Name ORDER BY Year ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Last_Sale
FROM Sales;


# 5. NTH_VALUE() with Window Function
-- This function returns the nth value from the ordered set of a partition. For example, you can retrieve the 2nd sale value for each employee:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	NTH_VALUE(Sale, 2) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Second_Sale
FROM Sales;

-- Note: In this query, NTH_VALUE(Sale, 2) returns the second sale value based on the order of the year for each employee.


# 6. NTILE() with Window Function
-- This function distributes the rows in a partition into a specified number of roughly equal-sized groups. 
-- For example, dividing each employee's sales into 3 groups:

SELECT * FROM Sales;

SELECT Employee_Name, Year, Sale,
	NTILE(3) OVER(PARTITION BY Employee_Name ORDER BY Year) AS Sales_Group
FROM Sales;

-- Note: In this query, NTILE(3) divides the sales of each employee into 3 ranked groups based on the order of the year.


