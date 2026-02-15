-- Concept: Querying with SELECT
-- SELECT is used to retrieve data from one or more tables.

-- 1️ Selecting All Columns

SELECT *
FROM Students;


-- 2️ Selecting Specific Columns

SELECT name, age
FROM Students;


-- 3️ Using DISTINCT
-- Removes duplicate values

SELECT DISTINCT age
FROM Students;


-- 4️ Using Column Aliases
-- AS is used to rename a column in the result set

SELECT name AS student_name
FROM Students;


-- 5️ Using Expressions in SELECT

SELECT name, age + 1 AS next_year_age
FROM Students;


-- 6️ Using SELECT with WHERE condition

SELECT name, age
FROM Students
WHERE age > 20;


-- 7️ Using ORDER BY
-- Sorts results in ascending (ASC) or descending (DESC) order

SELECT name, age
FROM Students
ORDER BY age DESC;
