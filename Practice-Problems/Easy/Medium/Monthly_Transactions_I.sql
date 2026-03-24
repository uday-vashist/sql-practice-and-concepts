-- =========================================================
-- Problem: Monthly Transactions Summary
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- For each month and country, compute:
--
-- 1️ Total number of transactions
-- 2️ Number of approved transactions
-- 3️ Total transaction amount
-- 4️ Total approved transaction amount
--
-- Month format: YYYY-MM
-- =========================================================


-- =========================================================
-- Table:
--
-- Transactions(id, country, state, amount, trans_date)
--
-- state → 'approved' or other values
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️⃣ Extract month using DATE_FORMAT
--     DATE_FORMAT(trans_date, '%Y-%m')
--
-- 2️⃣ Group by:
--     - month
--     - country
--
-- 3️⃣ Compute total transactions:
--     COUNT(*)
--
-- 4️⃣ Compute approved transactions:
--     Conditional aggregation using CASE
--
-- 5️⃣ Compute total amount:
--     SUM(amount)
--
-- 6️⃣ Compute approved amount:
--     SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END)
--
-- 7️⃣ Sort results by month and country
-- =========================================================


SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,

    COUNT(*) AS trans_count,

    SUM(
        CASE 
            WHEN state = 'approved' THEN 1 
            ELSE 0 
        END
    ) AS approved_count,

    SUM(amount) AS trans_total_amount,

    SUM(
        CASE 
            WHEN state = 'approved' THEN amount 
            ELSE 0 
        END
    ) AS approved_total_amount

FROM Transactions

GROUP BY 
    DATE_FORMAT(trans_date, '%Y-%m'),
    country

ORDER BY 
    month,
    country;



-- =========================================================
-- Key Concepts Used
--
-- • DATE_FORMAT()
-- • GROUP BY on expression
-- • Conditional aggregation (CASE WHEN)
-- • COUNT() and SUM()
-- • Multiple aggregations in one query
-- • ORDER BY
--
-- =========================================================


-- =========================================================
-- Important Insights
--
-- 1️⃣ GROUP BY on DATE_FORMAT groups data monthly.
--
-- 2️⃣ Conditional aggregation pattern:
--
--     SUM(CASE WHEN condition THEN value ELSE 0 END)
--
--     → Used to compute filtered metrics in one pass.
--
-- 3️⃣ COUNT(*) counts all rows,
--     while SUM(CASE ...) counts condition-based rows.
--
-- 4️⃣ Using month alias in ORDER BY improves readability.
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
