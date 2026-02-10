-- Show all employees sorted by salary from lowest to highest
SELECT name, salary
FROM employees
ORDER BY salary ASC;

-- Show all employees sorted by salary from highest to lowest
SELECT name, salary
FROM employees
ORDER BY salary DESC;

-- Show employees sorted alphabetically by name
SELECT name, department
FROM employees
ORDER BY name ASC;

-- Show employees sorted by department (A-Z)
SELECT name, department
FROM employees
ORDER BY department ASC;

-- Show employees sorted by department, then by salary (highest first)
SELECT name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;

-- Show departments sorted by total salary (highest first)
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- Show departments sorted by number of employees (highest first)
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC;

-- Show employees sorted by hire_date from newest to oldest
SELECT name, hire_date
FROM employees
ORDER BY hire_date DESC;
