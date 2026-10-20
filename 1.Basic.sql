-- 1. Basic of sql and database creation:
-- (i). To add one line comments in mysql we use this "--" symbol.Similarly to add multiline comments we use "/**/" symbol.
-- (ii). To write sql queries we firstly need to make a database and inside them we can write our queries to create the tables and store data init.

-- (iii).  Syntax to make our database is:
-- 	1. CREATE DATABASE database_name;
-- e.g.:
CREATE DATABASE collage;
/*
	create database student;
*/
-- 2. You can also add one more parameter in the create database queries i.e. "if not exists".It means create database only if it is not exists else not.It is basically used in the big databases to neglect the error.
-- syntax= create databse if not exists database_name;
-- e.g.:
create database if not exists collage; -- we can already create a collage database in above but this line not gave error it gave the warning.But if the collage datadase does not exists previously it will create it.

-- Note = 1. sql is a case in-sensitive language so you can either use upper case and lower case to write the queries.But file/table/database name you gave is case sensitive.
-- 2. It is recommended to use the "if not exists" parameter.

-- (iv). Syntax to delete the database:
-- 1. DROP DATABASE database_name;
-- e.g.:
DROP DATABASE collage;
/*
	drop database student;
*/
-- 2. You can also add one more parameter "if exists".It is used to delete the database if exists else not.
-- syntax= Drop database if exists database_name;
-- e.g.:
Drop database if exists student; 	 -- if we execute this line this line gave no error it will gave the warning, the student database does'nt exists.

-- (v). To see your database go in schemas section and right click and refresh all.

-- (vi). To see all the database and all the table present it the schemas we use:
-- 1.Show database.
-- 2.Show tables.
-- e.g.:
show databases;
show tables;


-- 2. Data Types = Data types are used to tell the sql that a columns can store what kind of data.
-- e.g. = A name column can store the string type of data,A roll_no column can store the interger type of data,etc.In sql we have numerous of data types out of them some of the important are:
-- 1. INT = It is used to store the interger type values.
-- 2. TINYINT = It is used to store the small integer values range from (-128 to 127).
-- 3. BIGINT = It is used to store the big intege values which can'nt store in "INT".
-- 4. FLOAT = It is used to store the decimal values.
-- 5. DOUBLE = It is used to store the big decimals values.
-- 6. BOOLEAN = It is used to store the boolean value 0 or 1.
-- 7. CHAR() = It us used to store the string type value of fixed length.Range (0 to 255).
-- 8. VARCHAR() = It us used to store the string type value of given length.Range (0 to 255).
-- 9. BLOOB() = It is used to store binary large objects.
-- 10. Date and year= In format yyyy-mm-dd and In year yyyy.



-- 3. Create our first table in the database:

-- (i) To create our table in the database syntax are as follow:
/*
	Use database_name;  -- This line is used to tell the sql which database is used to create a table.
    
    CREATE TABLE table_name(
		column_name1 datatype constraint,
        column_name2 datatype constraint,
        ...
        column_namen datatype constraint   -- In the last columns not need to add the comma.
    );
*/
-- e.g.:
USE collage;

CREATE TABLE student(
	ROLL_NO int primary key,  -- We add primary key constraint so that it store the unique value.
    Name varchar(19),
    Age int not null    -- We add not null constraint so that it will becomes compulsary to fill.
);


-- (ii) To add values in the database syntax are as follow:

-- 1. INSERT INTO table_name VALUES(column1_data,column2_data,...,column-n data),...;
-- e.g.:
insert into student values(5,"Sahil Kumar",19),(1,"Akshay Sharma",21);
insert into student values(6,"Sita",19),(7,"Geeta",18);
-- the above syntax is used when you have exact knowledge about your database columns.

-- 2. INSERT INTO table_name(column_name1,column_name2,...,column_namen) Value(column_value1,column_value2,...column_valuen),(column_value1,column_value2,...column_valuen),...;
insert into student
(NAME,ROLL_NO,AGE) 
Values
("Shivam",2,20),
("Ram",3,19);
-- The above syntax is used when you don'nt know the columns ordering in the database and you need to enter the data in the random order.

-- (iii) Print the complete table:
-- SELECT * FROM table_name;  -- Asterisk "*" symbol used to select whole the rows data of the table.
-- e.g.:
select * from student;

-- (iv) Delete the table from the database = To delete the table from the database we use the similar command we used in to delete the database.The command is "DROP TABLE table_name";
-- e.g.:
create table temp(
	id int primary key
);
insert into temp values(10);
select * from temp;

drop table temp;
show tables;
drop database collage;

-- Practice question 1 = Create a database of your company name "xyz".Create a table inside them name called "employees" which store the (id,name,and salary). Add atleast 5 values in them and print all the table.

-- Create database:
create database Google;

-- Select the google database:
use Google;

-- Create a table name called employees:
create table employees(
	id int primary key,
    name varchar(19),
    salary bigint
);

-- Insert the values init:
insert into employees values(10,"Sahil Kumar",1000000),(20,"Ram",10000200),(30,"Sita",30123141439);
insert into employees
(name,id,salary)
values
("aioaoo",9,4914),
("eorori",8,041493);

-- Print values from the table:
select * from employees;
drop database google;



-- 4. Keys = Keys basically are used to give our columns some special meaning and constraints.There are various types of keys in the database out of them the most important are:
-- 1. Primary keys = It is a column or a set of columns in a table that uniquely identify each row.In a table only that row is your primary key whose value can'nt be null and its values are unique.In a table primary key can make by using one columns or combination of two columns.There is only primary key in the table.

-- e.g. =
-- 1. Make primary key from one column:
create table temp1(
	id int primary key,
    name varchar(10),
    age int unsigned not null  		-- unsigned means age need be positive.
);

insert into temp1 values(1,"ffoa",10);
-- insert into temp1 values(2,"ffoa",-10);	 -- gave error.
select * from temp1;
drop table temp1;

-- 2. Make primary key from two columns:
create table temp2(
	id int,
    name varchar(10),
    age int unsigned not null,
    primary key(id,name)
);
insert into temp2 values(1,"ffoa",10);
select * from temp2;
drop table temp2;


-- 2. Foreign Keys = It is a column or a set of columns in a table that refer to the primary key in the other table.In a table it can be multiple foreign key.It can be duplicate and null.
-- Syntax to make foreign key:
-- foreign key(curent_table row) references outside_table_name(table_columns);
create table temp2(
	std_id int primary key,
    marks float not null
);
create table temp1(
	id int primary key,
	name varchar(19),
    age int not null,
    marks_id int not null,
    Foreign key(marks_id) references temp2(std_id)
);

insert into temp2 values(55,89);
insert into temp1 values(5,"Sahil Kumar",19,55);

select * from temp1;
select * from temp2;

drop table temp2;

-- Note = Always gave priority to the table which refered by the foreign key.

-- 5. Constraints = These are the set of rules which applied on the columns data.There are various type of constraints in the sql out of them some of the most important are:
-- 1. not null
-- 2. unique
-- 3. primary key = unique+not null
-- 4. foreign key
-- 5. default = It is used to gave the default value to the specific columns so that if user not enter it then we can take the bydeault value else the user value. 
-- e.g.:
create table temp1(
	id int primary key,
    name varchar(10),
    age int unsigned not null,
	salary int default 35000
);
insert into temp1(id,name,age) values(1,"fjfhfhf",19);
select * from temp1;
drop table temp1;

-- 6. check = It is used to check a specific condition before insert into the column.
-- e.g.:
-- 1. Apply constaint on one columns:
create table temp1(
	age int check(age>=18)
);
-- 2. Apply constraints on the whole table columns:
create table temp1(
	id int primary key,
    city varchar(10),
    age int,
    constraint cons check(age>=18 and city = "Delhi")
);

insert into temp1 values(1,"Kolkata",17);
select * from temp1;



















