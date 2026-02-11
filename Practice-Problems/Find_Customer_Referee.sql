-- Problem: Find Customer Referee
--Platform: Leetcode
--Problem Number:584
-- Difficulty: Easy
-- Concepts Used: WHERE clause, NULL handling, logical operators

-- Approach:
-- We need customers who were NOT referred by the customer with id = 2.
-- If referee_id is NULL, it means the customer was not referred by anyone,
-- so they should also be included.

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
