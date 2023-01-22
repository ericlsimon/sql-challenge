--Q1) List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, last_name, first_name, sex, s.salary
FROM employees e 
LEFT JOIN salaries s on e.emp_no = s.emp_no
--Q2) List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name, last_name, hire_date
FROM employees 
WHERE date_part('year', hire_date) = 1986
-- Q3) Manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT de.dept_no, d.dept_name, e.first_name, e.last_name, e.emp_no
FROM employees e 
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on de.dept_no = d.dept_no
WHERE emp_title_id = 'm0001'
--Q4) department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dept_no, e.emp_no, d.dept_name, e.first_name, e.last_name, d.dept_name 
FROM employees e 
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on de.dept_no = d.dept_no
--Q5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begin letter B
SELECT e.first_name, e.last_name, e.sex
FROM employees e 
WHERE first_name = ('Hercules')
AND last_name LIKE ('B%')
--Q6) List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, d.dept_name, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_manager dm on e.emp_no = dm.emp_no
LEFT JOIN departments d on dm.dept_no = d.dept_no
WHERE d.dept_name = ('Sales')
--Q7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, d.dept_name, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_manager dm on e.emp_no = dm.emp_no
LEFT JOIN departments d on dm.dept_no = d.dept_no
WHERE d.dept_name = ('Sales') or d.dept_name = ('Development')
--Q8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT  last_name,COUNT(*) as totals
FROM employees
GROUP BY 1