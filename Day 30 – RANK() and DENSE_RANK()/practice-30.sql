-- Rank customers by credit limit (highest first)
SELECT
    customerName,
    creditLimit,
    RANK() OVER(ORDER BY creditLimit DESC) AS ranking
FROM customers;


-- Dense rank customers by credit limit
SELECT
    customerName,
    creditLimit,
    DENSE_RANK() OVER(ORDER BY creditLimit DESC) AS dense_ranking
FROM customers;


-- Compare RANK and DENSE_RANK together
SELECT
    customerName,
    creditLimit,
    RANK() OVER(ORDER BY creditLimit DESC) AS ranking,
    DENSE_RANK() OVER(ORDER BY creditLimit DESC) AS dense_ranking
FROM customers;


-- Rank customers inside each country
SELECT
    customerName,
    country,
    creditLimit,
    RANK() OVER(
        PARTITION BY country
        ORDER BY creditLimit DESC
    ) AS rank_in_country
FROM customers;


-- Dense rank inside each country
SELECT
    customerName,
    country,
    creditLimit,
    DENSE_RANK() OVER(
        PARTITION BY country
        ORDER BY creditLimit DESC
    ) AS dense_rank_in_country
FROM customers;


-- Get Top 3 customers using RANK
SELECT *
FROM (
    SELECT
        customerName,
        creditLimit,
        RANK() OVER(ORDER BY creditLimit DESC) AS ranking
    FROM customers
) ranked
WHERE ranking <= 3;


-- Get Top 2 customers per country
SELECT *
FROM (
    SELECT
        customerName,
        country,
        creditLimit,
        DENSE_RANK() OVER(
            PARTITION BY country
            ORDER BY creditLimit DESC
        ) AS rank_in_country
    FROM customers
) ranked
WHERE rank_in_country <= 2;