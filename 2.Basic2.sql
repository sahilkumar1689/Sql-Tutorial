create database collage;
use collage;

create table student(
	roll_no int primary key,
    name varchar(19),
    marks int not null,
    grade varchar(1),
    city varchar(19)
);

insert into student 
values
(101,"Anil",78,"C","Pune"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"chectan",85,"A","Pune"),
(104,"Dhruv",96,"A","Delhi"),
(105,"Ram",88,"A","Bangaluru"),
(106,"Sham",82,"A","Pune");

-- 1. Select queries = It is used to selelct the value from the database.

-- (i). Syntax to select all the table columns values:
-- Syntax = select * fromt table_name;  
-- e.g.:
select * from student;

-- (ii). Syntax to select the specific columns from the table:
-- Syntax =  select columns_name1,column_name2,...,column_namen from table_name;
-- e.g.:
select name,marks from student;

-- (iii). Syntax to select the distict columns values from the table:
-- syntax = select distinct column_name from table_name;
-- e.g.:
select distinct city from student;

-- (iv). "where" clause = It is used with the select statements to add some conditions:
-- 1. syntax = where specific_condition;
-- e.g.:
select * from student 
where marks>80;

-- 2. Operators = Basically operator are used in where clause to group more than one condition.
-- Types of operator:
-- 1. Arithmetic Operator = +,-,*,/,%.
-- e.g.:
select marks from student
where marks+10>100;
-- 2. Relational Operator = =(equal),!=(not equal),>,<,>=,<=.
-- e.g.:
select * from student
where city="Pune";
-- 3. Logical Operator = AND,OR,NOT,IN,BETWEEN,ALL,LIKE,ANY.
-- e.g.:
select * from student
where marks>80 and city="Pune"; -- it satisfied both the condition.

select * from student
where marks>80 or city="Pune";  -- it satisfied ony one of the condition.

select * from student
where marks between 80 and 90;  -- it used to select the rows which lies between in the range[80 to 90]

select * from student
where city in ("Pune","Mumbai","Delhi");  -- it is used to select the rows which lies between in the list.

select * from student
where city not in ("Delhi","Mumbai");     -- it work opposite to the above condition it select the rows which not lies between in the list.

-- 4. Bitwise Operator = &,|. 

-- 3. Limit clause = It is used to set the number of rows nedd to return.
-- e.g.:
select * from student
where marks>80
limit 3;

-- 4. order by clause = It is used to order the values in ascending(asc) or in the descending order(desc).By default it sort the data in ascending order.
-- e.g.:
select * from student
order by marks desc;

select * from student
order by marks asc;



-- 2. Aggregate functions = Aggregate functions perform calculation on a set of values and return a single value.
-- 1. count() = It is used to count the number of row in the given column.
-- e.g.:
select count(name) from student;
-- 2. max() = It is used to find the maximum column value in the given column. 
-- e.g.:
select max(marks) from student;
-- 3. min() = It is used to find the minimum column value in the given column.
-- e.g.:
select min(marks) from student;	
-- 4. sum() = It is used to find the total sum of the values.
-- e.g.:
select sum(marks) from student;
-- 5. Avg() = It is used to find the average of the given column.
-- e.g.:
select avg(marks) from student;
-- 6. length() = It is used to find the length of the element store by the each row column.
-- e.g.:
select length(name) from student;
-- 7. left(column_name,number_of_character) = It is used to find the characters of string type element from left side.
-- e.g.:
select left(name,1) from student;
-- 7. right(column_name,number_of_character) = It is used to find the characters of string type element from right side.
-- e.g.:
select right(name,2) from student;
-- 8. lower(column_name) = It is used to convert the column_element in to lower case.
-- e.g.:
select lower(name) as names from student;
-- 9. upper(column_name) = It is used to convert the column_element in to upper case.
-- e.g.:
select upper(name) as names from student;
-- 10. sum() = It gave the sum of all elements present in the column.
-- e.g.:
select sum(marks) from student;
-- 11. round() and ceil() = It gave the round off values of every elements present in the column and round off to next integer values. .
-- e.g.:
select round(marks) from student;
select ceil(marks) from student;

-- 12. replace(column_name,old_character,new_character) = It replace any character in the columns elements by temporarly.
-- e.g.:
select replace(marks,7,10) from student;
select * from student;

-- 13. power(column_name,power_value) = It gave the power value of column elements.
-- 14. sqrt(column_name) = It gave the square root value of the column elements.


-- 3. Group by clause = "group by" clause is used to group the rows that have the same values into summary rows.Basically it collect data from the multiple record and group the result by one or more columns.Generally it is used with the aggregate function.
-- syntax = select group_column , aggregate function from table_name group by group_column;
-- e.g. = To count the number of student in each city.
-- In this we need to group the city with their total number of students.
SELECT city, count(roll_no) FROM student
GROUP BY city;

-- Basically you firtly need to find the column which you need to be grouped after that find the columns to grouped with and pass it in the aggregate function.In the aboce example city is the grouped column and roll_no is the gropu with which passed in the aggregate function.


-- Practice question 2 = Find the average marks in each city in ascending order.
-- Here, we observe clearly we need to make a group of city with their students average marks in ascending order,so the city is group column and marks is the grouped column with city.
select city,avg(marks) from student
group by city
order by avg(marks) asc;

-- 4. Having clause = It is similar to the "Where" clause but the only diference is that it applied condition on the group not on the rows and this query add after the group by clause.It used aggregate function to apply conditions.
-- e.g.:Count number of students in each city where the maximum marks is 90.
select city,count(roll_no) from student
group by city
having max(marks)>90;


-- 5. General order of commands = Till now we learn lot of commands now here is the general order to write all the commands.
/*
	select column_name
    from table_name
    where condition
    group by column_name
    having aggregate_function_condition
    order by column_name specific_order
    limit number;
	
*/


-- 2. Queries on tables:

-- 1. Query to update the existing row data:
/*	Syntax:
	update table_name
    set column_name1=new_value1,column_name_n=new_value_n
    where condition;   -- this query is used to uniqely identify the row where changes need to occur.If this query not include then changes reflected on whole table columns value.
*/
-- e.g.:

update student
set name="chaten"
where roll_no=103;  -- if we not include this then the whole column value become chaten.

select *from student;

-- 2. Query to delete the existing row:
/* 	Syntax:
	delete from table_name
    where condition;   -- again it is used to uniquely identify the row which you wnat to delete.If you not include this line then whole table data delete.
*/
-- e.g.:
set SQL_SAFE_UPDATES=0;  -- it is used to on/off the safe mode.
delete from student
where marks<80;

select * from student;

-- 3. Alter commands = It is used to change the schema of the table it means it is used to change the column,data_type,constraint,table_name,columns_name etc.

-- We have various commands in alter:

-- 1. To add a complete new column in the table:
/*	Syntax:
	alter table table_name
    add column columns_name,data_type,constriant;
*/
-- e.g.:

alter table student
add column age int not null;

select * from student;

-- 2. To delete a column in the table:
/*	Syntax:
	alter table table_name
    drop column columns_name;
*/
-- e.g.:

alter table student
drop column age;

select * from student;

-- 3. To change the name of the table:
/*	Syntax:
	alter table table_name
    rename to new_table_name;
*/
-- e.g.:

alter table student
rename to student_details;

select * from student_details;

-- 4. To change the name of the column:
/*	Syntax:
	alter table table_name
    change column old_name new_name new_data_type new_constraint;
*/
-- e.g.:

alter table student_details
change column name full_name varchar(19) not null;

select * from student_details;

-- 5. To change the data_type and the constraints:
/*	Syntax:
	alter table table_name
    Modify columns_name new_data_type new_constriant;
*/
-- e.g.:

alter table student_details
Modify marks float not null;

select * from student_details;

-- 6. To delete the data of the table:
/*	Syntax:
	truncate table table_name;
*/

truncate table student_details;

-- Note = 1. "Delete from table_name" is also used to delete the table data but it can also modify to delete the particular row data.On the other hand truncate only used to delete the table_data.


-- 3. Revisiting the foreign key = It is a column or a set of columns in the table which refer to the primary key of the other table.A table can contains multiple foreign keys.It can be duplicate and null.
-- The table in which a foreign key exists are called child table and the table which are refered by the foreign key are called parent table.Firstly parent table create after that child table create by taking references from the parent table.
-- Syntax = foreign_key(child_table_column) references parent_table(primary_key);

-- parent table:
create table department_name(
	id int primary key,
    dept_name varchar(19)
);
insert into department_name values(101,"Maths"),(102,"English");

create table teacher_details(
	id int primary key,
    name varchar(19),
    dept_id int not null,
    foreign key(dept_id) references department_name(id)
);

insert into teacher_details values(1,"FHFHFH",101),(2,"FDIFI",102);


select * from department_name;
select * from teacher_details;

-- cascading foreign key = Cascading foreign key is used to refelect the changes in the child table on the basic of the parent table.It means if we change any thing in the parent table then it will reflected in the child table automatically.You only need to add two command in your child table.
-- ON DELETE CASCADE = 	When we create foreign key using this option,it has a ability to delete the row in the child table when refernced row deleted in the parent table.
-- ON UPDATE CASCADE = When we create foreign key using this option,it has a ability to update the row in the child table when refernced row update in the parent table.

-- e.g. = If we change the id in the parent table then it will auto automatically reflected in the child table.

drop table teacher_details;
create table teacher_details(
	id int primary key,
    name varchar(19),
    dept_id int not null,
    foreign key(dept_id) references department_name(id)
    -- for cascading foreign key:
    on delete cascade
    on update cascade
);

insert into teacher_details values(1,"FHFHFH",101),(2,"FDIFI",102);
-- update in the parent table:
update department_name
set id=555
where id=101;

select * from department_name;
select * from teacher_details;










