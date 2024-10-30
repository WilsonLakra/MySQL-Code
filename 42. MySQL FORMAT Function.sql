# MySQL FORMAT() Function
/* 
The FORMAT() function formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places, 
then it returns the result as a string.
*/

-- Syntax

/*
FORMAT(number, decimal_places)
*/

/*
The MySQL FORMAT() function is used to format a numeric value with a specified number of decimal places and 
commas as a thousands separator. It also rounds the given number with the specified number of digits after the decimal.

This function does nothing but modifying a number for simpler mathematical calculations. 
It can only be invoked on numerical data of a database.
*/

-- Syntax

/*
FORMAT(number, decimals, [locale])
*/

/*
Locale: Optional. It specifies the locale to use that determines the decimal point result, thousands of separators, 
and grouping between separators. By default, MySQL will use an en_us locale.
*/


# Example: Formatting off a number with Decimal is positive.
-- Positive Number:
SELECT FORMAT(250500.5634, 2) AS Formatted_Number;		-- O/P 	250,500.56


-- Negative Number:
SELECT FORMAT(-250500.5634, 2) AS Formatted_Number; 		-- O/P 	-250,500.56


# Example: Formatting off a number when the decimal is negative.
-- Formatting a Positive number up to 2 decimal places
SELECT FORMAT (22516.67519, -2) AS Formatted_Number;		-- 	O/P 	22,517


-- Formatting a Negative number up to 3 decimal places
SELECT FORMAT (-22516.67519, -3) AS Formatted_Number;		-- O/P 	-22,517


# Example: Formatting off a number to 0 decimal places.
-- Formatting a Positive number up to 0 decimal places
SELECT FORMAT (22516.67519, 0) AS Formatted_Number;	 		-- O/P 	22,517


-- Formatting a Negative number up to 0 decimal places
SELECT FORMAT (-22516.67519, 0) AS Formatted_Number;		-- O/P 	-22,517




# Example: Using locale.
/*
As of now, the examples we discussed uses en_US locale by default. This is because we have not provided any locale with
 the MySQL FORMAT function. Now, the following example going to use de_DE locale instead of en_US.
*/

SELECT FORMAT(22516.67519, 2, 'de_DE ') AS Formatted_Number; 		-- O/P 	22,516.68




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


# Now, we are going to find the formatted values for the Price column of the Product table up to 2 decimal points

SELECT ProductId, ProductName,
BuyingPrice,
FORMAT(BuyingPrice, 2) AS Formated_BuyingPrice,
SellingPrice,
FORMAT(SellingPrice, 2) AS Formated_SellingPrice
FROM Product;

-----------------------------------------------------------------------------------------------------

/*
Here are examples using the FORMAT() function in MySQL to format the BuyingPrice and SellingPrice from your Product table. 
The FORMAT() function formats a number to a specified number of decimal places and also includes a comma (,) as the thousands separator.(ChatGPT)
*/

-- 1. Format Buying Price to 2 Decimal Places
-- This query formats the BuyingPrice to 2 decimal places, and it will include commas as thousands separators.

SELECT ProductName, FORMAT(BuyingPrice, 2) AS FormatedBuyingPrice FROM Product;


-- 2. Format Selling Price to 2 Decimal Places
-- This query formats the SellingPrice to 2 decimal places, similar to how it works for the buying price.

SELECT ProductName, FORMAT(SellingPrice, 2) AS FormatedSellingPrice FROM Product;


-- 3. Format Both Buying and Selling Prices to 3 Decimal Places
-- This query formats both the BuyingPrice and SellingPrice to 3 decimal places.

SELECT ProductName,
	FORMAT(BuyingPrice, 3) AS FormatedBuyingPrice,
	FORMAT(SellingPrice, 3) AS FormatedSellingPrice
FROM Product;


-- 4. Format Both Prices to No Decimal Places
-- This query formats the prices with no decimal places, rounding to the nearest whole number.

SELECT ProductName,
	FORMAT(BuyingPrice, 0) AS FormattedBuyingPrice,
    FORMAT(SellingPrice, 0) AS FormatedSellingPrice
FROM Product;


-- 5. Format the Profit Between Selling Price and Buying Price
-- This query calculates the profit by subtracting BuyingPrice from SellingPrice, and formats the result to 2 decimal places.

SELECT ProductName,
	FORMAT(SellingPrice - BuyingPrice, 2) AS FormattedProfit 
FROM Product;


-- 6. Format Buying Price with a Different Thousands Separator (e.g., Dot instead of Comma)
/* 
In this query, we use the German locale ('de_DE'), which formats the number with a period (.) as the thousands separator 
and a comma as the decimal point (e.g., 1.060,87).
*/

SELECT ProductName,
	FORMAT(BuyingPrice, 2, 'de_DE') AS FormattedBuyingPrice 
FROM Product;


-- 7. Format Both Prices and Include Both Formatted and Original Prices
-- This query displays both the original and formatted versions of the BuyingPrice and SellingPrice, rounded to 2 decimal places.

SELECT ProductName,
	BuyingPrice AS OriginalBuyingPrice,
	FORMAT(BuyingPrice, 2) AS FormatedBbuyingPrice,
	SellingPrice AS OriginalSellingPrice,
	FORMAT(SellingPrice, 2) AS FormatedSellingPprice
FROM Product;


-- 8. Format Buying Price and Selling Price in Thousands
-- This query formats the prices in thousands (divides by 1000), displaying the results with 2 decimal places.

SELECT ProductName, 
	FORMAT(BuyingPrice / 1000, 2) AS BuyingPriceInThousands,
    FORMAT(SellingPrice / 1000, 2) AS SellingPriceInThousands 
FROM Product;


