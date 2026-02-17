-- CONCEPT: AGGREGATE FUNCTIONS
-- Purpose:
-- Perform calculations on multiple rows
-- and return a single summarized result.


-- Sample Table for Demonstration

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



-- 1️ COUNT()
-- Counts number of rows

-- Counts all rows (includes NULL values)
SELECT COUNT(*) AS total_employees
FROM Employees;

-- Counts non-NULL salary values
SELECT COUNT(salary) AS employees_with_salary
FROM Employees;

-- Counts non-NULL bonus values
SELECT COUNT(bonus) AS employees_with_bonus
FROM Employees;

-- Counts disitinct non-NULL  salary values
SELECT COUNT(DISTINCT salary) AS unique_salary_count
FROM Employees;



-- 2️ SUM()
-- Returns total of non-NULL numeric values

SELECT SUM(salary) AS total_salary
FROM Employees;

SELECT SUM(bonus) AS total_bonus_paid
FROM Employees;



-- 3️ AVG()
-- Returns average of non-NULL numeric values

SELECT AVG(salary) AS average_salary
FROM Employees;

SELECT AVG(bonus) AS average_bonus
FROM Employees;



-- 4️ MIN()
-- Returns smallest value

SELECT MIN(salary) AS lowest_salary
FROM Employees;



-- 5️ MAX()
-- Returns largest value

SELECT MAX(salary) AS highest_salary
FROM Employees;



-- 6️ GROUP_CONCAT()  (MySQL Specific)
-- Concatenates multiple row values into a single string

-- Concatenate all employee names
SELECT GROUP_CONCAT(name) AS all_employee_names
FROM Employees;

-- Custom separator
SELECT GROUP_CONCAT(name SEPARATOR ' | ') AS formatted_names
FROM Employees;

-- With ORDER BY inside GROUP_CONCAT
SELECT GROUP_CONCAT(name ORDER BY salary DESC SEPARATOR ', ')
       AS employees_sorted_by_salary
FROM Employees;



-- IMPORTANT BEHAVIOR NOTES

-- 1️ Aggregate functions ignore NULL values (except COUNT(*))
-- 2️ They return exactly one row if no GROUP BY is used
-- 3️ They operate on a column across multiple rows
-- 4️ Entire table is treated as one group when GROUP BY is absent


-- End of Aggregate Functions
