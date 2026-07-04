create database Nexora_db;
use Nexora_db;
create table departments(
dept_id int primary key,
dept_name varchar(50),
location varchar(50)
);
insert into departments values
(101,'HR','Hyderabad'),
(102,'IT','Hyderabad'),
(103,'Sales','Bangalore'),
(104,'Finance','Mumbai'),
(105,'Marketing','Chennai');

create table employees(
emp_id int primary key,
name varchar(50),
salary int,
dept_id int,
joining_date date,
manager_id int
);
insert into employees values
(1,'Ali',30000,101,'2022-01-10',null),
(2,'Sara',45000,102,'2021-03-15',NULL),
(3,'John',50000,103,'2020-06-20',1),
(4,'David',60000,102,'2019-09-12',2),
(5,'Priya',35000,101,'2023-02-25',1);
select*from employees;
INSERT INTO employees VALUES
(6,'Rahul',55000,102,'2021-07-11',2),
(7,'Neha',40000,103,'2022-05-18',3),
(8,'Arjun',65000,102,'2020-11-30',2),
(9,'Sneha',38000,101,'2023-01-15',1),
(10,'Vikram',70000,104,'2019-04-22',NULL),
(11,'Kiran',45000,104,'2021-08-10',10),
(12,'Anjali',42000,105,'2022-09-05',NULL),
(13,'Ravi',39000,105,'2023-03-12',12),
(14,'Pooja',52000,103,'2021-12-01',3),
(15,'Aman',48000,102,'2022-10-20',2);

select count(*) from employees;
select max(salary) from employees;
select avg(salary) from employees;
select*from employees
where dept_id=102;

create table projects(
project_id int primary key,
project_name varchar(50),
dept_id int,
budget int,
start_date date
);
INSERT INTO projects VALUES
(1,'Employee Management System',102,500000,'2024-01-10'),
(2,'Sales Analytics Dashboard',103,300000,'2024-02-15'),
(3,'Payroll Automation',101,200000,'2024-03-01'),
(4,'Finance Tracker',104,400000,'2024-04-10'),
(5,'Marketing Campaign Tool',105,250000,'2024-05-05');
select*from projects;

select
e.name as employees_name,
d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;

select
e.name as employees_name,
d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id;

select
e.name as employees_name,
d.dept_name
from employees e
right join departments d
on e.dept_id=d.dept_id;

select
e.name as employee,
m.name as manager
from employees e
left join employees m
on e.manager_id=e.emp_id;

select
p.project_name ,
d.dept_name,
p.budget
from projects p
join departments d
on p.dept_id=d.dept_id
order by p.budget desc;

select e.emp_id, e.name,d.dept_name
from employees e
inner join departments d
on e.dept_id=d.dept_id;

select  e.name,d.dept_name,e.salary
from employees e
join departments d
on e.dept_id=d.dept_id;

select  
e.name as employee,
m.name as manager
from employees e
left join employees m
on e.manager_id=m.emp_id;

select
p.project_name,
d.dept_name
from projects p
join departments d
on p.dept_id=d.dept_id;

select
e.name,
p.project_name
from employees e
join projects p
on e.dept_id=p.dept_id;

select
p.project_name,
d.dept_name,
p.budget
from departments d
join projects p 
on d.dept_id=p.dept_id
order by p.budget desc;

select d.dept_name,e.name
from departments d
left join employees e
on d.dept_id=e.dept_id;

select e.name,d.dept_name
from employees e 
right join departments d
on e.dept_id=d.dept_id;

select 
e.name as employee,
d.dept_name,
m.name as manager
from employees e
join departments d
on e.dept_id=d.dept_id
left join employees m
on e.manager_id=m.emp_id;

select
p.project_name,
d.dept_name,
p.budget
from projects p
join departments d
on p.dept_id=d.dept_id
order by p.budget desc
limit 1;

select
d.dept_name,
count(e.emp_id) as employee_count
from departments d
left join employees e
on d.dept_id=e.dept_id
group by d.dept_name;

select
d.dept_name,
avg(e.salary) as average_salary
from departments d
join employees e
on d.dept_id=e.dept_id
group by d.dept_name;

select d.dept_name
from departments d
left join employees e
on d.dept_id=e.dept_id
where e.emp_id is null; 

select name
from employees 
where manager_id is null;

select 
d.dept_name,
sum(p.budget)as total_budget
from departments d
join projects p
on d.dept_id=p.dept_id
group by d.dept_name;

select e.name,
p.project_name,
d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id
join projects p
on d.dept_id=p.dept_id;

select
d.dept_name,
e.name,
e.salary
from employees e
join departments d
on e.dept_id=d.dept_id
where e.salary=(
      select max(e2.salary)
      from employees e2
      where e2.dept_id=e.dept_id
);
select
 d.dept_name,
 count(e.emp_id)as
employee_count,
  sum(e.salary)as total_salary,
  avg(e.salary)as average_salary,
  max(e.salary)as highest_salary
  from employees e
  join departments d
  on e.dept_id=d.dept_id
  group by d.dept_name;
  select name ,salary
  from employees
  order by salary desc
  limit 3;
  select name,salary
  from employees
  where salary=(select max(salary)
				from employees);
select name,salary
  from employees
  where salary>(select avg(salary)
				from employees);
 select name,salary
  from employees
  where salary=(select max(salary)
				from employees);
select name,salary
from employees
where salary=(select max(salary) 
               from employees
              where salary<(select max(salary)
              from employees
              )
	);
    select max(salary) as second_highest_salary
    from employees
    where salary< (select max(salary)
    from employees
    );
    select 
    e.name as employee_name,
    e.salary as employee_salary,
    m.name as manager_name,
    m.salary as manager_salary
    from employees e
    join employees m
    on e.manager_id=m.emp_id
    where e.salary>m.salary;
                
select dept_name,max(salary)
from employees e
join departments d
on e.dept_id=d.dept_id
group by dept_name;

select dept_name,
e.name,
e.salary
from employees e
join departments d
on e.dept_id=d.dept_id
where (e.dept_id,e.salary)in(select dept_id, max(salary)
                              from employees 
                              group by dept_id);

select
emp_id,
name,
joining_date,
timestampdiff(year,joining_date,curdate())as experience_years
from employees
where timestampdiff(year,joining_date,curdate())>3;

select d.dept_name,
        avg(e.salary)as avg_salary
from employees e
join departments d
on e.dept_id=d.dept_id
group by d.dept_name
order by avg_salary desc
limit 1;

select 
  p.project_name,
  e.name
  from projects p
  join employees e
  on p.dept_id=e.dept_id;
  
select name,salary,
row_number() over(order by salary desc) as row_num
  from employees;
  
 select name,salary,
 rank() over(order by salary desc) as salary_num
  from employees;
  
select name,salary,
 dense_rank() over(order by salary desc) as salary_rank
  from employees;
  
select name,salary,
 dense_rank() over(order by salary desc) as salary_rank
from employees;

 select name,salary,
 rank() over(order by salary desc) as salary_rank
  from employees;
  
   select*from
   (select name,salary,
 rank() over(order by salary desc) as salary_rank
 from employees)t
 where salary_rank<=3;
 
select
d.dept_name,
e.name,
e.salary,
Row_number() over(
partition by d.dept_name
order by e.salary desc
)AS rn
from employees e
join departments d
on e.dept_id =d.dept_id; 
 
select*from(
select 
d.dept_name,
e.name,
e.salary,
Row_number() over(
partition by d.dept_name
order by e.salary desc
)AS rn
from employees e
join departments d
on e.dept_id =d.dept_id)t
where rn=1; 

create view employee_details as
select
e.emp_id,
e.name,
d.dept_name,
e.salary
from employees e
join departments d
on e.dept_id=d.dept_id;

select*from employee_details;

create view high_salary_employees as
select
e.emp_id,
e.name,
d.dept_name,
e.salary
from employees e
join departments d
on e.dept_id=d.dept_id
where e.salary>(select avg(salary)
from employees);

select*from high_salary_employees;

delimiter $$
create procedure getallemployees()
begin
   select*from employees;
end $$
delimiter ;
call getallemployees();

delimiter $$
create procedure getallemployeesbydept(
in deptno int
)
begin
select*
from employees
where dept_id= deptno;
end $$
delimiter $$;
call  getallemployeesbydept(102);
call  getallemployeesbydept(103);
call  getallemployeesbydept(101);

select
 d.dept_name,
 count(e.emp_id) as employee_count,
 sum(e.salary)as total_salary,
 avg(e.salary)as average_salary,
 max(e.salary) as highest_salary,
 min(e.salary) as lowest_salary
 from employees e
 join departments d
 on e.dept_id=d.dept_id
 group by d.dept_name;
 
 select
 p.project_name,
 d.dept_name,
 p.budget
 from projects p
 join departments d
 on p.dept_id=d.dept_id
 order by p.budget desc;
 
 
 delimiter $$
 create trigger
 check_salary_before_insert
 before insert on employees
 for each row
 begin
 if new.salary<0 then
 signal sqlstate '45000'
 set message_text='salary cannot be negetive';
 end if;
 end$$
 delimiter ;
 ##test it
 insert into employees 
 values(16,'test',-5000,101,'2024-01-01',1);
 
 delimiter $$
  create trigger
 check_salary_before_update
 before update on employees
 for each row
 begin
 if new.salary<0 then
 signal sqlstate '45000'
 set message_text='salary cannot be negetive';
 end if;
 end$$
 delimiter ;
 ##test it
 update employees
 set salary=-10000
 where emp_id=11;
 
 create table salary_sudit(
 audit_id int auto_increment primary key,
 emp_id int,
 old_salary decimal(10,2),
 new_salary decimal(10,2),
 updated_on timestamp default
 current_timestamp
 );
 
 delimiter $$
  create trigger
 salary_update_auite
 after update on employees
 for each row
 begin
 if old.salary<> new.salary then
insert into
 salary_audit(emp_id,old_salary,new_salary)
 values(old.emp_Id, old_salary,new_salary);
 end if;
 end$$
 delimiter ;
 ##test it
 update employees
 set salary=50000
 where emp_id=11;
 
 CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DROP TRIGGER IF EXISTS salary_update_audit;

DELIMITER $$
CREATE TRIGGER salary_update_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_audit(emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
END $$
DELIMITER ;

UPDATE employees
SET salary = 50000
WHERE emp_id = 11;
SELECT * FROM salary_audit;
 