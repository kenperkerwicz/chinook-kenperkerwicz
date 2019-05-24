SELECT * FROM Customer WHERE Country = 'brazil';

SELECT * from Customer LEFT JOIN Invoice ON BillingCountry = 'brazil';

SELECT * FROM Invoice WHERE BillingCountry = 'brazil';

SELECT InvoiceId, InvoiceDate, BillingCountry, Customer.FirstName, Customer.LastName FROM Invoice Join Customer ON Invoice.BillingCountry = 'brazil';