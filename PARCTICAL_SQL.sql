create database RIDA_1443041;

     -----QNO: 1-----

create table customers(customerID int primary key,
firstName varchar(30),
lastName varchar (20),
email varchar(50),
phoneNumber varchar(20) );

 ---- insert records in customers table -------

INSERT INTO customers (customerID, firstName, lastName, email, phoneNumber) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 1234567890),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 9876543210),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 5551234567),
(4, 'Emily', 'Brown', 'emily.brown@example.com', 3334445555),
(5, 'Daniel', 'Wilson', 'daniel.wilson@example.com', 1112223333),
(6, 'Sarah', 'Anderson', 'sarah.anderson@example.com', 9998887777),
(7, 'David', 'Martinez', 'david.martinez@example.com', 6667778888),
(8, 'Jennifer', 'Taylor', 'jennifer.taylor@example.com', 4445556666),
(9, 'James', 'Garcia', 'james.garcia@example.com', 2223334444),
(10, 'Jessica', 'Lee', 'jessica.lee@example.com', 8889990000),
(11, 'Christopher', 'Hernandez', 'christopher.hernandez@example.com', 7776665555);


-------------- QNO: 2  ORDERS TABLE ---------------------

create table orders( orderID int primary key ,
customerID int,
orderDate date,
totalAmount decimal(10,2));

  ---- insert records in orders table -------

INSERT INTO orders (orderID, customerID, orderDate, totalAmount) VALUES
(1, 1, '2024-02-17', 100.00),
(2, 2, '2024-02-17', 75.50),
(3, 3, '2024-02-16', 200.25),
(4, 4, '2024-02-16', 50.75),
(5, 5, '2024-02-15', 300.00),
(6, 6, '2024-02-15', 150.50),
(7, 7, '2024-02-14', 75.25),
(8, 8, '2024-02-14', 125.75),
(9, 9, '2024-02-13', 175.00),
(10, 10, '2024-02-13', 225.50),
(11, 11, '2024-02-12', 250.25),
(12, 12, '2024-02-12', 300.75),
(13, 13, '2024-02-11', 50.00),
(14, 14, '2024-02-11', 100.50),
(15, 15, '2024-02-10', 125.25);



-------------- QNO: 3  ORDERS TABLE ---------------------
create table order_details( OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
UnitPrice decimal(10,2));

INSERT INTO  order_details (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice ) VALUES
(1, 1, 101,  50.00, 100),
(2, 1, 102,  75.00, 150),
(3, 2, 103,  100.00, 200),
(4, 2, 104,  25.00, 50),
(5, 3, 105,  150.00, 300),
(6, 3, 106,  80.00, 100),
(7, 4, 107,  70.00, 75),
(8, 4, 108,  120.00, 125),
(9, 5, 109,  90.00, 175),
(10, 5, 110,  200.00, 225),
(11, 6, 111,  60.00, 250),
(12, 6, 112,  95.00, 300),
(13, 7, 113,  30.00, 50),
(14, 7, 114,  85.00, 100),
(15, 8, 115,  110.00, 125);


-------------- QNO:4 PRODUCTS TABLE ---------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(25),
    UnitPrice DECIMAL(10,2),
    InStockQuantity INT);



INSERT INTO Products (ProductID, ProductName, UnitPrice, InStockQuantity)
VALUES
    (101, 'Product1', 10.99, 100),
    (102, 'Product2', 20.49, 75),
    (103, 'Product3', 5.99, 200),
    (104, 'Product4', 15.75, 50),
    (105, 'Product5', 8.49, 120),
    (106, 'Product6', 12.99, 80),
    (107, 'Product7', 18.25, 60),
    (108, 'Product8', 9.99, 150),
    (109, 'Product9', 25.49, 40),
    (110, 'Product10', 14.99, 90);





-----query no: 3 -------------
SELECT c.firstName, c.lastName, o.totalAmount, o.orderDate  FROM Customers c JOIN orders o ON c.customerID = o.customerID;



create view OrderSummary
as select orderID, orderDate, customerID, totalAmount FROM orders;

 ----  query no:7 ---------

create view ProductInventory
AS 
SELECT productName, InStockQuantity FROM Products;
 
  ----  query no:8 ---------
  SELECT 
    c.firstName,
    c.lastName,
    os.orderID,
    os.orderDate,
    os.totalAmount
FROM 
    OrderSummary os
JOIN 
    customers c ON os.customerID = c.customerID;
	  ----  query no:5---------

	CREATE PROCEDURE GetOrdersByCustomer(IN input_CustomerID INT) BEGIN
	as SELECT * FROM order_details orders WHERE customerID = input_customerID; END;

select * from ProductInventory;