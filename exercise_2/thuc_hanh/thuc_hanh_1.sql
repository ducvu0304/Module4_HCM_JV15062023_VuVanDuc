DROP DATABASE IF EXISTS order_management;
CREATE DATABASE  IF NOT EXISTS order_management;
USE order_management;

-- Bảng sản phẩm
CREATE TABLE Product (
    id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` 			VARCHAR(255) NOT NULL,
    unit 			VARCHAR(50) NOT NULL,
    descriptions 	TEXT
);

-- Bảng đơn vị đặt hàng
CREATE TABLE Purcharer (
    id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` 			VARCHAR(255) NOT NULL,
    address 		VARCHAR(255) NOT NULL,
    phone_number 	VARCHAR(255) NOT NULL
);

-- Bảng đơn vị giao hàng
CREATE TABLE DeliveryCompany(
    id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` 			VARCHAR(255) NOT NULL,
    `address` 		VARCHAR(255) NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL
);

-- Bảng đơn đặt hàng
CREATE TABLE OrderDetail(
	id 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    quantity 		INT UNSIGNED CHECK(quantity > 0),
    order_date 		DATETIME DEFAULT NOW(),
    product_id 		INT UNSIGNED NOT NULL,
    puscharer_id 	INT UNSIGNED NOT NULL,
    CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES Product(id),
    CONSTRAINT fk_purcharer FOREIGN KEY(puscharer_id) REFERENCES Purcharer(id)
);

CREATE TABLE ReceiptDetail(
	order_id 			INT UNSIGNED,
    deliver_id			INT UNSIGNED,
    delivery_address 	VARCHAR(255) NOT NULL,
    delivery_date 		DATE,
    PRIMARY KEY(order_id, deliver_id),
    FOREIGN KEY (order_id) REFERENCES OrderDetail(id),
	FOREIGN KEY (deliver_id) REFERENCES DeliveryCompany(id)
);






