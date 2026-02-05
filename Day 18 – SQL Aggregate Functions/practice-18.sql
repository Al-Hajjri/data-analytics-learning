-- Get the smallest age
SELECT MIN(age) AS min_age
FROM users;

-- Get the largest age
SELECT MAX(age) AS max_age
FROM users;

-- Count total number of users
SELECT COUNT(*) AS total_users
FROM users;

-- Calculate total salary
SELECT SUM(salary) AS total_salary
FROM employees;

-- Calculate average age
SELECT AVG(age) AS average_age
FROM users;