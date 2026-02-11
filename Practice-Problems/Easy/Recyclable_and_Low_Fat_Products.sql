-- Problem: Recyclable and Low Fat Products
-- Platform: LeetCode
-- Problem Number: 1757
-- Difficulty: Easy
-- Concepts Used: WHERE clause, multiple conditions, filtering

-- Approach:
-- We need product_ids of products that are BOTH low fat and recyclable.
-- So we filter rows where low_fats = 'Y' AND recyclable = 'Y'.

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
