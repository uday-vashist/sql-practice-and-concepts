-- CONCEPT: SQL CONSTRAINTS & KEY CLASSIFICATION
-- Purpose: Enforce data integrity and understand relational key hierarchy.


-- 1️ PRIMARY KEY
-- Enforces uniqueness + NOT NULL
-- Only one per table (can be composite)

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT
);


-- Composite Primary Key Example

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);


-- 2️ UNIQUE (Represents Alternate Keys)

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    username VARCHAR(50) UNIQUE
);


-- 3️ NOT NULL

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2)
);


-- 4️ CHECK
-- Enforces business rules at the database level.
-- Prevents logically invalid data.

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT CHECK (stock >= 0)
);


-- 5️ DEFAULT
-- Assigns automatic value when no value is provided.
-- Useful for status flags, timestamps, counters.

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'PENDING'
);


-- 6️ FOREIGN KEY

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

CREATE TABLE Customer_Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- 7️ ALTER TABLE (Adding Constraint)

CREATE TABLE Accounts (
    account_id INT,
    balance DECIMAL(10,2)
);

ALTER TABLE Accounts
ADD CONSTRAINT pk_account
PRIMARY KEY (account_id);



-- 8️ KEY CLASSIFICATION (Conceptual Layer)
-- These are logical classifications, not separate SQL syntax.

-- Example Table: Users

-- user_id → PRIMARY KEY
-- email → UNIQUE
-- username → UNIQUE

-- Super Keys:
-- (user_id)
-- (email)
-- (username)
-- (user_id, email)
-- (user_id, username)
-- (email, username)
-- (user_id, email, username)

-- Candidate Keys (Minimal Super Keys):
-- user_id
-- email
-- username

-- Primary Key:
-- user_id

-- Alternate Keys:
-- email
-- username

-- Composite Key Example:
-- (student_id, course_id) in Enrollments table


-- End of Constraints & Key Classification
