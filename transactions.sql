start transaction;
update employees
set salary=55000
where emp_id=11;
select emp_id, name ,salary
from employees
where emp_id=11;
commit;

start transaction;
update employees
set salary=70000
where emp_id=11;
select emp_id, name ,salary
from employees
where emp_id=11;
rollback;
select emp_id, name ,salary
from employees
where emp_id=11;