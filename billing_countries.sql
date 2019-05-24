SELECT * FROM Customer WHERE Country = 'brazil';

SELECT * from Customer LEFT JOIN Invoice ON BillingCountry = 'brazil';

SELECT * FROM Invoice WHERE BillingCountry = 'brazil';

SELECT InvoiceId, InvoiceDate, BillingCountry, Customer.FirstName, Customer.LastName FROM Invoice Join Customer ON Invoice.BillingCountry = 'brazil';

SELECT * FROM Employee WHERE Title LIKE '______support%'; 

SELECT * FROM Employee;

SELECT * FROM Invoice;

SELECT Employee.FirstName, Employee.LastName, Employee.EmployeeId, customer.SupportRepId, invoice.InvoiceId FROM Employee INNER JOIN customer on Employee.EmployeeId = customer.SupportRepId INNER JOIN Invoice on customer.CustomerId = invoice.CustomerId;

SELECT * 
FROM Invoice
WHERE BillingCountry = 'Belgium' 
OR BillingCountry = 'Canada'
OR BillingCountry = 'Ireland'