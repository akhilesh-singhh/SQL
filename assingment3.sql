Create database Company;

use Company;

Create table emp_info(
emp_id int Not null unique,
first_name varchar(50),
last_name varchar(50),
department varchar (50),
salary decimal (10,2),
hire_date date);

Insert into emp_info(emp_id,first_name,last_name,department,salary,hire_date)
values
(1,'john','doe','it',60000.00,'2019-01-10'),
(2,'jane','smith','hr',55000.00,'2018-03-05'),
(3,'emily','jones','it',62000.00,'2020-07-23'),
(4,'michael','brown','finance',70000.00,'2016-05-14'),
(5,'sarah','davis','finance',69000.00,'2017-11-18'),
(6,'david','johnson','hr',48000.00,'2021-09-10');


/* 1. Find the average salary of employees in each department.*/

select department,avg(salary) from emp_info
group by department;

/*  Find the total number of employees hired after 2019. */

select count(emp_id) from emp_info where hire_date>='2019-12-31';

/* List the departments and the total salary of all employees in each department, ordered by the total salary.*/

select department,sum(salary) as total_salary from emp_info
group by department;

/*  Find the highest salary in the Finance department.*/

select salary from emp_info where department = 'finance' order by salary desc limit 1; 

/*  Get the top 3 highest-paid employees. */

select first_name,max(salary) from emp_info
group by first_name order by max(salary) desc limit 3;

/*  Find the department with the minimum average salary.*/

select department,min(salary) from emp_info
group by department;

/* Display the total number of employees in each department, ordered by the number of employees. */

select department,count(emp_id) from emp_info
group by department;

/*  Find the average salary of employees who were hired before 2020.  */

select hire_date,avg(salary) from emp_info 
group by hire_date
having hire_date<'2020-12-31';

/*  List the names of employees in the IT department ordered by hire date, with the most recently hired employees first. */

select first_name , hire_date  as "most recently hired employee in it department " from emp_info where hire_date IN (select max(hire_date ) from emp_info where department ="IT");

/*  Find the sum of salaries for all employees hired after January 1, 2019, ordered by salary. */

select sum(salary) from emp_info where hire_date>'2019-01-01' order by sum(salary) asc;

/*  Get the employee with the lowest salary in the HR department. */

select first_name,last_name,salary from emp_info where salary in( select min(salary) from emp_info where department = 'hr');

/*  Find the total salary paid to employees in each department, but limit the result to the top 2 highest-paying departments.  */

select department,sum(salary) from emp_info
group by department
order by department desc
limit 2;

/* List all employees hired after 2018, ordered by salary, and show only the first 4 employees.*/

select first_name,last_name,emp_id,salary,hire_date from emp_info where hire_date > '2018-12-31' order by hire_date asc limit 4;

/* Find the highest salary in the IT department, but limit the results to the top 1 result.  */

select max(salary) from emp_info where department='it' order by max(salary) desc limit 1;

/*  Get the average salary of employees in each department and list only departments with an average salary greater than $60,000. */

select department,avg(salary) from emp_info 
group by department
having avg(salary)>60000;
