CREATE DATABASE Urban_Ecommerce;
USE Urban_Ecommerce;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(10),
    RegistrationDate DATE);
    CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2));

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    DeliveryArea VARCHAR(100), 
    DeliveryTime_Mins INT, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));
    CREATE TABLE Order_Items (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
    
    INSERT INTO Customers (CustomerID, CustomerName, PhoneNumber, RegistrationDate) VALUES
(1, 'Amit Sharma', '9876543210', '2026-01-10'),
(2, 'Priya Patel', '9876543211', '2026-01-15'),
(3, 'Rahul Deshmukh', '9876543212', '2026-02-01'),
(4, 'Sneha Joshi', '9876543213', '2026-02-10'),
(5, 'Vikram Malhotra', '9876543214', '2026-02-20');

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101, 'Baby Wipes', 'Baby Care', 150.00),
(102, 'Baby Shampoo', 'Baby Care', 250.00),
(103, 'Face Wash', 'Personal Care', 199.00),
(104, 'Body Lotion', 'Personal Care', 299.00),
(105, 'Dishwash Liquid', 'Household', 120.00),
(106, 'Floor Cleaner', 'Household', 180.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, DeliveryArea, DeliveryTime_Mins) VALUES
(1001, 1, '2026-03-01', 'Hadapsar', 25),
(1002, 2, '2026-03-01', 'Antarli', 45),
(1003, 3, '2026-03-02', 'Hadapsar', 15),
(1004, 4, '2026-03-02', 'Kothrud', 35),
(1005, 5, '2026-03-03', 'Hadapsar', 40),
(1006, 1, '2026-03-04', 'Antarli', 55),
(1007, 3, '2026-03-05', 'Viman Nagar', 20),
(1008, 2, '2026-03-05', 'Antarli', 42);

INSERT INTO Order_Items (OrderItemID, OrderID, ProductID, Quantity) VALUES
(1, 1001, 101, 2), 
(2, 1001, 105, 1), 
(3, 1002, 103, 1),
(4, 1003, 102, 1),
(5, 1003, 101, 1),
(6, 1004, 106, 2),
(7, 1005, 104, 1),
(8, 1006, 101, 3),
(9, 1007, 105, 1),
(10, 1008, 102, 1);

SELECT  DeliveryArea, 
    AVG(DeliveryTime_Mins) AS Avg_Delivery_Time
FROM Orders
GROUP BY DeliveryArea
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    p.Category, 
    SUM(p.Price * oi.Quantity) AS TotalRevenue
FROM Products p
JOIN Order_Items oi ON p.ProductID = oi.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;

SELECT 
    o.OrderID, 
    c.CustomerName, 
    o.OrderDate, 
    o.DeliveryTime_Mins
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.DeliveryArea = 'Hadapsar';

SELECT 
  OrderID, 
  DeliveryArea, 
  DeliveryTime_Mins,
  avg(DeliveryTime_Mins) OVER(PARTITION BY DeliveryArea) AS Area_Avg_Time FROM Orders;
  
WITH CustomerOrderCount AS 
(SELECT CustomerID, 
COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY CustomerID)
SELECT c.CustomerName, 
coc.TotalOrders,
DENSE_RANK() OVER(ORDER BY coc.TotalOrders DESC) AS CustomerRank
FROM CustomerOrderCount coc
JOIN Customers c ON coc.CustomerID = c.CustomerID;

SELECT CustomerName 
FROM Customers 
WHERE CustomerID IN (
    SELECT o.CustomerID 
    FROM Orders o
    JOIN Order_Items oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    WHERE p.Category = 'Baby Care');