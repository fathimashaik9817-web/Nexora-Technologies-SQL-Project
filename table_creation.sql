create table departments(
dept_id int primary key,
dept_name varchar(50),
location varchar(50)
);

create table employees(
emp_id int primary key,
name varchar(50),
salary int,
dept_id int,
joining_date date,
manager_id int
);

create table projects(
project_id int primary key,
project_name varchar(50),
dept_id int,
budget int,
start_date date
);