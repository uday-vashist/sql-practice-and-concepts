-- =========================================================
-- Problem: User Activity for the Past 30 Days
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- For each day within the given date range,
-- count the number of distinct active users.
--
-- Date range:
-- '2019-06-28' to '2019-07-27'
-- =========================================================


-- =========================================================
-- Table:
--
-- Activity(user_id, session_id, activity_date, activity_type)
--
-- Each row represents a user activity event.
-- A user may have multiple activities on the same day.
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️⃣ Filter rows within the required date range
--
-- 2️⃣ Group by activity_date
--
-- 3️⃣ Count distinct users per day
--
-- 4️⃣ Rename activity_date as 'day'
-- =========================================================


SELECT 
    activity_date AS day,

    COUNT(DISTINCT user_id) AS active_users

FROM Activity

WHERE activity_date 
BETWEEN '2019-06-28' AND '2019-07-27'

GROUP BY activity_date;



-- =========================================================
-- Key Concepts Used
--
-- • WHERE (date filtering)
-- • BETWEEN
-- • GROUP BY
-- • COUNT(DISTINCT)
--
-- =========================================================


-- =========================================================
-- Important Insights
--
-- 1️⃣ DISTINCT ensures a user is counted once per day,
--     even if they have multiple activities.
--
-- 2️⃣ BETWEEN is inclusive:
--     Both start and end dates are included.
--
-- 3️⃣ GROUP BY activity_date returns one row per day.
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
