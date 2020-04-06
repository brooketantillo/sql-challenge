-- Data Analysis
--
-- 1. List the following details of each employee: Employee number, last name, first name, gender, and salary

create view employee_number_name_gender_salary as
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.gender,
	sal.salary
from employees as emp
join salaries as sal on emp.emp_no=sal.emp_no
;
select * 
from employee_number_name_gender_salary
;

-- 2. List employees who were hired in 1986
create view employees_hired_1986 as 
select emp_no,
	last_name,
	first_name,
	hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
;
select *
from employees_hired_1986
;

-- 3. List the manager of each department with the following information: 
	-- Department number 
	-- Department name *departments*
	-- Manager's employee number
	-- Last name 
	-- First name 
	-- Start employment dates
	-- End employment dates
create view manager_department_info as 	
select dept_mgr.dept_no,
	dept.dept_name,
	dept_mgr.emp_no,
	emp.last_name,
	emp.first_name,
	dept_mgr.from_date,
	dept_mgr.to_date	
from dept_manager as dept_mgr
join employees as emp on dept_mgr.emp_no = emp.emp_no
join departments as dept on dept_mgr.dept_no = dept.dept_no 
;
select
*
from manager_department_info
;
-- 4. List the department of each employee with the following information: 
	-- Employee number
	-- Last name
	-- First name
	-- Department name
create view employee_department_info as
select emp.emp_no,
	emp.first_name,
	emp.last_name,
	departments.dept_name
from employees as emp
join dept_emp on dept_emp.emp_no=emp.emp_no
join departments on dept_emp.emp_no=emp.emp_no
order by emp.last_name 
;
select
*
from employee_department_info
;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select
*
from employees
where first_name = 'Hercules'
and last_name like 'B%'
;

-- 6. List all employees in the Sales department including their:
	-- Employee number
	-- Last name
	-- First name
	-- Department name
create view sales_emp as
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	departments.dept_name
from employees as emp
join dept_emp on dept_emp.emp_no=emp.emp_no
join departments on dept_emp.emp_no=emp.emp_no
where departments.dept_name = 'Sales'
order by emp.last_name 
;
select
*
from sales_emp
;
-- 7. List all employees in the Sales and Development departments including their:
	-- Employee number
	-- Last name
	-- First name
	-- Department name.
create view sales_develop_emp as
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	departments.dept_name
from employees as emp
join dept_emp on dept_emp.emp_no=emp.emp_no
join departments on dept_emp.emp_no=emp.emp_no
where departments.dept_name in ('Sales','Development')
order by emp.last_name 
;
select
*
from sales_develop_emp
;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
last_name,
count(last_name)
from employees
group by last_name
order by last_name desc
;