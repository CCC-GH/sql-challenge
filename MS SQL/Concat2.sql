
Alter [dbo].[dept_manager] ADD [key] varchar(50)

Update [dbo].[dept_manager] SET [key] = [dept_no] + '-' + cast(emp_no as varchar)