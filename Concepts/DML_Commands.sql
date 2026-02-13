-- Concept: DML (Data Manipulation Language)
-- DML commands are used to insert, modify, and delete
-- data inside existing database tables.
-- Unlike DDL, DML affects table records, not structure.

-- Assume Students table already exists.

-- 1️ INSERT
-- Adds new records into a table

INSERT INTO Students (id, name, age)
VALUES (1, 'Uday', 22);

-- 2️ UPDATE
-- Modifies existing records in a table.
-- The SET keyword is used to specify which column(s)
-- should be updated and what new value should be assigned.

UPDATE Students
SET age = 23
WHERE id = 1;

-- 3️ DELETE
-- Removes specific records from a table

DELETE FROM Students
WHERE id = 1;
