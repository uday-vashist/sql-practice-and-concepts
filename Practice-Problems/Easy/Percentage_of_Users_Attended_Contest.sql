-- Problem: Percentage of Users Attended a Contest
-- Platform: LeetCode


-- Objective

-- For each contest_id, calculate the percentage of users
-- who registered for that contest.

-- Formula:
--   (Number of distinct users in contest / Total users) * 100
--
-- Round the result to 2 decimal places.


-- Tables:
--
-- Register(contest_id, user_id)
-- Users(user_id)
--
-- Each row in Register represents a user registering
-- for a contest.



-- Approach
--
-- 1️ Count distinct users per contest:
--     COUNT(DISTINCT user_id)
--
-- 2️ Get total number of users using subquery:
--     (SELECT COUNT(*) FROM Users)
--
-- 3️ Compute percentage:
--     (contest_users / total_users) * 100
--
-- 4️ Use 100.0 to ensure floating-point division
--
-- 5️ Round result to 2 decimal places
--
-- 6️ Sort:
--     - percentage DESC
--     - contest_id ASC


SELECT 
    contest_id,

    ROUND(
        (COUNT(DISTINCT user_id) * 100.0) /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage

FROM Register

GROUP BY contest_id

ORDER BY percentage DESC, contest_id ASC;



-- Key Concepts Used
--
-- • COUNT(DISTINCT)
-- • Subquery (scalar subquery)
-- • Percentage calculation
-- • GROUP BY
-- • ORDER BY
-- • ROUND()



-- Important Notes
--
-- 1️ COUNT(DISTINCT user_id) ensures duplicate registrations
--     are not counted multiple times.
--
-- 2️ 100.0 (not 100) forces floating-point division.
--
-- 3️ Subquery is executed once (scalar subquery).
--
-- 4️ ORDER BY ensures correct sorting priority.


-- =========================================================
-- End of Problem
-- =========================================================
