USE Urban_Ecommerce;

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