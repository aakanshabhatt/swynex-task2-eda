Create table Employees(
 Employee_ID TEXT,
 First_Name TEXT,
 Last_Name  TEXT,
 Age  INTEGER,
 Department TEXT,
 Region  TEXT,
 Status TEXT,
 Salary NUMERIC(12,2),
 Email TEXT,
 Performance_Score TEXT,
 Remote_Work BOOLEAN,
 Join_Date DATE,
 phone TEXT
);
SELECT* FROM Employees;
--Q1.How many employees are present in the dataset?
SELECT COUNT(*) AS total_employees
FROM Employees;
--Q2.Are there any duplicate emoployee IDs?
Select Employee_id,
count(*) as occurences
from Employees
group by Employee_id
having count(*)>1;
--Q3.How many employee belong to each department?
SELECT Department , count(*) as employee_count
from employees
group by Department
order by employee_count desc;
--Q4.What is the average salary across all employees?
Select Avg(salary) as avg_salary
from employees;
--Q5.What are the minimum and maximum salaries among employees?
select min(salary) as min_salary , max(salary) as max_salary
from employees;
--Q6.Are there any missing salary values?
Select count(*)
from employees
where salary IS NULL;
--Q7. How many employees have missing age values?
Select count(*)
from employees
where  age IS NULL;
--Q8. How many employees have missing phone numbers?
Select count(*)
from employees
where  phone IS NULL;
--Q9.What is the employee count for each employment status (Active, Inactive, Pending)?
select status , count(*) as employee_count
from Employees
group by status
ORDER BY employee_count DESC;
--Q10. Which department has the highest avg salary?
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;
--Q11. How many employees work remotely and how many do not?
SELECT remote_work, count(*) as employee_count
from employees
group by remote_work;
--Q12.Distribution of employee performance score
select performance_score,count(*) as employee_count
from employees
group by performance_score;
--Q13. age analysis
select min(age),max(age),avg(age)
from employees;
--Q14. salary comparison by department
select round(avg(salary),2)as avg_salary, department,count(salary) as employee_w_salary
from employees
group by department
order by avg_salary desc
limit 1;
--Q15. Join date analysis
select extract(year from join_date) as year_joined , count(*) as employees_joined
from employees
group by year_joined
order by year_joined asc;