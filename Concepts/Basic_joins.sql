-- CONCEPT: BASIC JOINS
-- Purpose:
-- Combine rows from two tables based on a related column.


-- Sample Tables

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

INSERT INTO Customers VALUES
(1, 'Uday'),
(2, 'Rahul'),
(3, 'Aman'),
(4, 'Neha'),
(5, 'Simran');

INSERT INTO Orders VALUES
(101, 1, 5000),
(102, 1, 7000),
(103, 2, 3000),
(104, 3, 4500),
(105, 3, 2000),
(106, 3, 1500),
(107, 5, 8000);
-- Note: Customer 4 (Neha) has no orders



-- 1️ INNER JOIN
-- Returns only matching rows from both tables

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id;



-- 2️ LEFT JOIN
-- Returns all rows from left table + matched rows from right
-- Unmatched rows return NULL for right table columns

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_amount
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;



-- 3️ RIGHT JOIN
-- Returns all rows from right table + matched rows from left
-- Unmatched rows return NULL for left table columns

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_amount
FROM Customers c
RIGHT JOIN Orders o
    ON c.customer_id = o.customer_id;



-- 4️ FULL OUTER JOIN
-- Returns all rows from both tables
-- MySQL does NOT support FULL OUTER JOIN directly
-- It can be simulated using UNION

-- Simulated FULL OUTER JOIN (MySQL)

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_amount
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id

UNION

SELECT c.customer_id,
       c.customer_name,
       o.order_id,
       o.order_amount
FROM Customers c
RIGHT JOIN Orders o
    ON c.customer_id = o.customer_id;



-- 5️ NATURAL JOIN
-- Automatically joins tables on columns with same name
--  Not recommended in production (implicit behavior)

SELECT *
FROM Customers
NATURAL JOIN Orders;



-- IMPORTANT NOTES

-- 1️ JOIN creates row combinations based on matching condition
-- 2️ INNER JOIN excludes unmatched rows
-- 3️ LEFT JOIN keeps all rows from left table
-- 4️ RIGHT JOIN keeps all rows from right table
-- 5️ FULL OUTER JOIN keeps all rows from both tables
-- 6️ NATURAL JOIN depends on identical column names


-- =========================================================
-- End of Basic Joins
-- =========================================================
