-- =========================================================
-- Problem: Classes With at Least 5 Students
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- Find all classes that have at least 5 students.
-- =========================================================


-- =========================================================
-- Table:
--
-- Courses(student, class)
--
-- Each row represents a student enrolled in a class.
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️ Group records by class
--
-- 2️ Count number of students in each class
--
-- 3️ Filter classes having count >= 5 using HAVING
-- =========================================================


SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(*) >= 5;



-- =========================================================
-- Key Concepts Used
--
-- • GROUP BY
-- • HAVING
-- • COUNT()
--
-- =========================================================


-- =========================================================
-- Important Insight
--
-- WHERE cannot be used for aggregate filtering.
-- HAVING is required after GROUP BY.
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
