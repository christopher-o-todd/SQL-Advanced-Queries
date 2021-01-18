/* Create a stored procedure named spInsertProduct that inserts a row into the Products table. Procedure raises error if list price or discount is negative number. Execute procedure to test it  */

USE MyGuitarShop;
GO
CREATE PROCEDURE spInsertProduct
	@CategoryID int,
	@ProductCode varchar(10),
	@ProductName varchar(255),
	@ListPrice money,
	@DiscountPercent money
AS
IF @ListPrice < 0 THROW 50001, 'Invalid List Price, this value cannot be negative', 1;
If @DiscountPercent < 0 THROW 50001, 'Invalid Discount Percent, this value cannot be negative', 1;
INSERT Products
VALUES (@CategoryID, @ProductCode, @ProductName, '', @ListPrice, @DiscountPercent, GETDATE());

EXEC spInsertProduct	
	@CategoryID = 3,
	@ProductCode = 'Banjo',
	@ProductName = 'Four String Banjo',
	@ListPrice = -49.99,
	@DiscountPercent = -15
