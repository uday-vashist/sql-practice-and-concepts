-- =========================================================
-- Problem: Product Sales Analysis I
-- Platform: LeetCode
-- =========================================================


-- =========================================================
-- Objective
--
-- Retrieve:
-- • product_name
-- • year
-- • price
--
-- by joining Product and Sales tables.
-- =========================================================


-- =========================================================
-- Tables:
--
-- Product(product_id, product_name)
-- Sales(product_id, year, price)
--
-- Each sale record is linked to a product using product_id.
-- =========================================================


-- =========================================================
-- Approach
--
-- 1️⃣ Join Product and Sales using product_id
--
-- 2️⃣ Select required columns:
--     - product_name (from Product)
--     - year, price (from Sales)
--
-- 3️⃣ Use INNER JOIN since only matching records are needed
-- =========================================================


SELECT 
    p.product_name,
    s.year,
    s.price

FROM Product p

INNER JOIN Sales s
    ON p.product_id = s.product_id;



-- =========================================================
-- Key Concepts Used
--
-- • INNER JOIN
-- • Foreign key relationship
-- • Table aliasing
--
-- =========================================================


-- =========================================================
-- Important Insight
--
-- 1️⃣ INNER JOIN returns only matching rows from both tables.
--
-- 2️⃣ If a product has no sales, it will NOT appear in result.
--
-- 3️⃣ If you wanted all products (even without sales),
--     you would use LEFT JOIN instead.
--
-- =========================================================


-- =========================================================
-- End of Problem
-- =========================================================
