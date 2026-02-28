-- =========================================================
-- CONCEPT: SUBQUERIES
-- Purpose:
-- A query written inside another query.
-- Used for filtering, comparison, and dynamic value generation.
-- =========================================================



-- ========================================================
-- Sample Table
- =========================================================

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Uday', 'IT', 60000),
(2, 'Rahul', 'IT', 75000),
(3, 'Aman', 'HR', 50000),
(4, 'Neha', 'HR', 52000),
(5, 'Simran', 'Finance', 80000);



-- =========================================================
-- 1️⃣ SCALAR SUBQUERY
-- Returns single value
-- =========================================================

-- Employees earning more than average salary

SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);



-- =========================================================
-- 2️⃣ SUBQUERY IN SELECT CLAUSE
-- =========================================================

-- Show each employee salary and overall average salary

SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM Employees) AS average_salary
FROM Employees;



-- =========================================================
-- 3️⃣ SUBQUERY WITH IN
-- Returns multiple values
-- =========================================================

-- Employees working in departments that have salary > 70000

SELECT emp_name, department
FROM Employees
WHERE department IN (
    SELECT department
    FROM Employees
    WHERE salary > 70000
);



-- =========================================================
-- 4️⃣ CORRELATED SUBQUERY
-- Inner query depends on outer query
-- =========================================================

-- Employees earning more than department average

SELECT e1.emp_name, e1.department, e1.salary
FROM Employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.department = e1.department
);



-- =========================================================
-- 5️⃣ SUBQUERY WITH EXISTS
-- Checks if rows exist
-- =========================================================

SELECT emp_name
FROM Employees e1
WHERE EXISTS (
    SELECT 1
    FROM Employees e2
    WHERE e2.department = e1.department
    AND e2.salary > 70000
);



-- =========================================================
-- IMPORTANT NOTES
-- =========================================================

-- 1️⃣ Scalar subquery must return single value.
-- 2️⃣ IN works with multiple values.
-- 3️⃣ Correlated subquery runs once per outer row.
-- 4️⃣ EXISTS stops searching after first match.
-- 5️⃣ Subqueries can often be rewritten using JOIN.
-- 6️⃣ JOIN is usually faster than correlated subquery.


-- =========================================================
-- COMMON MISTAKE
-- =========================================================

-- SELECT *
-- FROM Employees
-- WHERE salary > (
--     SELECT salary
--     FROM Employees
-- );
-- ❌ Error:
-- Subquery returns multiple rows.



-- =========================================================
-- End of Subqueries
-- =========================================================