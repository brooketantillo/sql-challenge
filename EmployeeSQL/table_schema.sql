-- DATA ENGINEERING
-- Create a table schema for each of the six CSV files
-- Create Employee Table
create table employees (
	emp_no int primary key not null,
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	gender varchar(2),
	hire_date date
)
;
-- Create Department Table
create table departments (
	dept_no varchar(10) primary key not null,
	dept_name varchar(50) not null	
)
;
-- Create Department Employee Table
create table dept_emp (
	emp_no int not null,
	dept_no varchar(10) not null,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
)
;
-- Create Department Manager Table
create table dept_manager (
	dept_no varchar(10) not null,
	emp_no int not null,
	from_date date,
	to_date date,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees (emp_no)
)
;
-- Create Titles Table
create table titles (
	emp_no int not null,
	title varchar(50),
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
)
;
-- Create Salaries Table
create table salaries (
	emp_no int not null,
	salary int not null,
	from_date date,
	to_date date,
	foreign key (emp_no) references employees (emp_no)
)
;