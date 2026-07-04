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