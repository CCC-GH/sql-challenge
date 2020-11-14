## 09-SQL (Structured Query Language) Homework![](/HW/Instructions/sql2.png)
## SQL-Challenge with PostgreSQL ![](/postgres.jpg)
 * **Data Modeling** - two Entity Relationship Diagram (ERD) diagrams available:
     * "ERD_Quickdatabasediagrams" from the following website: (http://www.quickdatabasediagrams.com).
     * "ERD_MS-SSMS" from SQL Server Management Studio's "Database Diagrams" utility (generated from actual Table schema design).
 * **Data Engineering** - within "Full_Script_pgAdin4" script, top section of full script creates database Tables/schema, keys, and loads 6 csv files.
 * **Data Analysis** - within "Full_Script_pgAdin4" script, bottom section queries and outputs to CSV ("output" folder).
 * **Input CSV data** - "EmployeeSQL" folder (6 of them - listing below).
 * **Output CSV data** - data analysis "output" folder, file name "Report[1-8]" (8 CSV lists).
 * **Assignment material** - located within "HW" folder.

    > In addition, a Microsoft SQL-SSMS approach/solution is available within "MS-SQL-SSMS_Approach folder" ![](/MS-SQL-SSMS_Approach/ssms.PNG)
--------------------------
#### Data Analysis;  Report[1-8].csv  *(stored in "output" folder)*
  
> (https://github.com/CCC_GH/sql-challenge/tree/main/output)

1. List the following details of each employee: employee number, last name, first name, gender, and salary.
2. List employees who were hired in 1986.
3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
5. List all employees whose first name is "Hercules" and last names begin with "B."
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
<!--
#### Bonus (Optional)
As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:
   ```sql
   from sqlalchemy import create_engine
   engine = create_engine('postgresql://localhost:5432/<your_db_name>')
   connection = engine.connect()
   ```
* Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.
* If using a password, do not upload your password to your GitHub repository. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://martin-thoma.com/configuration-files-in-python/](https://martin-thoma.com/configuration-files-in-python/) for more information.

2. Create a histogram to visualize the most common salary ranges for employees.
3. Create a bar chart of average salary by title.
-->
