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

select e.name,
p.project_name,
d.dept_name
from employees e
join departments d
on e.dept_id=d.dept_id
join projects p
on d.dept_id=p.dept_id;