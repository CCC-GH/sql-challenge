-- SCHEMA: public
-- DROP SCHEMA public ;
--CREATE SCHEMA public
--    AUTHORIZATION postgres;
--COMMENT ON SCHEMA public
--    IS 'standard public schema';
--GRANT ALL ON SCHEMA public TO PUBLIC;
--GRANT ALL ON SCHEMA public TO postgres;
--
-- Create tables, drop if table exists (load procedure follows)
DROP TABLE if EXISTS employees;
DROP TABLE if EXISTS dept_emp;
DROP TABLE if EXISTS salaries;
DROP TABLE if EXISTS titles;
DROP TABLE if EXISTS departments;
DROP TABLE if EXISTS dept_manager;
CREATE TABLE employees(
	 emp_no INT NOT NULL,
	 emp_title_id VARCHAR(5) NULL,
	 birth_date VARCHAR(10) NULL,
	 first_name VARCHAR(30) NULL,
	 last_name VARCHAR(30) NULL,
	 sex VARCHAR(1) NULL,
	 hire_date VARCHAR(10) NULL
	);
CREATE TABLE dept_emp(
	 key VARCHAR(24) NOT NULL,
	 emp_no INT NULL,
	 dept_no VARCHAR(4) NULL
	);
CREATE TABLE salaries(
	 emp_no INT NOT NULL,
	 salary INT NULL
	);
CREATE TABLE titles(
	 title_id VARCHAR(4) NOT NULL,
	 title VARCHAR(30) NULL
	);
CREATE TABLE departments(
	 key VARCHAR(34) NOT NULL,
	 dept_no VARCHAR(4) NULL,
	 dept_name VARCHAR(30) NULL
	);
CREATE TABLE dept_manager(
	 key VARCHAR(50) NOT NULL,
	 dept_no VARCHAR(30) NULL,
	 emp_no INT NULL
	);
--
-- Load CSV data
COPY public.employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\coffm\GitHub\sql-challenge\EmployeeSQL\employees.csv'
DELIMITER ','
CSV HEADER;

copy public.employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) 
FROM 'C:/Users/coffm/OneDrive/DADSDO~1/DOCUME~1/GitHub/SQL-CH~1/EMPLOY~1/EMPLOY~1.CSV' CSV HEADER QUOTE '\"' ESCAPE '''';""


