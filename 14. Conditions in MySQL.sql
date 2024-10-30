# What are the Conditions?
/* 
In MySQL, a condition or an expression is made up of keywords, identifiers, and constants and 
it compares given values with the data rows values in a table. 
If the condition is matched with the data row it’s called a true condition otherwise a false condition.
*/


# Examples to Understand Conditions in MySQL:
-- Please use the following SQL Script to create the company database and employee table with the required records.

DROP TABLE employee;
SHOW TABLES;


CREATE DATABASE company;
USE company;
CREATE TABLE employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);


SELECT DATABASE();
SHOW TABLES;
DESC employee;


INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1011, 'Pramod Panda', 'IT', 45000, 'Male', 27, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1012, 'Preety Tiwary', 'HR', 55000, 'Female', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1013, 'Santosh Dube', 'IT', 52000, 'Male', 28, 'Mumbai');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1014, 'Sara Talour', 'HR', 85000, 'Female', 26, 'London');
INSERT INTO employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1015, 'Pamela Kar', 'Finance', 70000, 'Female', 26, 'London');


SELECT * FROM employee;
SELECT COUNT(*) FROM employee;


# True Conditions in MySQL
SELECT * FROM employee WHERE Id = 1006;


SELECT * FROM employee WHERE Age = 	28;
SELECT COUNT(*) FROM employee WHERE Age = 	28;


SELECT * FROM employee WHERE Salary = 50000;
SELECT COUNT(*) FROM employee WHERE Salary = 50000;




# FALSE Conditions in MySQL
SELECT * FROM employee WHERE NOT Id = 1006;

SELECT * FROM employee WHERE Id <> 1006;		-- Here “less than greater than” is a special symbol that represents “not equal to”.

-- Let’s get the result set again but this time we will exclude the data row where the Department is not equal to IT.
SELECT * FROM employee WHERE NOT Department = 'IT';

SELECT * FROM employee WHERE Department != 'IT';

-- In this SQL statement, we are using a special symbol “less than greater than’ which represents ‘not equal to”. 
-- And we want to get a result set where the city column value is not equal to ‘London’.

SELECT * FROM employee WHERE City <> 'London';
