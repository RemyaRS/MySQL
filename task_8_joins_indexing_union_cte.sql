create database operation;
use operation;

create table if not exists course (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50));


create table if not exists student(
student_id int ,
student_name varchar(30),
student_mobile int ,
student_course_enroll varchar(30),
student_course_id int );

insert into course values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

insert into student values(301 , "sudhanshu", 3543453,'yes', 101),
(302 , "sudhanshu", 3543453,'yes', 102),
(301 , "sudhanshu", 3543453,'yes', 105),
(302 , "sudhanshu", 3543453,'yes', 106),
(303 , "sudhanshu", 3543453,'yes', 101),
(304 , "sudhanshu", 3543453,'yes', 103),
(305 , "sudhanshu", 3543453,'yes', 105),
(306 , "sudhanshu", 3543453,'yes', 107),
(306 , "sudhanshu", 3543453,'yes', 103);

select * from course;

select * from student;

#JOINS
select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
inner join student s on c.course_id = s.student_course_id;
# c is an alias for course and s is alias for student
# inner join will find common records of the two tables
# So inner join means intersection of two tables

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id;
# Every data in left hand side is pulled out and corresponding records in other table is joined with it

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
left join student s on c.course_id = s.student_course_id where s.student_id is null;
# to get course which was not purchased by anyone

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
right join student s on c.course_id = s.student_course_id;
# Every data in left hand side is pulled out and corresponding records in other table is joined with it

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
right join student s on c.course_id = s.student_course_id where c.course_id is null;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s on c.course_id = s.student_course_id;
# Cross join gives all data from both the tables
#Right now it behaves same as inner join 

# But when the condition is removed in both inner and cross join
select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
inner join student s;

select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ;
# So inner join gives intersection only but cross join will give every possible combination of two tables

#INDEXING
show index from course;# Nothing displayed

create table if not exists course1 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id)
);

insert into course1 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course1;# Shows some  information and relations about the table
# Indexing shows that course_id is binary tree....means with the help of binary tree search method it will find the required index
# instead of going through each record's index

create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name)
);

create table if not exists course4 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_desc,course_name,course_tag)
);

insert into course4 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');

show index from course4;

EXPLAIN ANALYZE select * from course4 where  course_id = 106 or course_name = 'fsds';

explain select * from course4 where  course_id = 106;

analyze table course4;

describe course4;

create table if not exists course6 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
unique index(course_desc,course_name)
);
show index from course6;

# UNION
# To combine two tables vertically one after another
# Also it should be noted that number of columns selected in two tables must be same in number
select course_id , course_name from course
union
select student_id , student_name from student;


(select course_desc , course_name from course 
union 
select student_id , student_name from student );

(select course_desc , course_name from course 
union all
select student_id , student_name from student );

# Union all gives duplicate records also unlike Union

# CTE - Common table Expression
# To filter only a set of records and treat it as a separate temporary table
# with keyword is used for it
with sample_students as (
select * from course where course_id in (101,102,106))
select * from sample_students where course_tag = 'java';

with outcoume_corss as (select c.course_id , c.course_name , c.course_desc ,s.student_id,s.student_name ,s.student_course_id from course c
cross  join student s ) select course_id , course_name ,student_id from outcoume_corss where student_id = 301;

with recursive table1 as(
select 1 as n, 1 as p, -1 as q
union all
select n+1, q+2, p+4 from table1 where n<5)
select * from table1;