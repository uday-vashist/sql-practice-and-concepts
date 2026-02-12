-- Problem: Article Views I
-- Platform: LeetCode
-- Problem Number: 1148
-- Difficulty: Easy
-- Concepts Used: DISTINCT, filtering, column comparison

-- Approach:
-- We need authors who viewed their own articles.
-- That means author_id = viewer_id.
-- We return unique author_ids in ascending order.

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
