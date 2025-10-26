
# SQL Data Types (with Examples)
In SQL, every column in a table must have a data type, which defines the kind of data it can store. Choosing the correct data type ensures data integrity, storage efficiency, and better performance.

### ✅ 1. Numeric Data Types
Used for storing numbers (integers or decimals).

| Data Type       | Description                        | Example     |
|-----------------|------------------------------------|-------------|
| INT             | Integer values                     | 100, -50    |
| SMALLINT        | Smaller range of integer           | 32,000      |
| BIGINT          | Very large integers                | 9,000,000   |
| DECIMAL(p,s)    | Fixed-point (precise) decimals     | 10.25       |
| NUMERIC(p,s)    | Same as DECIMAL                    | 100.00      |
| FLOAT           | Approximate floating-point numbers | 3.14159     |
| REAL            | Lower precision than FLOAT         | 1.23        |


🔎 Use DECIMAL or NUMERIC when precision is critical, like in money calculations.

### ✅ 2. Character/String Data Types
Used for storing text.

| Data Type   | Description                                  | Example     |
|-------------|----------------------------------------------|-------------|
| CHAR(n)     | Fixed-length string                          | 'ABCD'      |
| VARCHAR(n)  | Variable-length string (up to n characters)  | 'Akshit'    |
| TEXT        | Large text values (limit varies by RDBMS)    | Essay text  |



🔍 Use VARCHAR for names, emails, etc. Use TEXT for longer inputs like articles or bios.

### ✅ 3. Date and Time Data Types
Used for storing dates and times.

| Data Type | Description                     | Example                 |
|-----------|---------------------------------|-------------------------|
| DATE      | Stores date only                | '2025-07-20'            |
| TIME      | Stores time only                | '13:45:00'              |
| DATETIME  | Stores both date and time       | '2025-07-20 13:45'      |
| TIMESTAMP | Unix-style date/time tracking   | Often auto-updated      |


✅ TIMESTAMP is often used for “created_at” or “last_updated” columns.

### ✅ 4. Boolean Data Type
Data Type	Description	Example

BOOLEAN	Stores TRUE or FALSE	TRUE

Some RDBMS may use TINYINT(1) as a workaround for boolean values (0 = false, 1 = true).

### ✅ 5. Binary Data Types (Advanced)
Used for storing files like images, PDFs, etc.

| Data Type  | Description                         |
|------------|-------------------------------------|
| BINARY     | Fixed-length binary data            |
| VARBINARY  | Variable-length binary data         |
| BLOB       | Binary Large Object (images, files) |


🧪 Example: Using Different Data Types
sql
Copy
Edit
````
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    joining_date DATE,
    is_active BOOLEAN
);
````
#### 🗣️ Interview Questions – Round 2
What is the difference between CHAR and VARCHAR?

Which data type would you use to store currency values? Why?

What’s the difference between DATE, DATETIME, and TIMESTAMP?

Can a VARCHAR column store numeric data?

What are some use cases for the BOOLEAN data type in a real-world table?



### Types of SQL Commands – DDL, DML, DQL, DCL, TCL
SQL commands are categorized based on what they do. Here's a breakdown of the 5 main types:

## ✅ 1. DDL – Data Definition Language
Used to define and modify the structure of database objects like tables, schemas, views, etc.

| Command   | Purpose                              |
|-----------|--------------------------------------|
| CREATE    | Creates a new table or database      |
| ALTER     | Modifies structure of a table        |
| DROP      | Deletes a table or database          |
| TRUNCATE  | Removes all rows from a table        |
| RENAME    | Changes the name of a table          |


Example:
sql
Copy
Edit
````
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(8, 2)
);
ALTER TABLE Products ADD quantity INT;

DROP TABLE Products;
````
##  ✅ 2. DML – Data Manipulation Language
Used to manipulate data in the database (but not table structure).

| Command | Purpose                   |
|---------|---------------------------|
| INSERT  | Add new data to a table   |
| UPDATE  | Modify existing data      |
| DELETE  | Delete data from a table  |


Example:
sql
Copy
Edit
````
INSERT INTO Products (id, name, price) VALUES (1, 'Phone', 599.99);

UPDATE Products SET price = 549.99 WHERE id = 1;

DELETE FROM Products WHERE id = 1;
````
### ✅ 3. DQL – Data Query Language
Used to query the database and fetch data.
| Command | Purpose                        |
|---------|--------------------------------|
| SELECT  | Retrieves data from tables     |


Example:
sql
Copy
Edit
````
SELECT * FROM Products WHERE price > 500;
````
🔎 Note: SELECT is the only DQL command.

### ✅ 4. DCL – Data Control Language
Used to control access and permissions on database objects.
| Command | Purpose                      |
|---------|------------------------------|
| GRANT   | Gives permission to users    |
| REVOKE  | Removes granted permissions  |


Example:
sql
Copy
Edit
````
GRANT SELECT, INSERT ON Products TO 'akshit';

REVOKE INSERT ON Products FROM 'akshit';
````
### ✅ 5. TCL – Transaction Control Language
Used to manage transactions and ensure data integrity.
| Command         | Purpose                                      |
|-----------------|----------------------------------------------|
| COMMIT          | Saves changes permanently                    |
| ROLLBACK        | Reverts changes since last COMMIT            |
| SAVEPOINT       | Creates a save point to roll back to partially |
| SET TRANSACTION | Sets properties for a transaction            |


Example:
sql
Copy
Edit
````
BEGIN;
UPDATE Products SET price = 499.99 WHERE id = 1;
SAVEPOINT BeforeDiscount;
UPDATE Products SET price = 399.99 WHERE id = 1;
ROLLBACK TO BeforeDiscount;
COMMIT;
````
### 🔄 Summary Table
| Category | Full Form                   | Focus                  | Examples                        |
|----------|-----------------------------|------------------------|---------------------------------|
| DDL      | Data Definition Language     | Structure              | CREATE, ALTER, DROP            |
| DML      | Data Manipulation Language   | Data in tables         | INSERT, UPDATE, DELETE         |
| DQL      | Data Query Language          | Retrieving data        | SELECT                          |
| DCL      | Data Control Language        | Permissions and security| GRANT, REVOKE                  |
| TCL      | Transaction Control Language | Managing transactions  | COMMIT, ROLLBACK, SAVEPOINT    |


#### 🗣️ Interview Questions – Round 3
What’s the difference between DDL and DML?

Why is SELECT not considered part of DML?

What is the purpose of ROLLBACK in SQL?

How does TRUNCATE differ from DELETE?

Can we use SAVEPOINT without a transaction?



### 📘 Table Related Queries – Creating & Viewing Tables

---

### ✅ 1. Creating a Table

To define a new table, we use the `CREATE TABLE` statement.

#### 🔹 Syntax:
````sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    ...
);
````

#### 🔹 Example:
````sql
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    grade CHAR(1)
);
````

#### ✅ Explanation:
- `student_id INT PRIMARY KEY`: Unique identifier.
- `name VARCHAR(100) NOT NULL`: Max 100 characters, can't be null.
- `age INT`: Integer value.
- `grade CHAR(1)`: Single character like A, B, C.

---

### ✅ 2. Viewing Table Structure

To view table columns, types, and constraints:

**MySQL:**
````sql
DESCRIBE Student;
````

**PostgreSQL / Oracle:**
````sql
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'student';
````

---

### ✅ 3. Viewing All Data – SELECT *

To fetch all rows and columns:

#### 🔹 Syntax:
````sql
SELECT * FROM table_name;
````

#### 🔹 Example:
````sql
SELECT * FROM Student;
````

⚠️ **Note:** Useful for debugging, but avoid `SELECT *` in production.

---

### ✅ 4. Viewing Specific Columns

To fetch selected columns only:
````sql
SELECT name, grade FROM Student;
````

---

### ✅ 5. Renaming a Table

**MySQL:**
````sql
RENAME TABLE Student TO Students;
````

**Oracle / Other SQLs:**
````sql
ALTER TABLE Student RENAME TO Students;
````

---

### ✅ 6. Deleting a Table

````sql
DROP TABLE Students;
````

⚠️ **Warning:** Deletes table structure and all data permanently!

---

### 🗣️ Interview Questions – Round 4

- What is the difference between `DROP` and `TRUNCATE`?
- Can a column have both `PRIMARY KEY` and `NOT NULL`?
- What does `DESCRIBE` do in SQL?
- Why should we avoid using `SELECT *`?
- What's the use of `VARCHAR` in table definitions?




## INSERT INTO – Adding Data to Tables
### ✅ 1. Basic Syntax of INSERT INTO
To insert data into a table, use this structure:

sql
Copy
Edit
````
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
````
🚨 You must match column names and values in the same order and quantity.

### ✅ 2. Inserting One Row into a Table
Let's say we have this table:

sql
Copy
Edit
````
CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);
````
Now to insert data:

sql
Copy
Edit
````
INSERT INTO Student (rollno, name)
VALUES (101, 'Karan');


INSERT INTO Student (rollno, name)
VALUES (102, 'Arjun');
````
✅ These two statements insert two students into the table.

### ✅ 3. Inserting Multiple Rows at Once
sql
Copy
Edit
````
INSERT INTO Student (rollno, name)
VALUES 
  (103, 'Rahul'),
  (104, 'Simran'),
  (105, 'Raj');
````
💡 This is more efficient when inserting bulk data.

❌ Let’s Fix Your Code Example
You wrote:

sql
Copy
Edit
````
INSERT INTO student
(rollno,
name )
VALUES
(101,
(102,
"karan"
"arjun"
````
The corrected version is:

sql
Copy
Edit
````
INSERT INTO Student (rollno, name)
VALUES 
  (101, 'Karan'),
  (102, 'Arjun');
````
✅ Now it’s syntactically correct and will work in any SQL database.

#### 🗣️ Interview Questions – Round 5
What happens if you insert a duplicate value into a column with a PRIMARY KEY constraint?

Can we insert data into some columns only and leave the rest?

How do you insert multiple rows with a single INSERT command?

What’s the difference between 'Karan' and "Karan" in SQL?

What error do you get if you insert fewer values than columns without specifying column names?

## Keys in SQL – Primary Key & Foreign Key
### ✅ 1. Primary Key (PK)
A Primary Key uniquely identifies each row in a table. It ensures that:

No duplicate values

No NULL values

Only one primary key per table (though it can consist of multiple columns — called a composite key)

🔹 Syntax:
sql
Copy
Edit
CREATE TABLE Student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50)
);
🔹 Another Example (Composite Primary Key):
sql
Copy
Edit
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
### ✅ 2. Foreign Key (FK)
A Foreign Key is a column in one table that refers to the Primary Key in another table.

Maintains referential integrity

Can contain duplicate and NULL values

A table can have multiple foreign keys

🔹 Example:
sql
Copy
Edit
-- Parent table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Child table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
In this example:

Department is the parent table.

Employee.dept_id is a foreign key pointing to Department.dept_id.

### ✅ 3. Key Differences: Primary Key vs Foreign Key
Feature	Primary Key	Foreign Key
Purpose	Uniquely identifies a row	Links to another table’s PK
Nulls Allowed?	❌ No	✅ Yes (can be NULL)
Duplicates?	❌ No	✅ Yes (can be duplicate)
Count Per Table	Only one	Can be many
Table Role	Exists in main (parent) table	Exists in related (child) table

### 🗣️ Interview Questions – Round 6
What is the main purpose of a primary key?

Can a foreign key point to a column that is not a primary key?

Can a foreign key accept NULL values? Why?

What is a composite primary key? Give an example.

Can a table have more than one primary key or foreign key?


### SQL Constraints – Rules to Protect Your Data
SQL constraints are rules enforced on columns in a table to restrict the type of data that can be stored. Constraints help you maintain clean, valid, and consistent data.

### ✅ 1. NOT NULL
Prevents a column from having NULL (empty) values.

🔹 Example:
sql
Copy
Edit
CREATE TABLE Student (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL
);
🔍 Use NOT NULL when a column must always have a value (e.g., username, email, ID).

### ✅ 2. UNIQUE
Ensures all values in a column are different.

🔹 Example:
sql
Copy
Edit
CREATE TABLE Student (
    email VARCHAR(100) UNIQUE
);
🔍 Unlike PRIMARY KEY, UNIQUE can have NULL values unless combined with NOT NULL.

### ✅ 3. PRIMARY KEY
Unique + Not Null

Only one per table

Can be a single column or a composite (multiple columns)

🔹 Example:
sql
Copy
Edit
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);
### ✅ 4. FOREIGN KEY
Ensures referential integrity between two related tables.

🔹 Example:
sql
Copy
Edit
CREATE TABLE Enrollment (
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);
🔍 Prevents inserting values that don’t exist in the parent table.

### ✅ 5. DEFAULT
Sets a default value for a column when no value is provided.

🔹 Example:
sql
Copy
Edit
CREATE TABLE Student (
    id INT,
    city VARCHAR(50) DEFAULT 'Delhi'
);
sql
Copy
Edit
INSERT INTO Student (id) VALUES (1);
-- city will be 'Delhi' by default
### ✅ 6. CHECK
Limits the values that can be entered in a column.

🔹 Example:
sql
Copy
Edit
CREATE TABLE Student (
    age INT CHECK (age >= 18)
);
🔍 If someone tries to insert age = 16, it will throw an error.

### ✅ 7. ALL CONSTRAINTS TOGETHER – Example Table
sql
Copy
Edit
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Delhi'
);
### 🗣️ Interview Questions – Round 7
What’s the difference between UNIQUE and PRIMARY KEY?

Can a column have both DEFAULT and NOT NULL constraints?

What happens if you try to insert a duplicate value in a UNIQUE column?

What does the CHECK constraint do?

How does the FOREIGN KEY constraint maintain referential integrity?


### SELECT Statement & WHERE Clause – in Detail
### ✅ 1. Basic SELECT Syntax
SELECT is used to fetch data from one or more tables.

🔹 Syntax:
sql
Copy
Edit
SELECT column1, column2
FROM table_name;
🔹 Example:
sql
Copy
Edit
SELECT name, age
FROM Student;
### ✅ 2. Selecting All Columns – *
sql
Copy
Edit
SELECT * FROM Student;
✅ This fetches all columns from the Student table. Use only for quick tests or small tables — avoid in production for performance reasons.

### ✅ 3. WHERE Clause – Filtering Rows
The WHERE clause is used to filter rows based on a condition.

🔹 Syntax:
sql
Copy
Edit
SELECT column1, column2
FROM table_name
WHERE condition;
🔹 Example:
sql
Copy
Edit
SELECT name, age
FROM Student
WHERE age >= 18;
### ✅ 4. Operators with WHERE
Operator	Meaning	Example
=	Equal to	age = 20
!= or <>	Not equal to	age <> 20
>	Greater than	age > 18
<	Less than	age < 30
>=	Greater or equal	age >= 18
<=	Less or equal	age <= 25

### ✅ 5. Combining Conditions – AND, OR, NOT
🔹 AND
sql
Copy
Edit
SELECT * FROM Student
WHERE age >= 18 AND city = 'Delhi';
🔹 OR
sql
Copy
Edit
SELECT * FROM Student
WHERE city = 'Delhi' OR city = 'Mumbai';
🔹 NOT
sql
Copy
Edit
SELECT * FROM Student
WHERE NOT age < 18;
### ✅ 6. Other Powerful Clauses
Clause	Description	Example
BETWEEN	Value in range	age BETWEEN 18 AND 25
IN	Matches any value in list	city IN ('Delhi', 'Mumbai', 'Pune')
LIKE	Pattern matching using wildcards	name LIKE 'A%' (starts with A)
IS NULL	Checks for NULL values	email IS NULL
IS NOT NULL	Checks for NOT NULL values	email IS NOT NULL

🧪 Examples:
sql
Copy
Edit
SELECT * FROM Student
WHERE city IN ('Delhi', 'Pune') AND age BETWEEN 18 AND 22;
sql
Copy
Edit
SELECT name FROM Student
WHERE name LIKE 'A%'; -- Names starting with A
sql
Copy
Edit
SELECT * FROM Student
WHERE email IS NULL;
### 🗣️ Interview Questions – Round 8
What does SELECT * do, and when should it be avoided?

What’s the difference between WHERE and HAVING?

How does BETWEEN work, and is it inclusive?

What’s the result of name LIKE '%an%'?

Write a query to select all students whose city is not 'Delhi' and age is greater than 20.



## SQL Operators (Arithmetic, Comparison, Logical, Bitwise)
### ✅ 1. Arithmetic Operators
These perform basic mathematical operations on numeric columns.

Operator	Meaning	Example
+	Addition	salary + bonus
-	Subtraction	marks - 5
*	Multiplication	price * quantity
/	Division	total / 2
%	Modulus (remainder)	marks % 2

🔹 Example Query:
sql
Copy
Edit
SELECT name, marks, marks + 5 AS updated_marks
FROM Student;
### ✅ 2. Comparison Operators
Used in the WHERE clause to compare values.

Operator	Meaning	Example
=	Equal to	WHERE age = 18
!= or <>	Not equal to	WHERE city <> 'Delhi'
>	Greater than	WHERE salary > 10000
<	Less than	WHERE marks < 50
>=	Greater or equal	WHERE age >= 18
<=	Less or equal	WHERE age <= 25

### ✅ 3. Logical Operators
Used to combine multiple conditions in a WHERE clause.

Operator	Description	Example
AND	All conditions must be true	WHERE age > 18 AND city = 'Pune'
OR	Any one condition must be true	WHERE age < 18 OR city = 'Delhi'
NOT	Reverses a condition	WHERE NOT age > 18
IN	Matches any value in a list	WHERE city IN ('Delhi', 'Pune')
BETWEEN	Value is in a range	WHERE marks BETWEEN 60 AND 80
LIKE	Pattern matching (wildcards %, _)	WHERE name LIKE 'A%'
ANY	Compares to any value from subquery	WHERE age > ANY (SELECT age FROM Student)
ALL	Compares to all values from subquery	WHERE age > ALL (SELECT age FROM Student)

### ✅ 4. Bitwise Operators
Used to compare bits of integers (rare in daily SQL use, but known for interviews).

Operator	Description	Example
&	Bitwise AND	SELECT 5 & 3; → returns 1
`	`	Bitwise OR

🔹 Binary View:
5 = 101

3 = 011

5 & 3 = 001 (1)

5 | 3 = 111 (7)

✅ Using These Operators in WHERE
sql
Copy
Edit
SELECT name, age
FROM Student
WHERE age BETWEEN 18 AND 25
  AND city IN ('Delhi', 'Mumbai')
  AND marks % 2 = 0;
✅ This gets students:

Whose age is between 18 and 25

Who live in Delhi or Mumbai

Whose marks are even numbers

### 🗣️ Interview Questions – Round 9
What is the difference between = and IN in a WHERE clause?

What does the % operator do in SQL?

How does the BETWEEN clause handle boundary values?

Give an example using LIKE and explain what it does.

What is the difference between ANY and ALL?

## LIMIT Clause & LIKE Operator – Filtering and Controlling Results
### ✅ 1. LIMIT Clause
The LIMIT clause is used to restrict the number of rows returned in the result set.

🔹 Syntax:
sql
Copy
Edit
SELECT column1, column2
FROM table_name
LIMIT number;
🔹 Example:
sql
Copy
Edit
SELECT * FROM Student
LIMIT 5;
✅ This will return only the first 5 rows from the Student table.

### ✅ 2. LIMIT with OFFSET
Sometimes you want to skip the first few rows and start from a specific position.

🔹 Syntax:
sql
Copy
Edit
SELECT * FROM Student
LIMIT 5 OFFSET 10;
✅ This skips the first 10 rows and then returns the next 5 rows.

🔹 Another way (MySQL-style):
sql
Copy
Edit
SELECT * FROM Student
LIMIT 10, 5;  -- 10 is OFFSET, 5 is LIMIT
### ✅ 3. LIKE Operator – Pattern Matching
LIKE is used in the WHERE clause to search for patterns in text data.

Pattern	Description	Example
'A%'	Starts with 'A'	LIKE 'A%'
'%n'	Ends with 'n'	LIKE '%n'
'%ra%'	Contains 'ra'	LIKE '%ra%'
'A_L'	'A' followed by any one char and then 'L'	LIKE 'A_L'

🔹 Example:
sql
Copy
Edit
SELECT name FROM Student
WHERE name LIKE 'A%';
✅ Returns names that start with 'A', e.g., "Akshit", "Arjun", "Anjali".

### ✅ 4. Using LIKE with LIMIT Together
sql
Copy
Edit
SELECT name FROM Student
WHERE name LIKE 'A%'
LIMIT 3;
✅ Returns the first 3 students whose names start with A.

✅ Bonus: NOT LIKE
Use NOT LIKE to exclude patterns.

sql
Copy
Edit
SELECT name FROM Student
WHERE name NOT LIKE 'A%';
✅ Gets all names that do not start with A.

### 🗣️ Interview Questions – Round 10
What does the LIMIT clause do?

How would you write a query to get rows 11 to 20 from a table?

What is the difference between LIKE 'A%' and LIKE '%A'?

Can we use LIKE with numeric columns?

How is LIMIT different from TOP (used in SQL Server)?

 ## ORDER BY Clause & Aggregate Functions
### ✅ 1. ORDER BY Clause
Used to sort the result set either in:

Ascending order (ASC) – Default

Descending order (DESC)

🔹 Syntax:
sql
Copy
Edit
SELECT col1, col2
FROM table_name
ORDER BY col1 ASC;   -- or DESC
🔹 Example:
sql
Copy
Edit
SELECT name, marks
FROM student
ORDER BY marks DESC;
✅ This will list students in order of highest to lowest marks.

🔹 Multiple Columns in ORDER BY:
sql
Copy
Edit
SELECT name, class, marks
FROM student
ORDER BY class ASC, marks DESC;
✅ First sorts by class (ascending), then by marks (descending) within each class.

### ✅ 2. Aggregate Functions
Aggregate functions perform calculations on groups of rows and return a single value.

Function	Description
COUNT()	Returns the number of rows
MAX()	Returns the highest value
MIN()	Returns the lowest value
SUM()	Returns the total sum
AVG()	Returns the average

📘 Examples of Aggregate Functions:
🔹 1. COUNT():
sql
Copy
Edit
SELECT COUNT(*) FROM student;
✅ Counts total number of rows in student table.

🔹 2. MAX() and MIN():
sql
Copy
Edit
SELECT MAX(marks), MIN(marks) FROM student;
✅ Finds the highest and lowest marks.

🔹 3. SUM():
sql
Copy
Edit
SELECT SUM(marks) FROM student;
✅ Returns the total marks scored by all students.

🔹 4. AVG():
sql
Copy
Edit
SELECT AVG(marks) FROM student;
✅ Returns the average marks of all students.

### ✅ 3. Using Aggregate with WHERE Clause
sql
Copy
Edit
SELECT COUNT(*) FROM student
WHERE class = '10A';
✅ Counts students only from class 10A.

### 🗣️ Interview Questions – Round 11
What is the default sorting order in SQL using ORDER BY?

Can you sort using more than one column? Give an example.

What's the difference between COUNT(*) and COUNT(column_name)?

Write a query to find the student with the highest marks.

What would the result of AVG() be if one of the values is NULL?


## GROUP BY & HAVING Clauses
### ✅ 1. GROUP BY Clause
GROUP BY groups rows that have the same value into summary rows, often used with aggregate functions like COUNT(), SUM(), MAX() etc.

🔹 Syntax:
sql
Copy
Edit
SELECT column, AGG_FUNC(column)
FROM table_name
GROUP BY column;
🔹 Example 1: Count number of students in each city
sql
Copy
Edit
SELECT city, COUNT(*) AS total_students
FROM student
GROUP BY city;
✅ This groups all students by city and shows how many students live in each.

🔹 Example 2: Get average marks per class
sql
Copy
Edit
SELECT class, AVG(marks) AS avg_marks
FROM student
GROUP BY class;
### ✅ 2. HAVING Clause
HAVING is like WHERE, but it's used after grouping to filter aggregated results.

You cannot use WHERE with aggregate functions, that's why HAVING exists.

🔹 Example 3: Count of students in each city where MAX marks > 90
sql
Copy
Edit
SELECT city, MAX(marks) AS top_score
FROM student
GROUP BY city
HAVING MAX(marks) > 90;
✅ This filters only those cities where top student scored above 90.

🔹 Example 4: Find classes with more than 10 students
sql
Copy
Edit
SELECT class, COUNT(*) AS student_count
FROM student
GROUP BY class
HAVING COUNT(*) > 10;
### ✅ General SQL Execution Order (Very Important for Interviews):
sql
Copy
Edit
SELECT columns
FROM table_name
WHERE condition        -- filters raw rows
GROUP BY column(s)     -- groups remaining rows
HAVING condition       -- filters grouped data
ORDER BY column        -- sorts final result
### 🗣️ Interview Questions – Round 12
What is the difference between WHERE and HAVING?

Can we use aggregate functions in WHERE clause? Why or why not?

Write a query to find the average marks in each class, but only show classes where the average is above 75.

What will happen if you use GROUP BY without an aggregate function?

How is HAVING COUNT(*) > 1 used in detecting duplicate values?


## UPDATE and DELETE in SQL
### ✅ 1. UPDATE Statement
Used to modify existing records in a table.

🔹 Syntax:
sql
Copy
Edit
UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE condition;
⚠️ Always use WHERE to avoid updating all rows by mistake.

🔹 Example 1:
sql
Copy
Edit
UPDATE student
SET marks = 95
WHERE rollno = 101;
✅ This updates the marks of the student whose roll number is 101.

🔹 Example 2: Update name of all students in class 10
sql
Copy
Edit
UPDATE student
SET name = 'Updated Name'
WHERE class = 10;
### ✅ 2. DELETE Statement
Used to remove existing records from a table.

🔹 Syntax:
sql
Copy
Edit
DELETE FROM table_name
WHERE condition;
⚠️ If you skip the WHERE, it deletes ALL rows.

🔹 Example 3:
sql
Copy
Edit
DELETE FROM student
WHERE rollno = 105;
✅ Deletes the student whose roll number is 105.

🔹 Example 4: Delete all students from a city
sql
Copy
Edit
DELETE FROM student
WHERE city = 'Delhi';
🧨 Important Tips
Task	Statement	Danger if…
Update row	UPDATE ... SET ... WHERE	No WHERE → updates all rows
Delete row	DELETE FROM ... WHERE	No WHERE → deletes all rows
Delete all rows	DELETE FROM table_name;	This clears entire table

### 🗣️ Interview Questions – Round 13
What is the difference between UPDATE and DELETE?

What happens if you run DELETE FROM student; without WHERE?

Can you update multiple columns at once? Show an example.

How do you delete all records but keep the structure of the table?

How is DELETE different from TRUNCATE?

## Foreign Key Cascading & Table Alterations
### ✅ 1. Foreign Key Cascading Options
When defining a FOREIGN KEY, we can specify what happens to the child table when the parent table’s data is updated or deleted.

##### 🔹 ON DELETE CASCADE
Automatically deletes child table rows when the corresponding row in the parent table is deleted.

sql
Copy
Edit
FOREIGN KEY (student_id)
REFERENCES students(id)
ON DELETE CASCADE
📌 Use Case: If a student is deleted, their marks or attendance in related tables will also be deleted.

##### 🔹 ON UPDATE CASCADE
Automatically updates the child table rows if the referenced primary key value in the parent table is updated.

sql
Copy
Edit
FOREIGN KEY (student_id)
REFERENCES students(id)
ON UPDATE CASCADE
📌 Use Case: If a student’s ID is changed (rare case), that change will reflect in all related tables.

### ✅ 2. ALTER TABLE – To Modify Table Structure
SQL allows us to change table schemas using ALTER TABLE.

##### 🔹 ADD COLUMN
sql
Copy
Edit
ALTER TABLE student
ADD COLUMN age INT;
##### 🔹 DROP COLUMN
sql
Copy
Edit
ALTER TABLE student
DROP COLUMN age;
##### 🔹 RENAME TABLE
sql
Copy
Edit
ALTER TABLE student
RENAME TO student_info;
### ✅ 3. MODIFY vs CHANGE COLUMN
Operation	Syntax	Description
MODIFY	MODIFY col_name datatype constraints;	Change data type or constraints
CHANGE	CHANGE old_name new_name datatype constraints;	Rename a column and change its type

##### 🔹 Example (MODIFY):
sql
Copy
Edit
ALTER TABLE student
MODIFY age VARCHAR(3);
##### 🔹 Example (CHANGE):
sql
Copy
Edit
ALTER TABLE student
CHANGE COLUMN age student_age INT;
### ✅ 4. TRUNCATE TABLE
Used to delete all records from a table fast and reset identity (auto_increment).

sql
Copy
Edit
TRUNCATE TABLE student;
📌 Faster than DELETE without WHERE and cannot be rolled back (in most DBs).

🧨 Table Alteration Summary
Action	SQL Syntax Example
Add Column	ALTER TABLE t ADD col_name datatype;
Drop Column	ALTER TABLE t DROP COLUMN col_name;
Rename Table	ALTER TABLE old_name RENAME TO new_name;
Modify Column	ALTER TABLE t MODIFY col_name new_type;
Change Column Name	ALTER TABLE t CHANGE old_name new_name new_type;
Truncate Table	TRUNCATE TABLE t;

#### 🗣️ Interview Questions – Round 14
What is the difference between ON DELETE CASCADE and ON UPDATE CASCADE?

What is the difference between MODIFY and CHANGE in SQL?

How can you add a new column to an existing table?

What happens when you TRUNCATE a table? Can it be rolled back?

How is TRUNCATE different from DELETE FROM table;?

# 🧩 SQL JOINS – Deep Dive

## 🔗 What is a JOIN?
A **JOIN** combines rows from two or more tables based on a related column (usually a foreign key = primary key relationship).

---

## ✅ Types of SQL Joins

| Type of JOIN | What it returns |
|---------------|----------------|
| **INNER JOIN** | Only matching records in both tables |
| **LEFT JOIN** | All records from left + matched from right |
| **RIGHT JOIN** | All records from right + matched from left |
| **FULL JOIN** | All records from both tables (matched or not) |

---

## 📌 Base Tables for Examples

### `students`
| student_id | name  |
|-------------|-------|
| 1 | Akshit |
| 2 | Rahul |
| 3 | Priya |
| 4 | Neha |

### `enrollments`
| enroll_id | student_id | course |
|------------|-------------|--------|
| 1 | 1 | DSA |
| 2 | 2 | SQL |
| 3 | 5 | Java |

---

## 🔸 1. INNER JOIN
Returns only students who are enrolled in a course.

```sql
SELECT s.student_id, s.name, e.course
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id;

🔍 Result:
student_id	name	course
1	Akshit	DSA
2	Rahul	SQL

🧠 Neha and Priya not returned because they didn’t match.

## 🔸 2. LEFT JOIN
Returns all students, and course info if available.

sql
Copy
Edit
SELECT s.student_id, s.name, e.course
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id;
🔍 Result:
student_id	name	course
1	Akshit	DSA
2	Rahul	SQL
3	Priya	NULL
4	Neha	NULL

🧠 Priya & Neha shown with NULL since they’re not enrolled.

🔸 3. RIGHT JOIN
Returns all enrollments, and student info if exists.

sql
Copy
Edit
SELECT s.name, e.course
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;
🔍 Result:
name	course
Akshit	DSA
Rahul	SQL
NULL	Java

🧠 Student ID 5 is in enrollments but not in students.

🔸 4. FULL JOIN (Simulated in MySQL)
MySQL doesn’t support FULL JOIN directly, so we simulate it using UNION.

sql
Copy
Edit
SELECT s.student_id, s.name, e.course
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id

UNION

SELECT s.student_id, s.name, e.course
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;
🔍 Result:
student_id	name	course
1	Akshit	DSA
2	Rahul	SQL
3	Priya	NULL
4	Neha	NULL
NULL	NULL	Java

🧠 Combines both LEFT and RIGHT JOIN results.

🔥 HARD-LEVEL JOIN SCENARIOS (Interview-Level)
⚔️ Example 1: List students who have not enrolled in any course.
sql
Copy
Edit
SELECT s.name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
⚔️ Example 2: List courses where the student is not present in the students table (data inconsistency).
sql
Copy
Edit
SELECT e.course
FROM enrollments e
LEFT JOIN students s
ON s.student_id = e.student_id
WHERE s.student_id IS NULL;
⚔️ Example 3: Find students and the number of courses they enrolled in (Aggregate + JOIN)
sql
Copy
Edit
SELECT s.name, COUNT(e.course) AS total_courses
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.name;
⚔️ Example 4: Join 3 Tables – students + enrollments + courses
Assume we also have:

courses
course_id	course_name
1	DSA
2	SQL
3	Java

And enrollments has course_id instead of name.

sql
Copy
Edit
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
🧠 Summary Table
JOIN Type	What it returns
INNER JOIN	Matches only
LEFT JOIN	All from left
RIGHT JOIN	All from right
FULL JOIN	All from both

🎯 Interview Questions – Round 15
What is the difference between LEFT JOIN and INNER JOIN?

Can we perform FULL JOIN in MySQL? How?

Write a query to find records in one table but not in the other.

How do you join 3 or more tables?

Which JOIN is best to find unmatched records?
Summary Table
Join Type	Matching Required	Nulls Returned	Best For
INNER JOIN	Yes	No	Data that exists in both
LEFT JOIN	Optional (Right)	Yes (Right)	All from left, optional right
RIGHT JOIN	Optional (Left)	Yes (Left)	All from right, optional left
FULL JOIN	No	Yes (Both)	All data regardless of match
CROSS JOIN	No	No	Combinations of rows
SELF JOIN	Custom	No	Hierarchical/Same table joins
NATURAL JOIN	Auto	Risky	Quick but uncontrolled matches


QL Subqueries – The Easy Way
✅ What is a Subquery?
A subquery is a SQL query inside another query.

You use it when your main query (called the outer query) needs help from another mini query (called the inner query).

Think of it like this:

“I want all the students whose roll numbers are in this list (that comes from another query).”

🔹 Syntax (Looks like this):
sql
Copy
Edit
SELECT column_name
FROM table_name
WHERE column_name IN (
   SELECT column_name FROM other_table WHERE condition
);
🧊 Easy Example
Tables:

DATABASE: Stores student name, location, and phone.

STUDENT: Stores roll number and section.

❓ Question:
Get the name, location, and phone number of students who are in section ‘A’.

sql
Copy
Edit
SELECT NAME, LOCATION, PHONE_NUMBER
FROM DATABASE
WHERE ROLL_NO IN (
  SELECT ROLL_NO FROM STUDENT WHERE SECTION = 'A'
);
📌 Explanation:

Inner query gets roll numbers from STUDENT table where section is 'A'.

Outer query gets details of those students from DATABASE.

🔁 Types of Subqueries
Type	Returns	Used With
Single-row	1 value	=, >, <
Multi-row	Multiple values	IN, ANY, ALL
Correlated	Refers outer query	Advanced filtering
Non-Correlated	Works alone	Simple filters

🧪 More Subquery Examples
🔹 Example 2: Subquery with INSERT
👉 Add data from one table into another.

sql
Copy
Edit
INSERT INTO Student1
SELECT * FROM Student2;
🧠 It copies all records from Student2 to Student1.

🔹 Example 3: Subquery with DELETE
👉 Delete records from one table based on data in another.

sql
Copy
Edit
DELETE FROM Student2
WHERE ROLL_NO IN (
  SELECT ROLL_NO FROM Student1 WHERE LOCATION = 'chennai'
);
🧠 Deletes all students from Student2 who are from Chennai (as per Student1).

🔹 Example 4: Subquery with UPDATE
👉 Update data using info from another table.

sql
Copy
Edit
UPDATE Student2
SET NAME = 'geeks'
WHERE LOCATION IN (
  SELECT LOCATION FROM Student1
  WHERE NAME IN ('Raju', 'Ravi')
);
🧠 Changes name to "geeks" for students in Student2 whose location matches that of Raju or Ravi in Student1.

⚙️ Tips for Writing Good Subqueries
✅ Use EXISTS instead of IN if the subquery returns many rows
✅ Use aliases for better readability
✅ Avoid too many layers of subqueries — use JOINs when possible
✅ Always use parentheses around subqueries
✅ Practice on real data — try modifying examples

📊 Real World Analogy
You’re a teacher. You ask:

“Give me names of students in section A.”

Your assistant says:

“Let me check the list of roll numbers in section A first.” (subquery)

Then gives you names using those roll numbers. (main query)

#### 🗣️ Interview Questions – Subquery Focus
What is the difference between correlated and non-correlated subqueries?

How would you delete rows from one table based on data in another table?

Can a subquery return more than one row? If yes, how?

Why might EXISTS be faster than IN in some databases?

How do subqueries in the FROM clause differ from those in WHERE?


SQL Stored Procedures – Made Super Simple
✅ What Is a Stored Procedure?
Think of a stored procedure as a pre-saved function in your database.

📦 It’s like saving a shortcut for a task (a group of SQL commands) so you don’t have to write them again and again.

📌 Real-Life Analogy:
Imagine you're running a shop. Every day, you want to:

Check customers from Sri Lanka

Print their name and contact

Instead of writing the same SQL query daily, you save it in a procedure and just call it like:

sql
Copy
Edit
EXEC GetCustomersByCountry @Country = 'Sri Lanka';
🎉 Boom! You get your result without rewriting anything.

🔧 Basic Syntax
sql
Copy
Edit
CREATE PROCEDURE procedure_name
   @parameter1 datatype,
   @parameter2 datatype
AS
BEGIN
   -- SQL statements here
END;
Then, you run (execute) it like this:

sql
Copy
Edit
EXEC procedure_name @parameter1 = value, @parameter2 = value;
👶 Simple Example
🎯 Goal: Get customers from a specific country
sql
Copy
Edit
CREATE PROCEDURE GetCustomersByCountry
   @Country VARCHAR(50)
AS
BEGIN
   SELECT CustomerName, ContactName
   FROM Customers
   WHERE Country = @Country;
END;
✅ To run this:
sql
Copy
Edit
EXEC GetCustomersByCountry @Country = 'Sri Lanka';
📦 Result:

diff
Copy
Edit
CustomerName | ContactName
-------------|--------------
Naveen       | Tulasi
🚀 Why Use Stored Procedures?
Reason	Why It’s Cool 😎
🎯 Faster Execution	Precompiled = executes faster
🔐 More Secure	Users can't touch raw tables directly
🔁 Reusable	Write once, use many times
📶 Less Network Load	All logic happens in one go
🛠️ Easy to Maintain	Edit one procedure = updates everywhere

🧱 Types of Stored Procedures
System Stored Procedures 🏗️
Built-in by SQL Server
Example: sp_help, sp_rename

User-Defined Procedures (UDPs) 👨‍💻
Created by us
Example: GetCustomersByCountry

Extended Procedures 🔌
Connect with programs written in other languages (like C/C++)

CLR Procedures 💻
Created using .NET languages like C#

🔥 Use Cases (Where They Help)
🛒 E-commerce: Place orders, update inventory, send invoices

🧮 HR Systems: Calculate salary, taxes, generate payslip

✅ Validation: Check if an email or user already exists

🔍 Audit Logs: Track who changed what and when

📌 Best Practices (Coach Tips!)
Keep It Simple & Modular
Break big procedures into smaller tasks

Use Error Handling
Like this:

sql
Copy
Edit
BEGIN TRY
  -- your SQL
END TRY
BEGIN CATCH
  -- what to do if error
END CATCH
Avoid Hardcoding
Use parameters (e.g., @Country) not fixed values ('India')

Limit Cursors
Use WHILE or sets — they're faster!

Performance Matters
Use indexing, avoid unnecessary joins, and keep it clean.

🧩 Mini Quiz Time
Q1. What is the main benefit of a stored procedure?
A. It's stored in a file
B. You can copy-paste it easily
C. It's reusable and faster to execute
✅ Answer: C

Q2. What keyword do we use to run a stored procedure?
✅ EXEC

Q3. What’s the best way to pass changing data to a procedure?
✅ Use parameters (e.g., @Country)



Window Functions in SQL – Super Simple Explanation
🔍 What is a Window Function?
Window functions allow you to do calculations across rows that are "related" to the current row — without grouping or losing individual rows.

Think of it like this:

🪟 A window is a "view" into a set of rows — and for each row, you can look across this set and perform a calculation like sum, average, rank, etc.

📖 Real Life Analogy:
Imagine you’re looking at a class list of students, and for each student you want to know:

Their rank in class based on marks

The average marks in their section

The total marks till now (running total)

You don't want to group them and lose rows — you want all the data plus your extra calculation.

🛠 Basic Syntax
sql
Copy
Edit
SELECT col1,
       window_function(col2) OVER (
            PARTITION BY col3
            ORDER BY col4
       ) AS new_col
FROM table_name;
🔑 Key Parts:
window_function: Could be SUM(), AVG(), RANK(), etc.

OVER: Tells SQL this is a window function

PARTITION BY: Divide rows into groups (like by department)

ORDER BY: Sort rows within each group (like by salary)

✨ Types of Window Functions
1️⃣ Aggregate Window Functions
These work like SUM(), AVG() etc. but keep all rows in the result.

🔹 Example: Get average salary by department
sql
Copy
Edit
SELECT Name, Department, Salary,
       AVG(Salary) OVER (PARTITION BY Department) AS Avg_Salary
FROM employee;
🧠 Meaning:

Look at each department (PARTITION BY Department)

Calculate average salary

Show it alongside every employee

🔸 Output:
Name	Department	Salary	Avg_Salary
Ramesh	Finance	50000	40000
Suresh	Finance	50000	40000
Ram	Finance	20000	40000
Deep	Sales	30000	25000
Pradeep	Sales	20000	25000

2️⃣ Ranking Window Functions
These help to rank or number rows within each partition (group).

🏅 RANK()
sql
Copy
Edit
SELECT Name, Department, Salary,
       RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS emp_rank
FROM employee;
Same salaries → same rank

Skips next rank if duplicate (e.g., 1, 1, 3)

🟡 DENSE_RANK()
sql
Copy
Edit
SELECT Name, Department, Salary,
       DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS emp_dense_rank
FROM employee;
No skipping!

If two are ranked 1, next is 2 (not 3)

🔢 ROW_NUMBER()
sql
Copy
Edit
SELECT Name, Department, Salary,
       ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS emp_row_no
FROM employee;
Just gives each row a unique number.

No matter if values repeat, no duplicates in numbering.

⚙ Use Cases (Real-World)
🧮 1. Running Total (Cumulative Sales)
sql
Copy
Edit
SELECT Date, Sales,
       SUM(Sales) OVER (ORDER BY Date) AS Running_Total
FROM sales_data;
For each row (date), gives the total sales so far (till that date).

🏆 2. Top N Employees in Each Department
sql
Copy
Edit
WITH RankedEmployees AS (
    SELECT Name, Department, Salary,
           RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS emp_rank
    FROM employee
)
SELECT Name, Department, Salary
FROM RankedEmployees
WHERE emp_rank <= 3;
Picks top 3 earners per department

RANK() helps break ties (equal salaries)

🧯 Common Errors to Avoid
Mistake	Tip 💡
❌ Forgetting PARTITION BY	Then the whole table is one window
❌ Wrong ORDER BY	Changes how values are ranked/sorted
⚠️ Performance issues	Window functions can be slow — index your data

🧩 Mini Quiz Time!
Q1. What does OVER() do in a window function?
✅ A: It defines the window frame for calculation.

Q2. What’s the difference between RANK() and DENSE_RANK()?
✅ RANK() skips ranks if there’s a tie, DENSE_RANK() does not.

Q3. Can we use SUM() as a window function?
✅ Yes — SUM() becomes a window function when used with OVER().



🔥 What is a Trigger in SQL?
Think of a trigger like a robot that automatically does something in the database when a specific event happens, such as:

Someone adds a new row (INSERT)

Someone updates a row (UPDATE)

Someone deletes a row (DELETE)

You don’t need to tell it every time. It will automatically act when that event happens — like a security guard who always checks what’s going on.

🛠️ Syntax of a Trigger
sql
Copy
Edit
CREATE TRIGGER trigger_name
BEFORE | AFTER INSERT | UPDATE | DELETE
ON table_name
FOR EACH ROW
BEGIN
   -- some SQL code here
END;
🚦 BEFORE vs AFTER
Type	When it runs	Use Case
BEFORE	Before the change happens	To check or correct data
AFTER	After the change is done	To log info or update another table

📚 Let’s Learn with Examples
🟢 1. BEFORE INSERT Trigger: ✅ Validate Grades
📘 Check if grades are valid before inserting them into a table.

sql
Copy
Edit
CREATE TRIGGER validate_grade
BEFORE INSERT ON student_grades
FOR EACH ROW
BEGIN
   IF NEW.grade < 0 OR NEW.grade > 100 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Grade must be between 0 and 100';
   END IF;
END;
✅ This will stop the insert if the grade is wrong!

🔵 2. AFTER UPDATE Trigger: 🔄 Update Total Marks Automatically
📘 If a student's grade is changed, update their total score in another table.

sql
Copy
Edit
CREATE TRIGGER update_total_score
AFTER UPDATE ON student_grades
FOR EACH ROW
BEGIN
   UPDATE total_scores
   SET total = total + NEW.grade
   WHERE student_id = NEW.student_id;
END;
✅ This will automatically update total score when grade changes!

🔴 3. DDL Trigger: ⛔ Prevent Table Deletion
📘 Stop users from deleting or altering tables.

sql
Copy
Edit
CREATE TRIGGER prevent_changes
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
BEGIN
   PRINT 'No table changes allowed!';
   ROLLBACK;
END;
✅ This will block anyone trying to delete or change tables.

🟡 4. AFTER DELETE Trigger: 📝 Log Deletion
📘 Track when someone deletes a row from the employees table.

sql
Copy
Edit
CREATE TRIGGER log_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
   INSERT INTO log_table (emp_id, deleted_at)
   VALUES (OLD.emp_id, NOW());
END;
✅ Keeps a record of deleted rows.

🟠 5. BEFORE INSERT Trigger: Calculate Total & Percentage Automatically
📘 Before inserting marks, calculate total and percentage.

Assume we have a students table with maths, science, and english columns.

sql
Copy
Edit
CREATE TRIGGER calculate_scores
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
   SET NEW.total = NEW.maths + NEW.science + NEW.english;
   SET NEW.percentage = (NEW.total / 300) * 100;
END;
✅ Automatically calculates total marks and percentage.

🧠 Why Triggers are Cool (Benefits)
Feature	Description
✅ Automation	Works on its own
✅ Data Integrity	Blocks bad data
✅ Logging	Tracks changes
✅ Business Rules	Follows company logic

🕵️ How to See All Triggers in a Database
sql
Copy
Edit
SELECT name
FROM sys.triggers;
Or, in MySQL:

sql
Copy
Edit
SHOW TRIGGERS;
⚠️ Common Mistakes to Avoid
Mistake	Fix
Forgot FOR EACH ROW	Always add it for row-level triggers
Wrong table name	Check table name before writing
Using :NEW in MySQL	Use NEW.column instead (no colon)
No permissions	Ask your admin to enable trigger permissions

What is a Cursor in SQL?
A cursor is like a pointer that lets you go through each row in a result set one at a time, just like flipping through pages in a notebook 📓.

SQL normally works with entire tables at once — but if you want to process one row at a time, you use a cursor.

🎯 Why Use a Cursor?
Imagine this:

You have 1,000 students.

You want to go row by row, check each student's marks, and give them a grade (A, B, C) one by one.

That’s where a cursor helps — it lets you process each record individually.

🛠️ Cursor Workflow (Step-by-Step)
Here’s how a cursor works — think of it as 5 simple steps:

Declare the Cursor (What to loop through)

Open the Cursor (Start the engine)

Fetch Rows One by One (Like reading line by line)

Process the Row (Do something for each row)

Close the Cursor (Turn off the engine)

📘 Cursor Syntax (MySQL / SQL Server Style)
sql
Copy
Edit
-- Step 1: Declare variables to hold data
DECLARE @name VARCHAR(50);

-- Step 2: Declare the cursor
DECLARE student_cursor CURSOR FOR
SELECT student_name FROM students;

-- Step 3: Open the cursor
OPEN student_cursor;

-- Step 4: Fetch rows and loop
FETCH NEXT FROM student_cursor INTO @name;

WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT 'Student Name: ' + @name;

   -- Fetch next
   FETCH NEXT FROM student_cursor INTO @name;
END

-- Step 5: Close and deallocate
CLOSE student_cursor;
DEALLOCATE student_cursor;
🧪 Easy Example: Print Each Student's Name One by One
Suppose we have a table:

sql
Copy
Edit
CREATE TABLE students (
    id INT,
    student_name VARCHAR(50)
);
Data:

id	student_name
1	Ankit
2	Riya
3	Rahul

Cursor will help you go row by row, like:

yaml
Copy
Edit
Student Name: Ankit  
Student Name: Riya  
Student Name: Rahul  
✅ Real-World Example: Update Status Based on Score
Table: results

id	name	score	status
1	Aman	92	NULL
2	Sneha	76	NULL
3	Ravi	59	NULL

Goal: Use a cursor to assign status:
If score ≥ 90 → 'Excellent'

If score ≥ 60 → 'Good'

Else → 'Fail'

sql
Copy
Edit
DECLARE @id INT, @score INT, @status VARCHAR(20);

DECLARE result_cursor CURSOR FOR
SELECT id, score FROM results;

OPEN result_cursor;

FETCH NEXT FROM result_cursor INTO @id, @score;

WHILE @@FETCH_STATUS = 0
BEGIN
   IF @score >= 90
      SET @status = 'Excellent';
   ELSE IF @score >= 60
      SET @status = 'Good';
   ELSE
      SET @status = 'Fail';

   UPDATE results SET status = @status WHERE id = @id;

   FETCH NEXT FROM result_cursor INTO @id, @score;
END

CLOSE result_cursor;
DEALLOCATE result_cursor;
✅ After this code runs, the status column is filled based on score.

⚠️ Cursor vs Loop Alternatives
Feature	Cursor	Better Alternative
Easy to write	✅ Yes	✅ Sometimes
Fast	❌ Slower	✅ Set-based operations
Use Case	Row-by-row logic	Bulk updates are better

Use cursors only when you really need row-by-row logic. Otherwise, set-based queries are faster.

📌 Quick Summary Table
Step	Command	Purpose
1	DECLARE cursor	Define which data to loop through
2	OPEN cursor	Starts the loop
3	FETCH NEXT	Go to next row
4	WHILE loop	Process each row
5	CLOSE & DEALLOCATE	Clean up the memory



What Is Indexing in SQL?
Imagine a book with 1,000 pages 📖.

If there's no index, and you want to find “Binary Search,” you have to flip every page from 1 to 1,000. 😩

But if there is an index at the back, it tells you:

Binary Search → Page 412 ✅
Now you jump directly!

SQL indexes work the same way for tables.

🎯 Why Use Indexes?
Faster search in large tables

Boost SELECT query speed

Reduce CPU & disk I/O

✅ Reads get faster
❌ Writes (INSERT/UPDATE/DELETE) get slightly slower (because the index also needs updating)

🧱 Types of Indexes
Type	Description	Real-Life Analogy
Clustered Index	Changes the actual order of rows	Dictionary pages sorted alphabetically
Non-Clustered Index	Creates a separate lookup table	Index at the back of a book

📌 1. Clustered Index (Main Book is Re-Ordered)
🔍 Data is physically sorted by the indexed column.
Only 1 Clustered Index per table is allowed.

📋 Example Table: students
id	name	marks
2	Ankit	80
3	Riya	90
1	Ravi	70

If we create a clustered index on id, the table becomes:

id	name	marks
1	Ravi	70
2	Ankit	80
3	Riya	90

Now the rows are physically sorted, so fetching id = 2 is faster ✅.

🔧 Syntax:
sql
Copy
Edit
CREATE CLUSTERED INDEX idx_students_id
ON students(id);
📌 2. Non-Clustered Index (Separate Look-Up Table)
🔍 Creates a secondary structure with pointers to the actual rows.
You can have multiple non-clustered indexes.

🔧 Syntax:
sql
Copy
Edit
CREATE NONCLUSTERED INDEX idx_students_name
ON students(name);
This creates a lookup table like:

name	Row Location
Ankit	→ Row 2
Ravi	→ Row 1
Riya	→ Row 3

So when you do:

sql
Copy
Edit
SELECT * FROM students WHERE name = 'Riya';
SQL uses the index to quickly find where "Riya" is — instead of checking every row.

⚙️ Clustered vs Non-Clustered: Easy Comparison
Feature	Clustered Index	Non-Clustered Index
Sorts actual table	✅ Yes	❌ No
Separate lookup table	❌ No	✅ Yes
How many allowed?	❗ Only 1	✅ Many allowed
Speed for lookups	✅ Very fast	✅ Fast
Slows down writes?	❗ Slightly	❗ Slightly

🚀 When to Use What?
Situation	Index Type
Primary key / frequently searched ID	Clustered Index
Frequently searched columns (name, city)	Non-Clustered Index
Composite search (e.g. first + last name)	Composite Index

🔍 Example: Real-Life Query
Table: orders
order_id	customer_name	order_date	total_amount

Let’s say:

You often search orders by customer_name

You sometimes search by order_date

Indexes:
sql
Copy
Edit
-- Clustered index on order_id (default if it's primary key)
CREATE CLUSTERED INDEX idx_orders_id ON orders(order_id);

-- Non-clustered index on customer_name
CREATE NONCLUSTERED INDEX idx_customer_name ON orders(customer_name);
Now, this query will be fast:

sql
Copy
Edit
SELECT * FROM orders WHERE customer_name = 'Akshit';
🧠 Tip: Always Analyze First
Don’t just blindly add indexes.

✅ Use them on:

Columns in WHERE, JOIN, ORDER BY

❌ Avoid on:

Columns with lots of unique values that are never searched

Columns updated very often

🔍 Bonus: View Existing Indexes
sql
Copy
Edit
-- MySQL
SHOW INDEX FROM table_name;

-- SQL Server
SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('table_name');

📘 What is a CTE (Common Table Expression)?
A CTE (Common Table Expression) is like a temporary named result set that you can use in your main SQL query.

It helps break complex queries into simpler blocks, like writing small functions or helpers in programming.

🎯 Why Use CTE?
✅ Improves readability of complex queries
✅ Helps write recursive queries (like finding hierarchy or factorial)
✅ Makes SQL feel like writing steps in a story

🧱 Syntax of CTE
sql
Copy
Edit
WITH cte_name AS (
   SELECT column1, column2
   FROM table_name
   WHERE condition
)
SELECT * FROM cte_name;
🔹 The WITH keyword starts the CTE
🔹 cte_name is the name you give to your temporary table
🔹 Inside the CTE, you write a subquery
🔹 You then use cte_name in your main query

✅ Example 1: Simple CTE
Let’s say you have a table called employees:

id	name	salary
1	Ravi	30000
2	Riya	45000
3	Ankit	60000

You want to find employees with salary > 40000.

✅ Without CTE:
sql
Copy
Edit
SELECT * FROM (
   SELECT id, name, salary FROM employees
   WHERE salary > 40000
) AS high_salary_employees;
✅ With CTE:
sql
Copy
Edit
WITH high_salary_employees AS (
   SELECT id, name, salary
   FROM employees
   WHERE salary > 40000
)
SELECT * FROM high_salary_employees;
Much cleaner and reusable ✅

🌀 Example 2: CTE with Join
Suppose we have two tables:

employees:

id	name	dept_id
1	Ravi	101
2	Riya	102
3	Ankit	101

departments:

dept_id	dept_name
101	HR
102	Marketing

We want to find employees working in the HR department.

✅ Using CTE:
sql
Copy
Edit
WITH hr_employees AS (
   SELECT e.name, d.dept_name
   FROM employees e
   JOIN departments d ON e.dept_id = d.dept_id
   WHERE d.dept_name = 'HR'
)
SELECT * FROM hr_employees;
This makes joining and filtering easy to manage.

🔁 Example 3: Recursive CTE (Advance Level)
CTEs are the only way to do recursion in SQL.

Imagine this problem:

Find numbers from 1 to 5 using SQL!

✅ Recursive CTE:
sql
Copy
Edit
WITH RECURSIVE count_up(n) AS (
  SELECT 1      -- Base case
  UNION ALL
  SELECT n + 1  -- Recursive step
  FROM count_up
  WHERE n < 5
)
SELECT * FROM count_up;
Output:
n
1
2
3
4
5

💡 You can use this to build trees, hierarchies, etc.

🆚 CTE vs Subquery vs Temp Table
Feature	CTE	Subquery	Temp Table
Scope	Only in the query	Inside outer query	Can be reused later
Readability	✅ Clean & easy	❌ Can get messy	❌ Need to manage table
Recursion	✅ Supported	❌ Not supported	❌ Not supported
Multiple use	✅ Yes (in same query)	❌ No	✅ Yes

🔍 Best Use Cases for CTE
Breaking complex queries into steps

Recursion (like folder structure, org charts)

Filtering intermediate results

Ranking rows using ROW_NUMBER()

Reusing the same logic multiple times in one query

🔧 Pro Tip: Multiple CTEs
You can chain more than one CTE:

sql
Copy
Edit
WITH cte1 AS (...),
     cte2 AS (...)
SELECT ...
FROM cte1
JOIN cte2 ON ...


What is Normalization?
Normalization is the process of organizing data in a database to reduce redundancy (duplicate data) and improve data integrity.

🎯 Goals of Normalization:
✅ Eliminate redundant (repeated) data

✅ Ensure data is stored in only one place

✅ Make data updates easier and consistent

🏠 Real-Life Analogy (Super Simple):
Imagine a school register.

Every student writes their name, class, and teacher name.

If 20 students are from the same class, we are writing the same teacher name 20 times = 🔁 repetition.

Normalization fixes this by breaking the data into multiple linked tables.

🔥 Types of Normal Forms
✅ 1NF (First Normal Form)
Rule:

All columns must have atomic (indivisible) values.

No repeating groups or arrays.

📌 Bad Table (Not 1NF)

StudentID	Name	Subjects
1	Riya	Math, Science
2	Ravi	English, History

📌 Good Table (1NF Applied)

StudentID	Name	Subject
1	Riya	Math
1	Riya	Science
2	Ravi	English
2	Ravi	History

✅ No multiple values in one column.

✅ 2NF (Second Normal Form)
Rule:

Be in 1NF

And all non-key columns must depend entirely on the primary key (not partially)

📌 Bad Table (Partial Dependency)

StudentID	Subject	TeacherName
1	Math	Mr. A
1	Science	Mr. B

Here, TeacherName depends only on Subject, not the full key (StudentID + Subject)

📌 Good Tables (Split it):

Student_Subject Table

StudentID	Subject
1	Math
1	Science

Subject_Teacher Table

Subject	TeacherName
Math	Mr. A
Science	Mr. B

✅ Now, each piece of data is stored only once and related properly.

✅ 3NF (Third Normal Form)
Rule:

Be in 2NF

No transitive dependency (i.e., non-key depending on another non-key)

📌 Bad Table:

EmpID	EmpName	DeptID	DeptName
101	Ravi	10	HR

Here, DeptName depends on DeptID, not on the primary key EmpID.

📌 Good Tables:

Employee Table

EmpID	EmpName	DeptID
101	Ravi	10

Department Table

DeptID	DeptName
10	HR

✅ No transitive dependency.

✅ BCNF (Boyce-Codd Normal Form)
Rule:

A stricter version of 3NF

For each dependency A → B, A must be a super key

📌 Use BCNF when you have composite keys and functional dependencies beyond the primary key.

Example:
A table where both CourseCode and Instructor can uniquely identify a class, but not vice versa.

BCNF ensures the highest data consistency.

🔄 What is Denormalization?
Denormalization is the process of combining normalized tables back into fewer tables for faster read performance.

🔁 It's a trade-off between:

🔄 Read performance (denormalized)

✅ Update performance & consistency (normalized)

⚖️ Trade-offs: Normalization vs. Denormalization
Feature	Normalization	Denormalization
Redundancy	❌ No	✅ May have duplicate data
Storage efficiency	✅ Yes	❌ More space used
Data update	✅ Easy and safe	❌ Error-prone and inconsistent
Query complexity	❌ More JOINs	✅ Faster SELECT queries
Best for	OLTP (Online Transaction) systems	OLAP (Reporting/Data Warehouses)

🧠 Real-Life Example
Imagine you run a shopping app:

Normalized:

Users in one table

Orders in another

Products in a third

You JOIN them during reports

Denormalized (reporting):

A single table like Orders_Full_Details for quick dashboard reports, combining everything

📝 Summary Table
Normal Form	Goal	Removes
1NF	Atomic columns, no repeats	Repeating groups
2NF	Full functional dependency	Partial dependencies
3NF	Remove indirect dependency	Transitive dependencies
BCNF	Every determinant is a key	Anomalies in composite keys

🔍 What is a View?
A View in SQL is like a virtual table based on the result of a SELECT query.

You can use a view just like a table, but it doesn’t store data permanently. It shows data fetched from real tables.

🧠 Simple Analogy:
🪞 Think of a view as a mirror:

It reflects the data from one or more tables.

When base tables change, the view also updates automatically.

✅ Why Use Views?
Hide complex SQL logic 🔒

Restrict access to sensitive data 🔐

Simplify repeated queries 🔁

Help in abstraction (users only see what they need to)

🧪 Example
🔹 Table: Employees
EmpID	Name	Dept	Salary
1	Riya	HR	50000
2	Rahul	IT	70000
3	Sneha	IT	75000

📌 Create a View (Basic)
sql
Copy
Edit
CREATE VIEW IT_Employees AS
SELECT Name, Salary
FROM Employees
WHERE Dept = 'IT';
Now, using:

sql
Copy
Edit
SELECT * FROM IT_Employees;
You’ll get:

Name	Salary
Rahul	70000
Sneha	75000

💡 We simplified the WHERE condition using a view.

🔍 Types of Views
✅ 1. Simple View
Based on a single table

Uses basic SELECT (no joins, no group by)

Can often be updatable

Example:

sql
Copy
Edit
CREATE VIEW HR_View AS
SELECT Name, Salary
FROM Employees
WHERE Dept = 'HR';
✅ 2. Complex View
Based on multiple tables (joins, aggregations, group by)

Often read-only (non-updatable)

Example:

sql
Copy
Edit
CREATE VIEW Dept_Salary AS
SELECT Dept, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Dept;
Now you have a summary view.

🔁 Updatable vs Non-Updatable Views
🔹 Updatable Views
You can perform INSERT, UPDATE, DELETE on the view — and it will affect the base table(s).

📌 Conditions for an updatable view:

Based on a single table

No group by, distinct, aggregate functions

Must include primary key

No joins or subqueries

Example:

sql
Copy
Edit
CREATE VIEW Emp_Salary_View AS
SELECT EmpID, Name, Salary
FROM Employees;
You can now run:

sql
Copy
Edit
UPDATE Emp_Salary_View
SET Salary = 80000
WHERE EmpID = 2;
This will update the Employees table.

🔹 Non-Updatable Views
You cannot modify the data through these views.

📌 Reasons:

Uses GROUP BY, JOIN, DISTINCT, aggregate functions

Uses subqueries or UNION

Includes calculated columns or LIMIT

Example (non-updatable):

sql
Copy
Edit
CREATE VIEW Avg_Dept_Salary AS
SELECT Dept, AVG(Salary) AS AvgSal
FROM Employees
GROUP BY Dept;
You can’t update or insert into this view.

📊 Summary Table
Feature	Simple View	Complex View
Based on	Single Table	Multiple Tables
Includes	No functions or joins	Aggregates, Joins
Updatable	Usually Yes	Usually No
Performance	Fast	May be slower

Feature	Updatable View	Non-Updatable View
Can be updated	✅ Yes	❌ No
Based on	Single table	Joins, group by, etc.
Example usage	Update employee data	Summary or report view

🧠 Real-Life Use Case
Imagine a banking system:

Simple View: Show account holders in one branch → easy filtering

Complex View: Show average balance per branch → grouped summary

Updatable View: Allow branch manager to update contact info

Non-Updatable View: Display monthly interest summaries → read-only

📝 Sample Interview Questions
What is a view and why is it used?

What’s the difference between a simple and complex view?

Can you update data using a view? Why or why not?

How does a view differ from a table?

Give a real-world example where a view is more beneficial than querying a table.

✅ 1. Fibonacci using LOOP (SQL Server)
sql
Copy
Edit
DECLARE @n INT = 10;
DECLARE @a INT = 0, @b INT = 1, @temp INT;
DECLARE @i INT = 1;

PRINT 'Fibonacci Series:';
WHILE @i <= @n
BEGIN
    PRINT @a;
    SET @temp = @a + @b;
    SET @a = @b;
    SET @b = @temp;
    SET @i = @i + 1;
END;
🧠 Output: 0, 1, 1, 2, 3, 5, 8, 13, ...

✅ 2. Factorial using WHILE (SQL Server)
sql
Copy
Edit
DECLARE @n INT = 5;
DECLARE @result BIGINT = 1;

WHILE @n > 1
BEGIN
    SET @result = @result * @n;
    SET @n = @n - 1;
END;

PRINT 'Factorial:';
PRINT @result;
🧠 Output: 120 (i.e. 5×4×3×2×1)

✅ 3. Reversing a String (SQL Server)
sql
Copy
Edit
DECLARE @str VARCHAR(100) = 'SQL';
DECLARE @rev VARCHAR(100) = '';
DECLARE @i INT = LEN(@str);

WHILE @i > 0
BEGIN
    SET @rev = @rev + SUBSTRING(@str, @i, 1);
    SET @i = @i - 1;
END;

PRINT 'Reversed String:';
PRINT @rev;
🧠 Output: 'LQS'

✅ 4. Sum of Digits (SQL Server)
sql
Copy
Edit
DECLARE @num INT = 12345;
DECLARE @sum INT = 0;

WHILE @num > 0
BEGIN
    SET @sum = @sum + @num % 10;
    SET @num = @num / 10;
END;

PRINT 'Sum of digits:';
PRINT @sum;
🧠 Output: 15 (1+2+3+4+5)

✅ 5. Palindrome Check (SQL Server)
sql
Copy
Edit
DECLARE @str VARCHAR(100) = 'madam';
DECLARE @rev VARCHAR(100) = '';
DECLARE @i INT = LEN(@str);

WHILE @i > 0
BEGIN
    SET @rev = @rev + SUBSTRING(@str, @i, 1);
    SET @i = @i - 1;
END;

IF @str = @rev
    PRINT 'Palindrome';
ELSE
    PRINT 'Not Palindrome';
🧠 Output: 'Palindrome'

🔰 Easy Level (Basic Concepts & Syntax)
✅ What is the difference between WHERE and HAVING?

✅ What does the GROUP BY clause do?

✅ How do you find duplicate records in a table?

✅ What is the use of the DISTINCT keyword?

✅ How can you fetch the first 5 rows from a table?

✅ What is a primary key and a foreign key?

✅ Write a query to count the number of employees in each department.

🟡 Medium Level (Joins, Aggregates, Subqueries)
🟡 What is the difference between INNER JOIN, LEFT JOIN, and FULL OUTER JOIN?

🟡 Write a query to get the second highest salary from the employee table.

🟡 What is a subquery? Write one that finds employees who earn more than the average salary.

🟡 Write a query to find employees who don’t have any manager.

🟡 Explain window functions like ROW_NUMBER() or RANK() with examples.

🟡 How do you use a CASE statement in SQL?

🔴 Hard Level (Performance, Complex Joins, Advanced Functions)
🔴 What is the difference between CROSS JOIN and INNER JOIN?

🔴 What is normalization? Explain 1NF, 2NF, 3NF, BCNF.

🔴 What are indexes? Difference between clustered and non-clustered indexes?

🔴 Write a query to get running total of salaries in each department.

🔴 Write a query to find top 2 employees by salary in each department.

🔴 Explain how to detect and avoid deadlocks in SQL transactions.

🧠 In-Depth / System Design Level (SQL Internals, Optimization, Architecture)
🧠 What happens internally when a SELECT query is executed?

🧠 How does indexing affect performance, and when should you avoid indexing?

🧠 What is a materialized view and how is it different from a regular view?

🧠 What is ACID in SQL? Explain each component.

🧠 How would you optimize a slow SQL query? What steps would you take?

🧠 How does the database engine handle joins internally?

✅ BONUS: Real Interview-Style Challenge Questions
🧩 Write a query to get employees who joined in the last 3 months.

🧩 You have a table of orders. Find the customer with the highest total purchase value.

🧩 Detect and remove duplicate rows in a table without using the ROWID.

🧩 You are given an attendance log table. Find employees who came late more than 3 times in a month.

🧩 From a sales table, write a query to show sales growth month over month for each product.


🔰 Easy Level (Fundamentals and Simple Queries)
✅ What is the difference between NULL and 0 in SQL?

✅ How do you use IS NULL and IS NOT NULL in a query?

✅ Write a query to select only even-numbered IDs from a table.

✅ What is the difference between CHAR and VARCHAR?

✅ Explain the use of BETWEEN, IN, and LIKE with examples.

✅ How to rename a column in a result using AS?

✅ How to fetch the current system date and time?

🟡 Medium Level (Multi-table Logic and Aggregate Challenges)
🟡 Write a query to find departments that have more than 5 employees.

🟡 What is the difference between EXISTS, IN, and JOIN?

🟡 Write a query to return employees who don’t belong to any department.

🟡 Retrieve students with the highest marks in each subject.

🟡 How to write a recursive CTE to return factorials or Fibonacci numbers?

🟡 Write a query to calculate percentage of sales for each product out of total sales.

🟡 What is a correlated subquery? How is it different from a regular subquery?

🔴 Hard Level (Set Operations, Windowing, Ranking)
🔴 Find the 3rd highest salary in each department using DENSE_RANK().

🔴 Difference between UNION, UNION ALL, INTERSECT, EXCEPT.

🔴 What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()?

🔴 Find users who placed an order every month for the last 6 months.

🔴 Given a table of page visits, find users whose next page visit was not on the same day.

🔴 Find all pairs of users who have ordered the same products (self join logic).

🔴 Implement a rolling 7-day sum of sales using window functions.

🧠 In-Depth / Expert Level (Internals, Performance Tuning)
🧠 How does a query planner decide which index to use?

🧠 What is query execution plan? How can you generate it?

🧠 Explain index scan vs. table scan.

🧠 What are covering indexes and how do they improve performance?

🧠 What is sharding in SQL databases? When would you use it?

🧠 Describe the difference between OLTP and OLAP systems.

🧠 How does SQL handle locking and concurrency? What are deadlocks and how do you resolve them?

💼 Real Interview Business Scenarios
🧩 You have a bank transactions table. Find customers whose account balance never went below 0.

🧩 In a ride-sharing app, find the driver with the highest average rating per city.

🧩 You have a products table and a reviews table. Find the product with most 5-star reviews.

🧩 Given an order log, find customers who have made orders every week for the past 3 weeks.

🧩 You’re given a messages table. Write a query to detect conversations between two users (user A sent to B and B replied to A).


