-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT E.emp_no, last_name, first_name, sex, salary
FROM employees AS E
INNER JOIN salaries AS S ON E.emp_no = S.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, 
-- last name, and first name.
SELECT D.dept_no, D.name, E.emp_no, last_name, first_name
FROM employees AS E
INNER JOIN dept_manager AS DM ON E.emp_no = DM.emp_no
INNER JOIN departments AS D ON DM.dept_no = D.dept_no;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT D.dept_no, E.emp_no, last_name, first_name, D.name
FROM employees AS E
INNER JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
INNER JOIN departments AS D ON DE.dept_no = D.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT E.emp_no, last_name, first_name
FROM employees AS E 
INNER JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
INNER JOIN departments AS D ON DE.dept_no = D.dept_no
WHERE D.name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
SELECT E.emp_no, last_name, first_name, D.name
FROM employees AS E 
INNER JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
INNER JOIN departments AS D ON DE.dept_no = D.dept_no
WHERE D.name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the 
-- employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;