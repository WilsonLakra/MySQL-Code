# MySQL CONVERT() Function
-- The CONVERT() function converts a value into the specified datatype or character set.

-- Syntax
/*
CONVERT(value, type)
*/
-- OR:
/*
CONVERT(value USING charset)
*/

/*
Similar to the CAST function, the MySQL CONVERT function is used to convert a value or expression from one data type to another data type. 
It is also used to converts a value or expression from one character set to another character set.
*/


# Example: Converting a value to DATE datatype using the CONVERT function.

SELECT CONVERT("2020-10-25", DATE) AS ConvertedDate;		-- O/P 	2020-10-25


# Example: Converting a value to DATETIME datatype using the CONVERT function.

SELECT CONVERT("2020-10-25", DATETIME) AS ConvertedDateTime;		-- O/P 	2020-10-25 00:00:00


# Example: Converting a value to TIME datatype using the CONVERT function.

SELECT CONVERT("2020-10-25 08:14:57", TIME) AS ConvertedTime;		-- O/P 	08:14:57


# Example: Converting a value to CHAR datatype using the CONVERT function.

SELECT CONVERT('123', CHAR) AS ConvertedChar;		-- O/P 	123


# Example: Converting a value to NCHAR datatype using the CONVERT function.

SELECT CONVERT('123', NCHAR) AS ConvertedNChar;		-- O/P 	123


# Example: Converting a value to SIGNED datatype using the CONVERT function.

SELECT CONVERT(20-44, SIGNED) AS ConvertedSsigned;		-- O/P 	-24


# Example: Converting a value to UNSIGNED datatype using the CONVERT function.

SELECT CONVERT(20-44, UNSIGNED) AS ConvertedUnsigned;		-- O/P 	18446744073709551592


# Example: Converting a value to DECIMAL datatype using the CONVERT function.

SELECT CONVERT('4.4', DECIMAL(6,2)) AS ConvertedDecimal;		-- O/P 4.40




# Example: Converting a string value to utf8 character set using the CONVERT function

SELECT CONVERT('MySQLTutorials'USING utf8) AS ConvertedCharacterSet;		-- O/P 	MySQLTutorials


# Example: Converting a string value to latin1 character set using CONVERT function.

SELECT CONVERT('MySQLTutorials' USING latin1) AS ConvertedCharacterSet;		-- O/P 	MySQLTutorials


/*
Difference between CAST AND CONVERT Function
The main difference between MySQL CAST and CONVERT functions are given below.

CAST Function:
1. We use the MySQL CAST function to convert one data type into the other data type.
2. It cannot be used to convert a character set.
3. It is the part of ANSI-SQL standard
4. CAST function uses the “AS” keyword for separating the parameter.

CONVERT Function:
1. We use the MySQL CONVERT function to convert one data type into the other data type.
2. It can be used to convert a character set.
3. It is not part of the ANSI-SQL standard
4. CONVERT function uses the “comma(,)” or “USING” keyword for separating the parameter.
*/

---------------------------------------------------------------------------------------------------

/*
The CONVERT() function in MySQL is used to convert a value from one data type to another, similar to the CAST() function. 
However, it also supports conversions between different character sets. Here are some examples of its usage:(ChatGPT)
*/

-- 1. String to Date
-- Converting a string to a date:

SELECT CONVERT('2024-10-09', DATE) AS ConvertToDate;		-- O/P 	2024-10-09


-- 2. String to Integer
-- Converting a string to an integer:

SELECT CONVERT('12345', UNSIGNED) AS ConvertToInteger;		-- O/P 	12345


-- 3. Integer to String
-- Converting an integer to a string:

SELECT CONVERT(12345, CHAR) AS ConvertToString; 		-- O/P 	12345


-- 4. String to Decimal
-- Converting a string to a decimal value:

SELECT CONVERT('12345.678', DECIMAL(10,3)) AS ConvertToDecimal; 		-- O/P 	12345


-- 5. Datetime to Date
-- Converting a datetime to a date:

SELECT CONVERT('2024-10-09 13:45:30', DATE) AS ConvertToDate; 		-- 	O/P 	2024-10-09


-- 6. Integer to Binary
-- Converting an integer to binary:

SELECT CONVERT(15, BINARY) AS ConvertToBinary;		-- 	O/P 	1111


-- 7. Character Set Conversion
-- Converting a string to a different character set (e.g., from latin1 to utf8):

SELECT CONVERT('Hello World' USING utf8) AS ConvertToUTF8;		-- 	O/P 	Hello World


-- 8. Float to Integer
-- Converting a floating-point number to an integer:

SELECT CONVERT(12345.67, SIGNED) AS ConvertToInteger; 		-- O/P 	12346





 











