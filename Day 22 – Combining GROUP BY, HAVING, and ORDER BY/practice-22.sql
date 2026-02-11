-- Show departments with total salary greater than 10000
-- Sort by total salary from highest to lowest
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 10000
ORDER BY total_salary DESC;

-- Show departments with more than 2 employees
-- Sort by number of employees from highest to lowest
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY total_employees DESC;

-- Show departments with average salary greater than 5000
-- Sort by average salary from highest to lowest
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 5000
ORDER BY average_salary DESC;

-- Show departments where minimum salary is greater than 3000
-- Sort alphabetically by department name
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department
HAVING MIN(salary) > 3000
ORDER BY department ASC;

-- Show departments where maximum salary is less than 15000
-- Sort by maximum salary from lowest to highest
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) < 15000
ORDER BY max_salary ASC;

-- Show departments with total salary between 8000 and 20000
-- Sort by total salary from lowest to highest
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) BETWEEN 8000 AND 20000
ORDER BY total_salary ASC;
