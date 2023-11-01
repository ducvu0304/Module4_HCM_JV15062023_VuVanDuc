DROP DATABASE IF EXISTS bt_th_01;
CREATE DATABASE IF NOT EXISTS bt_th_01;
USE bt_th_01;

CREATE TABLE Customer(
	id 				VARCHAR(4) NOT NULL PRIMARY KEY,
    `name`			VARCHAR(30) NOT NULL,
    address  		VARCHAR(50),
    birth_day		DATETIME,
    phone_number 	VARCHAR(50) UNIQUE 
);

CREATE TABLE Employee(
	id 				VARCHAR(4) NOT NULL PRIMARY KEY,
	full_name		VARCHAR(30) NOT NULL,
    gender 			BOOLEAN DEFAULT TRUE,
    address			VARCHAR(50) NOT NULL,
    birth_day		DATETIME NOT NULL,
    phone_number	VARCHAR(15),
    email			TEXT,
    birth_place 	VARCHAR(20) NOT NULL,
    work_date		DATETIME,
    management_id 	VARCHAR(4),
    FOREIGN KEY (management_id) REFERENCES Employee(id)
);

CREATE TABLE Provider(
	id 				VARCHAR(5) NOT NULL PRIMARY KEY,
    `name` 			VARCHAR(50) NOT NULL,
    address 		VARCHAR(50) NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL,
    email 			VARCHAR(30) NOT NULL,
    website			VARCHAR(30)
);

CREATE TABLE Category(
	id 		VARCHAR(4) NOT NULL PRIMARY KEY,
    `name` 	VARCHAR(30) NOT NULL,
    note 	VARCHAR(100) NOT NULL
);

CREATE TABLE Product(
	id 			VARCHAR(4) NOT NULL PRIMARY KEY,
    category_id VARCHAR(4) NOT NULL,
    `name` 		VARCHAR(50) NOT NULL,
    unit 		VARCHAR(10) NOT NULL,
	note 		VARCHAR(100),
    CONSTRAINT fk_category 
    FOREIGN KEY (category_id) 
    REFERENCES Category(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Receipt(
	id 			VARCHAR(5) NOT NULL PRIMARY KEY,
	employee_id VARCHAR(4) NOT NULL,
	provider_id VARCHAR(5) NOT NULL,
	import_date DATETIME NOT NULL DEFAULT NOW(),
    note  		VARCHAR(100),
	CONSTRAINT fk_receipt_employee FOREIGN KEY (employee_id)  REFERENCES Employee(id),
    CONSTRAINT fk_receipt_provider FOREIGN KEY (provider_id) REFERENCES Provider(id)
);

CREATE TABLE ReceiptDetail(
	product_id 		VARCHAR(4) NOT NULL,
	receipt_id 	 	VARCHAR(5) NOT NULL,
    quantity	 	SMALLINT NOT NULL DEFAULT 0,
    import_price 	VARCHAR(4) CHECK (import_price > 0),
    PRIMARY KEY (product_id, receipt_id),
	CONSTRAINT fk_ReceiptDetail_Product FOREIGN KEY (product_id) REFERENCES Product(id),
    CONSTRAINT fk_ReceiptDetail_Receipt FOREIGN KEY (receipt_id) REFERENCES Receipt(id)
);


CREATE TABLE Bill(
	id 			VARCHAR(5) NOT NULL PRIMARY KEY,
	employee_id VARCHAR(4) NOT NULL,
    customer_id VARCHAR(4) NOT NULL,
    export_date DATETIME NOT NULL DEFAULT NOW(),
    note 		TEXT,
    CONSTRAINT fk_bill_employee FOREIGN KEY(employee_id) REFERENCES Employee(id),
	CONSTRAINT fk_bill_customer FOREIGN KEY(customer_id) REFERENCES Customer(id)
);

CREATE TABLE BillDetail(
	bill_id		VARCHAR(5) NOT NULL,
	customer_id VARCHAR(4) NOT NULL,
	quantity	SMALLINT NOT NULL CHECK(quantity > 0),
    price		DECIMAL(12,0) NOT NULL CHECK(price > 0),
    CONSTRAINT fk_BillDetail_Bill FOREIGN KEY(bill_id) REFERENCES Bill(id),
	CONSTRAINT fk_BillDetail_Customer FOREIGN KEY(customer_id) REFERENCES Customer(id)
);

INSERT INTO Customer(id, `name`)
VALUES			 	('CS01', 'Nguyễn Văn A'),
					('CS02', 'Nguyễn Thị B'),
					('CS03', 'Nguyễn Văn C'),
					('CS04', 'Nguyễn Thị D'),
					('CS05', 'Nguyễn Văn E');

INSERT INTO Employee(id, full_name, gender, address, birth_day, birth_place)
VALUES			 	('EM01', 'Trần Văn A', TRUE, 'Tân Bình', '1991-10-10', 'Bình Định'),
					('EM02', 'Trần Thị B', FALSE, 'Tân Bình', '1994-12-10', 'Bình Định'),
					('EM03', 'Trần Văn C', TRUE, 'Tân Bình', '1995-5-10', 'Bình Định'),
					('EM04', 'Trần Thị D', FALSE, 'Tân Bình', '1996-12-10', 'Bình Định'),
					('EM05', 'Trần Văn E', TRUE, 'Tân Bình', '1990-3-10', 'Bình Định');



