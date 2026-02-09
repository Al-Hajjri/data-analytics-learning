-- Show departments with total salary greater than 10000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 10000;

-- Show departments with more than 2 employees
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- Show departments with average salary greater than 5000
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 5000;

-- Show departments where the minimum salary is greater than 3000
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department
HAVING MIN(salary) > 3000;

-- Show departments where the maximum salary is less than 15000
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) < 15000;

-- Show departments with total salary between 8000 and 20000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) BETWEEN 8000 AND 20000;

-- Show departments that have exactly 3 employees
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) = 3;
