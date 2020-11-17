# Import connection config
import dbConfig as dbcf

# Setup connection
from sqlalchemy import create_engine
engine = create_engine(f"postgresql+psycopg2://{dbcf.username}:{dbcf.password}@{dbcf.localhost}/{dbcf.dbname}")
connection = engine.connect()

# SQL database into Pandas
import pandas as pd
from matplotlib import pyplot
import numpy as np

# Create a histogram to visualize the most common salary ranges for employees.

# Import into Pandas and define/store query
salaryData = pd.read_sql("SELECT * FROM salaries", connection)

# Plot Historgram
pyplot.hist(salaryData['salary'],label="Salary")
pyplot.axvline(salaryData['salary'].mean(), color='r', label="Mean Salary (USD)")
pyplot.xlabel("Salary (USD)")
pyplot.ylabel("#Employees")
pyplot.legend() 
pyplot.title("Common Employee Salary Ranges")
pyplot.savefig(".\output\Bonus_CommonSalaryRanges.png")

# Create a bar chart of average salary by title.

# Import and define/group/store query
query = pd.read_sql("SELECT employees.emp_no, titles.title, salaries.salary FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no INNER JOIN titles ON employees.emp_title_id = titles.title_id", connection)
avgSalaryTitle = query.groupby(["title"]).mean()["salary"]

# Plot Barchart
title_list = avgSalaryTitle.index
avgSalaryTitle  = avgSalaryTitle.values
xAxis = np.arange(len(title_list))
tickLocs = [value for value in xAxis]
pyplot.xticks(tickLocs, title_list, rotation=90)
pyplot.title("Average Salary (USD) By Title")
pyplot.xlabel("Title")
pyplot.ylabel("Avg Salary (USD)")
pyplot.grid(axis="y")
pyplot.bar(xAxis, avgSalaryTitle , color="g", alpha=0.5, align="center")
pyplot.savefig(".\output\Bonus_AvgSalaryByTitle.png")

