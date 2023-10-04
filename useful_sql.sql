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

-- pg_class: list all different objects (tables, indexes, sequences, etc) that exist inside of our DB
-- 'i': index object
SELECT relname, relkind
FROM pg_class
WHERE relkind = 'i';

WITH RECURSIVE countdown(val) AS (
 	SELECT 3 AS val -- Initial, Non-recursive query
	UNION
	SELECT val - 1 FROM countdown WHERE val > 1 -- Recursive query
)

SELECT *
FROM countdown;

CREATE VIEW recent_posts AS (
	SELECT *
	FROM posts
	ORDER BY created_at DESC
	LIMIT 10
);

CREATE MATERIALIZED VIEW weekly_likes AS (
	SELECT 
		date_trunc('week', COALESCE(posts.created_at, comments.created_at)) AS week,
		COUNT(posts.id) AS num_likes_for_posts,
		COUNT(comments.id) AS num_likes_for_comments
	FROM likes
	LEFT JOIN posts ON posts.id = likes.post_id
	LEFT JOIN comments ON comments.id = likes.comment_id
	GROUP BY week
	ORDER BY week
) WITH DATA;

SELECT * 
FROM weekly_likes;

DELETE FROM posts
WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes;

SELECT * 
FROM weekly_likes;