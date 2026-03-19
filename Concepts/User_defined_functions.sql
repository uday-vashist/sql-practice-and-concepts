-- CONCEPT: USER-DEFINED FUNCTIONS (UDF) - MySQL
-- Purpose:
-- Create reusable custom functions that return a value



-- 1️ Basic Function Syntax

-- DELIMITER is used to define function body properly

DELIMITER //

CREATE FUNCTION get_bonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;



-- Using the Function

SELECT get_bonus(50000) AS bonus;



-- 2️ Function with Conditional Logic

DELIMITER //

CREATE FUNCTION salary_category(salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);

    IF salary >= 70000 THEN
        SET category = 'High';
    ELSEIF salary >= 50000 THEN
        SET category = 'Medium';
    ELSE
        SET category = 'Low';
    END IF;

    RETURN category;
END //

DELIMITER ;



-- Using Function in Query

SELECT 
    emp_name,
    salary,
    salary_category(salary) AS category
FROM Employees;



-- 3️ Function with Multiple Parameters

DELIMITER //

CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_rate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN price - (price * discount_rate / 100);
END //

DELIMITER ;



-- Example Usage

SELECT calculate_discount(1000, 10) AS final_price;



-- IMPORTANT RULES

-- 1️ Functions must return a single value
-- 2️ Cannot return result sets (use stored procedures for that)
-- 3️ Use DETERMINISTIC if output depends only on input
-- 4️ Functions can be used inside SELECT, WHERE, etc.
-- 5️ Avoid heavy logic inside functions (performance impact)



-- DIFFERENCE: FUNCTION vs PROCEDURE

-- FUNCTION:
-- • Returns a value
-- • Can be used in SELECT
-- • Used for calculations

-- PROCEDURE:
-- • Does not need to return a value
-- • Cannot be used in SELECT
-- • Used for operations (INSERT, UPDATE, etc.)


-- =========================================================
-- End of User-Defined Functions
-- =========================================================
