# Data Cleaning


-- Retrieve all records from the layoffs table within the current database.
SELECT *
FROM layoffs;

-- Select a specific database for the current session
USE world_layoffs;

-- Verify Data Types - Check the data types in the table definition
DESC layoffs;
DESCRIBE layoffs;

-- Verify if Table Exists
SHOW TABLES;

-- Count Records in the Table
SELECT COUNT(*) FROM layoffs;

-- SELECT on Limited Rows
SELECT * FROM layoffs LIMIT 10;

-- 1. Remove Duplicates
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns or Rows




-- Creates a new table, layoffs_staging, with the same structure as the existing table layoffs. 
-- This command only copies the table structure, not the data within it.
CREATE TABLE layoffs_staging
LIKE layoffs;


-- Retrieves all records from the layoffs_staging table, but it likely has no data unless you’ve inserted records into it.
SELECT * 
FROM layoffs_staging;


-- Data Transfer: If you want layoffs_staging to contain the same data as layoffs, you could copy records over with:
INSERT INTO layoffs_staging
SELECT * 
FROM layoffs;


-- Here this query will display the copied data.
SELECT * 
FROM layoffs_staging;


/*
Here the SELECT statement is attempting to add a ROW_NUMBER column to the result set. 
This column will assign a unique row number to each row within a partition.

This is useful if you need to identify unique or duplicate entries based on these columns, or if 
you want to select only the first occurrence of each group.
*/
SELECT *, 
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date') AS row_num
FROM layoffs_staging;


-- This query will return only the duplicate rows based on the specified columns, which is helpful for identifying redundant data.
WITH duplicate_cte AS
(
SELECT *, 
ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
SELECT * FROM duplicate_cte WHERE row_num > 1;


-- Checking particular record
SELECT * FROM layoffs_staging
WHERE company = 'Oda';

SELECT * FROM layoffs_staging
WHERE company = 'Casper';


WITH duplicate_cte AS
(
SELECT *, 
ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
DELETE FROM duplicate_cte WHERE row_num > 1;

-- Error Code: 1288. The target table duplicate_cte of the DELETE is not updatable




-- Here creating new empty table 
CREATE TABLE `layoffs_staging2` (
  `company` TEXT,
  `location` TEXT,
  `industry` TEXT,
  `total_laid_off` INT DEFAULT NULL,
  `percentage_laid_off` TEXT,
  `date` TEXT,
  `stage` TEXT,
  `country` TEXT,
  `funds_raised_millions` INT DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Verifying the table rows
SELECT * FROM layoffs_staging2;


-- Insert records in layoffs_staging2 from layoffs_staging
INSERT INTO layoffs_staging2
SELECT *, 
ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging;
    

-- Filter table where row_num is > 1.
SELECT * FROM layoffs_staging2
WHERE row_num > 1;    


-- Delete from table where row_num is > 1.
Delete FROM layoffs_staging2
WHERE row_num > 1;    


-- Retrive all records from layoffs_staging2
SELECT * FROM layoffs_staging2;




-- Standardizig the Data (Finding issue in your data and fixing it)
SELECT company, TRIM(company) FROM layoffs_staging2;


-- Update company column in layoffs_staging2 table with TRIM() function,
-- TRIM function removes any whitespace at the beginning and end of the text in the company column.  
UPDATE layoffs_staging2
SET company = TRIM(company);


-- Retrieves distinct values from the industry column in the layoffs_staging2 table and orders them alphabetically. 
SELECT DISTINCT(industry) 
FROM layoffs_staging2
ORDER BY 1;




SELECT * FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';


-- Change the value of the industry column to 'Crypto' for all records in the layoffs_staging2 table 
-- where the industry currently starts with "Crypto".
UPDATE layoffs_staging2
SET industry = 'Crypto' 
WHERE industry LIKE 'Crypto%';


-- Retrieves distinct values from the location column in the layoffs_staging2 table and orders them alphabetically. 
SELECT DISTINCT location 
FROM layoffs_staging2
ORDER BY 1;


SELECT DISTINCT country 
FROM layoffs_staging2
ORDER BY 1;


SELECT * FROM layoffs_staging2
WHERE country LIKE 'United States%'
ORDER BY 1;


-- selects distinct values from the country column in the layoffs_staging2 table and trims any trailing periods (.) from those values.
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) 
FROM layoffs_staging2
ORDER BY 1;

-- Note: 
/* TRIM(TRAILING '.' FROM country): This trims any trailing periods from the values in the country column. 
If a country name ends with a period, it will be removed in the result set. */


-- Modify the country column in the layoffs_staging2 table by trimming any trailing periods from the country names that start with "United States"
UPDATE layoffs_staging2 
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';




-- Select the date column from the layoffs_staging2 table and convert that string representation of the date into a proper date format 
-- using the STR_TO_DATE() function.

SELECT date,
	STR_TO_DATE(date, '%m/%d/%Y')  --  If your dates are not actually in MM/DD/YYYY format (e.g., if they’re in DD-MM-YYYY or YYYY/MM/DD), STR_TO_DATE() will return NULL.
FROM layoffs_staging2;

-- Step 1: Update the date Column to Date Format
UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- Important Considerations
-- 1. Data Type: Make sure the date column is of type DATE or DATETIME to store the converted value. 
-- If it is currently a VARCHAR or TEXT, you might first need to change the data type:

ALTER TABLE layoffs_staging2
MODIFY date DATE;

-- 2. Null Values: If any rows have a date that doesn’t match the MM/DD/YYYY format, STR_TO_DATE() will return NULL for those entries. 
-- You may want to check for any inconsistent formats beforehand with a SELECT query:

SELECT date FROM layoffs_staging2 WHERE STR_TO_DATE(date, '%m/%d/%Y') IS NULL;


-- Verify Data Types - Check the data types in the table definition
DESCRIBE layoffs_staging2;

-- Retrieve all records from the layoffs_staging2 table within the current database.
SELECT * FROM layoffs_staging2;

SELECT date FROM layoffs_staging2;




-- Retrieves all records from the layoffs_staging2 table where the total_laid_off column contains NULL values. 
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL;

-- Retrieves all records from the layoffs_staging2 table where both the total_laid_off and percentage_laid_off columns contain NULL values.
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


-- Retrieves all records from the layoffs_staging2 table where the industry column is either NULL or an empty string ('').
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';


-- Retrieves all records from the layoffs_staging2 table where the company column is equal to 'Airbnb'. 
SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';


SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;       
    
    
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;     
    
    
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';




SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';


-- Retrieves all records from the layoffs_staging2 table where both the total_laid_off and percentage_laid_off columns contain NULL values.
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


-- Deletes all records from the layoffs_staging2 table where both the total_laid_off and percentage_laid_off columns are NULL.
DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


-- Retrieve all records from the layoffs_staging2 table within the current database.
SELECT *
FROM layoffs_staging2;




--  To drop (remove) the row_num column from the layoffs_staging2 table.
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;




DESC layoffs_staging2;

SELECT *
FROM layoffs_staging2;

SELECT percentage_laid_off
FROM layoffs_staging2 
WHERE percentage_laid_off IS NULL OR percentage_laid_off = '';

-- Example of a Backup
-- You can create a backup of your table before modifying it:

CREATE TABLE layoffs_staging2_backup AS
SELECT * FROM layoffs_staging2;

SELECT * FROM layoffs_staging2_backup;


ALTER TABLE layoffs_staging2_backup
MODIFY COLUMN percentage_laid_off DECIMAL(5, 2);


DESC layoffs_staging2_backup;


SELECT * FROM layoffs_staging2_backup;

-- 1. Using an INNER JOIN to Find Matching Rows
-- You can use an INNER JOIN to find rows where the data in specific columns matches between the two tables.

SELECT t1.percentage_laid_off, t2.percentage_laid_off
FROM layoffs_staging2 AS t1
JOIN layoffs_staging2_backup AS t2
    ON t1.percentage_laid_off = t2.percentage_laid_off;
-- Note: This query will return only rows where the column_name values in table1 match those in table2.


-- 2. Using a LEFT JOIN to Find Non-Matching Rows
-- To find rows where data in specific columns doesn’t match between two tables, you can use a LEFT JOIN with a NULL check.

SELECT t1.*
FROM layoffs_staging2 AS t1
LEFT JOIN layoffs_staging2_backup AS t2
    ON t1.company = t2.company
WHERE t2.percentage_laid_off IS NULL;
-- Note: This query returns rows from table1 where there is no matching column_name in table2, helping you identify differences.


-- 3. Using UNION to Compare All Rows in Two Tables
-- You can use a UNION to combine data from two tables and identify missing or different rows.

SELECT   percentage_laid_off FROM layoffs_staging2
UNION ALL
SELECT   percentage_laid_off FROM layoffs_staging2_backup
GROUP BY percentage_laid_off
HAVING COUNT(*) = 1;


-- 4. Using NOT IN for Row Comparison
-- To find rows in one table that don’t exist in another, you can use NOT IN.

SELECT percentage_laid_off FROM layoffs_staging2
WHERE percentage_laid_off NOT IN (SELECT percentage_laid_off FROM layoffs_staging2_backup);
-- Note: This query returns rows from table1 that don’t have a corresponding value in table2.


-- 5. Using a FULL OUTER JOIN Equivalent in MySQL
-- MySQL doesn’t support FULL OUTER JOIN, but you can simulate it by combining LEFT JOIN and RIGHT JOIN with UNION.

SELECT t1.company, t1.percentage_laid_off, t2.company, t2.percentage_laid_off
FROM layoffs_staging2 AS t1
LEFT JOIN layoffs_staging2_backup AS t2
    ON t1.company = t2.company
WHERE t2.percentage_laid_off IS NULL

UNION

SELECT t1.company, t1.percentage_laid_off, t2.company, t2.percentage_laid_off
FROM layoffs_staging2 AS t1
RIGHT JOIN layoffs_staging2_backup AS t2
    ON t1.company = t2.company
WHERE t1.percentage_laid_off IS NULL;
-- Note: This query finds rows that are in table1 but not in table2 and vice versa.


-- Example: Verifying Multiple Columns
-- If you want to verify that multiple columns match, adjust the ON clause accordingly:

SELECT t1.*
FROM layoffs_staging2 AS t1
LEFT JOIN layoffs_staging2_backup AS t2
    ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t2.percentage_laid_off IS NULL;
-- Note: This checks for differences in both column1 and column2 between table1 and table2.




