-- CONCEPT: WINDOW FUNCTIONS 
-- Purpose:
-- Perform calculations across a set of rows related to 
-- the current row without collapsing the result.


-- Sample Table

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



-- Basic Window Function Syntax

-- window_function() OVER (
--     PARTITION BY column
--     ORDER BY column
-- )



-- 1️ ROW_NUMBER()
-- Assigns unique sequential number per partition

SELECT 
    emp_name,
    department,
    salary,
    ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS row_num
FROM Employees;



-- 2️ RANK()
-- Same rank for ties, skips next rank

SELECT 
    emp_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS rank_position
FROM Employees;



-- 3️ DENSE_RANK()
-- Same rank for ties, does NOT skip numbers

SELECT 
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS dense_rank_position
FROM Employees;



-- 4️ Running Total

SELECT 
    emp_name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS running_total
FROM Employees;



-- 5️ Window Aggregate Without Collapsing Rows
-- Compare each salary with department average

SELECT 
    emp_name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS dept_avg_salary
FROM Employees;



-- 6️ LAG() and LEAD()
-- Access previous or next row values

SELECT 
    emp_name,
    department,
    salary,
    LAG(salary) OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS previous_salary,
    LEAD(salary) OVER (
        PARTITION BY department
        ORDER BY salary
    ) AS next_salary
FROM Employees;



-- =========================================================
-- IMPORTANT DIFFERENCE
-- =========================================================

-- GROUP BY collapses rows into one per group.
-- Window functions keep all rows intact.

-- Example:
-- GROUP BY department → 3 rows (IT, HR, Finance)
-- Window function with PARTITION BY department → 5 rows (original rows remain)



-- Key Concepts

-- 1️ PARTITION BY → divides data into groups.
-- 2️ ORDER BY → defines row sequence inside partition.
-- 3️ No row reduction occurs.
-- 4️ Useful for ranking, analytics, running totals.
-- 5️ Window functions execute after WHERE but before ORDER BY.

