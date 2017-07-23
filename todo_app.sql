DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app;

CREATE TABLE tasks ( id SERIAL NOT NULL, title VARCHAR(255) NOT NULL, description TEXT, created_at TIMESTAMP WITHOUT time zone NOT NULL DEFAULT NOW(), updated_at TIMESTAMP WITHOUT time zone, completed BOOL NOT NULL DEFAULT false);

\d tasks;