# MySQL Project : Second Hand Car Dealer 

create schema cars;

SELECT database();
USE cars;
SHOW TABLES;


-- Read cars data
SELECT * FROM car_dekho;


-- Total Cars: Count the total number of records. 
SELECT COUNT(*) FROM car_dekho;

SELECT COUNT(*) AS total_cars 
FROM car_dekho;


-- The manager asked the employee, How many cars will be available in 2023?
SELECT COUNT(*) FROM car_dekho WHERE year = 2023;

SELECT COUNT(*) AS total_cars
FROM car_dekho WHERE year = 2023;


-- The manager asked the employee, How many cars were available in 2020, 2021, and 2022. 
SELECT COUNT(*) FROM car_dekho WHERE year = 2020;	-- 74
SELECT COUNT(*) FROM car_dekho WHERE year = 2021;	-- 7
SELECT COUNT(*) FROM car_dekho WHERE year = 2022;	-- 7

# IN Operator with GROUP BY METHOD
SELECT year, COUNT(*) AS total_cars
FROM car_dekho 
WHERE year IN (2020, 2021, 2022)
GROUP BY year;

# GROUP BY with ORDER BY METHOD
SELECT year, COUNT(*) AS total_cars
FROM car_dekho 
WHERE year IN (2020, 2021, 2022)
GROUP BY year 
ORDER BY year ASC;


 -- The client asked me to print the total number of cars by year. Do I see all the details?
 
 # GROUP BY METHOD
SELECT year, COUNT(*) AS total_cars
FROM car_dekho 
GROUP BY year;

 # GROUP BY METHOD with ORDER BT METHOD
SELECT year, COUNT(*) AS total_cars
FROM car_dekho 
GROUP BY year
ORDER BY year;


-- The client asked to car dealer's agent, How many diesel cars will there be in 2020?
SELECT COUNT(*) FROM car_dekho WHERE year = 2020 AND fuel = 'Diesel';

SELECT COUNT(*) AS total_diesel_cars
FROM car_dekho 
WHERE year = 2020 AND fuel = 'Diesel';


-- The client requested a car dealer agent, how many petrol cars will there be in 2010?
SELECT COUNT(*) FROM car_dekho WHERE fuel = 'Petrol' AND year = 2020;

SELECT COUNT(*) total_petrol_cars   -- Without AS keyword
FROM car_dekho 
WHERE fuel = 'Petrol' AND year = 2020;


-- The manager asked the employee to give a print. All the fuel cars (petrol, diesel, and CNG) come by all year.
SELECT year, COUNT(*) FROM car_dekho WHERE fuel = 'Petrol' GROUP BY year;
SELECT year, COUNT(*) FROM car_dekho WHERE fuel = 'Diesel' GROUP BY year;
SELECT year, COUNT(*) FROM car_dekho WHERE fuel = 'CNG' GROUP BY year;

SELECT year, fuel, COUNT(*) total_cars
FROM car_dekho
WHERE fuel IN ('Petrol', 'Diesel', 'CNG')
GROUP BY year, fuel
ORDER BY year, fuel;


-- Manager said there were more than 100 cars in a given year, which year had more than 100 cars?
SELECT year, COUNT(*) FROM car_dekho GROUP BY year HAVING COUNT(*) > 100;

SELECT year, COUNT(*) AS total_cars
FROM car_dekho
GROUP BY year
HAVING total_cars > 100;


-- The manager said to the employee, All car count details between 2015 and 2023, We need a complete list.
SELECT COUNT(*) FROM car_dekho WHERE year BETWEEN 2015 AND 2023;

SELECT year, COUNT(*) AS total_cars
FROM car_dekho
WHERE year BETWEEN  2015 AND 2023
GROUP BY year
ORDER BY year;


-- The manager told the employee, All car details between 2015 and 2023. We need a complete list.  
SELECT * FROM car_dekho WHERE year BETWEEN 2015 AND 2023;

SELECT * FROM car_dekho 
WHERE year BETWEEN 2015 AND 2023
ORDER BY year;

select * from car_dekho;
