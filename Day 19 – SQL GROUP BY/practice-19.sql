-- Count employees per department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Calculate total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees  
GROUP BY department;

-- Calculate average salary per department
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Get minimum salary per department
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- Get maximum salary per department
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;