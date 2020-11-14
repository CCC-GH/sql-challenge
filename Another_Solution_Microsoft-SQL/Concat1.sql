
Alter [dbo].[dept_emp] ADD [key] varchar(50)

Update [dbo].[dept_emp] SET [key] = [emp_no] + '-' + [dept_no]
