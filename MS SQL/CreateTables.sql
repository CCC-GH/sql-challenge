DROP TABLE [dbo].[employees2];
DROP TABLE [dbo].[dept_emp2];
DROP TABLE [dbo].[salaries2];
DROP TABLE [dbo].[titles2];
DROP TABLE [dbo].[departments2];
DROP TABLE [dbo].[dept_manager2];
CREATE TABLE [dbo].[employees2](
	[emp_no][int] NOT NULL,
	[emp_title_id] [varchar](5) NULL,
	[birth_date] [varchar](10) NULL,
	[first_name] [varchar](30) NULL,
	[last_name] [varchar](30) NULL,
	[sex] [varchar](1) NULL,
	[hire_date] [varchar](10) NULL,
	);
CREATE TABLE [dbo].[dept_emp2](
	[key] [varchar](24) NOT NULL,
	[emp_no] [int] NULL,
	[dept_no] [varchar](4) NULL
	);
CREATE TABLE [dbo].[salaries2](
	[emp_no] [int] NOT NULL,
	[salary] [Int] NULL
	);
CREATE TABLE [dbo].[titles2](
	[title_id] [varchar](4) NOT NULL,
	[title] [nvarchar](30) NULL
	);
CREATE TABLE [dbo].[departments2](
	[key] [varchar](34) NOT NULL,
	[dept_no] [varchar](4) NULL,
	[dept_name] [varchar](30) NULL
	);
CREATE TABLE [dbo].[dept_manager2](
	[key] [varchar](50) NOT NULL,
	[dept_no] [varchar](30) NULL,
	[emp_no] [int] NULL
	);