/* Display invoice IDs together with how many lines each invoice has */
SELECT InvoiceID, MAX(InvoiceSequence) AS InvLines
FROM InvoiceLineItems
WHERE InvoiceSequence >1
GROUP BY InvoiceID
