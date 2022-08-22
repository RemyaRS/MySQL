create database key_prim;
use key_prim;

/* primary key should be unique.....there should not be any duplicate entries */

create table ineuron(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into ineuron values(01 , 'FSDA','active',100);
insert into ineuron values(02 , 'FSDs','not-actrive',100);
select * from ineuron;

create table studets_ineuron(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references ineuron(course_id)); /* to make studets_ineuron as child table of ineuron table */

insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',05);/* This will give an error because course id is having values 01 and 02 only */

insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01);
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',01);
insert into studets_ineuron values(101 , 'fsda','test@gmail.com','active',02);

select * from studets_ineuron;

create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references ineuron(course_id)); /* to make payment as child table of ineuron table */

insert into payment values ('fsda',01,'not-active','7th aug');
insert into payment values ('fsda',01,'not-active','7th aug');
insert into payment values ('fsda',01,'not-active','7th aug');


create table class(
course_id int ,
class_name varchar(60),
class_topic varchar(60),
class_duration int ,
primary key(course_id),
foreign key(course_id) references ineuron(course_id)); /* to make class as child table of ineuron table */

alter table ineuron drop primary key;

alter table class drop primary key;

alter table ineuron add constraint test_prim primary key(course_id,course_name)

drop table ineuron /* not possible unless child table is dropped*/

drop table class;

create table test(
id int not null , 
name varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50));

alter table test add primary key(id);

alter table test drop primary key;

alter table test add constraint test_prim primary key(id , email_id);


create table parent(
id int not null ,
primary key(id));

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id));

insert into parent values(1);
select * from parent ;
insert into child values(1,1);
select * from child;
insert into child values(2,2);
insert into child values(2,1);

delete from parent where id =1;
delete from child where id =1;
delete from child where parent_id =1;

drop table child;


create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on delete cascade );

/*  delete cascade keyword is used to update child table corresponding to change in parent table */
insert into parent values(1);
insert into child values(1,1),(2,1),(3,1),(4,1);

select * from child;

select * from parent;

delete from parent where id  = 1;

update parent set id = 3 where id = 2

drop table child;

create table child (
id int ,
parent_id int ,
foreign key (parent_id) references parent(id) on update cascade );

insert into parent values(1);
insert into parent values(2);
insert into parent values(3);

insert into child values(1,1),(1,2),(3,2),(2,2);


select * from child ; 
select * from parent;

update parent set id = 4 where id = 2
select * from parent;
