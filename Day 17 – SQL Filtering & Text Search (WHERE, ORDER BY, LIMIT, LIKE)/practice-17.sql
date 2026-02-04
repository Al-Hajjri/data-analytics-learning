-- Sort users by age from oldest to youngest
SELECT *
FROM users
ORDER BY age DESC;

-- Display only the first 3 rows
SELECT *
FROM users
LIMIT 3;

-- Names starting with letter 'A'
SELECT *
FROM users
WHERE name LIKE 'A%';

-- Values starting with letter 'a'
SELECT *
FROM users
WHERE column_name LIKE 'a%';

-- Values ending with letter 'a'
SELECT *
FROM users
WHERE column_name LIKE '%a';

-- Values containing 'or'
SELECT *
FROM users
WHERE column_name LIKE '%or%';

-- Values where the second character is 'r'
SELECT *
FROM users
WHERE column_name LIKE '_r%';

-- Values starting with 'a' and ending with 'o'
SELECT *
FROM users
WHERE column_name LIKE 'a%o';