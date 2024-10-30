# Assignment Operator in MySQL
-- The Assignment Operator in MySQL is used to assign or compare a value to a column or a field of a table. 
-- The equal sign (=) is the assignment operator where the value on the right is assigned to the value on the left. 
-- It is also used to establish a relationship between a column heading and the expression that defines the values for the column.


# Example to understand Assignment Operator in MySQL
-- Please execute the below SQL Script to create and populate the Product table with the required sample data.

CREATE DATABASE ShoppingCart;
USE ShoppingCart;


CREATE TABLE Product (
  ProductId INT PRIMARY KEY,
  CategoryId INT,
  Name VARCHAR(100),
  Price FLOAT
);


SELECT DATABASE();
SHOW TABLES;
DESC Product;


INSERT INTO Product VALUES (1, 1001, 'Android Phone', 250);
INSERT INTO Product VALUES (2, 1001, 'I7 Processor, 8GB RAM Laptop', 1500);
INSERT INTO Product VALUES (3, 1002, 'How to Train your Cat', 25);
INSERT INTO Product VALUES (4, 1002, 'Healthy Dog Food Recipes', 20);
INSERT INTO Product VALUES (5, 1003, 'Beautiful Black T-Shirts', 100);
INSERT INTO Product VALUES (6, 1003, 'Blue Colored Jeans', 150);


SELECT * FROM Product;
SELECT COUNT(*) FROM Product;


# Example: Update the Price of each product by adding 10
-- Now we will update the Price column of the Product table by using the equals operator as an assignment.

UPDATE Product SET Price = Price + 10;

SELECT * FROM Product;


# Also, we can use the same operator for comparing values.

UPDATE Product SET Price = Price * 1.02 WHERE ProductId = 6;

SELECT * FROM Product;


# Assigning Variables using Assignment Operator in MySQL
-- There are two ways to assign a value:

-- 1. By using SET statement: Using SET statement we can either use := or = as an assignment operator.
-- 2. By using SELECT statement: Using SELECT statement we must use := as an assignment operator because = operator is used for comparison in MySQL.

-- Syntax
/*
SET variableName = expression; where the variable name can be any variable created.
SELECT FieldName = expression; where field name can be any given name.
*/


# Example: Using SET Statement in MySQL

SET @MyCounter = 1;
SELECT @MyCounter ;

/*
In this example, first, we have created a variable @MyCounter and 
then we are using the assignment operator to set @MyCounter to a value returned by an expression.
*/


# Example: Using SELECT Statement in MySQL
-- Let’s get the most expensive item from the Product table and assigns the Price to the variable @ExpensiveItem.

SELECT @ExpensiveItem := MAX(Price) FROM Product;

SELECT * FROM Product;


