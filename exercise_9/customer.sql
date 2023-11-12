DROP DATABASE IF EXISTS customer_management;
CREATE DATABASE IF NOT EXISTS customer_management;
USE customer_management;

CREATE TABLE customers(
	id 		 INT AUTO_INCREMENT PRIMARY KEY,
    `name` 	 VARCHAR(255) NOT NULL,
    birthday DATE,
    address  VARCHAR(255) NOT NULL,
    img 	 TEXT(255)
);
