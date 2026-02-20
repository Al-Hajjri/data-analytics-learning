-- Show previous credit limit
SELECT
    customerName,
    creditLimit,
    LAG(creditLimit) OVER(
        ORDER BY customerNumber
    ) AS previous_credit
FROM customers;


-- Show next credit limit
SELECT
    customerName,
    creditLimit,
    LEAD(creditLimit) OVER(
        ORDER BY customerNumber
    ) AS next_credit
FROM customers;


-- Calculate difference between current and previous credit
SELECT
    customerName,
    creditLimit,
    creditLimit - LAG(creditLimit) OVER(
        ORDER BY customerNumber
    ) AS credit_difference
FROM customers;


-- Compare credit limit inside each country
SELECT
    customerName,
    country,
    creditLimit,
    LAG(creditLimit) OVER(
        PARTITION BY country
        ORDER BY creditLimit
    ) AS previous_in_country
FROM customers;


-- Rank customers and show previous ranking credit
SELECT
    customerName,
    creditLimit,
    RANK() OVER(ORDER BY creditLimit DESC) AS ranking,
    LAG(creditLimit) OVER(
        ORDER BY creditLimit DESC
    ) AS previous_rank_credit
FROM customers;


-- Detect increase or decrease
SELECT
    customerName,
    creditLimit,
    LAG(creditLimit) OVER(ORDER BY customerNumber) AS previous_credit,
    CASE
        WHEN creditLimit > LAG(creditLimit) OVER(ORDER BY customerNumber)
            THEN 'Increase'
        WHEN creditLimit < LAG(creditLimit) OVER(ORDER BY customerNumber)
            THEN 'Decrease'
        ELSE 'Same'
    END AS change_status
FROM customers;