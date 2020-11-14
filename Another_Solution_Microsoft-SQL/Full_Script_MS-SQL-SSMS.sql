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
-- Write Reports to CSV files within \output folder (note: "write" permission must be given to PostgreSQL-Server for CSV write access)
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT        dbo.employees.emp_no AS [employee number], dbo.employees.last_name AS [last name], dbo.employees.first_name AS [first name], dbo.employees.sex, dbo.salaries.salary
FROM            dbo.employees INNER JOIN
                         dbo.titles ON dbo.employees.emp_title_id = dbo.titles.title_id INNER JOIN
                         dbo.salaries ON dbo.employees.emp_no = dbo.salaries.emp_no
-- 2. List first name, last name, and hire date for employees who were hired in 1986.					 
SELECT        dbo.employees.emp_no AS [employee number], dbo.employees.last_name AS [last name], dbo.employees.first_name AS [first name], dbo.employees.sex, dbo.salaries.salary
FROM            dbo.employees INNER JOIN
                         dbo.titles ON dbo.employees.emp_title_id = dbo.titles.title_id INNER JOIN
                         dbo.salaries ON dbo.employees.emp_no = dbo.salaries.emp_no
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT        dbo.departments.dept_no AS [department number], dbo.departments.dept_name AS [department name], dbo.employees.emp_no AS [manager's employee number], dbo.employees.last_name AS [manager's last name], 
                         dbo.employees.first_name AS [manager's first name]
FROM            dbo.employees INNER JOIN
                         dbo.departments INNER JOIN
                         dbo.dept_manager ON dbo.departments.dept_no = dbo.dept_manager.dept_no ON dbo.employees.emp_no = dbo.dept_manager.emp_no
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT        dbo.employees.emp_no AS [employee number], dbo.employees.last_name AS [last name], dbo.employees.first_name AS [first name], dbo.departments.dept_name AS [department name]
FROM            dbo.departments INNER JOIN
                         dbo.employees INNER JOIN
                         dbo.dept_emp ON dbo.employees.emp_no = dbo.dept_emp.emp_no ON dbo.departments.dept_no = dbo.dept_emp.dept_no
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT        first_name AS [first name], last_name AS [last name], sex
FROM            dbo.employees
WHERE        (first_name = 'Hercules') AND (last_name LIKE 'B%')

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT        dbo.employees.emp_no AS [employee number], dbo.employees.last_name AS [last name], dbo.employees.first_name AS [first name], dbo.departments.dept_name AS [dapartment name]
FROM            dbo.employees INNER JOIN
                         dbo.dept_emp ON dbo.employees.emp_no = dbo.dept_emp.emp_no INNER JOIN
                         dbo.departments ON dbo.dept_emp.dept_no = dbo.departments.dept_no
WHERE        (dbo.departments.dept_name = N'Sales')
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT        dbo.employees.emp_no AS [employee number], dbo.employees.last_name AS [last name], dbo.employees.first_name AS [first name], dbo.departments.dept_name AS [dapartment name]
FROM            dbo.employees INNER JOIN
                         dbo.dept_emp ON dbo.employees.emp_no = dbo.dept_emp.emp_no INNER JOIN
                         dbo.departments ON dbo.dept_emp.dept_no = dbo.departments.dept_no
WHERE        (dbo.departments.dept_name = N'Sales') OR
                         (dbo.departments.dept_name = N'Development')
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.	
SELECT        TOP (100) PERCENT last_name AS [last names], COUNT(last_name) AS count
FROM            dbo.employees
GROUP BY last_name
ORDER BY count DESC

