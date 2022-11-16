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