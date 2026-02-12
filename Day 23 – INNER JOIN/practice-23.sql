-- 1. Show all customers with their sales representative names
SELECT 
    customers.customerName,
    employees.firstName,
    employees.lastName
FROM customers
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;


-- 2. Show customer name and employee job title
SELECT 
    customers.customerName,
    employees.jobTitle
FROM customers
INNER JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;


-- 3. Show employee full name and the customers they handle
SELECT 
    employees.firstName,
    employees.lastName,
    customers.customerName
FROM employees
INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber;


-- 4. Count how many customers each employee handles
SELECT 
    employees.firstName,
    employees.lastName,
    COUNT(customers.customerNumber) AS total_customers
FROM employees
INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber, employees.firstName, employees.lastName;


-- 5. Show employees who handle more than 1 customer
SELECT 
    employees.firstName,
    employees.lastName,
    COUNT(customers.customerNumber) AS total_customers
FROM employees
INNER JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY employees.employeeNumber, employees.firstName, employees.lastName
HAVING COUNT(customers.customerNumber) > 1;
