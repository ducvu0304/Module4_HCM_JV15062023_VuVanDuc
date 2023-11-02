-- Exericse 3
INSERT INTO Employee(id	   , 	full_name	 	, 	gender	, address	, birth_day		, birth_place, 	management_id)
VALUES			 	('NV06', 	'Trần Văn A'	, 	TRUE	, 'Tân Bình', '1991-10-10'	, 'Bình Định',	'E001');

-- Exericse 4
UPDATE customer
SET phone_number = '0966666666'
WHERE id LIKE ('KH10');

UPDATE employee
SET address = 'Bình Tân'
WHERE id LIKE('NV05');

-- Exercise 5
DELETE FROM employee
WHERE id LIKE('NV06');

DELETE FROM product
WHERE id LIKE('SP15');

-- Exercise 6.1
SELECT id, full_name, gender, birth_day, address, phone_number, (year(now()) - year(birth_day)) age
FROM bai_tap_th_01.employee
ORDER BY age;

-- Exercise 6.2
SELECT r.id, r.employee_id, e.full_name ten_nv, p.name nha_cc
FROM receipt r
INNER JOIN employee e ON e.id  = r.employee_id
INNER JOIN provider p ON p.id  = r.provider_id
WHERE month(import_date) = 6;

-- Exercise 6.3
SELECT * FROM bai_tap_th_01.product
WHERE unit LIKE('đôi');

-- Exercise 6.4
SELECT 
	rd.receipt_id, 
    rd.product_id, 
    p.name, 
    c.name category, 
    rd.quantity, 
    rd.import_price,
    rd.quantity * rd.import_price as total
FROM receiptdetail rd
	INNER JOIN product p ON p.id = rd.product_id
	INNER JOIN category c ON c.id = p.category_id
	INNER JOIN receipt r ON r.id = rd.receipt_id
WHERE month(r.import_date) = month(now());

-- Exercise 6.5
SELECT 
	p.*, r.id,  dayofmonth(r.import_date) `date`
FROM receiptdetail rd
	INNER JOIN receipt r ON r.id = rd.receipt_id
    INNER JOIN provider p ON p.id = r.provider_id
WHERE month(r.import_date) = month(now())
ORDER BY `date`;

-- Exercise 6.6
SELECT 
	bd.bill_id, 
    c.name, 
    b.export_date, 
    bd.product_id,
    p.name, 
    bd.quantity,
    bd.price,
    bd.quantity * bd.price total
FROM billdetail bd
	INNER JOIN bill b ON b.id = bd.bill_id
	INNER JOIN customer c ON c.id = b.customer_id
    INNER JOIN product p ON p.id = bd.product_id
WHERE month(b.export_date) <= 6;

-- Exercise 6.7
SELECT * 
FROM bai_tap_th_01.customer
WHERE month(birth_day) = month(now());

-- Exercise 6.8
SELECT 
	b.id, 
    e.full_name,
    b.export_date, 
    bd.product_id, 
    p.name, 
    bd.quantity, 
    bd.price,
    bd.quantity * bd.price total
FROM bill b
	INNER JOIN employee e ON e.id = b.employee_id
    INNER JOIN billdetail bd ON bd.bill_id = b.id
    INNER JOIN product p ON p.id = bd.product_id
WHERE b.export_date BETWEEN '2018-04-15' AND '2018-05-15';

-- Exercise 6.9
SELECT 
	b.id, 
    b.export_date, 
    b.customer_id, 
    c.name,
    bd.quantity * bd.price total
FROM bill b
	INNER JOIN customer c ON c.id = b.customer_id
    INNER JOIN billdetail bd ON bd.bill_id = b.id
ORDER BY b.id;

-- Exercise 6.10
SELECT 
    p.name,
    sum(quantity) total
FROM billdetail bd 
	INNER JOIN bill b ON b.id = bd.bill_id
    INNER JOIN product p ON p.id = bd.product_id
WHERE p.name LIKE('GEL-RESOLUTION 9')
GROUP BY p.name;

-- Exercise 6.11
SELECT 
	month(b.export_date) `month`,
    c.id,
    c.name,
    c.address,
	bd.quantity * bd.price total
FROM customer c
	LEFT JOIN bill b ON b.customer_id = c.id
    INNER JOIN billdetail bd ON bd.bill_id = b.id;

-- Exercise 6.12
SELECT 
	year(b.export_date) `year`,
    month(b.export_date) `month`,
    bd.product_id,
    p.name,
    p.unit,
    bd.quantity
FROM bill b
	INNER JOIN billdetail bd ON bd.bill_id = b.id
    INNER JOIN product p ON p.id = bd.product_id;

-- Exercise 6.13
SELECT 
	month(b.export_date) `month`,
    SUM(bd.quantity * bd.price) total
FROM bill b
	INNER JOIN billdetail bd ON bd.bill_id = b.id
GROUP BY `month`
HAVING `month` <= 6;

-- Exercise 6.14
SELECT 
	b.id,
    b.export_date, 
    e.full_name,
    c.name,
    bd.quantity * bd.price total
FROM bill b
	INNER JOIN employee e ON e.id = b.employee_id
    INNER JOIN customer c ON c.id = b.customer_id
    INNER JOIN billdetail bd ON  bd.bill_id = b.id
HAVING month(b.export_date) BETWEEN 5 AND 6;

-- Exercise 6.15
SELECT 
	b.id,
    b.customer_id, 
    c.name,
    e.full_name,
    b.export_date,
    bd.price * bd.quantity total
FROM bill b
	INNER JOIN employee e ON e.id = b.employee_id
    INNER JOIN customer c ON c.id = b.customer_id
    INNER JOIN billdetail bd ON  bd.bill_id = b.id;
    
-- Exercise 6.16
SELECT 
    e.full_name,
    ifnull(sum(bd.quantity * bd.price), 0) total
FROM employee e
	LEFT JOIN bill b ON b.employee_id = e.id
    LEFT JOIN billdetail bd ON bd.bill_id = b.id
GROUP BY e.full_name;

-- Exercise 6.17
SELECT 
	b.id,
    b.export_date,
    bd.product_id,
    p.name,
    bd.quantity,
    bd.price,
    bd.price * bd.quantity total
FROM bill b
	INNER JOIN billdetail bd ON bd.bill_id = b.id
    INNER JOIN product p ON p.id = bd.product_id
	INNER JOIN customer c ON c.id = b.customer_id
WHERE b.customer_id LIKE('KH01') 
HAVING month(export_date) BETWEEN 4 AND 6 ;

-- Exercise 6.18

