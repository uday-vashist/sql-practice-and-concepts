-- Concept: WHERE Clause
-- The WHERE clause is used to filter records
-- based on specific conditions.


-- 1 Basic Filtering

SELECT *
FROM Students
WHERE age > 20;



-- 2️ Multiple Conditions with AND

SELECT *
FROM Students
WHERE age > 20 AND age < 25;



-- 3️ Multiple Conditions with OR

SELECT *
FROM Students
WHERE age < 18 OR age > 60;



-- 4 Filtering with String Condition

SELECT *
FROM Students
WHERE name = 'Uday';



-- 5️ Using WHERE with LIKE

SELECT *
FROM Students
WHERE name LIKE 'A%';



-- 6️ Handling NULL values
-- Important: NULL cannot be compared using =

SELECT *
FROM Students
WHERE age IS NULL;

SELECT *
FROM Students
WHERE age IS NOT NULL;
