-- CONCEPT: DATE FUNCTIONS (MySQL)
-- Purpose:
-- Perform operations on DATE, DATETIME, and TIMESTAMP values



-- Sample Table

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    delivery_date DATE,
    created_at DATETIME
);

INSERT INTO Orders VALUES
(1, '2024-01-10', '2024-01-15', '2024-01-10 10:30:00'),
(2, '2024-02-05', '2024-02-07', '2024-02-05 14:45:00'),
(3, '2024-03-20', '2024-03-25', '2024-03-20 09:00:00');



-- 1️ CURRENT DATE & TIME

SELECT CURDATE() AS current_date;
SELECT CURRENT_DATE() AS current_date;

SELECT NOW() AS current_datetime;
SELECT CURRENT_TIMESTAMP() AS current_timestamp;



-- 2️ EXTRACTING PARTS OF DATE

SELECT 
    order_id,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day
FROM Orders;

SELECT 
    order_id,
    HOUR(created_at) AS hour,
    MINUTE(created_at) AS minute,
    SECOND(created_at) AS second
FROM Orders;



-- 3️ DATE DIFFERENCE

-- Difference in days
SELECT 
    order_id,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM Orders;



-- 4️ DATE ADD / SUBTRACT

-- Add 7 days
SELECT 
    order_id,
    DATE_ADD(order_date, INTERVAL 7 DAY) AS expected_followup
FROM Orders;

-- Subtract 1 month
SELECT 
    order_id,
    DATE_SUB(order_date, INTERVAL 1 MONTH) AS previous_month_date
FROM Orders;



-- 5️ DATE FORMAT

SELECT 
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM Orders;



-- 6️ EXTRACT FUNCTION

SELECT 
    order_id,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM Orders;



-- 7️ LAST_DAY & DAYNAME

SELECT 
    order_id,
    LAST_DAY(order_date) AS last_day_of_month,
    DAYNAME(order_date) AS weekday_name
FROM Orders;



-- 8️ TIMESTAMPDIFF

SELECT 
    order_id,
    TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_between
FROM Orders;



-- IMPORTANT NOTES

-- 1️ DATEDIFF returns difference in days only.
-- 2️ TIMESTAMPDIFF allows different units (DAY, MONTH, YEAR).
-- 3️ DATE_ADD and DATE_SUB modify date values.
-- 4️ DATE_FORMAT converts date into readable format.
-- 5️ CURDATE() returns only date.
-- 6️ NOW() returns date + time.
