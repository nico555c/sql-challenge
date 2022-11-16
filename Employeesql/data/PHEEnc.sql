create table employees (
	emp_no serial primary key,
	emp_title varchar(45),
	birth_date date,
	first_name varchar(45),
	last_name varchar(45),
	sex varchar(45),
	hire_date date
);

create table departments (
	dept_no varchar(45) primary key,
	dept_name varchar(45)
);

create table titles (
	title_id varchar(45) primary key,
	title varchar(45)
);

create table salaries (
	emp_no serial primary key,
	salary integer,
	foreign key (emp_no) references employees(emp_no)
);

create table dept_manager (
	dept_no varchar(45),
	emp_no serial,
	primary key (dept_no, emp_no)
--	foreign key emp_no references employees(emp_no),
--	foreign key dept_no references departments(dept_no)
);

create table dept_emp (
	emp_no serial,
	dept_no varchar(45),
	primary key (dept_no, emp_no)
);

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on
e.emp_no =s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select * from employees
where extract (Year from (hire_date))=1986

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
inner join dept_manager as m on
d.dept_no=m.dept_no
inner join employees as e on
m.emp_no=e.emp_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name--, de.dept_no
from employees as e
inner join dept_emp as de on
e.emp_no=de.emp_no
inner join departments as d on 
d.dept_no=de.dept_no

-- 5. List first name, last name, and sex for employees whose first name is
--"Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules'  and last_name like 'B%'

--6. List all employees in the Sales department, d007
--including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name--, de.dept_no
from employees as e
inner join dept_emp as de on
e.emp_no=de.emp_no
inner join departments as d on 
d.dept_no=de.dept_no
where d.dept_no ='d007'

--7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name--, de.dept_no
from employees as e
inner join dept_emp as de on
e.emp_no=de.emp_no
inner join departments as d on 
d.dept_no=de.dept_no
where d.dept_name ='Sales' or d.dept_name = 'Development'

--8. List the frequency count of employee last names 
--(i.e., how many employees share each last name) in descending order.

select last_name, count (last_name) as "Nr of EEs"
from employees
group by last_name 
order by "Nr of EEs" desc
