create database joins2;
use joins2;

create table employees(
emp_id int,
emp_name varchar(40),
dept_id int,
salary int);

insert into employees(emp_id,emp_name,dept_id,salary)values
(1,"alice",101,6000),
(2,"bob",102,7000),
(3,"charlie",103,8000),
(4,"david",101,7500),
(5,"eve",102,8500);

select * from employees;

create table  department(
dept_id int,
dept_name varchar(40));

insert into department(dept_id,dept_name)values
(101,"HR"),
(102,"sales"),
(103,"IT"),
(104,"marketing");

select * from department;

create table project(
project_id int,
project_name varchar(40),
dept_id int);

insert into project(project_id,project_name,dept_id)values
(1,"project A",101),
(2,"project B",102),
(3,"project C",103),
(4,"project D",104);

select * from project;

/*retrieve the employee name and department name for each employee */





/* list the employees names and their respective project names */
select e.emp_name, p.project_name
from employees as e
inner join project as p
on e.dept_id = p.dept_id;

/* find the employee and the projrct name for employees in hr department */
create database joins;
use joins;
create table students(
student_id int,
name varchar(40));
insert into students(student_id,name)
values
(101,"adam"),
(102,"bob"),
(103,"casey");

create table course(
student_id int,
course varchar(50));
insert into course(student_id,course)
values
(102,"english"),
(103,"math"),
(105,"science"),
(107,"comp sci");


SELECT students.student_id,name,course
FROM students
LEFT JOIN course
ON students.student_id=course.student_id;


SELECT course.student_id,name,course
FROM students
RIGHT JOIN course
ON students.student_id=course.student_id;

