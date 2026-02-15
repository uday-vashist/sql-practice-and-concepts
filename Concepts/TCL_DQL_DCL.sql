-- TCL (Transaction Control Language)
-- Used to manage transactions and control changes
-- made by DML statements.

-- 1️ COMMIT
-- Permanently saves changes in the current transaction.
COMMIT;

-- 2️ ROLLBACK
-- Reverts changes made in the current transaction.
ROLLBACK;

-- 3️ SAVEPOINT
-- Creates a point within a transaction to which
-- we can roll back later.
SAVEPOINT sp1;
ROLLBACK TO sp1;



-- DQL (Data Query Language)
-- Used to retrieve data from database tables.

-- 1️ SELECT
-- Retrieves data from one or more tables.

SELECT *
FROM Students;

SELECT name, age
FROM Students
WHERE age > 20;


-- DCL (Data Control Language)
-- Used to manage user permissions and access control.

-- 1️ GRANT
-- Gives specific privileges to a user.

GRANT SELECT, INSERT
ON Students
TO user_name;

-- 2️ REVOKE
-- Removes previously granted privileges.

REVOKE INSERT
ON Students
FROM user_name;
