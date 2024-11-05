# Exploratory Data Analysis


-- Select a specific database for the current session
USE world_layoffs;

-- Verify if Table Exists
SHOW TABLES;

-- Show currently selected database in MySQL.  If no database is currently selected, it will return NULL.
SELECT database();


-- Retrieve all records from the layoffs_staging2 table within the current database.
SELECT * 
FROM layoffs_staging2;


-- Retrieves the maximum values for two columns, total_laid_off and percentage_laid_off, from the layoffs_staging2 table.
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;


-- Retrieves all records from the layoffs_staging2 table where the percentage_laid_off column has a value of 1, 
-- indicating that 100% of employees were laid off.
SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1;


-- Retrieves all records from the layoffs_staging2 table where all employees were laid off, 
-- sorting the results by the total number of employees laid off in descending order.
SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;


-- Retrieves all records from the layoffs_staging2 table where 100% of employees were laid off, 
-- and it sorts these records in descending order based on the amount of funds raised.
SELECT * 
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- Retrieves each company’s total layoffs from the layoffs_staging2 table, 
-- then orders the companies by the total number of employees laid off in descending order.
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
-- Note: ORDER BY 2 DESC: Sorts the results in descending order based on the second column in the result set, which is SUM(total_laid_off).


-- Retrieves the earliest and latest dates from the date column in the layoffs_staging2 table, 
-- effectively giving the range of dates over which the layoffs data spans.
SELECT MIN(date), MAX(date)
FROM layoffs_staging2;


-- Retrieves the total layoffs for each industry from the layoffs_staging2 table and orders the results by the total layoffs in descending order.
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;


SELECT * 
FROM layoffs_staging2;


-- Retrieves the total layoffs for each country in the layoffs_staging2 table, 
-- sorting the results by the highest total layoffs per country in descending order.
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;


-- Return a list of unique dates along with the total layoffs that occurred on those dates, 
-- sorted from the most recent date to the oldest date.
SELECT (date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY date
ORDER BY 1 DESC;
/*
-- Note:  
In SQL, single quotes are used for string literals, while backticks (`) or double quotes (") should be used for column names 
that might conflict with reserved keywords or if the column names contain special characters.
*/

SELECT date, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY date
ORDER BY 1 DESC;


-- Retrieves the total number of layoffs by year from the layoffs_staging2 table. 
SELECT YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 DESC;


-- Retrieve the total number of layoffs for each stage from the layoffs_staging2 table. 
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;


-- Calculate the average percentage of employees laid off for each company in the layoffs_staging2 table.
SELECT company, AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- Return a list of month-year combinations along with the total number of layoffs for each, 
-- sorted in ascending order by the month. This is useful for analyzing trends in layoffs over time on a monthly basis.
-- It also filters out any null values from the date substring. 
SELECT SUBSTRING(date, 1, 7) AS "MONTH", SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(date, 1, 7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC;
-- Note:  It’s best to use the alias directly without quotes or with backticks (if your SQL dialect requires it).



-- Returns each month along with the total layoffs for that month and a cumulative (rolling) total of layoffs, ordered by month. 
-- This provides insight into the monthly progression and cumulative impact of layoffs over time.
WITH Rolling_Total AS
(
SELECT SUBSTRING(date, 1, 7) AS MONTH, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(date, 1, 7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC
)
SELECT "MONTH", total_off,
SUM(total_off) OVER( ORDER BY MONTH) AS rolling_total
FROM Rolling_Total;


--  Provide a list of companies with the total layoffs for each year, sorted by company. 
-- Each row will show a company, a specific year, and the total layoffs for that year, making it easy to analyze layoffs over time per company.
SELECT company, YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(date)
ORDER BY company ASC;


-- Produce a list of companies, each year of layoffs, and the total layoffs for that year, ordered by the highest number of layoffs at the top. 
-- This is useful for identifying which companies and years had the most significant layoffs.
SELECT company, YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(date)
ORDER BY 3 DESC;


-- Display the top 5 companies with the highest layoffs for each year, ranked from the most to least layoffs within each year, 
-- which is useful for identifying major layoffs on an annual basis across companies.
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(date), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(date)
), Company_Year_Rank AS
(
SELECT * , DENSE_RANK() OVER (PARTITION BY  years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY Ranking ASC
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;




