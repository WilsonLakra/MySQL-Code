# MySQL CAST() Function
-- The CAST() function converts a value (of any type) into the specified datatype.

-- Syntax
/*
CAST(value AS datatype)
*/

/*
The MySQL CAST function is used to convert a value or expression from one data type to another data type. 
The changing of one data type to another data type is known as casting. The casting is very useful while importing or exporting the data. 
It is mostly used with WHERE, HAVING, and JOIN clauses. This function is similar to the CONVERT function in MySQL
*/


# Example: Converting a value to DATE datatype using the CAST function.

SELECT CAST("2020-10-25" AS DATE) AS CastDate;		-- O/P 	2020-10-25


# Example: Converting a value to DATETIME datatype using the CAST function.

SELECT CAST("2020-10-25" AS DATETIME) AS CastDateTime;		-- O/P 	2020-10-25 00:00:00


# Example: Converting a value to TIME datatype using the CAST function.

SELECT CAST("2020-10-25 08:14:57" AS TIME) AS CastTime;		-- O/P 	08:14:57


# Example: Converting a value to CHAR datatype using the CAST function.

SELECT CAST("123" AS CHAR) AS CastChar;		-- O/P 	123


# Example: Converting a value to SIGNED datatype using the CAST function.

SELECT CAST(20-44 AS SIGNED) AS CastSigned;		-- O/P 	-24


# Example: Converting a value to UNSIGNED datatype using the CAST function.

SELECT CAST(20-44 AS UNSIGNED) AS CastUnsigned;		-- O/P 	18446744073709551592


# Example: Converting a value to DECIMAL datatype using the CAST function.

SELECT CAST('4.4' AS DECIMAL(6,2)) AS CastDecimal;		-- O/P 	4.40

-------------------------------------------------------------------------------------------------------

/*
The CAST() function in MySQL is used to convert a value from one data type to another. Below are several examples 
that demonstrate its usage with different data types:(ChatGPT)
*/

-- 1. String to Date
-- Converting a string to a date type:

SELECT CAST("2024-10-09" AS DATE) AS CastToDate;		-- O/P 	2024-10-09


-- 2. String to Integer
-- Converting a string to an integer:

SELECT CAST("1234" AS UNSIGNED) AS CastToInteger;		-- O/P 	1234


-- 3. Integer to String
-- Converting an integer to a string:

SELECT CAST(1234 AS CHAR) AS CastToString;		-- O/P 	1234


-- 4. String to Decimal
-- Converting a string to a decimal:

SELECT CAST("1234.56" AS DECIMAL) AS CastToDecimal;		-- 	O/P 	1235


-- 5. Integer to Binary
-- Converting an integer to binary:

SELECT CAST(10 AS BINARY) AS CastToBinary;		-- O/P 	1010


-- 6. Datetime to Date
-- Converting a datetime value to a date:

SELECT CAST('2024-10-09 12:34:56' AS DATE) AS CastToDate;		-- 	O/P 	2024-10-09



-- 7. Float to Integer
-- Converting a float value to an integer:

SELECT CAST(1234.56 AS DECIMAL) AS CastToInteger;		-- 	O/P 	1235



