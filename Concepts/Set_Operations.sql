-- CONCEPT: SET OPERATIONS
-- Purpose:
-- Combine results from multiple SELECT queries.
-- Each query must return the same number of columns
-- and compatible data types.


-- Sample Tables

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Uday'),
(2, 'Rahul'),
(3, 'Aman');

INSERT INTO Suppliers VALUES
(1, 'Rahul'),
(2, 'Neha'),
(3, 'Simran');



-- 1️ UNION
-- Combines results and removes duplicates

SELECT customer_name AS name
FROM Customers

UNION

SELECT supplier_name
FROM Suppliers;



-- 2️ UNION ALL
-- Combines results but keeps duplicates
-- Faster than UNION because duplicate removal is skipped

SELECT customer_name AS name
FROM Customers

UNION ALL

SELECT supplier_name
FROM Suppliers;



-- 3️ INTERSECT
-- Returns only rows that exist in BOTH result sets
-- Note: MySQL does not support INTERSECT directly

-- Conceptual example (supported in PostgreSQL / SQL Server)

-- SELECT customer_name
-- FROM Customers
-- INTERSECT
-- SELECT supplier_name
-- FROM Suppliers;



-- INTERSECT equivalent in MySQL using INNER JOIN

SELECT c.customer_name
FROM Customers c
INNER JOIN Suppliers s
ON c.customer_name = s.supplier_name;



-- 4️ EXCEPT (or MINUS)
-- Returns rows from first query not present in second
-- Note: MySQL does not support EXCEPT directly

-- Conceptual example

-- SELECT customer_name
-- FROM Customers
-- EXCEPT
-- SELECT supplier_name
-- FROM Suppliers;



-- EXCEPT equivalent in MySQL using LEFT JOIN


SELECT c.customer_name
FROM Customers c
LEFT JOIN Suppliers s
ON c.customer_name = s.supplier_name
WHERE s.supplier_name IS NULL;



-- IMPORTANT RULES

-- 1️ Each SELECT must return the same number of columns.
-- 2️ Corresponding columns must have compatible data types.
-- 3️ Column names in final result come from the first query.
-- 4️ ORDER BY can only appear at the end of the final query.



-- Example with ORDER BY

SELECT customer_name AS name
FROM Customers

UNION

SELECT supplier_name
FROM Suppliers

ORDER BY name;


