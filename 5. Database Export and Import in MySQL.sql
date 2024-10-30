# Export MySQL database using MySQL Workbench:

SHOW DATABASES;
SELECT DATABASE();
use school;
SHOW TABLES;


SELECT * FROM students;
SELECT * FROM studentaddress;
DELETE FROM students;
DROP TABLE students;


# Export MySQL database using MySQL Workbench:

/* In order to export a database using MySQL Workbench, we should have a database on our MySQL Server. 
So, let us first create a Database called School and tables Students and StudentAddress with some data.  */

CREATE TABLE `School`.`Students`(
  StudentId INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Class VARCHAR(50),
  Age INT
);


INSERT INTO `school`.`students` (StudentId, FirstName, LastName, Class, Age) 
VALUES (1, 'Anurag', 'Mohanty', 'First', 18);
INSERT INTO `school`.`students` (StudentId, FirstName, LastName, Class, Age) 
VALUES (2, 'Priyanka', 'Dewangan', 'Second', 17);
INSERT INTO `school`.`students` (StudentId, FirstName, LastName, Class, Age) 
VALUES (3, 'Hina', 'Sharma', 'First', 19);
INSERT INTO `school`.`students` (StudentId, FirstName, LastName, Class, Age) 
VALUES (4, 'Sambit', 'Monanty', 'Second', 17);


CREATE TABLE `school`.`studentaddress` (
  AddressId INT PRIMARY KEY,
  StudentId INT NOT NULL,
  City VARCHAR(200),
  State VARCHAR(200)
);


INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State) 
VALUES (1, 1, 'BBSR', 'Odisha');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State)
VALUES (2, 2, 'Mumbai', 'Maharashtra');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State) 
VALUES (3, 3, 'BBSR', 'Odisha');
INSERT INTO `school`.`studentaddress` (AddressId, StudentId, City, State)
VALUES (4, 4, 'Mumbai', 'Maharashtra');


-- Now let us see how to export the School database. To do so, from the top menu select ‘Server’ and ‘Data Export’ Option.
/* It will open the data export settings and options window. 
The left section on the window displays all the existing databases on our MySQL database server.
When we select a database by clicking on it, it will display all the respected tables under the selected database. 
We can select one or more database check-boxes to include the database in the Export file. 
We can also select one or more tables from the right section of this window. */

-- So, let’s select our school database which we created earlier. And in the right-side pane, select the students and studentaddress table.

/* In the drop-down setting, we can select ‘Dump Structure Only’, ‘Dump Data Only’ or ‘Dump Structure and Data’ option. 
The ‘Dump Structure Only’ option will save only the table structure. That is database columns and data types defined by us. 
While ‘Dump Data Only’ option will save only the inserted rows in the tables. 
The Dump Structure and Data option will save both data and structure. 
Let’s choose the ‘Dump Structure and Data’ option to save both table structure and data rows in it. */

/* In the drop-down setting, we can select ‘Dump Structure Only’, ‘Dump Data Only’ or ‘Dump Structure and Data’ option. 
The ‘Dump Structure Only’ option will save only the table structure. That is database columns and data types defined by us.
 While ‘Dump Data Only’ option will save only the inserted rows in the tables. 
 The Dump Structure and Data option will save both data and structure. 
 Let’s choose the ‘Dump Structure and Data’ option to save both table structure and data rows in it */
 
 /* Under the Export Options section, you can change the default export path of your choice and I am going with the default one. 
 Also, there are two radio buttons. By selecting the first option that is ‘Export to Dump Project Folder’,
 MySQL Workbench will save all the tables as separate SQL files under one folder which is useful when you will be importing or 
 restoring the export file one by one table. The second option Export to Self-contained File will store all the databases and 
 tables in a single SQL file. This is a good option when you will be importing all the databases, tables, and data rows by using a single SQL file. 
 We will export the database using both the method, to understand the difference. 
 Let’s export the database using the first option ‘Export to Dump Project Folder’. */
 
 -- Finally, click on the start export button to start export functionality.
 
 -- Once you click on the start export button it will display the progress bar and log.
 
 -- Now, if you go to the location where it saved the file, then you will see multiple SQL files which are nothing but individual tables.

-- Now again go to the Server => Data Export window and this time select Export to self-contained file option and click on the Start Export button.

/* Once the Export did successfully, go to the folder location where this file saved and you will see under the dumps folder, 
we have a single dump file that includes all the databases and tables, and data rows. */


# Import Database using MySQL Workbench

/*Before Importing the database, let us first delete the tables which are already there in the school database by executing the below SQL statement.*/


DROP TABLE school.studentaddress;
DROP TABLE school.students;


SHOW TABLES;


/* Now let’s learn how to import the database and tables using the MySQL workbench. 
Go to the top ‘Server’ menu and select the ‘Data Import’ option. */

/* It will open the ‘Data import’ window which is exactly opposite to the data export window.
 Here you can either Import from the dump project folder or import by using a single self-contained file. */
 
 /* Here, I am Selecting Import from Dump project folder radio button option, and then I will select the dump project folder location 
 where we saved the file while exporting. */
 
 /* Once you select the Import from Dump project folder, then click the ‘Load Folder Content’ button to display all the available databases 
 in the ‘project folder’. */
 
 /* Next, select the school database from the left pane and select the tables that you want to import from the right-hand side, 
 select the Dump Structure and Data option from the drop-down list, and then click on the Select Tables and 
 finally click on the Start Import button. 
 
 Once you click on the Start Import button, it will import the data and if the import completed successfully, 
 then you will get the import completed window.
 
 Now again under the schemas option, go to the school database, and under the tables tab clicks ‘refresh’ and you can see 
 students and studentaddress tables appear again.
 
 In this way, we can export and import a single database table or multiple tables using MySQL Workbench ‘Data Export’ and ‘Data Import’ options. */
 
 
 -- To verify tables using MYSQL Query
DESC school.studentaddress;
DESC school.students;


SELECT * FROM studentaddress;
SELECT * FROM school.students;







 
 









