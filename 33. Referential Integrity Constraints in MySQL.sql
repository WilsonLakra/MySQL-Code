# What are Referential Integrity Constraints in MySQL?
/*
The Referential Integrity Constraints in MySQL are nothing but the foreign key constraints that tell MySQL Database to perform 
certain actions whenever a user attempts to delete or update a primary key for which existing foreign keys point. 
*/

# What are the Actions Performed by MySQL?
/*
In order to tell MySQL what actions to perform whenever a user trying to delete or update a primary key value for which existing foreign key
 values point, MySQL provided with the following Referential Integrity Constraints which we need to set while creating the foreign key constraints.
 
1. SET NULL: If a user tries to delete or update statement(s) that will affect rows in the foreign key table, 
then those values will be set to NULL when the primary key record is deleted or updated in the Primary key table. 
The important thing that we need to keep in mind is that the foreign key columns affected must allow NULL values.
 
2. CASCADE: If a user tries to delete the statement(s) which will affect the rows in the foreign key table, 
then those rows will also be deleted when the primary key record is deleted. 
Similarly, if an update statement affects rows in the foreign key table, then those rows will also be updated
 with the value from the primary key record after it has been updated.

3. NO ACTION: This is the default action that MySQL performs. This specifies that if an update or deletes statement affects 
rows in foreign key tables, then the action will be denied and rolled back. An error message will be raised.
*/


# Example to understand Referential Integrity Constraints in MySQL:
/*
Let us understand the Referential Integrity Constraints in MySQL with examples. In order to understand this concept, 
first, we need two database tables. So, let’s first create two tables (Department and Employees) and enforce the primary and 
foreign key constraints as follows.
*/


-- Department Table (Primary Key Table):

CREATE TABLE Department (
Id INT PRIMARY KEY,
Name VARCHAR(50)
);


-- Insert some test data in Department Table
INSERT INTO Department VALUES (10, 'IT');
INSERT INTO Department VALUES (20, 'HR');
INSERT INTO Department VALUES (30, 'INFTA');


SELECT * FROM Department;


-- Employees Table (Foreign Key Table):
-- In the Employees table, the DepartmentId column is the foreign key which is referencing the ID column of the Department table.

CREATE TABLE Employees (
Id INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DepartmentID INT
);


-- Adding the Foreign Key Constraint
ALTER TABLE Employees ADD FOREIGN KEY (DepartmentID) REFERENCES Department(Id);


-- Insert some test data in Employees Table
INSERT INTO Employees VALUES (101, 'Anurag', 10);

INSERT INTO Employees VALUES (102, 'Pranaya', 20);

INSERT INTO Employees VALUES (103, 'Hina', 30);


SELECT * FROM Employees;


-- To see the table structure
DESCRIBE Employees;


-- To view the complete table structure,
SHOW CREATE TABLE Employees;


/*
Now, consider the above 2 tables (Department and Employees). If we delete the row with ID = 10 from the Department table 
then the row with ID = 101 from the Employees table becomes an orphan record. That means we will not be able to tell the 
Department name for this record. So, the referential integrity constraint in MySQL is basically used to define the actions
 that MySQL should take. By, if we try to delete, we get an error and the DELETE or UPDATE statement is rolled back. 
 Let us prove this. Try to execute the below DELETE Statement.
*/


DELETE FROM Department WHERE Id = 10;

-- When you try to execute the above Delete Statement, you should get the following error message.
/*
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails 
(`employeedb`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`Id`))	0.688 sec
*/


/*
If you want to delete or update a record in the parent table (in our case the Department table) 
when they have a corresponding child record in the child table (in our case the Employees table), 
MySQL provided with a set of rules to perform delete and update operations known as DELETE rules and UPDATE rules as shown in the below.

DELETE Rules						UPDATE Rules	
ON DELETE CASCADE 					ON UPDATE CASCADE
OM DELETE SET NULL					ON UPDATE SET NULL
ON DELETE NO ACTION					ON UPDATE NO ACTION
*/

/* Note: The point that you need to remember is, the Delete and Update rules were not imposed on the master table,
 they are imposed on the child table, and that too on the foreign key column.
*/


# Example: CASCADE Referential Integrity Constraints in MySQL
/*
Let’s delete the existing Employees table and again create the Employees table as shown below. As you can see in the below SQL Script, 
we have set the ON DELETE and ON UPDATE rules as CASCADE. This means, if we delete a record from the Department table for which there 
are some records in the Employees table, then those records will also be deleted. Similarly, if we update a record in the Department table 
for which if there are some records in the Employees table, then those records will be updated with the updated primary key value.
*/


DROP TABLE Employees;

CREATE TABLE Employees (
Id INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Department (Id)
ON DELETE CASCADE
ON UPDATE CASCADE
);


# Now, insert some data into the Employees table

INSERT INTO Employees VALUES (101, 'Anurag', 10);

INSERT INTO Employees VALUES (102, 'Pranaya', 20);

INSERT INTO Employees VALUES (103, 'Hina', 30);


SELECT * FROM Employees;


# Now, delete the Department whose Id is 10 from the Department table 

DELETE FROM Department WHERE Id = 10;

/*
Now, you can see the above DELETE statement executed successfully, and further if you notice the employees whose DepartmentId is 10 
are also deleted from the Employees table automatically. 
*/

SELECT * FROM Department;
SELECT * FROM Employees;


# Now, execute the below UPDATE statement.

UPDATE Department SET Id = 40 WHERE Id = 30;

/*
Now, you can see the above UPDATE statement also executed successfully, and further if you notice the employees 
whose DepartmentId is 30 are also updated as 40 in the Employees table automatically.
*/




# Example: SET NULL Referential Integrity Constraints in MySQL
/*
Let’s delete the existing Employees table and again create the Employees table as shown below. As you can see in the below SQL Script, 
we have set the ON DELETE and ON UPDATE rules as SET NULL. This means if we delete a record from the Department table for which if
 there are some records in the Employees table, then those records will also be set as NULL values. Similarly,
 if we update a record in the Department table for which if there are some records in the Employees table, 
 then those records will be updated as NULL
*/


# First, delete the Employees table

DROP TABLE Employees;


# Then truncate the Department table and add the three records

TRUNCATE TABLE Department;

INSERT INTO Department VALUES (10, 'IT');
INSERT INTO Department VALUES (20, 'HR');
INSERT INTO Department VALUES (30, 'INFRA');


SELECT * FROM Department;


# Now, create the Employees table 

CREATE TABLE Employees (
Id INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCEs Department (Id)
ON DELETE SET NULL
ON UPDATE SET NULL
);


# Now, insert the following records into the Employees table

INSERT INTO Employees VALUES (101, 'Anurag', 10);
INSERT INTO Employees VALUES (102, 'Pranaya', 20);
INSERT INTO Employees VALUES (103, 'Hina', 30);


SELECT * FROM Employees;


# Now, delete the Department whose Id is 10 from the Department table 

DELETE FROM Department WHERE Id = 10;

/*
Now, you can see the above DELETE statement executed successfully, and further if you notice the Employees table,
 those employees whose DepartmentId is 10 are set to NULL automatically.
*/

SELECT * FROM Department;
SELECT * FROM Employees;


# Now, execute the below UPDATE statement.

UPDATE Department SET Id = 40 WHERE Id = 30;

/*
Now, you can see the above UPDATE statement also executed successfully, and further if you notice the employees whose 
DepartmentId is 30 are also updated as NULL in the Employees table automatically.
*/




# Example: NO ACTION Referential Integrity Constraints in MySQL
/*
Let’s delete the existing Employees table and again create the Employees table as shown below. As you can see in the below SQL Script,
 we have set the ON DELETE and ON UPDATE rules as NO ACTION. NO ACTION is the default action that MySQL performs.
 It specifies that if an update or deletes statement affects rows in foreign key tables,
 then the action will be denied and rolled back and an error message will be raised.
*/


# First, delete the Employees table

DROP TABLE Employees;


# Then truncate the Department table and add the three records 

TRUNCATE TABLE Department;

INSERT INTO Department VALUES (10, 'IT');
INSERT INTO Department VALUES (20, 'HR');
INSERT INTO Department VALUES (30, 'INFRA');


SELECT * FROM Department;


# Now, create the Employees table

CREATE TABLE Employees (
Id INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DepartmentID INT,
FOREIGN KEY (DepartmentID) REFERENCES Department (Id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


# Now, insert the following records into the Employees table

INSERT INTO Employees VALUES (101, 'Anurag', 10);
INSERT INTO Employees VALUES (102, 'Pranaya', 20);
INSERT INTO Employees VALUES (103, 'Hina', 30);


SELECT * FROM Employees;


# Now, delete the Department whose Id is 10 from the Department table 

DELETE FROM Department WHERE Id = 10;

-- Now, when you try to execute the above DELETE statement, you will get the following error message, and the delete operation is rollback.

/* 
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails
 (`employeedb`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`Id`))	0.766 sec
*/


# Now, execute the below UPDATE statement.

UPDATE Department SET Id = 40 WHERE Id = 30;

-- Now, when you try to execute the above UPDATE statement then you will get the following error message and the update operation is rollback.

/*
Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails 
(`employeedb`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`Id`))	0.156 sec
*/


# What is Self-Referential Integrity Constraint in MySQL?
/*
This is the same as the referential integrity Constraint. In earlier cases, we are binding one column of a table (foreign key table) with 
another column of another table (Primary Key) whereas in self-referential integrity we bind a column of a table with another column 
of the same table i.e. both the foreign key and primary key will be present in one table only.
*/

# First, delete the Employees table and Department table

DROP TABLE Employees;
DROP TABLE Department;


#  Use Case: Employee-Manager Relationship
/*
Imagine you have an Employees table where each employee has a manager, who is also an employee in the same table. 
This is a perfect scenario for a self-referential foreign key constraint.
*/

-- Example with ON DELETE and ON UPDATE:

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ManagerID INT,
    CONSTRAINT FK_Manager
    foreign key (ManagerID) REFERENCES Employees (EmployeeID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);


# Insert Records (Employee and Manager Relationship):

-- Insert CEO who does not report to anyone (ManagerID is NULL)
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES (1, 'Alice', NULL);

-- Insert managers who report to the CEO (EmployeeID = 1)
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES (2, 'Bob', 1),
       (3, 'Charlie', 1);

-- Insert employees who report to managers (EmployeeID = 2 and 3)
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES (4, 'David', 2),
       (5, 'Eve', 2),
       (6, 'Frank', 3);

-- Insert more employees reporting to other managers
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES (7, 'Grace', 3),
       (8, 'Heidi', 2),
       (9, 'Ivan', 3);

-- Insert an employee reporting to another employee (not a manager)
-- Example: Jake reports to David
INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES (10, 'Jake', 4);


SELECT * FROM Employees;


# Now, DELETE the Employees whose Id is 10 from the Employees table 
DELETE FROM Employees WHERE EmployeeID = 10;


-- To verify the records deleted ot not  
SELECT * FROM Employees WHERE EmployeeID  = 10;


-- Now, UPDATE the Employees whose Id is 10 from the Employees table  
UPDATE Employees SET Name = 'Jake' WHERE EmployeeID = 9;


-- To verify the records UPDATEED or NOT
SELECT * FROM Employees WHERE EmployeeID  = 9;



