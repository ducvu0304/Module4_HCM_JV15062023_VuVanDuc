DROP DATABASE IF EXISTS demo;
CREATE DATABASE IF NOT EXISTS demo;
Use demo;

CREATE TABLE Products(
	id 					INT	AUTO_INCREMENT PRIMARY KEY,
	productCode			VARCHAR(4) NOT NULL,
	productName			VARCHAR(255) NOT NULL,
	productPrice		DECIMAL NOT NULL,
	productAmount		INT DEFAULT 0,
	productDescription	VARCHAR(255) NOT NULL,
	productStatus		BOOLEAN DEFAULT TRUE
);

INSERT INTO Products(productCode, productName	, productPrice, productAmount	, productDescription)
    VALUES 			("1234",	  "productName"	, 10, 			4				, "productDescription"),
					("1235",	  "productName"	, 10, 			4				, "productDescription"),
					("1236",	  "productName"	, 10, 			4				, "productDescription"),
					("1237",	  "productName"	, 10, 			4				, "productDescription");

CREATE UNIQUE INDEX unique_index
ON Products(productCode);

CREATE INDEX composite_index 
ON Products (productName, productPrice);

EXPLAIN SELECT *
FROM Products;

CREATE VIEW ViewProduct AS
    SELECT productCode, productName, productPrice, productStatus 
    FROM Products;
    
UPDATE ViewProduct 
SET productName = '+33 14 723 5555'
WHERE productCode = "1234";

DROP VIEW ViewProduct;


-- Procedure
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM Products;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AddProduct()
BEGIN
	INSERT INTO Products(productCode, productName	, productPrice	,productAmount	, productAmount	 , productDescription	,productStatus)
    VALUES 				("1234",	  "productName"	, "productPrice","productAmount", "productAmount", "productDescription" , "productStatus");
END //                   			
                        	
DELIMITER ;              		
		
        
        
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN productId INT,
    IN productName VARCHAR(100),
    IN category VARCHAR(50),
    IN price DECIMAL(10,2)
)
BEGIN
    UPDATE Product
    SET ProductName = productName,
        Category = category,
        Price = price
    WHERE ID = productId;
END//
DELIMITER ;   
             
             
DELIMITER //         
CREATE PROCEDURE DeleteProduct(
    IN productId INT
)
BEGIN
    DELETE FROM Product
    WHERE ID = productId;
END//
DELIMITER ;   
                         		