CREATE DATABASE Urban_Ecommerce;
USE Urban_Ecommerce;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY auto_increment,
CustomerName VARCHAR(100),
PhoneNumber VARCHAR(10),
RegistrationDate DATE );

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10, 2));

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE,
DeliveryArea VARCHAR(100), 
DeliveryTime_Mins INT, 
CustomerID INT,FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));

CREATE TABLE Order_Items (
OrderItemID INT PRIMARY KEY auto_increment,
Quantity INT,
OrderID INT,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ProductID INT,FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
