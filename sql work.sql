
create database school;
use school;
create table student2(
Name varchar(40),
gender varchar(1),
age int,
DOB date);

select*from student2;

insert into student2(Name,gender,age,DOB)
values
("ram","M",34,"1990-09-12"),
("shyam","M",34,"1990-09-12"),
("john","M",34,"1990-09-12"),
("don","M",34,"1990-09-12");

alter table student
add email varchar(20);

alter table student
modify email varchar(20) after name;

alter table student
modify email int;

alter table student
add unique (email);

alter table student
change email email_id int;

alter table student
drop column email_id;

use school;

create table personal(
id int not null unique,
name varchar(50)not null,
age int not null check (age>=18),
gender varchar(1) not null,
phone varchar(10) not null unique,
city varchar(20) not null default"agra");


insert into personal(id,name,age,gender,phone,city)
values
(2,"abc",19,"m",9837462647,"agra"),
(3,"def",20,"m",9818324567,"agra");

select * from personal;

insert into personal(id,name,age,gender,phone)
values
(4,"fghj",54,"M",876543);
use school;
create table personal2(
id int not null unique,
name varchar(50)not null,
age int not null check (age>=18),
gender varchar(1) not null,
phone varchar(10) not null unique,
city varchar(20) not null default"agra");


select * from personal2;

/* session4 */

select name from personal2;

select id, name from personal2;

select id as emp_id, name as emp_name from personal2;

select * from personal2 ;

select name from personal2 where gender ="m";

insert into personal2(id,name,age,gender, phone,city)
values
(6,"sam",24,"m",435267,"bhopal"),
(2,"rani",22,"f",654218,"delhi"),
(7,"john",26,"m",876542,"bhopal"),
(4,"seeta",24,"f",4355268,"bhopal"),
(5,"shruti",22,"f",643248,"delhi");



select * from personal2 where age >=21;

select * from personal2 where age in(21,22,23);

select * from personal2 where not city in ('bhopal','delhi');

set sql_safe_updates=0;
update personal2
set name ="ram" where id=1;

update personal2
set phone=7042249445 where id =1;

update personal2
set age = 19;

update personal2 set age=18 where id in(1,4,5);

select * from personal2 ;

select * from personal2 where age between 18 and 21;

select * from personal where id between 2 and 5;

select * from personal2 where name between "a" and "k";

delete from personal2 where id=1;

/*truncate delete table info and leaves rows */


truncate table personal2;

select * from  personal2 where name like "r%"; 

select * from personal2 where name like "%am%";

select * from personal2 where phone like"%21";

select * from personal2 where name like"_a%";

select * from personal2 where name like"___n%";

select * from personal2 where name regexp "ra";

select * from personal2 where name regexp "^ra";

select * from personal2 where name regexp "an$";

select * from personal2 where name regexp "ram|kapoor|khan";

select * from personal2 where name regexp "^ram|kapoor|^khan";

select * from personal2 where name regexp "^ram|kapoor|khan$";

select * from personal2 where name regexp "[is]";

select * from personal2 where name regexp "[rm]";

select * from personal2 where name regexp "[rm]a";

select * from personal2 where name regexp "[rmh]a";

select * from personal2 where name regexp "r[am]";

select * from personal2 order by name;

select * from personal2 order by name asc;

select * from personal2 order by name desc;

select * from personal2 order by namw ,city;

select * from personal2  where city="agra" order by name desc; 

select min(age) as minimum_age from personal2;

select avg(age) as average_age from personal2;



select sum(age) as sum_age from personal2;

#/arithmatic functions 

select 5+6;

select 5+6 as total;
#/denotes qutiont
select 15/3;

#% dentes remainder
select 15%3;
select 16%3;

select id, name, age+5 as "new_age" from personal2;
select pi();
select round(pi(),2);
select round(4.3);
select round(4.7);
select ceil(4.3);
select ceil(4.6);
select ceil(4.01);
select ceil(4.1);
select floor(4.3);
select pow(2,2);
select pow(4,3);
select sqrt(64);
select sqrt(5), round(sqrt(5),2);
select abs(-2.25);
select abs(2.25);
select sign(-25);
select sign(25);
select sign(0);
select rand();
select rand()*100;

#string functions
select id, upper(name), age from personal2;
select id, ucase(name), age from personal2;
select id, lower(name), age from personal2;
select id, lcase(name), age from personal2;
select id, name, character_length(name) as characters from personal2;
select id, concat(name," ",age) as name from personal2;

select concat("neema","_","jha","hello") as name from personal2;

select concat_ws("!","akki","yaduvanshi","hello","class") as name from personal2;
select"    akki     "as name;
select LTRIM("  AKKI    ")as name;
select RTRIM("     akki      ")as name;
select instr("hello world","ell")as position_no;
select instr("hello world","el")as position_no;
select locate("hello world","ell")as position_no;
select locate("l","hello world",1)as position_no;
select locate("1","hello world",3)as position_no;
select locate("l","hello world",7)as position_no;
select substring("neema jha",3);
select substring("neema jha",5);
select substring("neema jha",3,6);
select substring("neema jha",-6,3);
select mid("neema jha"-6,3);
select substring_index("www.neemajha.net",".",1);
select substring_index("www.neemajha.net",".",2);
select substring_index("www.neemajha.net","e",2);
select substring_index("www.neema.jha","e",3);
select left("neema jha",3);
select right("neema jha",3);
select lpad("neema jha",20,"-");
select rpad("neema jha",20,"-");
select reverse("neema jha");
select replace("neema jha","jha","mam");
select replace("neema jha neema jha ","jha","mam");
select strcmp("neema jha","neema jha");
select strcmp("neema jha","neema");
select strcmp("neema","neema jha");
select field("a","x","a","k");
select field("a","x","a","k");
select field(5,0,1,2,3,4,5,6);
select field_in_set("ram","Ram","mohan","Shyam");
select hex("neema jha") as value;
select current_date();
select curdate();
select sysdate();
select now();
select date("2024-10-14 10:08:21");
select month("2024-10-14 10:08:21");
select monthname("2024-10-14 10:08-21");
select year("2024-10-14 10:08;21");
select quarter("2024-10-14 10:08:21");
select dayname("2024-10-14 10:08:21");
select dayofmonth("2024-10-14 10:08:21");
select dayofweek("2024-10-14 10:08:21");
select dayofyear("2024-10-14 10:08:21");
select week("2024-10-14 10:08:21");
select weekday("2024-10-14 10:08:21");
select yearweek("2024-10-14 10:08:21");
select last_day("2024-10-14 10:08:21");
select extract(month from "2024-10-14 10:08:21");
select adddate("2024-10-14",interval 10 day);
select adddate("2024-10-14",interval 1 month);
select adddate("2024-10-14",interval 24 hour);
select date_add("2024-10-14",interval 5000 minute);
select makedate(2024,16);
select subdate("2024-10-14",interval 1 day);

/*time functions */
select current_time();
select curtime();
select current_timestamp();
select localtime();
select localtimestamp();
select time("2024-10-14 10:08:21");
select hour("2024-10-14 10:08:21");
select timediff("13:10:45","10:08:21");






