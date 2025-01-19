create table empl(
emp_id int ,
emp_name varchar(50),
dept_id int);
create table dept(
dept_id int,
dept_name varchar(50));
create table pro(
pro_id int ,
emp_id int,
pro_name varchar(50));
insert into empl(emp_id,emp_name,dept_id)
values
(1,'alice',10),
(2,'bob',20),
(3,'charlie',30),
(4,'david',10),
(5,'eve',40);
insert into dept(dept_id,dept_name)
values
(10,'hr'),
(20,'finance'),
(30,'it'),
(40,'admin'),
(50,'marketing');
insert into pro(pro_id,emp_id,pro_name)
values
(101,1,'alpha'),
(102,2,'beta'),
(103,3,'gamma'),
(104,4,'delta');
create database it_company;
use it_company;
select * from empl;
select * from dept;
select * from pro;
 /*1.Write a query to get Employee and Department details using join.*/
   select emp_id,emp_name,dept_name
   from empl left join dept on
   empl.dept_id=dept.dept_id;
select  emp_id , emp_name, dept_name 
from empl left join dept
on empl.dept_id = dept.dept_id;     



 /*2.Write a query to retrieve all employees with their departments, even if the department is missing.*/
select emp_id,emp_name,dept_name from empl left join dept on empl.dept_id=dept.dept_id;
select emp_name , dept_name
from empl left join dept
on empl.dept_id = dept.dept_id;



/*3. Write a query to get department details even if there are no employees in that department.*/ 
select emp_name,dept_name from empl left join dept on empl.dept_id=dept.dept_id;
select emp_name , dept_name
from empl right join dept
on empl.dept_id = dept.dept_id;

/*4.Write a query to get all employees and departments, whether matched or not. */
select emp_id,emp_name ,dept_name from empl right join dept on empl.dept_id = dept.dept_id;
select  emp_id , emp_name , dept_name
from empl right join dept
on empl.dept_id = dept.dept_id;



/*5.JOIN three tables (Employees, Departments, Projects) to get employee, department, and project information.*/
select emp_name ,dept_name,pro_id,pro_name from dept left join empl on dept.dept_id = empl.dept_id left join pro on empl.emp_id=pro.emp_id; 


select  emp_name , dept_name , pro_id , pro_name
from dept left join empl
on dept.dept_id = empl.dept_id
left  join pro
on empl.emp_id= pro.emp_id; 



/*6.Find employees who are not assigned to any projects.*/
select emp_name , pro_id from empl left join pro on empl.emp_id=pro.pro_id where pro_id is null;
select emp_name , pro_id 
from empl left join pro
on empl.emp_id= pro.emp_id where pro_id is null;


/*7.Find departments with no employees using a RIGHT JOIN. */
select emp_name, dept_name from empl right join dept on empl.dept_id = dept.dept_id where emp_name is null;
select  dept_name , emp_name
from empl right join dept
on empl.dept_id = dept.dept_id where emp_name is null;


/*8.Write a query to get Employee and Department details using join with aliases. */
select emp_name, dept_name from empl e left join dept d on e.dept_id = d.dept_id;
select  emp_id , emp_name, dept_name 
from empl e left join dept d
on e.dept_id = d.dept_id;


/*9.Write a query to find employees in the same department as other employees.*/ 

select e1.emp_name
from empl e1 join empl e2 
on e1.dept_id =e2.dept_id
where e1.emp_id != e2.emp_id;



/*10.Write a query to find projects managed by employees in the 'IT' department.*/ 

select  emp_name , dept_name , pro_name
from dept d right join empl e
on d.dept_id = e.dept_id
right join pro p
on e.emp_id = p.emp_id where dept_name = "IT" ;

/*11.Write a query to show employees and their project information (even if not assigned to a project).*/ 

select emp_name , pro_id , pro_name
from empl left join pro
on empl.emp_id= pro.emp_id ;



/*12.Find employees who work in departments with names starting with 'A'. */
select   emp_name , dept_name
from empl left join dept
on empl.dept_id = dept.dept_id where emp_name LIKE "A%";


/*13. Find the total number of employees in each department using GROUP BY and JOIN. */
select dept_name, count(emp_name) from empl right join dept on empl.dept_id = dept.dept_id group by dept_name having count(emp_name)>1;
select  dept_name, count( emp_name)
from empl right join dept
on empl.dept_id = dept.dept_id group by dept_name;



/*14.Get the list of departments with more than one employee.*/ 

select dept_name , count(emp_name)  as "no. of employees " 
from empl right join dept
on empl.dept_id = dept.dept_id group by dept_name having count(emp_name)>1;














