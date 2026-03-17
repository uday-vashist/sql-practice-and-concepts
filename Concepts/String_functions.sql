-- CONCEPT: STRING FUNCTIONS (MySQL)
-- Purpose:
-- Perform operations on text data


-- Sample Table

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Users VALUES
(1, 'Uday', 'Vashist', 'uday@gmail.com'),
(2, 'Rahul', 'Sharma', 'rahul@yahoo.com'),
(3, 'Aman', 'Verma', 'aman@hotmail.com');



-- 1️ CONCAT()


SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Users;



-- 2️ LENGTH() vs CHAR_LENGTH()

SELECT 
    first_name,
    LENGTH(first_name) AS byte_length,
    CHAR_LENGTH(first_name) AS char_length
FROM Users;



-- 3️ UPPER() and LOWER()

SELECT 
    UPPER(first_name) AS upper_name,
    LOWER(first_name) AS lower_name
FROM Users;



-- 4️ SUBSTRING()

SELECT 
    first_name,
    SUBSTRING(first_name, 1, 3) AS short_name
FROM Users;



-- 5️ TRIM()

SELECT TRIM('   SQL   ') AS trimmed_text;



-- 6️ REPLACE()

SELECT REPLACE(email, '@gmail.com', '@company.com') AS updated_email
FROM Users;



-- 7️ INSTR() / LOCATE()


SELECT 
    email,
    LOCATE('@', email) AS at_position
FROM Users;



-- 8️ LEFT() and RIGHT()

SELECT 
    first_name,
    LEFT(first_name, 2) AS left_part,
    RIGHT(first_name, 2) AS right_part
FROM Users;



-- IMPORTANT NOTES

-- 1️ STRING functions are heavily used in data cleaning
-- 2️ CHAR_LENGTH() is safer than LENGTH() for multibyte chars
-- 3️ CONCAT() is commonly used in reporting queries
-- 4️ SUBSTRING() is useful for parsing structured text


-- =========================================================
