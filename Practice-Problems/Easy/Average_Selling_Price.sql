-- Problem: Average Selling Price
-- Platform: LeetCode

-- Objective:
-- Calculate the average selling price for each product.
-- 
-- Average Price Formula:
--   SUM(price * units) / SUM(units)
--
-- If a product has no sales, return 0.
-- Round the result to 2 decimal places.

-- Tables:
--
-- Prices(product_id, start_date, end_date, price)
-- UnitsSold(product_id, purchase_date, units)
--
-- A product may have multiple price periods.
-- Units sold must fall within the valid price date range.


-- Approach:
--
-- 1️ LEFT JOIN Prices with UnitsSold
--     - Join on product_id
--     - Ensure purchase_date falls within start_date and end_date
--
-- 2️ Compute total revenue:
--     SUM(price * units)
--
-- 3️ Compute total units sold:
--     SUM(units)
--
-- 4️ Handle division-by-zero using NULLIF
--     NULLIF(SUM(units), 0)
--
-- 5️ Handle NULL case using IFNULL
--
-- 6️ Round result to 2 decimal places


SELECT 
    p.product_id,

    ROUND(
        IFNULL(
            SUM(p.price * u.units) / NULLIF(SUM(u.units), 0),
            0
        ),
        2
    ) AS average_price

FROM Prices p

LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date

GROUP BY p.product_id;



-- Key Concepts Used:
-- • LEFT JOIN (retain products even if no sales)
-- • Conditional JOIN using date range
-- • Aggregate functions (SUM)
-- • NULLIF to prevent division by zero
-- • IFNULL to return 0 when no sales exist
-- • ROUND for formatting output
--


-- Important Behavior Notes:
-- 1️ If a product has no matching rows in UnitsSold,
--     SUM(u.units) becomes NULL.
-- 2️ NULLIF(SUM(u.units), 0) prevents division by zero.
-- 3️ IFNULL(..., 0) ensures final result is 0 instead of NULL.
-- 4️ LEFT JOIN ensures all product_ids from Prices appear.


-- =========================================================
-- End of Problem
-- =========================================================
