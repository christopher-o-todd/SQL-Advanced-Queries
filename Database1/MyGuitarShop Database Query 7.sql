/* Create function named fnItemTotal that calculates the total amount of an item in the OrderItems table */

CREATE FUNCTION fnItemTotal (@ItemID int)
RETURNS money
BEGIN
RETURN (SELECT Quantity * dbo.fnDiscountPrice(@ItemID)
        FROM OrderItems
        WHERE (ItemID = @ItemID))
END;

PRINT 'The total price of the item is $' + CONVERT(varchar, dbo.fnItemTotal(5), 1);
