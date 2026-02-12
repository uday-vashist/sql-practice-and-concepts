-- Problem: Invalid Tweets
-- Platform: LeetCode
-- Problem Number: 1683
-- Difficulty: Easy
-- Concepts Used: CHAR_LENGTH function, filtering

-- Approach:
-- A tweet is invalid if the number of characters in the content
-- is greater than 15. We filter rows where CHAR_LENGTH(content) > 15.

-- Note:
-- CHAR_LENGTH() counts characters.
-- LENGTH() counts bytes.
-- CHAR_LENGTH() is more accurate when checking character limits.

SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
