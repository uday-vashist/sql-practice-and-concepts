-- CONCEPT: GROUP BY & HAVING
-- Purpose:
-- 1. Group rows based on column values
-- 2. Apply aggregate functions per group
-- 3. Filter aggregated results using HAVING


-- Sample Table


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Uday', 'IT', 60000, 5000),
(2, 'Rahul', 'IT', 75000, NULL),
(3, 'Aman', 'HR', 50000, 3000),
(4, 'Neha', 'HR', 52000, NULL),
(5, 'Simran', 'Finance', 80000, 10000);



-- 1️ Basic GROUP BY
-- Groups rows by department

SELECT department
FROM Employees
GROUP BY department;


-- 2️ GROUP BY with Aggregate Functions

-- Total salary per department
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department;


-- Average salary per department
SELECT department,
       AVG(salary) AS avg_salary
FROM Employees
GROUP BY department;


-- Count employees per department
SELECT department,
       COUNT(*) AS total_employees
FROM Employees
GROUP BY department;


-- Minimum salary per department
SELECT department,
       MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department;


-- Maximum salary per department
SELECT department,
       MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;



-- 3️ GROUP_CONCAT with GROUP BY (MySQL Specific)

SELECT department,
       GROUP_CONCAT(name SEPARATOR ', ') AS employees
FROM Employees
GROUP BY department;



-- 4️ WHERE vs GROUP BY
-- WHERE filters rows BEFORE grouping

SELECT department,
       SUM(salary) AS total_salary
FROM Employees
WHERE salary > 50000
GROUP BY department;



-- 5️ HAVING
-- HAVING filters grouped results AFTER aggregation

-- Departments where total salary > 100000
SELECT department,
       SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 100000;


-- Departments with more than 1 employee
SELECT department,
       COUNT(*) AS total_employees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 1;



-- IMPORTANT RULE

-- Any column in SELECT that is NOT inside an aggregate function
-- must appear in the GROUP BY clause.


-- Common Error Example (Will Fail)

-- SELECT name, SUM(salary)
-- FROM Employees
-- GROUP BY department;
--  ERROR:
-- 'name' must appear in GROUP BY or be used in an aggregate function
-- Reason:
-- SQL cannot decide which name to display for each grouped department.


-- BEHAVIOR NOTES

-- 1️ GROUP BY reduces number of rows
-- 2️ Each unique group becomes one result row
-- 3️ Aggregates operate within each group
-- 4️ HAVING works only after grouping


-- =========================================================
-- End of GROUP BY & HAVING
-- =========================================================
