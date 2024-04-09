CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    delivery VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS user_roles (
    user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);
Drop table books;
CREATE TABLE IF NOT EXISTS Books (
    ID int auto_increment,
    NAME varchar(50) NOT NULL,
    Author varchar(50) NOT NULL,
    Price float check (Price >= 0) NOT NULL,
    Description varchar(100),
    PHOTO image,
    PHOTO_FILE_NAME varchar,
    Availability int check (Availability >= 0) NOT NULL,
    COMMENTS varchar(255) array,
    quantity int check(quantity >= 0) NOT NULL,
    PRIMARY KEY (ID)
);
