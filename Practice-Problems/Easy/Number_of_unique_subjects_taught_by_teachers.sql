-- =========================================================
-- Problem: Number of Subjects Taught by Each Teacher
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- For each teacher, count the number of unique subjects
-- they teach.
-- =========================================================


-- =========================================================
-- Table:
--
-- Teacher(teacher_id, subject_id)
--
-- A teacher may appear multiple times for the same subject.
-- We must count only distinct subjects.
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️⃣ Group rows by teacher_id
--
-- 2️⃣ Use COUNT(DISTINCT subject_id)
--     to count unique subjects only
--
-- 3️⃣ Alias result as cnt
-- =========================================================


SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;



-- =========================================================
-- Key Concepts Used
--
-- • GROUP BY
-- • COUNT(DISTINCT)
--
-- =========================================================


-- =========================================================
-- Important Insight
--
-- COUNT(subject_id) ≠ COUNT(DISTINCT subject_id)
--
-- Example:
--
-- teacher_id | subject_id
-- -----------|-----------
--     1      |    Math
--     1      |    Math
--     1      |    Science
--
-- COUNT(subject_id) → 3   ❌ (counts duplicates)
-- COUNT(DISTINCT subject_id) → 2 ✅ (correct)
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
