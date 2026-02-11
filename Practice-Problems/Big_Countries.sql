-- Problem: Big Countries
-- Platform: LeetCode
-- Problem Number: 595
-- Difficulty: Easy
-- Concepts Used: WHERE clause, OR condition, numeric filtering

-- Approach:
-- A country is considered big if:
-- population >= 25,000,000 OR area >= 3,000,000.
-- We return name, population, and area for such countries.

SELECT name , population , area 
  FROM World
  WHERE Area >= 3000000
  OR Population >= 25000000 ;
