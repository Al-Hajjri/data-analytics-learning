-- 1. SELECT (DISPLAY DATA)
SELECT * FROM users;


-- 2. SELECT WITH CERTAIN COLUMN
SELECT name, email FROM users;


-- 3. WHERE (FILTER DATA)
SELECT * FROM users
WHERE age >= 18;


-- 4. WHERE + AND / OR
SELECT * FROM users
WHERE age >= 18 AND balance > 100000;

SELECT * FROM Shinkansen_stations_inJapan WHERE not Year = 1964--selain kota 1964


-- 5. INSERT (ADD DATA)
INSERT INTO users (name, age, email, balance)
VALUES ('Budi', 22, 'budi@mail.com', 500000);


-- 6. UPDATE (CHANGE DATA)
UPDATE users
SET balance = 750000
WHERE name = 'Budi';


-- 7. DELETE (DELETE DATA)
DELETE FROM users
WHERE name = 'Budi';
