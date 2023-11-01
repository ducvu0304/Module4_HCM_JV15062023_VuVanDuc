DROP DATABASE IF EXISTS sale_management;
CREATE DATABASE IF NOT EXISTS sale_management;
USE sale_management;

CREATE TABLE Product(
	product_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(12,0)
);

CREATE TABLE Customer(
	customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    age SMALLINT NOT NULL
);

CREATE TABLE `Order`(
	order_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	order_date DATE,
    total_price DECIMAL(10,2),
    customer_id INT UNSIGNED,
    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
		ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE OrderDetail(
	order_id INT UNSIGNED,
    product_id INT UNSIGNED,
    quantity SMALLINT CHECK(quantity >0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
);