USE Urban_Ecommerce;

INSERT INTO Customers (CustomerName, PhoneNumber, RegistrationDate) VALUES
('Amit Sharma', '9876543210', '2026-01-10'),
( 'Priya Patel', '9876543211', '2026-01-15'),
('Rahul Deshmukh', '9876543212', '2026-02-01'),
('Sneha Joshi', '9876543213', '2026-02-10'),
('Vikram Malhotra', '9876543214', '2026-02-20');

INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101, 'Baby Wipes', 'Baby Care', 150),
(102, 'Baby Shampoo', 'Baby Care', 250),
(103, 'Face Wash', 'Personal Care', 199),
(104, 'Body Lotion', 'Personal Care', 299),
(105, 'Dishwash Liquid', 'Household', 120),
(106, 'Floor Cleaner', 'Household', 180);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, DeliveryArea, DeliveryTime_Mins) VALUES
(1001, 1, '2026-03-01', 'Hadapsar', 25),
(1002, 2, '2026-03-01', 'Antarli', 45),
(1003, 3, '2026-03-02', 'Hadapsar', 15),
(1004, 4, '2026-03-02', 'Kothrud', 35),
(1005, 5, '2026-03-03', 'Hadapsar', 40),
(1006, 1, '2026-03-04', 'Antarli', 55),
(1007, 3, '2026-03-05', 'Viman Nagar', 20),
(1008, 2, '2026-03-05', 'Antarli', 42);

INSERT INTO Order_Items (OrderID, ProductID, Quantity) VALUES
(1001, 101, 2), 
(1001, 105, 1), 
(1002, 103, 1),
(1003, 102, 1),
(1003, 101, 1),
(1004, 106, 2),
(1005, 104, 1),
(1006, 101, 3),
(1007, 105, 1),
(1008, 102, 1);
