-- SCHEMA: public
-- DROP SCHEMA public ;
-- CREATE SCHEMA public
-- AUTHORIZATION postgres;
-- COMMENT ON SCHEMA public
-- IS 'standard public schema';
-- GRANT ALL ON SCHEMA public TO PUBLIC;
-- GRANT ALL ON SCHEMA public TO postgres;
--
-- Create tables, drop if table exists (load procedure follows)
DROP TABLE if EXISTS employees;
DROP TABLE if EXISTS dept_emp;
DROP TABLE if EXISTS salaries;
DROP TABLE if EXISTS titles;
DROP TABLE if EXISTS departments;
DROP TABLE if EXISTS dept_manager;
-- Define tables, dept_emp and dept_manager are composite (all columns) 
CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NULL,
	birth_date VARCHAR(10) NULL,
	first_name VARCHAR(30) NULL,
	last_name VARCHAR(30) NULL,
	sex VARCHAR(1) NULL,
	hire_date VARCHAR(10) NULL,
	PRIMARY KEY (emp_no)
	);
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NULL,
	primary key (emp_no)
	);
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NULL,
	primary key (title_id)
	);
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NULL,
	primary key(dept_no)
	);
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	primary key(emp_no, dept_no)
	);
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	primary key(dept_no, emp_no)
	);
-- Load CSV data (note: "read" permission must be given to PostgreSQL-Server for CSV file access)
COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\employees.csv'
	DELIMITER ',' CSV HEADER;
COPY salaries(emp_no, salary)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\salaries.csv'
	DELIMITER ',' CSV HEADER;
COPY titles(title_id, title)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\titles.csv'
	DELIMITER ',' CSV HEADER;
COPY departments(dept_no, dept_name)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\departments.csv'
	DELIMITER ',' CSV HEADER;
COPY dept_emp(emp_no, dept_no)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\dept_emp.csv'
	DELIMITER ',' CSV HEADER;
COPY dept_manager(dept_no, emp_no)
	FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\dept_manager.csv'
	DELIMITER ',' CSV HEADER;
-- Write Reports to CSV files within \output folder (note: "write" permission must be given to PostgreSQL-Server for CSV write access)
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Copy (
SELECT employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", employees.sex, salaries.salary
	FROM employees INNER JOIN
		titles ON employees.emp_title_id = titles.title_id INNER JOIN
		salaries ON employees.emp_no = salaries.emp_no
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report1.csv'
	DELIMITER ',' CSV HEADER;
-- 2. List first name, last name, and hire date for employees who were hired in 1986.					 
Copy (
SELECT employees.first_name AS "first name", employees.last_name AS "last name", employees.hire_date
	FROM employees
		WHERE (hire_date LIKE '%1986')
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report2.csv'
	DELIMITER ',' CSV HEADER;
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Copy (
SELECT departments.dept_no AS "department number", departments.dept_name AS "department name", employees.emp_no AS "manager employee number", employees.last_name AS "manager last name", employees.first_name AS "manager first name"
	FROM employees INNER JOIN
    	departments INNER JOIN
        dept_manager ON departments.dept_no = dept_manager.dept_no ON employees.emp_no = dept_manager.emp_no
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report3.csv'
	DELIMITER ',' CSV HEADER;
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Copy (
SELECT employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "department name"
	FROM departments INNER JOIN
		employees INNER JOIN
		dept_emp ON employees.emp_no = dept_emp.emp_no ON departments.dept_no = dept_emp.dept_no
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report4.csv'
	DELIMITER ',' CSV HEADER;
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Copy (
SELECT first_name AS "first name", last_name AS "last name", sex
	FROM employees
		WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%')
		) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report5.csv'
	DELIMITER ',' CSV HEADER;
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Copy (
SELECT employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "dapartment name"
	FROM employees INNER JOIN
       	dept_emp ON employees.emp_no = dept_emp.emp_no INNER JOIN
		departments ON dept_emp.dept_no = departments.dept_no
			WHERE ( departments.dept_name = N'Sales')
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report6.csv'
	DELIMITER ',' CSV HEADER;
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Copy (
	SELECT employees.emp_no AS "employee number", employees.last_name AS "last name", employees.first_name AS "first name", departments.dept_name AS "dapartment name"
	FROM employees INNER JOIN
      	dept_emp ON employees.emp_no = dept_emp.emp_no INNER JOIN
		departments ON dept_emp.dept_no = departments.dept_no
			WHERE (departments.dept_name = N'Sales') OR (departments.dept_name = N'Development')
	) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report7.csv'
	DELIMITER ',' CSV HEADER;
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.	
Copy (
	SELECT last_name AS "last names", COUNT(last_name) AS count
	FROM employees
		GROUP BY last_name
		ORDER BY count DESC
		) TO 'C:\Users\coffm\GitHub\sql-challenge\output\Report8.csv'
	DELIMITER ',' CSV HEADER;