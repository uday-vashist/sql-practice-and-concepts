-- Concept: SQL Operators
-- Operators are used in SQL to perform comparisons,
-- logical evaluations, and arithmetic operations.


-- 1️ Comparison Operators
-- Used to compare values.

-- Equal to (=)

SELECT *
FROM Students
WHERE age = 22;

-- Not equal to (!= or <>)

SELECT *
FROM Students
WHERE age != 22;

-- Greater than (>)

SELECT *
FROM Students
WHERE age > 20;

-- Less than (<)

SELECT *
FROM Students
WHERE age < 25;

-- Greater than or equal to (>=)

SELECT *
FROM Students
WHERE age >= 21;

-- Less than or equal to (<=)

SELECT *
FROM Students
WHERE age <= 23;



-- 2️ Logical Operators
-- Used to combine multiple conditions.

-- AND

SELECT *
FROM Students
WHERE age > 20 AND age < 25;

-- OR

SELECT *
FROM Students
WHERE age < 18 OR age > 60;

-- NOT

SELECT *
FROM Students
WHERE NOT age = 22;



-- 3️ Arithmetic Operators
-- Used for mathematical calculations.

SELECT name, age + 1 AS next_year_age
FROM Students;

SELECT name, age * 2 AS double_age
FROM Students;


-- 4️ Special Operators

-- BETWEEN

SELECT *
FROM Students
WHERE age BETWEEN 18 AND 25;

-- IN

SELECT *
FROM Students
WHERE age IN (18, 20, 22);

-- LIKE

SELECT *
FROM Students
WHERE name LIKE 'A%';

-- IS NULL

SELECT *
FROM Students
WHERE age IS NULL;
