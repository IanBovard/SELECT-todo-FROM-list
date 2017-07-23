\c radlad;

DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app;

CREATE TABLE tasks ( id SERIAL NOT NULL, title VARCHAR(255) NOT NULL, description TEXT, created_at TIMESTAMP WITHOUT time zone NOT NULL DEFAULT NOW (), updated_at TIMESTAMP WITHOUT time zone, completed BOOL NOT NULL DEFAULT false );

ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP WITHOUT time zone DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW ();

INSERT INTO tasks VALUES ( DEFAULT, 'Study SQL', 'Complete this exercise', NOW (), NOW(), NULL );

INSERT INTO tasks (title, description)
  VALUES('Study PostgreSQL', 'Read all of the documentation');

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
  VALUES('mistake 1', 'a test entry');
INSERT INTO tasks (title, description)
  VALUES('mistake 2', 'another test entry');
INSERT INTO tasks (title, description)
  VALUES('mistake 3', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;