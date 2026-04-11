-- Problem: Find Followers Count
-- Platform: LeetCode

-- =========================================================
-- Objective
--
-- For each user, count the number of unique followers.

-- =========================================================
-- Table:
--
-- Followers(user_id, follower_id)
--
-- A follower_id represents a user following user_id.
-- Duplicate follower entries may exist.


-- =========================================================
-- Approach
--
-- 1️ Group by user_id
--
-- 2️ Use COUNT(DISTINCT follower_id)
--     to avoid duplicate followers
-- =========================================================


SELECT 
    user_id,
    COUNT(DISTINCT follower_id) AS followers_count
FROM Followers
GROUP BY user_id;



-- =========================================================
-- Key Concepts Used
--
-- • GROUP BY
-- • COUNT(DISTINCT)
--

-- =========================================================
-- Important Insight
--
-- DISTINCT ensures each follower is counted only once,
-- even if duplicate records exist.
--
-- =========================================================
