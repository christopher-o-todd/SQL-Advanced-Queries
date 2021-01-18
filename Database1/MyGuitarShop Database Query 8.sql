/* Create a trigger named Products_UPDATE that checks the new value for the DiscountPercent column of the Products table. */

USE MyGuitarShop
GO

CREATE TRIGGER Products_UPDATE
ON Products
AFTER INSERT, UPDATE 
AS
DECLARE @DPercent money;
SELECT @DPercent = DiscountPercent FROM inserted

IF @DPercent > 100 OR @DPercent < 0 THROW 50001, 'Invalid Discount Amount. Must be between 0 and 100', 1;
ELSE IF @DPercent < 1 UPDATE Products
SET DiscountPercent = @DPercent * 100
WHERE ProductID IN (SELECT ProductID FROM inserted)

/* Test for negative values */
UPDATE Products 
SET DiscountPercent = -100 WHERE ProductID =1

/* Test for greater than 100% */
UPDATE Products 
SET DiscountPercent = 150 WHERE ProductID =1

/* Convert discount to percentage */

UPDATE Products 
SET DiscountPercent = 0.6 WHERE ProductID =1

