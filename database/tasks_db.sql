CREATE DATABASE IF NOT EXISTS tasks_db
    CHARACTER SET utf8 COLLATE utf8_spanish_ci;

DROP DATABASE tasks_db;

SHOW CREATE
DATABASE tasks_db;

USE tasks_db;

CREATE TABLE IF NOT EXISTS ROLES (
    role_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (role_id)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS USERS_ROLES (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    CONSTRAINT fk_student_id FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES ROLES (role_id) ON UPDATE NO ACTION ON DELETE NO ACTION
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS USERS (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(35) NOT NULL,
    full_name VARCHAR(40) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS TASKS (
    task_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    author VARCHAR(25) NOT NULL,
    description TEXT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (task_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_spanish_ci;

ALTER TABLE tasks
    MODIFY COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON
    UPDATE CURRENT_TIMESTAMP;

ALTER TABLE tasks
    ADD COLUMN user_id INT NOT NULL AFTER description;

ALTER TABLE tasks
    DROP
    CONSTRAINT fk_user_id;

DROP INDEX fk_user_id ON tasks;

ALTER TABLE tasks
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
        ON UPDATE CASCADE ON DELETE CASCADE;

DESCRIBE tasks;

SELECT * FROM tasks;

INSERT INTO tasks (title, author, description)
    VALUE ('MUSICS', 'LUCAS', 'JAPAN MUSIC OF MERRY CHRISTMAS');

UPDATE tasks
    SET author='MARIA',description='ROCK MUSIC FOR EVERYONE'
    WHERE task_id = 2;

DELETE FROM tasks; #test

ALTER TABLE tasks AUTO_INCREMENT = 0;
ALTER TABLE roles AUTO_INCREMENT = 0;

INSERT INTO roles (`name`)
    VALUES ("ROLE_USER");

INSERT INTO roles (`name`)
    VALUES ("ROLE_MODERATOR");

INSERT INTO roles (`name`)
    VALUES ("ROLE_ADMIN");

ALTER TABLE USERS_ROLES
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (user_id)
        ON UPDATE NO ACTION ON DELETE NO ACTION;

SHOW INDEX FROM USERS_ROLES;

ALTER TABLE USERS_ROLES
    DROP CONSTRAINT FKj6m8fwv7oqv74fcehir1a9ffy;

DROP INDEX FKj6m8fwv7oqv74fcehir1a9ffy ON USERS_ROLES;