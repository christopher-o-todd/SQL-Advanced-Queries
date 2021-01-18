/* For each vendor who has invoices, diplay vendor ID, vendor name, and the date of the most recent invoice of that vendor. Display without the time component */
SELECT Invoices.VendorID, VendorName, CONVERT(date, MAX(InvoiceDate)) AS LatestInv
FROM Vendors INNER JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName, Invoices.VendorID
ORDER BY LatestInv DESC;
