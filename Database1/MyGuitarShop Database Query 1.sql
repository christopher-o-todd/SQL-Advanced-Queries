/* Create a view named OrderItemProducts that returns columns from the Orders, OrderItems, and Products tables */
CREATE VIEW OrderItemProducts AS
SELECT Orders.OrderID, OrderDate, TaxAmount, ShipDate, ItemPrice, DiscountAmount, 
	SUM(ItemPrice-DiscountAmount) AS FinalPrice, Quantity, 
	SUM((ItemPrice-DiscountAmount)*Quantity + TaxAmount) AS ItemTotal,
	ProductName
FROM Orders 
JOIN OrderItems ON Orders.OrderID=OrderItems.OrderID
JOIN Products ON OrderItems.ProductID=Products.ProductID
GROUP BY Orders.OrderID, Orders.OrderDate, Orders.TaxAmount, Orders.ShipDate, 
OrderItems.ItemPrice, OrderItems.DiscountAmount, OrderItems.Quantity, Products.ProductName;
