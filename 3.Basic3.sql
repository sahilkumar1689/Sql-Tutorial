use collage;
create table student(
	std_id int primary key,
    name varchar(19)
);
insert into student values(101,"Adam"),(102,"Bob"),(103,"casey");
create table course(
	id int primary key,
    courses varchar(19)
);
insert into course values(102,"english"),(105,"Maths"),(103,"science"),(107,"Computer science");

-- 1. Joins = Joins are used to combine the rows from two or more tables,based on the related column between them.It is not compulsary to apply joins we need to  have a foreign key in our table although we only need on related column between them.
-- Types of joins = There are three types of joins:
-- 1. Inner join = It is basically used to return the matched values in both the table.
/*	Syntax:
	
    select column_names from table_name1
    inner join table_name2
    on table_name1.column_name = table_name2.column_name  -- basically it is the condition which tell the sql on what column basic you need to find the commom data.
*/
-- e.g.:
select * from student
inner join course
on student.std_id = course.id;

-- 2. Outer join = It further divided into three part:
-- (i). Left outer join = It is used to return the table1 values and the matched values from the table2.The table selected first in the table will be treated as the table1 and the table seleted using left outer join query will be treated as second.
/*	Syntax:
	
    select column_name from table_name1
    left join table_name2
    on table_name1.column_name = table_name2.column_name  -- basically it is the condition which tell the sql on what column basic you need to find the commom data.
*/
-- e.g.:
select * from student
left join course
on student.std_id = course.id;
-- (ii). Right outer join = It is used to return the table2 values and the matched values from the table.The table selected first in the table will be treated as the table1 and the table seleted using right outer join query will be treated as second.
/*	Syntax:
	
    select column_name from table_name1
    right join table_name2
    on table_name1.column_name = table_name2.column_name  -- basically it is the condition which tell the sql on what column basic you need to find the commom data.
*/
-- e.g.:
select * from student
right join course
on student.std_id = course.id;
-- (iii). Full outer join = It is used to give the both the table1 and table2 value.But in mysql there is no command to perform the full join.To perform the full join we firstly need to find the left join and right join and secondly union them.
/*	Syntax:
	
    select column_name from table_name1
    left join table_name2
    on table_name1.column_name = table_name2.column_name
    Union
    select column_name from table_name1
    right join table_name2
    on table_name1.column_name = table_name2.column_name

*/
-- e.g.:
select * from student
left join course
on student.std_id = course.id
union
select * from student
right join course
on student.std_id = course.id;

-- Other joins:
-- (i). Left exclusive join = It is used to get only the left table data which is only present in the left table remove the common values.There is no particular query to perform the left exclusive join but we can find it indirectly.Firslty we find the left outer join and after that we add condition only get the data which is null in table2 because the data which is only perent in the table1 null in the table2.

select * from student
left join course
on student.std_id = course.id
where course.id is null;
-- (ii). Right exclusive join = It is used to get only the right table data which is only present in the right table remove the common values.There is no particular query to perform the right exclusive join but we can find it indirectly.Firslty we find the right outer join and after that we add condition only get the data which is null in table1 because the data which is only perent in the table2 null in the table1.

select * from student
right join course
on student.std_id = course.id
where student.std_id is null;

-- (iii) Full exclusive join = It is used to find the data that is only present in the table1 and in the table2 but neglect the common data.We firstly find the left exclusive and right execlusive and after that union them.

select * from student
left join course
on student.std_id = course.id
where course.id is null
union
select * from student
right join course
on student.std_id = course.id
where student.std_id is null;
-- Note = we can also gave the alias to the table name using "as" keyword.
-- e.g.:
select s.std_id,s.name,c.courses 
from student as s
inner join course as c
on s.std_id = c.id;

-- 3. Self join = It is used to join the table to it self.
select a.std_id,b.name from student as a
join student as b
on a.std_id = b.std_id;


-- 2. Sub queries = It is also called inner query or subquery or nested query.It is basically a type of query which is write inside another query.It involves two select statements.
/*	Syntax:
	select column_name
    from table_name
    where column_name operator 
    (subquery);
*/
truncate student;

insert into student 
values (101,"anit",78),
(102,"bhumika",93),
(103,"chetan",85),
(104,"dhruv",96),
(105,"emanual",92),
(106,"farah",82);

select * from student;

-- e.g. = 1. Get name of all student who scored more than class average.
-- Here ,we firsly need to write the query to select the name of the student after that while check the condtion we need to find the write the class average query.

select name,marks from student
where marks > (select avg(marks) from student);

-- e.g. 2. Find the name of all the students with even roll_no.
-- Here, we firstly select the names of the student and secondly find the list of even roll no.

select name,roll_no from student
where roll_no in (select roll_no from student where roll_no%2 =0);

-- 3. e.g.: Select the max marks of the student which belong to delhi.
-- Here you firstly need to filter the table with the only delhi city data after that select the mac values.In this basically we use the subquery in the from statemnt but you need to use the alias if you want to use the subquery inside the from statement.

alter table student
add column city varchar(19) not null default "Delhi";

select max(marks) from (select * from student where city="Delhi") as temp;

-- Alternative method1:
select max(marks) from student
where city = "Delhi";
-- Alternative method2:
select marks from student
where city ="Delhi"
order by marks desc
limit 1;


-- 3. Views = Basically view is a virtual table based on the result set of the query statements.A view always show the up-to-date data of the table.The sql engine always change the view ever time whenever user query it.Suppose in your table you have 10 columns but you only need to work with the 5 columns in that case you make a view of 5 columns and use it as a table.The change you done in the views automatically reflected in the table because after creating view is treated as a virtual table you can implement all of the query commands on it.
/*	Syntax to create view:
	create view view_name as
    select column_name_1,... from table_name;
*/

create view new_view as
select roll_no,marks,name from student;

select * from new_view;
-- Make change in the view reflectd in the table:
update new_view
set marks = 87
where roll_no=101;

select * from student;


-- 4. Case-end statements = In sql case-end statements are used to implement the "if-else if-else" block  staements.It can be used in any clause where you need the if-else type situation.
-- syntax:
/*	Syntax:
	case   column_name					-- column_name is used to apply condition on particular column elements it in not mandatory to write.
    when contition_1 then result1		-- used as if 
    when contition_2 then result2		-- used an else if
	when contition_n then resultn		-- used as else if
    else result							-- used as else
    end	 as alias_name					--  "as alias_name" is used to given the column name where the output of the block will store it is not mandatory.
*/
create table customer(
	customer_id int primary key,
    customer_name varchar(19) not null,
    age int unsigned not null,
    payment int
);
insert into customer values (1,"Ram",19,1000),
(2,"Sham",18,500),
(3,"Sita",16,100),
(4,"Geeta",18,5000),
(5,"Reeta",21,1000),
(6,"Ham",18,5000),
(7,"Ramesh",22,8000);

-- e.g.: 1. Print the name and id of the customers also make another columns which show how it gave the payment upto 1000 ot less than 1000 or euqal to 1000.


select customer_id,customer_name,
case payment
when payment>1000 then 'Pay Greater than 1000'
when payment<1000 then 'Pay less than 1000'
else 'Pay equal to 1000'
end as paymentText  -- you clearly see we use the alias name when we need to store the output in the new column.
from customer;

select * from customer;


alter table customer
add column gender varchar(10) not null default "M";


-- e.g. = 2. Change the gender element value if the value is "M" change it to "Male" or "F" change it to "Female":
select *,
case 		-- you clearly see we gave column_name if we want to apply condition on particular column.
when "M" then "Male"
when "F" then "Female"
else "Not Specify"
end as gender_name
from customer;

-- e.g. = 3. Change the gender column values name "M" to "Male" or "F" to "Female":
set  SQL_SAFE_UPDATES=0;
update customer
set gender=case gender
			when 'M' then "Male"
            when "Female" then 'F'
            else 'Not Specify'
            end;

select * from customer;

-- 5. Concat() = It is used to concate the string results.
-- e.g.:
select concat("My name is ",name,".") as names from student;


-- Stored Procedures = Block of code used to execute a store and execute a specific set of sql statements multiple times.

-- 1. Without parameter procedure :

-- DELIMITER //

-- create procedure getValues()
-- begin
-- select * from customer;
-- end

-- DELIMITER ;


-- CALL getValues();

-- 2. With parameter procedure :

-- DELIMITER //

-- create procedure getIndVal(inpId int)
-- begin
-- select * from customer where id = inpId;
-- end

-- DELIMITER ;


-- CALL getIndVal(1);

-- 3. With input and output variable:

-- DELIMITER //

-- create procedure getIndVal(IN inpId int , out variableName varchar(10))
-- begin
-- select count(*) into variableName from customer where id = inpId;
-- end

-- DELIMITER ;


-- CALL getIndVal(1,@variableName);
-- select @variableName;

-- Functions = Function is similar to stored procedure used to store the multiple sql statements in a single block.

-- DELIMITER //

-- create function getValues(variableName varchar(10)) returns varchar(1)
-- deterministic
-- begin
-- select * from customer;
-- return null;
-- end //

-- DELIMITER ;

-- select getValues(value);


-- Difference between the stored procedure and function is :
-- 1. Procedure cannot have return value directly but function must have return value.
-- 2. Procedure can take input and output parameters but function only take the input parameters.
-- 3. In procedure recursion not present but in function recursion is present.
-- 4. Procedure handle transaction but functions not.
-- 5. Procedure is generally used for the inertion,updation and deletion purpose but function is typically used for retreival purpose.


-- Cursor = It is used database object which is used to iterate over the set of record in row by row fashion.No recommended because use storage.Instead of cursor we use window functions.


-- Window Functions = It is used to perform calculation on the individual row without collapsing the result into one row like we do in aggregate functions.
-- e.g. over(),lag(),led(),firstClass(),etc.


-- Indexing = In sql index is nothing but the data structure which is helps the sql to make fast the data retreivel from the table.It allow sql to quicly locate the data without scanning every row.
-- Types = 
-- 1. cluster index = When we create an primary key in a table , it means we directly create an cluster index. There is only one cluster index in a table.It is Fast.
-- 2. Non cluster index = The non cluster indexex store separately from the actaull table. Also there are multiple non cluster index in a table.It is Slow.

-- Syntax :

-- create cluster index / Non cluster index clusterName on
-- tableName(columnName asc/desc);

-- Triggers = these are nothing but the stored programs which automatially execute when the any operation executed on the table. 




