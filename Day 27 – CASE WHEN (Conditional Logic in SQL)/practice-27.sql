-- Create credit categories
SELECT customerName,
       creditLimit,
       CASE
           WHEN creditLimit > 100000 THEN 'High'
           WHEN creditLimit BETWEEN 50000 AND 100000 THEN 'Medium'
           ELSE 'Low'
       END AS credit_category
FROM customers;


-- Show employees and classify their job titles
SELECT firstName,
       jobTitle,
       CASE
           WHEN jobTitle LIKE '%Manager%' THEN 'Management'
           WHEN jobTitle LIKE '%Sales%' THEN 'Sales'
           ELSE 'Other'
       END AS job_category
FROM employees;


-- Count customers by credit category
SELECT
    CASE
        WHEN creditLimit > 100000 THEN 'High'
        WHEN creditLimit BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'Low'
    END AS credit_category,
    COUNT(*) AS total_customers
FROM customers
GROUP BY credit_category;


-- Conditional SUM example
-- Count customers with credit limit above 100000
SELECT
    SUM(CASE
            WHEN creditLimit > 100000 THEN 1
            ELSE 0
        END) AS high_credit_customers
FROM customers;


-- Show total customers per employee using conditional COUNT
SELECT
    e.firstName,
    COUNT(c.customerNumber) AS total_customers,
    SUM(CASE
            WHEN c.creditLimit > 100000 THEN 1
            ELSE 0
        END) AS high_credit_customers
FROM employees e
LEFT JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY e.employeeNumber;


--Combine CASE + GROUP BY + ORDER BY
SELECT
    country,
    CASE
        WHEN creditLimit > 100000 THEN 'High'
        ELSE 'Normal'
    END AS credit_level,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country