## 09-SQL (Structured Query Language) Homework![](/HW/Instructions/sql2.png)
## SQL-Challenge with PostgreSQL ![](/postgresImage.jpg)
 * **Data Modeling** - two Entity Relationship Diagram (ERD) diagrams available:
     * [ERD_Quickdatabasediagrams](ERD_Quickdatabasediagrams.PNG) from the following website: (http://www.quickdatabasediagrams.com).
     * [ERD_MS-SSMS](ERD_MS-SSMS.PNG) from SQL Server Management Studio's "Database Diagrams" utility (generated from actual Table schema design).
 * **Data Engineering** - run/view **Full_Script_pgAdin4** script, top section of full script creates database Tables/schema, keys, and loads 6 CSV files.
 * **Data Analysis** - run/view **Full_Script_pgAdin4** script, bottom section queries with code to output to CSV ([output](/output) folder).
 * **Input CSV data** - located within [EmployeeSQL](/EmployeeSQL) folder (Qty-6) *Note: PostgreSQL server requires "read" access to this folder/files*
 * **Output CSV data** - within data analysis [output](/output) folder, file names "Report[1-8]" *Note: PostgreSQL server requires "write" access to this folder/files*
 * **Bonus Accomplished** - run/view **Bonus_spyder.py** script with its two Bonus reports outputed to [output](/output) folder
 * **Assignment material** - located within [HW](/HW) folder.

    > In addition, a Microsoft SQL-SSMS approach/solution is available within "MS-SQL-SSMS_Approach folder" ![](/MS-SQL-SSMS_Approach/ssms.PNG)
--------------------------
#### Data Analysis;  Report[1-8].csv
  
> [output](/output) folder (note: a couple reports too large for display within github, Excel a good option)

1. [List the following details of each employee: employee number, last name, first name, gender, and salary.](/output/Report1.csv)
2. [List employees who were hired in 1986.](/output/Report2.csv)
3. [List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.](/output/Report3.csv)
4. [List the department of each employee with the following information: employee number, last name, first name, and department name.](/output/Report4.csv)
5. [List all employees whose first name is "Hercules" and last names begin with "B."](/output/Report5.csv)
6. [List all employees in the Sales department, including their employee number, last name, first name, and department name.](/output/Report6.csv)
7. [List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.](/output/Report7.csv)
8. [In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.](/output/Report8.csv)

#### Bonus (Optional) - Completed
1. Import the SQL database into Pandas: **Bonus_spyder.py**
2. Create a histogram to visualize the most common salary ranges for employees: [Bonus_CommonSalaryRanges.png](/output/Bonus_CommonSalaryRanges.png)
3. Create a bar chart of average salary by title: [Bonus_AvgSalaryByTitle.png](/output/Bonus_AvgSalaryByTitle.png)
