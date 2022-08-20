create database dummy;
use dummy;

create table if not exists test ( 
test_id int auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30),
primary key (test_id));

/*only column defined as primary key can use auto_increment keyword */
/* on using auto_increment keyword --> for each and evrey row incremented integer like serial number occurs*/
/* primary key is used to link one table with other*/

insert into test values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore'),
(2,'krish','krish@gmail.com', 'bengalore'),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore'),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur');

select * from test;

create table if not exists test2 ( 
test_id int not null auto_increment,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30),
primary key (test_id));

insert into test2 (test_name , test_mailid , teast_adress) values ('sudhanshu','sudhanshu@ineuron.ai','benglaore'),
('krish','krish@gmail.com', 'bengalore'),
('hitesh' ,'hitesh@ineuron.ai','bengalore'),
('shubahm' , 'shudham@gmail.com', 'jaipur');

select * from test2;

/* Use check contraint to make column value to abide some rule*/
create table if not exists test3 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30),
test_salary int check(test_salary > 10000));

insert into test3 values (1,'sudhanshu','sudhanshu@ineuron.ai','benglaore' , 50000),
(2,'krish','krish@gmail.com', 'bengalore' , 30000),
(3,'hitesh' ,'hitesh@ineuron.ai','bengalore' , 111000),
(4,'shubahm' , 'shudham@gmail.com', 'jaipur',20000);

select * from test3;

create table if not exists test4 ( 
test_id int ,
test_name varchar(30) , 
test_mailid varchar(30),
teast_adress varchar(30) check (teast_adress= 'bengalore'),
test_salary int check(test_salary > 10000));

insert into test4 values (1,'sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);
select * from test4;

create table if not exists test5( 
test_id int NOT NULL,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30) check (test_adress= 'bengalore'),
test_salary int check(test_salary > 10000));

insert into test5 ( test_name , test_mailid , test_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);
select * from test5;

create table if not exists test6( 
test_id int NOT NULL default 0 ,
test_name varchar(30) , 
test_mailid varchar(30),
test_adress varchar(30) check (test_adress= 'bengalore'),
test_salary int check(test_salary > 10000));

insert into test6 ( test_name , test_mailid , test_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

select * from test6;

insert into test6 ( test_id,test_name , test_mailid , test_adress,test_salary) values (101 , 'sudhanshu1','sudhanshu@ineuron.ai','bengalore' , 50000);
select * from test6;

create table if not exists test7( 
test_id int NOT NULL default 0 ,
test_name varchar(30)  , 
test_mailid varchar(30) unique ,
test_adress varchar(30) check (test_adress= 'bengalore'),
test_salary int check(test_salary > 10000));
	
insert into test7 ( test_name , test_mailid , test_adress,test_salary) values ('sudhanshu','sudhanshu@ineuron.ai','bengalore' , 50000);

create table if not exists test8( 
test_id int NOT NULL auto_increment  ,
test_name varchar(30)  NOT NULL default 'unknown' , 
test_mailid varchar(30) unique NOT NULL,
test_adress varchar(30) check (test_adress= 'bengalore') NOT NULL,
test_salary int check(test_salary > 10000) NOT NULL,
primary key (test_id));

/* Only one primary key is allowed for a table, but there can be any number of unique key */
select * from test8;

insert into test8 ( test_id , test_name , test_mailid , test_adress,test_salary) values (101 , 'sudhanshu','sudhanshu55@ineuron.ai','bengalore' , 50000);

insert into test8 ( test_name , test_mailid , test_adress,test_salary) values ('sudhanshu','sudhanshu90@ineuron.ai','bengalore' , 50000);

select * from test8;