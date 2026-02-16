-- Single-Value Subquery (=)
-- Show customer(s) with the highest credit limit

SELECT customerName, creditLimit
FROM customers
WHERE creditLimit = (
    SELECT MAX(creditLimit)
    FROM customers
);

-- IN (Multiple Values)
-- Show customers handled by employees from office '1'

SELECT customerName, salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IN (
    SELECT employeeNumber
    FROM employees
    WHERE officeCode = '1'
);

-- EXISTS
-- Show employees who manage at least one customer

SELECT employeeNumber, firstName, lastName
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.salesRepEmployeeNumber = e.employeeNumber
);

-- NOT IN
-- Show employees who are NOT assigned to office '1'

SELECT employeeNumber, firstName, officeCode
FROM employees
WHERE employeeNumber NOT IN (
    SELECT employeeNumber
    FROM employees
    WHERE officeCode = '1'
);

-- NOT EXISTS
-- Show employees who do NOT manage any customers

SELECT employeeNumber, firstName, lastName
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM customers c
    WHERE c.salesRepEmployeeNumber = e.employeeNumber
);

-- Correlated Subquery
-- Show customers whose credit limit is above the average credit limit

SELECT customerName, creditLimit
FROM customers c1
WHERE creditLimit > (
    SELECT AVG(creditLimit)
    FROM customers c2
    WHERE c1.country = c2.country
);

-- Subquery with COUNT
-- Show employees who manage more than 1 customer

SELECT employeeNumber, firstName, lastName
FROM employees e
WHERE (
    SELECT COUNT(*)
    FROM customers c
    WHERE c.salesRepEmployeeNumber = e.employeeNumber
) > 1;