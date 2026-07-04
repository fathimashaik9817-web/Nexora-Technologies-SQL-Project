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