CREATE TABLE Users (
    id int NOT NULL auto_increment,
    age int,
    role_id int,
    PRIMARY KEY (id),
    FOREGIN KEY (role_id) REFERENCES roles(role_id)
);