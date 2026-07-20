CREATE DATABASE ProductDB;
USE ProductDB;
DROP TABLE products;
CREATE TABLE Products (
ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    Manufacturer VARCHAR(100)
);
INSERT INTO Products
(ProductID, ProductName, Category, Price, Quantity, Manufacturer)
VALUES
(101, 'Laptop', 'Electronics', 65000.00, 15, 'Dell'),
(102, 'Smartphone', 'Electronics', 35000.00, 30, 'Samsung'),
(103, 'Headphones', 'Accessories', 2500.00, 50, 'Sony'),
(104, 'Keyboard', 'Accessories', 1200.00, 40, 'Logitech'),
(105, 'Mouse', 'Accessories', 800.00, 60, 'HP'),
(106, 'Monitor', 'Electronics', 15000.00, 20, 'LG'),
(107, 'Printer', 'Office', 9500.00, 10, 'Canon'),
(108, 'Tablet', 'Electronics', 28000.00, 18, 'Apple'),
(109, 'Webcam', 'Accessories', 3200.00, 25, 'Logitech'),
(110, 'Speaker', 'Audio', 4500.00, 35, 'JBL');
SELECT * FROM Products;
ALTER TABLE Products
RENAME COLUMN Manufacturer TO Brand;
SELECT * FROM Products;
ALTER TABLE Products
ADD CONSTRAINT pk_product  #Already Product_ID is PK
PRIMARY KEY (ProductID);
ALTER TABLE Products
ADD CONSTRAINT chk_price
CHECK (Price > 0);
ALTER TABLE Products
ADD CONSTRAINT uq_product_name
UNIQUE (ProductName);

ALTER TABLE Products
ADD CategoryID INT;

TRUNCATE TABLE Products;
SELECT * FROM Products; 

DROP TABLE Products;
SELECT * FROM Products; 

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT,
    Manufacturer VARCHAR(100)
);
INSERT INTO Products
(ProductID, ProductName, Category, Price, Quantity, Manufacturer)
VALUES
(101, 'Laptop', 'Electronics', 65000, 15, 'Dell'),
(102, 'Smartphone', 'Electronics', 35000, 30, 'Samsung');

SELECT * FROM Products;

ALTER TABLE Products
MODIFY Category VARCHAR(50) NOT NULL;

ALTER TABLE Products
MODIFY Quantity INT NOT NULL;

ALTER TABLE Products
MODIFY Manufacturer VARCHAR(100) NOT NULL;

SELECT * FROM Products;
SELECT * 
FROM Products
WHERE Category IS NULL 
   OR Quantity IS NULL
   OR Manufacturer IS NULL;

