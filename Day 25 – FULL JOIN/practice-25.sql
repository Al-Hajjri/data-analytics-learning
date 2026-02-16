
-- Show all customers and employees (FULL JOIN)
SELECT customers.customerName,
       employees.firstName,
       employees.lastName
FROM customers
FULL JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- Show records that exist only in customers
SELECT customers.customerName,
       employees.employeeNumber
FROM customers
FULL JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE employees.employeeNumber IS NULL;

-- Show records that exist only in employees
SELECT customers.customerNumber,
       employees.firstName,
       employees.lastName
FROM customers
FULL JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE customers.customerNumber IS NULL;

-- Count total relationships (FULL JOIN + GROUP BY)
SELECT employees.employeeNumber,
       COUNT(customers.customerNumber) AS total_customers
FROM customers
FULL JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
GROUP BY employees.employeeNumber;

-- Show all unique customer and employee combinations sorted
SELECT customers.customerName,
       employees.firstName
FROM customers
FULL JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
ORDER BY customers.customerName;
