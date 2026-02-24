-- Show highest credit limit for all customers
SELECT
    customerName,
    creditLimit,
    FIRST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
    ) AS highest_credit
FROM customers;


-- Show lowest credit limit for all customers
SELECT
    customerName,
    creditLimit,
    LAST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_credit
FROM customers;


-- Show highest credit per country
SELECT
    customerName,
    country,
    creditLimit,
    FIRST_VALUE(creditLimit) OVER(
        PARTITION BY country
        ORDER BY creditLimit DESC
    ) AS highest_in_country
FROM customers;


-- Show lowest credit per country
SELECT
    customerName,
    country,
    creditLimit,
    LAST_VALUE(creditLimit) OVER(
        PARTITION BY country
        ORDER BY creditLimit DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_in_country
FROM customers;


-- Compare current credit with highest credit
SELECT
    customerName,
    creditLimit,
    FIRST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
    ) AS highest_credit,
    creditLimit -
    FIRST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
    ) AS difference_from_highest
FROM customers;


-- Compare current credit with lowest credit
SELECT
    customerName,
    creditLimit,
    LAST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_credit,
    creditLimit -
    LAST_VALUE(creditLimit) OVER(
        ORDER BY creditLimit DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS difference_from_lowest
FROM customers;