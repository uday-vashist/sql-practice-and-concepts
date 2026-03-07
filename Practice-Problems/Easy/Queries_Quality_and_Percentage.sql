-- Problem: Queries Quality and Percentage
-- Platform: LeetCode
-- Problem ID: 1211


-- Objective
--
-- For each query_name calculate:
--
-- 1️ Query Quality
--     = AVG(rating / position)
--
-- 2️ Poor Query Percentage
--     Percentage of queries where rating < 3
--
-- Results should be rounded to 2 decimal places.
-- =========================================================


-- Table Structure

-- Queries(query_name, result, position, rating)
-- query_name → name of the query
-- position   → ranking position
-- rating     → user rating of result


-- Approach
-- 1️ Group rows by query_name
-- 2️ Calculate query quality:
--     AVG(rating / position)
-- 3️ Calculate poor query percentage:
--     Use conditional aggregation
--     CASE WHEN rating < 3 THEN 1 ELSE 0 END
--     This converts the condition into numeric values
--     allowing AVG() to compute percentage.
-- 4️ Multiply by 100 to convert to percentage
-- 5️ Round final results to 2 decimal places


SELECT 
    query_name,

    ROUND(AVG(rating / position), 2) AS quality,

    ROUND(
        AVG(CASE 
                WHEN rating < 3 THEN 1 
                ELSE 0 
            END) * 100,
        2
    ) AS poor_query_percentage

FROM Queries

GROUP BY query_name;



-- Key Concepts Used
-- • GROUP BY
-- • Aggregate Functions (AVG)
-- • Conditional Aggregation
-- • CASE WHEN
-- • Percentage Calculation
-- • ROUND() function

-- Important Insight
-- AVG(CASE WHEN condition THEN 1 ELSE 0 END)
-- works because:
--
-- TRUE  → 1
-- FALSE → 0
--
-- So AVG() effectively calculates the proportion
-- of rows satisfying the condition.

