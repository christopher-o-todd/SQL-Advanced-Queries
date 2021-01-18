/* Create a view named ProductSummary that uses the view created in query 1. This view should return summary information about each product.  */
CREATE VIEW ProductSummary AS
SELECT DISTINCT ProductName, SUM(Quantity) AS OrderCount, SUM(ItemTotal) AS OrderTotal
FROM OrderItemProducts
GROUP BY OrderItemProducts.ProductName;

SELECT TOP 5 ProductName, OrderTotal
FROM ProductSummary
ORDER BY OrderTotal DESC;
