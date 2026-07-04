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