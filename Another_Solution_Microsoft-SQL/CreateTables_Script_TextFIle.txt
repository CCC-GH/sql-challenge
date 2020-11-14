-- Create tables, drop if table exists (load procedure follows)
DROP TABLE if EXISTS dept_emp;
DROP TABLE if EXISTS salaries;
DROP TABLE if EXISTS dept_manager;
DROP TABLE if EXISTS employees;
DROP TABLE if EXISTS departments;
DROP TABLE if EXISTS titles;
-- Define tables, dept_emp and dept_manager are composite (all columns) 
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NULL,
	primary key(title_id)
	);
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NULL,
	primary key(dept_no)
	);
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) FOREIGN KEY REFERENCES titles(title_id) NOT NULL,
	birth_date VARCHAR(10) NULL,
	first_name VARCHAR(30) NULL,
	last_name VARCHAR(30) NULL,
	sex VARCHAR(1) NULL,
	hire_date VARCHAR(10) NULL,
	PRIMARY KEY(emp_no)
	);
CREATE TABLE salaries(
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no) NOT NULL,
	salary INT NULL,
	primary key(emp_no)
	);
CREATE TABLE dept_emp(
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no) NOT NULL,
	dept_no VARCHAR(4) FOREIGN KEY REFERENCES departments(dept_no) NOT NULL,
	primary key(emp_no, dept_no)
	);
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) FOREIGN KEY REFERENCES departments(dept_no) NOT NULL,
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no) NOT NULL,
	primary KEY(dept_no, emp_no)
	);