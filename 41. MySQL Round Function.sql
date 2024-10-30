# MySQL ROUND() Function
-- The ROUND() function rounds a number to a specified number of decimal places.

-- Syntax
/*
ROUND(number, decimals)
*/

/*
Parameter	Description
number		Required. The number to be rounded
decimals	Optional. The number of decimal places to round number to. If omitted, it returns the integer (no decimals)
*/

-- Note: If decimals are a negative number, then the ROUND function will make digits to the left of the decimal place 0 values.


# Example: Rounding off a number when Decimal is not specified.
-- Positive Number:
SELECT ROUND(50.55) AS Round_Number;		-- O/P 	51


-- Negative Number:
SELECT ROUND(-15.25) AS Round_Number;		-- O/P 	-15


# Example: Rounding off a number when the decimal is positive.
-- Rounding a Positive number up to 3 decimal places
SELECT ROUND(22516.67519, 3) AS Round_Number;		-- O/P 	22516.675


# Rounding a Negative number up to 3 decimal places
SELECT ROUND(-22516.67519, 3) AS Round_Number;		-- O/P 	-22516.675


# Example: Rounding off a number when the decimal is negative.
-- Rounding a Positive number up to 2 decimal places
SELECT ROUND(22516.67519, -2) AS Round_Number;		-- O/P 	22500


-- Rounding a Negative number up to 3 decimal places
SELECT ROUND(-22516.67519, -3) AS Round_Number;		-- O/P 	-23000


# Example: Rounding off a number to 0 decimal places.
-- Rounding a Positive number up to 0 decimal places
SELECT ROUND(123.456, 0);		-- O/P 	123

-- Rounding a Negative number up to 0 decimal places
SELECT ROUND(-123.456, 0);		-- O/P 	-123




# Working with database table:
-- Please use the below SQL Script to create and populate the Product table with the required sample data.

CREATE TABLE Product(
    ProductId INT PRIMARY KEY, 
    ProductName VARCHAR(100) NOT NULL,
    BuyingPrice DECIMAL(13, 6) NOT NULL,
    SellingPrice DECIMAL(13, 6) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC Product;


INSERT INTO Product VALUES (1001, 'Mobile', 1060.865460, 1950.675400);
INSERT INTO Product VALUES (1002, 'iPhone', 2000.154300, 3050.986700);
INSERT INTO Product VALUES (1003, 'Laptop', 4000.874300, 5070.786500);
INSERT INTO Product VALUES (1004, 'Desktop', 2090.654300, 3050.896500);
INSERT INTO Product VALUES (1005, 'TV', 5900.543280, 7010.654700);
INSERT INTO Product VALUES (1006, 'AC', 4000.353200, 4500.125400);
INSERT INTO Product VALUES (1007, 'Cooler', 5010.768900, 6000.873200);


SELECT * FROM Product;


SELECT DATABASE();
SHOW TABLES;
DESC Product;
SHOW DATABASES;
USE Company;


# Now, we are going to find the rounded values for the Price column of the Product table

SELECT ProductId, ProductName, 
BuyingPrice, 
ROUND(BuyingPrice, 2) AS Rounded_BuyingPrice, 
SellingPrice, 
ROUND(SellingPrice, 2) AS Rounded_SellingPrice
FROM Product;

-----------------------------------------------------------------------------------------------------

-- Here are some examples of using the MySQL ROUND() function with your Product table to round decimal values.(ChatGPT)

-- 1. Round the Buying Price to 2 Decimal Places
-- This query rounds the BuyingPrice of each product to 2 decimal places.

SELECT ProductName, ROUND(BuyingPrice, 2) AS RoundedBuyingPrice FROM Product;


-- 2. Round the Selling Price to 2 Decimal Places
-- This query rounds the SellingPrice of each product to 2 decimal places.

SELECT ProductName, ROUND(SellingPrice, 2) AS RoundSellingPrice FROM Product; 


-- 3. Round Both Buying and Selling Prices to 1 Decimal Place
-- This query rounds both BuyingPrice and SellingPrice to 1 decimal place.

SELECT ProductName, ROUND(BuyingPrice, 1) AS RoundedBuyingPrice, ROUND(SellingPrice, 1) AS RoundedSellingPrice FROM Product;


-- 4. Round the Buying Price to No Decimal Places
-- This query rounds the BuyingPrice to the nearest integer.

SELECT ProductName, ROUND(BuyingPrice) AS RoundedBuyingPrice FROM Product;


-- 5. Round the Selling Price to No Decimal Places
-- This query rounds the SellingPrice to the nearest integer.

SELECT ProductName, ROUND(SellingPrice) AS RoundedSellingPrice FROM Product;


-- 6. Round Both Prices and Calculate the Profit
-- This query rounds both BuyingPrice and SellingPrice to 2 decimal places and calculates the profit (rounded to 2 decimal places) for each product.

SELECT ProductName, 
	ROUND(BuyingPrice, 2) AS RoundedBuyingPrice,
	ROUND(SellingPrice, 2) AS RoundedSellingPrice,
	ROUND(SellingPrice - BuyingPrice, 2) AS Profit
FROM Product;


-- 7. Round the Profit to 1 Decimal Place
-- This query calculates and rounds the profit to 1 decimal place.

SELECT ProductName, ROUND(SellingPrice - BuyingPrice, 1) AS RoundedProfit  FROM Product;


-- 8. Round Buying Price and Selling Price Upwards
-- For positive numbers, ROUND() will always round half-up (default behavior), but to see how it works explicitly:

SELECT ProductName, ROUND(BuyingPrice) AS RounedBuyingPrice, ROUND(SellingPrice) AS RoundedSellingPrice FROM Product;

SELECT ProductName, ROUND(BuyingPrice, 0) AS RoundedBuyingPriceUp, ROUND(SellingPrice, 0) AS RoundedSellingPriceUp FROM Product;


/*
Key Differences:
1. Explicit vs. Implicit Precision:

The first query does not provide a second argument for ROUND(), but the function implicitly 
	assumes 0 decimal places, rounding to the nearest integer by default.

The second query explicitly specifies 0 as the second argument to ROUND(), making it
	clear that the rounding should be done to 0 decimal places (whole number).

2. Functionality:

Both queries produce the exact same result, as they are effectively doing the same thing—rounding 
	the BuyingPrice and SellingPrice to the nearest integer.
*/