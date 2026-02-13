-- Problem: Not Boring Movies
-- Platform: LeetCode
-- Problem Number: 620
-- Difficulty: Easy
-- Concepts Used: WHERE clause, modulo operator, logical AND, ORDER BY

-- Approach:
-- We need movies with:
-- 1) An odd id (id % 2 != 0)
-- 2) Description not equal to 'boring'
-- Finally, results must be ordered by rating in descending order.

SELECT *
FROM Cinema
WHERE id % 2 != 0
  AND description <> 'boring'
ORDER BY rating DESC;
