# What is an AUTO INCREMENT Field?
/*
Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.
Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

MySQL AUTO_INCREMENT Keyword
MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.
By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
*/


# Defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
Personid INT NOT NULL AUTO_INCREMENT,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
PRIMARY KEY (Personid)
);


-- To see the table structure
DESCRIBE Persons;


-- To view the complete table structure,
SHOW CREATE TABLE Persons;


# To let the AUTO_INCREMENT sequence start with another value

ALTER TABLE Persons AUTO_INCREMENT = 100;


# When we insert a new record into the "Persons" table, we do NOT have to specify a value for the "Personid" column
-- (a unique value will be added automatically):

INSERT INTO Persons (LastName, FirstName) VALUES ('Lars','Monsen');
INSERT INTO Persons (LastName, FirstName, Age) VALUES ('Nikhil','Kumar', 18);


SELECT * FROM Persons;

---------------------------------------------------------------------------------------

-- Adds an AUTO_INCREMENT constraint on the ID column of the CUSTOMERS table −

CREATE TABLE CUSTOMERS (
ID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(20) NOT NULL,
AGE INT,
PRIMARY KEY (ID)
);


-- To see the table structure
DESCRIBE CUSTOMERS;


-- To view the complete table structure,
SHOW CREATE TABLE CUSTOMERS;


-- In the insert statements below, we are not inserting ID values.

INSERT INTO CUSTOMERS (Name, Age) VALUES ('Nikhil', 18);

INSERT INTO CUSTOMERS (Name, Age) VALUES ('Varun', 16);

INSERT INTO CUSTOMERS (Name, Age) VALUES ('Datta', 19);


-- To display the records of the above-created table −
SELECT * FROM CUSTOMERS;




