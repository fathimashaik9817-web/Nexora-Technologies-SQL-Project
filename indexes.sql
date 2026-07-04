create index idx_employee_name
on employees(name);
create index inx_department
on employees(dept_id);
create index inx_salary
on employees(salary);

select *from employees
where name='kiran';
select *from employees
where dept_id=101;
select *from employees
where salary>50000;

show index from employees;