-- CONCEPT: ADVANCED JOINS
-- Purpose:
-- Handle complex relational queries involving
-- multiple tables and advanced join patterns.



-- Sample Tables

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);



-- 1️ MULTIPLE JOINS (3 TABLE JOIN)
-- Employees working in departments handling projects

SELECT 
    e.emp_name,
    d.dept_name,
    p.project_name
FROM Employees e
INNER JOIN Departments d
    ON e.dept_id = d.dept_id
INNER JOIN Projects p
    ON d.dept_id = p.dept_id;



-- 2️ SELF JOIN
-- Used when a table references itself
-- Example: Employee-Manager relationship

SELECT 
    e.emp_name AS employee,
    m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id;



-- 3️ CROSS JOIN
-- Produces Cartesian product
-- Every row from first table matches every row from second

SELECT 
    e.emp_name,
    d.dept_name
FROM Employees e
CROSS JOIN Departments d;



-- 4️ EQUI JOIN
-- Join condition uses equality (=)
-- (Most common join type)

SELECT 
    e.emp_name,
    d.dept_name
FROM Employees e
INNER JOIN Departments d
    ON e.dept_id = d.dept_id;



-- 5️ NON-EQUI JOIN
-- Join condition uses operators other than =
-- Example: Salary range classification

CREATE TABLE SalaryGrade (
    grade CHAR(1),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

SELECT 
    e.emp_name,
    e.salary,
    sg.grade
FROM Employees e
JOIN SalaryGrade sg
    ON e.salary BETWEEN sg.min_salary AND sg.max_salary;



-- IMPORTANT NOTES

-- 1️ Multiple joins increase row combinations.
-- 2️ Self join requires table aliases.
-- 3️ CROSS JOIN can explode row count quickly.
-- 4️ Equi join uses equality.
-- 5️ Non-equi join uses ranges or inequality conditions.
-- 6️ Join order does not change logical result,
--     but affects readability and sometimes performance.

