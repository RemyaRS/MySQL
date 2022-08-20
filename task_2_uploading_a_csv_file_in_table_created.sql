create database dress_data;
use dress_data;

create table if not exists dress(
`Dress_ID` varchar(30),	
`Style`	varchar(30),	
`Price`	varchar(30),	
`Rating`	varchar(30),	
`Size`	varchar(30),	
`Season`	varchar(30),	
`NeckLine`	varchar(30),	
`SleeveLength` varchar(30),		
`waiseline`	varchar(30),	
`Material`	varchar(30),	
`FabricType`	varchar(30),	
`Decoration`	varchar(30),	
`Pattern Type` varchar(30),		
`Recommendation` varchar(30));

LOAD DATA INFILE 'E:/ineuron/AttributeDataSet.csv'
into table dress
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

/* 
To eleiminate this error :
MySQL server is running with the -secure-file-priv option so it can not execute this statement

Go to:
C drive --> Program dta folder --> MySQL --> MySQL Server --> my ------- then righth click on it and select notepad   ==

Now in the notepad edit path of -----------> secure-file-priv as ------> secure-file-priv=""

Then save the notepad

Go to services in search
MySQL right click it, and press restart

 */

select *  from dress;


