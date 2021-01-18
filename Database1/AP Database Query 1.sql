/* For each invoice with a payment date, calculate how many days before the due tdate the invoice was paid.*/
SELECT InvoiceID, InvoiceNumber, 
CONVERT(date, InvoiceDate) AS InvoiceDate, 
CONVERT(date,InvoiceDueDate) AS InvoiceDueDate, 
CONVERT(date,PaymentDate) AS PaymentDate, 
DATEDIFF(day, PaymentDate, InvoiceDueDate) AS DaysPaidEarly
FROM Invoices
WHERE PaymentDate IS NOT NULL
