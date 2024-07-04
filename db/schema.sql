-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

\c ecommerce_db;

CREATE TABLE Category (
    id SERIAL NOT NULL PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL
);

CREATE TABLE Product (
    id SERIAL NOT NULL PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 10,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Tag (
    id SERIAL NOT NULL PRIMARY KEY,
    tag_name VARCHAR(30)
);

CREATE TABLE ProductTag (
    id SERIAL NOT NULL PRIMARY KEY,
    product_id INT,
    tag_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (tag_id) REFERENCES Tag(id)
);