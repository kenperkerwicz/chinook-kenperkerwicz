SELECT * FROM Customer WHERE Country = 'brazil';

SELECT * from Customer LEFT JOIN Invoice ON BillingCountry = 'brazil';

SELECT * FROM Invoice WHERE BillingCountry = 'brazil';

SELECT InvoiceId, InvoiceDate, BillingCountry, Customer.FirstName, Customer.LastName
 FROM Invoice Join Customer ON Invoice.BillingCountry = 'brazil';

SELECT * FROM Employee WHERE Title LIKE '______support%'; 


SELECT * FROM Employee;


SELECT * FROM Invoice;


SELECT Employee.FirstName, Employee.LastName, Employee.EmployeeId, customer.SupportRepId, invoice.InvoiceId
 FROM Employee INNER JOIN customer on Employee.EmployeeId = customer.SupportRepId
  INNER JOIN Invoice on customer.CustomerId = invoice.CustomerId;


SELECT t.TrackId,
t.Name,
sum(il.Quantity)
FROM Invoice i 
join InvoiceLine il on il.InvoiceId = i.InvoiceId
join Track t on t.TrackId = il.TrackId
where i.InvoiceDate LIKE '%2013%'
group by t.TrackId, t.Name
order by NumberPurchased desc 
;

select Distinct BillingCountry from Invoice;


SELECT YEAR(i.InvoiceDate) [Year], COUNT(i.InvoiceId) NumInvoicesInYear 
FROM Invoice i
WHERE (i.InvoiceDate 
BETWEEN '2011-01-01 00:00:00.000' 
AND '2011-12-21 23:59:59.999')
OR (i.InvoiceDate 
BETWEEN '2009-01-01 00:00:00.000' 
AND '2009-12-21 23:59:59.999')
GROUP BY YEAR(i.InvoiceDate)


SELECT YEAR(i.InvoiceDate) [Year], COUNT(i.InvoiceId) NumInvoicesInYear,
SUM(i.Total) totalSales  
FROM Invoice i
WHERE (i.InvoiceDate 
BETWEEN '2011-01-01 00:00:00.000' 
AND '2011-12-21 23:59:59.999')
OR (i.InvoiceDate 
BETWEEN '2009-01-01 00:00:00.000' 
AND '2009-12-21 23:59:59.999')
GROUP BY YEAR(i.InvoiceDate)











