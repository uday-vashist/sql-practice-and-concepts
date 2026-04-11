-- =========================================================
-- Problem: Biggest Single Number
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- Find the largest number that appears exactly once.
-- If no such number exists, return NULL.
-- =========================================================


-- =========================================================
-- Table:
--
-- MyNumbers(num)
--
-- Each row contains a number.
-- Numbers may appear multiple times.
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️⃣ Group numbers by value
--
-- 2️⃣ Filter numbers that appear exactly once
--     using HAVING COUNT(num) = 1
--
-- 3️⃣ From remaining numbers, find the maximum
-- =========================================================


SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS temp;



-- =========================================================
-- Key Concepts Used
--
-- • GROUP BY
-- • HAVING
-- • Subquery
-- • MAX()
--
-- =========================================================


-- =========================================================
-- Important Insight
--
-- 1️ HAVING COUNT(num) = 1 filters unique numbers.
--
-- 2️ Subquery isolates valid candidates.
--
-- 3️ MAX() extracts the largest among them.
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
