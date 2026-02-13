-- Concept: DDL (Data Definition Language)
-- These are basic DDL commands used to define and modify
-- the structure of database objects.
-- DDL operations are mainly performed during the initial
-- setup and design phase of a database.

-- 1 CREATE TABLE
-- Creates a new table in the database

CREATE TABLE Students (
    id INT,
    name VARCHAR(50),
    age INT
);

-- 2️ ALTER TABLE
-- Modifies the structure of an existing table
-- The ADD keyword is used to introduce a new column without deleting existing data.

ALTER TABLE Students
ADD email VARCHAR(100);

-- 3️ DROP TABLE
-- Permanently deletes the table from the database

DROP TABLE Students;
