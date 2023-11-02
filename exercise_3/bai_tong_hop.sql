DROP DATABASE IF EXISTS bai_tap_th_01;
CREATE DATABASE IF NOT EXISTS bai_tap_th_01;
USE bai_tap_th_01;

-- Bảng khách hàng
CREATE TABLE Customer(
	id 				VARCHAR(4) NOT NULL PRIMARY KEY,
    `name`			VARCHAR(30) NOT NULL,
    address  		VARCHAR(50),
    birth_day		DATETIME,
    phone_number 	VARCHAR(15) UNIQUE 
);

-- Bảng nhân viên
CREATE TABLE Employee(
	id 				VARCHAR(4) NOT NULL PRIMARY KEY,
	full_name		VARCHAR(30) NOT NULL,
    gender 			BOOLEAN DEFAULT TRUE,
    address			VARCHAR(50) NOT NULL,
    birth_day		DATETIME NOT NULL,
    phone_number	VARCHAR(15),
    email			TEXT,
    birth_place 	VARCHAR(20) NOT NULL,
    dob				DATETIME,
    management_id 	VARCHAR(4)
);

-- Bảng nhà cung cấp
CREATE TABLE Provider(
	id 				VARCHAR(5) NOT NULL PRIMARY KEY,
    `name` 			VARCHAR(50) NOT NULL,
    address 		VARCHAR(50) NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL,
    email 			VARCHAR(30) NOT NULL,
    website			VARCHAR(30)
);

-- Bảng loại sản phẩm
CREATE TABLE Category(
	id 		VARCHAR(4) NOT NULL PRIMARY KEY,
    `name` 	VARCHAR(255) NOT NULL,
    note 	VARCHAR(100)
);

-- Bảng sản phẩm
CREATE TABLE Product(
	id 			VARCHAR(4) NOT NULL PRIMARY KEY,
    category_id VARCHAR(4) NOT NULL,
    `name` 		VARCHAR(255) NOT NULL,
    unit 		VARCHAR(50) NOT NULL,
	note 		VARCHAR(100)
);

-- Bảng phiếu nhập
CREATE TABLE Receipt(
	id 			VARCHAR(5) NOT NULL PRIMARY KEY,
	employee_id VARCHAR(4) NOT NULL,
	provider_id VARCHAR(5) NOT NULL,
	import_date DATETIME NOT NULL DEFAULT NOW(),
    note  		VARCHAR(100)
);

-- Chi tiết phiếu nhập
CREATE TABLE ReceiptDetail(
	product_id 		VARCHAR(4) NOT NULL,
	receipt_id 	 	VARCHAR(5) NOT NULL,
    quantity	 	SMALLINT NOT NULL DEFAULT 0,
    import_price 	VARCHAR(4) CHECK (import_price > 0)
);

-- Phiếu xuất
CREATE TABLE Bill(
	id 			VARCHAR(5) NOT NULL PRIMARY KEY,
	employee_id VARCHAR(4) NOT NULL,
    customer_id VARCHAR(4) NOT NULL,
    export_date DATETIME NOT NULL ,
    note 		TEXT
);

CREATE TABLE BillDetail(
	bill_id		VARCHAR(5) NOT NULL,
	product_id  VARCHAR(4) NOT NULL,
	quantity	SMALLINT NOT NULL CHECK(quantity > 0),
    price		DECIMAL(12,0) NOT NULL CHECK(price > 0)
);

/*Bai tap 02*/
ALTER TABLE product
	ADD CONSTRAINT fk_product_category FOREIGN KEY(category_id) REFERENCES category(id);

ALTER TABLE receiptdetail	
	ADD PRIMARY KEY(product_id, receipt_id),
	ADD	CONSTRAINT fk_ReceiptDetail_product FOREIGN KEY(product_id) REFERENCES product(id),
	ADD	CONSTRAINT fk_ReceiptDetail_receipt FOREIGN KEY(receipt_id) REFERENCES receipt(id);

ALTER TABLE receipt
	ADD CONSTRAINT fk_receipt_employee FOREIGN KEY (employee_id) REFERENCES employee(id),
	ADD CONSTRAINT fk_receipt_provider FOREIGN KEY (provider_id) REFERENCES provider(id);

ALTER TABLE billdetail
	ADD PRIMARY KEY(bill_id, product_id),
	ADD CONSTRAINT fk_BillDetail_bill FOREIGN KEY (bill_id) REFERENCES bill(id),
	ADD CONSTRAINT fk_BillDetail_product FOREIGN KEY (product_id) REFERENCES product(id);

ALTER TABLE bill
ADD CONSTRAINT fk_bill_employee FOREIGN KEY(employee_id) REFERENCES employee(id),
ADD CONSTRAINT fk_bill_customer FOREIGN KEY(customer_id) REFERENCES customer(id);

-- bài tập 03
INSERT INTO Customer(id		, `name`		,	birth_day	)
VALUES			 	('KH01'	, 'Nguyễn Văn A',	'1980-01-20'),
					('KH02'	, 'Nguyễn Thị B',	'1985-04-23'),
					('KH03'	, 'Nguyễn Văn C',	'1978-11-20'),
					('KH04'	, 'Nguyễn Thị D',	'1980-11-30'),
					('KH05'	, 'Nguyễn Văn E',	'1995-11-21'),
					('KH06'	, 'Nguyễn Thị F',	'1992-06-12'),
					('KH07'	, 'Nguyễn Văn G',	'1988-07-20'),
					('KH08'	, 'Nguyễn Thị H',	'1985-04-11'),
					('KH09'	, 'Nguyễn Văn Z',	'1993-03-22'),
					('KH10'	, 'Nguyễn Thị Y',	'1983-08-15'),
					('KH11'	, 'Nguyễn Văn U',	'1988-10-03'),
					('KH12'	, 'Nguyễn Thị I',	'1987-11-17'),
					('KH13'	, 'Nguyễn Văn L',	'1987-01-20');

INSERT INTO Employee(id	   , 	full_name	 	, 	gender	, address	, birth_day		, birth_place, 	management_id)
VALUES			 	('NV01', 	'Trần Văn A'	, 	TRUE	, 'Tân Bình', '1991-10-10'	, 'Bình Định',	'E001'),
					('NV02', 	'Trần Thị B'	, 	FALSE 	, 'Tân Bình', '1994-12-10'	, 'Bình Định',	'E002'),
					('NV03', 	'Trần Văn C'	, 	TRUE	, 'Tân Bình', '1995-5-10'	, 'Bình Định',	'E001'),
					('NV04', 	'Trần Thị D'	, 	FALSE 	, 'Tân Bình', '1996-12-10'	, 'Bình Định',	'E001'),
					('NV05', 	'Trần Văn E'	, 	TRUE	, 'Tân Bình', '1990-3-10'	, 'Bình Định',	'E002');

INSERT INTO Provider(id		, `name`	,  address	, 	phone_number	, email)
VALUES				('PD001', 'Nike'	, 'Tan Binh', 	'0908666666'	, 'Nike@gmail.com'),
					('PD002', 'Asics'	, 'Tan Binh', 	'0908666666'	, 'Nike@gmail.com'),
					('PD003', 'Addias'	, 'Tan Binh', 	'0908666666'	, 'Nike@gmail.com'),
					('PD004', 'Puma'	, 'Tan Binh', 	'0908666666'	, 'Nike@gmail.com');
				
INSERT INTO Category(id		, 	`name`		)
VALUES				('CG01', 	'Running'	),
					('CG02', 	'Hikking'	),
					('CG03', 	'Tennis'	),
					('CG04', 	'Indoor'	);
                    
INSERT INTO Product	(id		, 	category_id	,	`name`					, 	unit	)
VALUES			 	('SP01'	, 	'CG01'	,		'METASPEED EDGE+'		,	'đôi'	),
					('SP02'	, 	'CG01'	,		'GEL-KAYANO 30'			,	'đôi'	),
					('SP03'	, 	'CG03'	,		'VERSABLAST 2'			,	'đôi'	),
					('SP04'	, 	'CG02'	,		'FUJISPEED 2'			,	'đôi'	),
					('SP05'	, 	'CG02'	,		'FUJISPEED'				,	'đôi'	),
					('SP06'	, 	'CG03'	,		'GEL-RESOLUTION 9'		,	'đôi'	),
					('SP07'	, 	'CG04'	,		'GEL-ROCKET 11'			,	'đôi'	),
					('SP08'	, 	'CG01'	,		'GEL-KAYANO 29'			,	'đôi'	),
					('SP09'	, 	'CG03'	,		'SOLUTION SPEED FF 2'	,	'đôi'	),
					('SP10'	, 	'CG04'	,		'GEL-ROCKET 11'			,	'đôi'	),
					('SP11'	, 	'CG01'	,		'GEL-KAYANO 29'			,	'đôi'	),
					('SP12'	, 	'CG03'	,		'SOLUTION SPEED FF 2'	,	'đôi'	),
					('SP13'	, 	'CG04'	,		'GEL-ROCKET 11'			,	'đôi'	),
					('SP14'	, 	'CG01'	,		'GEL-KAYANO 29'			,	'đôi'	),
					('SP15'	, 	'CG03'	,		'SOLUTION SPEED FF 2'	,	'đôi'	),
					('SP16'	, 	'CG04'	,		'SKY ELITE FF MT 2'	 	,	'đôi'	);
                    
INSERT INTO Receipt	(id		, 	employee_id	,	provider_id	,	import_date	)
VALUES			 	('RC001', 	'NV02'	,		'PD002'		,	'2018-1-20'),
					('RC002', 	'NV02'	,		'PD002'		,	'2018-2-23'),
					('RC003', 	'NV03'	,		'PD002'		,	'2018-3-02'),
					('RC004', 	'NV02'	,		'PD002'		,	'2018-5-20'),
					('RC005', 	'NV02'	,		'PD002'		,	'2018-6-10'),
					('RC006', 	'NV03'	,		'PD002'		,	'2018-6-20'),
					('RC007', 	'NV04'	,		'PD002'		,	'2018-9-13'),
					('RC008', 	'NV02'	,		'PD002'		,	'2018-10-5'),
					('RC009', 	'NV03'	,		'PD002'		,	'2018-11-10'),
					('RC010', 	'NV04'	,		'PD002'	 	,	'2018-12-20');
                    
INSERT INTO ReceiptDetail	(receipt_id	, 	product_id	,	quantity,	import_price)
VALUES			 			('RC001'	, 	'SP01'		,	5		,	1200		),
							('RC001'	, 	'SP02'		,	10		,	1500		),
							('RC003'	, 	'SP02'		,	10		,	900			),
                            ('RC003'	, 	'SP03'		,	10		,	900			),
							('RC003'	, 	'SP08'		,	10		,	900			),
							('RC004'	, 	'SP04'		,	12		,	750			),
							('RC005'	, 	'SP05'		,	5		,	1700		),
							('RC006'	, 	'SP01'		,	8		,	1600		),
                            ('RC006'	, 	'SP10'		,	8		,	1600		),
							('RC007'	, 	'SP06'		,	14		,	1300		),
                            ('RC007'	, 	'SP03'		,	14		,	1300		),
							('RC008'	, 	'SP07'		,	15		,	860			),
							('RC009'	, 	'SP01'		,	15		,	965			),
                            ('RC009'	, 	'SP02'		,	11		,	965			),
                            ('RC009'	, 	'SP06'		,	14		,	965			),
							('RC010'	, 	'SP04'		,	20		,	1400 		);	

INSERT INTO Bill	(id		, 	employee_id	,	customer_id	, 	export_date	)
VALUES			 	('B0001', 	'NV02'	,		'KH02'		, 	'2018-1-15'	),
					('B0002', 	'NV02'	,		'KH03'		, 	'2018-2-15'	),
					('B0003', 	'NV03'	,		'KH02'		, 	'2018-3-20'	),
					('B0004', 	'NV02'	,		'KH01'		, 	'2018-4-20'	),
					('B0005', 	'NV02'	,		'KH02'		,	'2018-5-23'	),
					('B0006', 	'NV03'	,		'KH04'		,	'2018-6-30'	),
					('B0007', 	'NV04'	,		'KH02'		,	'2018-7-01'	),
					('B0008', 	'NV02'	,		'KH02'		,	'2018-8-05'	),
					('B0009', 	'NV03'	,		'KH03'		,	'2018-9-10'	),
					('B0010', 	'NV04'	,		'KH01'		,	'2018-10-15');
                    
INSERT INTO BillDetail	(bill_id	, 	product_id	,	quantity,	price		)
VALUES			 		('B0001'	, 	'SP01'		,	2		,	1200* 1.2	),
						('B0001'	, 	'SP02'		,	4		,	1500* 1.2	),
						('B0003'	, 	'SP02'		,	2		,	900	* 1.2	),
						('B0003'	, 	'SP03'		,	4		,	900	* 1.2	),
						('B0003'	, 	'SP08'		,	5		,	900	* 1.2	),
						('B0004'	, 	'SP04'		,	8		,	750	* 1.2	),
						('B0005'	, 	'SP05'		,	7		,	1700* 1.2	),
						('B0006'	, 	'SP01'		,	3		,	1600* 1.2	),
						('B0006'	, 	'SP10'		,	4		,	1600* 1.2	),
						('B0007'	, 	'SP06'		,	4		,	1300* 1.2	),
						('B0007'	, 	'SP03'		,	7		,	1300* 1.2	),
						('B0008'	, 	'SP07'		,	6		,	860	* 1.2	),
						('B0009'	, 	'SP01'		,	7		,	965	* 1.2	),
						('B0009'	, 	'SP02'		,	9		,	965	* 1.2	),
						('B0009'	, 	'SP06'		,	2		,	965	* 1.2	),
						('B0010'	, 	'SP04'		,	4		,	1400* 1.2	);	
                        
