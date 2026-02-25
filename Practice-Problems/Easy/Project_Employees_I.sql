-- Problem: Project Employees I
-- Platform: LeetCode
-- Difficulty: Easy

-- Objective:
-- For each project, calculate the average experience years 
-- of employees working on that project.
-- Round the result to 2 decimal places.


-- Tables:
-- Project(project_id, employee_id)
-- Employee(employee_id, experience_years)
-- Each row in Project represents an employee assigned
-- to a specific project.


-- Approach:
-- 1️ INNER JOIN Project and Employee
--     - Join using employee_id

-- 2️ For each project:
--     - Calculate AVG(experience_years)
-- 3️ Use ROUND(..., 2) for formatting
-- 4️ GROUP BY project_id to compute per-project average


SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years

FROM Project p

INNER JOIN Employee e
    ON p.employee_id = e.employee_id

GROUP BY p.project_id;



-- Key Concepts Used:
-- • INNER JOIN
-- • GROUP BY
-- • AVG()
-- • ROUND()
-- • Table aliasing


-- Important Behavior Notes:
-- 1️ INNER JOIN ensures only matching employee records 
--     are considered.
-- 2️ GROUP BY reduces rows to one per project_id.
-- 3️ AVG() ignores NULL values automatically.
-- 4️ Without GROUP BY, average would be computed 
--     across entire dataset instead of per project.


-- =========================================================
-- End of Problem
-- =========================================================
