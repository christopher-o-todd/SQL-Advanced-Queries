/* Dispaly account numbers and descriptions of all accounts from GLAccounts table that are NOT referenced by any invoice line item */
SELECT AccountNo, AccountDescription
FROM GLAccounts
WHERE AccountNo NOT IN 
	(SELECT AccountNo 
	FROM InvoiceLineItems)
