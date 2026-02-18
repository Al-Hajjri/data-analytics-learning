
-- Show total credit limit for all customers
SELECT
    customerName,
    creditLimit,
    SUM(creditLimit) OVER() AS total_credit
FROM customers;


-- Show total credit per country
SELECT
    customerName,
    country,
    creditLimit,
    SUM(creditLimit) OVER(PARTITION BY country) AS total_per_country
FROM customers;


-- Rank customers by credit limit
SELECT
    customerName,
    creditLimit,
    ROW_NUMBER() OVER(ORDER BY creditLimit DESC) AS row_number_rank
FROM customers;


-- Rank customers with RANK()
SELECT
    customerName,
    creditLimit,
    RANK() OVER(ORDER BY creditLimit DESC) AS ranking
FROM customers;


-- Running total of credit limit
SELECT
    customerName,
    creditLimit,
    SUM(creditLimit) OVER(
        ORDER BY customerNumber
    ) AS running_total
FROM customers;


-- Ranking per country
SELECT
    customerName,
    country,
    creditLimit,
    RANK() OVER(
        PARTITION BY country
        ORDER BY creditLimit DESC
    ) AS rank_in_country
FROM customers;


-- Count customers per country using window function
SELECT
    customerName,
    country,
    COUNT(*) OVER(PARTITION BY country) AS total_customers_in_country
FROM customers;
