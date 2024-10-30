# MySQL NOT NULL Constraint
/*
By default, a column can hold NULL values.
The NOT NULL constraint enforces a column to NOT accept NULL values.
This enforces a field to always contain a value, which means that you cannot insert a new record, 
or update a record without adding a value to this field.
*/


# Examples to Understand MySQL NOT NULL Constraint:
-- To understand this concept, first, let us create the StudentDB database and Student table by executing the below SQL Script.

Create database StudentDB;
Use StudentDB;


CREATE TABLE Student (
StudentId INT NOT NULL,
FullName VARCHAR(50) NOT NULL,
RegdNo VARCHAR(50) NOT NULL,
Branch VARCHAR(50) NOT NULL,
Mobile VARCHAR(15)
);


SELECT DATABASE();
SHOW TABLES;
DESC Student;
SHOW DATABASES;


# For any existing database table, if you want to check the constraints, in MySQL,
DESCRIBE  Student;

/*
The above image shows the Student table structure, except Mobile filed, all other fields have NO value for NULL constraint. 
It means the StudentId, FullName, RegdNo, Branch won’t accept NULL values. Only the Mobile field will accept a NULL value.
*/


# Let’s modify the Student table definition using the following alter SQL statement and accept a null value for the FullName column.

ALTER TABLE Student MODIFY COLUMN FullName VARCHAR(45) NULL;


# Now execute the following SQL statement to display the Student table structure.
DESCRIBE Student;

-- And now the FullName column has NULL constraints value “yes”. It means the FullName column can accept NULL values.


# Let’s INSERT a new data row with no name by executing the below SQL Statement.

INSERT INTO Student (StudentId, FullName, RegdNo, Branch, Mobile) VALUES (1, NULL, 1001, 'CSC', '1234567890');


# To verify the Student table 
SELECT * FROM Student;


/* Does the above record in the Student table make any sense? The answer is NO. 
Therefore, it is better not to allow inserting NULL for columns that are required and mandatory like the above FullName column. 
*/


# Let’s modify the table structure again and enable NOT NULL Constraint for the FullName column by executing the below SQL Statement.

ALTER TABLE Student MODIFY COLUMN FullName VARCHAR(45) NOT NULL;

/*
But, while you try to execute the above alter statement, you will get the below error. 
This is because the FullName Column already has null values and hence you cannot apply the NOT NULL constraint.
*/

-- Error Code: 1138. Invalid use of NULL value	1.453 sec

/*
So, first, we need to delete the data row which contains NULL values in the FullName column and
 then alter the column by executing the below SQL Statements.
*/


DELETE FROM Student WHERE FullName IS NULL;
ALTER TABLE Student MODIFY COLUMN FullName VARCHAR(45) NOT NULL;	


/*
Note: When we INSERT a null value into a column on which the NOT NULL constraint is imposed. 
The execution of the insert statement is terminated by displaying a user-friendly message telling the reason for termination and 
also specifies the database, the table, and the column where the problem got occurred.
*/


# Now let’s try to insert a student record with a NULL value for the FullName column or
-- try to insert NULL for any column on which the NOT NULL constraint is applied.

INSERT INTO Student (StudentId, FullName, RegdNo, Branch, Mobile) VALUES (1, NULL, '1001', 'CSC', '1234567890');

-- Now, when you try to execute the above statement, you will get the following error which clearly tells us that 
-- you cannot insert null for the FullName column

-- Error Code: 1048. Column 'FullName' cannot be null	0.047 sec


-- SQL Statement by supplying the FullName value.

INSERT INTO Student (StudentId, FullName, RegdNo, Branch, Mobile) VALUES (1, 'Anurag', '1001', 'CSC', '1234567890');


# When to use NOT NULL Constraint?
/*
If you don’t want to accept NULL values but you want to accept duplicates values to be stored in a column, 
then you need to apply NOT NULL Constraint to that column in MySQL.
*/

-----------------------------------------------------------------------------------------

-- NOT NULL on CREATE TABLE
-- SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:

CREATE TABLE Persons (
ID INT NOT NULL,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255) NOT NULL,
Age INT
);




-- NOT NULL on ALTER TABLE
-- To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created

ALTER TABLE Persons 
MODIFY Age INT NOT NULL;


-- To display the table structure.
DESCRIBE Persons;


