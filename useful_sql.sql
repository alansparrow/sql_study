A Heap file holds all data for a single table.
A Heap includes many Pages/Blocks, which have Tuples (rows). Each page is 8KB.

SHOW data_directory;

-- List all DB
SELECT oid, datname
FROM pg_database;

SELECT *
FROM pg_class;

CREATE INDEX ON users (username);
DROP INDEX users_username_idx;

EXPLAIN ANALYZE 
SELECT *
FROM users
WHERE username = 'Emil30';

-- Size of index
SELECT pg_size_pretty(pg_relation_size('users'));
SELECT pg_size_pretty(pg_relation_size('users_username_idx'));