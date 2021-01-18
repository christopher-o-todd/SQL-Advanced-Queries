/* Add invoiceNumber and vendorName to the previous query (join two or more tables) */
SELECT Invoices.InvoiceID, MAX(InvoiceSequence) AS InvLines, InvoiceNumber, VendorName
FROM InvoiceLineItems
JOIN Invoices ON InvoiceLineItems.InvoiceID=Invoices.InvoiceID
JOIN Vendors ON Invoices.VendorID=Vendors.VendorID
WHERE InvoiceSequence >1
GROUP BY Invoices.InvoiceID, Invoices.InvoiceNumber, Vendors.VendorName
