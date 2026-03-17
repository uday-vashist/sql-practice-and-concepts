-- CONCEPT: CASE EXPRESSIONS
-- Purpose:
-- Add conditional logic inside SQL queries


-- Sample Table

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employees VALUES
(1, 'Uday', 60000),
(2, 'Rahul', 75000),
(3, 'Aman', 50000),
(4, 'Neha', 52000);



-- 1️ Basic CASE

SELECT 
    emp_name,
    salary,
    CASE 
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees;



-- 2️ CASE inside Aggregate

SELECT 
    COUNT(CASE WHEN salary >= 60000 THEN 1 END) AS high_salary_count
FROM Employees;



-- 3️ CASE with SUM()

SELECT 
    SUM(CASE WHEN salary >= 60000 THEN 1 ELSE 0 END) AS high_salary_count
FROM Employees;



-- 4️ CASE in ORDER BY

SELECT emp_name, salary
FROM Employees
ORDER BY 
    CASE 
        WHEN salary >= 70000 THEN 1
        WHEN salary >= 50000 THEN 2
        ELSE 3
    END;



-- IMPORTANT NOTES

-- 1️ CASE adds conditional logic inside SQL
-- 2️ Frequently used in analytics queries
-- 3️ Works with SELECT, WHERE, ORDER BY, GROUP BY
-- 4️ Core pattern for conditional aggregation


-- 
