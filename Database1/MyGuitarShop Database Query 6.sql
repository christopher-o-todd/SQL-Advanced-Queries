/* Create function named fnDiscountPrice that calculates discount price of an item in the OrderItems table */

CREATE FUNCTION fnDiscountPrice (@ItemID int)
RETURNS money
BEGIN
RETURN (SELECT (ItemPrice-DiscountAmount)
        FROM OrderItems
        WHERE (ItemID = @ItemID))
END;

PRINT 'The discount price of the item is $' + CONVERT(varchar, dbo.fnDiscountPrice(5), 1);
