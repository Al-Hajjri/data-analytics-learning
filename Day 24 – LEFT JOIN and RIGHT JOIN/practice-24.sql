-- Show all customers and their sales representatives (LEFT JOIN)
SELECT customers.customerName,
       employees.firstName,
       employees.lastName
FROM customers
LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- Show customers who do NOT have a sales representative
SELECT customers.customerName
FROM customers
LEFT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE employees.employeeNumber IS NULL;

-- Show all employees and their customers (RIGHT JOIN)
SELECT customers.customerName,
       employees.firstName,
       employees.lastName
FROM customers
RIGHT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- Show employees who do NOT manage any customers
SELECT employees.firstName,
       employees.lastName
FROM customers
RIGHT JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE customers.customerNumber IS NULL;

-- Count how many customers each employee manages (LEFT JOIN + GROUP BY)
SELECT employees.firstName,
       employees.lastName,
       COUNT(customers.customerNumber) AS total_customers
FROM employees
LEFT JOIN customers
ON customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY employees.employeeNumber;