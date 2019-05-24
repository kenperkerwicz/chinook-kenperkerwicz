SELECT * FROM Customer WHERE Country = 'brazil';

SELECT * from Customer LEFT JOIN Invoice ON BillingCountry = 'brazil';

SELECT * FROM Invoice WHERE BillingCountry = 'brazil';

SELECT InvoiceId, InvoiceDate, BillingCountry, Customer.FirstName, Customer.LastName
 FROM Invoice Join Customer ON Invoice.BillingCountry = 'brazil';

SELECT * FROM Employee WHERE Title LIKE '______support%'; 


SELECT * FROM Employee;


SELECT * FROM Invoice;


SELECT Employee.FirstName,
 Employee.LastName, 
 Employee.EmployeeId,
  customer.SupportRepId,
   invoice.InvoiceId
 FROM Employee 
 INNER JOIN customer 
 on Employee.EmployeeId = customer.SupportRepId
  INNER JOIN Invoice
 on customer.CustomerId = invoice.CustomerId;


SELECT t.TrackId,
t.Name,
sum(il.Quantity)
FROM Invoice i 
join InvoiceLine il on il.InvoiceId = i.InvoiceId
join Track t on t.TrackId = il.TrackId
where i.InvoiceDate LIKE '%2013%'
group by t.TrackId, t.Name
order by t.Name desc 
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
GROUP BY YEAR(i.InvoiceDate);


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

Select COUNT(InvoiceLine.InvoiceLineId) NumberOfLineItems
from InvoiceLine 
where InvoiceId = 37


-- (Looking at the InvoiceLine table,
--  provide a query that COUNTs the number of line items
--   for each Invoice)

Select COUNT(InvoiceLine.InvoiceLineId) NumberOfLineItems
from InvoiceLine 
join Invoice on InvoiceLine.InvoiceLineId = Invoice.InvoiceId
group by InvoiceLine.InvoiceLineId;


-- Provide a query that includes the purchased track name with each invoice line item.

SELECT il.*, t.Name
from InvoiceLine il 
join track t 
On il.TrackId = t.trackId
order by il.InvoiceId;


-- Provide a query that includes the purchased track name 
-- AND artist name with each invoice line item.

SELECT il.InvoiceLineId,
 t.Name, 
 Artist.Name
from InvoiceLine il 
join track t On t.TrackId = il.trackId
join Album al on t.AlbumId = al.AlbumId
join Artist on Artist.ArtistId = al.ArtistId
order by il.InvoiceId;


-- country_invoices.sql: Provide a query that shows the # of invoices per country.
--  HINT: GROUP BY

SELECT  Count(invoice.BillingCountry) numberOfInvoicesPerCountry,
Invoice.BillingCountry
from Invoice
group by  invoice.BillingCountry;


-- 15 = playlists_track_count.sql: Provide a query that shows
--  the total number of tracks in each playlist.
--  The Playlist name should be include on the resulant table.

Select Count(trackId) numberOfTracks, p.name
FROM PlaylistTrack pt 
join playlist p 
on pt.playlistId = p.playlistId 
group by p.Name 

-- tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. 
-- The result should include the Album name,
--  Media type and Genre.

SELECT t.Name, t.Composer TrackComposer, t.Milliseconds, 
t.Bytes, t.UnitPrice, a.title
FROM Track t
inner join Album a on t.AlbumId = a.AlbumId
inner join MediaType MT on t.MediaTypeId = mt.MediaTypeId
inner join Genre g on g.genreId = t.genreId;


-- invoices_line_item_count.sql: Provide a query that shows all Invoices
--  but includes the # of invoice line items.

SELECT Count(il.InvoiceLineId) invoiceLineItems, i.InvoiceDate
 from InvoiceLine il
 inner join Invoice i 
 on il.InvoiceId = i.InvoiceId
 Group BY i.InvoiceId, i.InvoiceDate;


--  sales_agent_total_sales.sql: 
--  Provide a query that shows total sales made by each sales agent  --
 
SELECT e.LastName as EmployeeName, Sum(i.total)
 FROM Customer c 
 INNER JOIN Employee e on e.EmployeeId = c.SupportRepId
 INNER JOIN Invoice i on i.CustomerId = c.CustomerId 
 group by e.LastName
; 


-- top_2009_agent.sql:
--  Which sales agent made the most in sales in 2009?

SELECT  Sum(i.total) SALESTOTALFORSALESREP, e.EmployeeId,
YEAR(i.InvoiceDate) AS InvoiceYear
 FROM Invoice i, Employee e, Customer c
 WHERE i.CustomerId = c.CustomerId 
 AND c.supportRepId = e.EmployeeId 
 AND YEAR(i.InvoiceDate) = '2009'
 group by e.LastName, e.EmployeeId, i.InvoiceDate
 order by SALESTOTALFORSALESREP DESC;





-- top_agent.sql

SELECT TOP 1 Sum(i.total), e.LastName, e.FirstName 
 FROM Customer c 
 INNER JOIN Employee e on e.EmployeeId = c.SupportRepId
 INNER JOIN Invoice i on i.CustomerId = c.CustomerId 
 group by e.LastName, e.FirstName
; 



-- sales_agent_customer_count.sql:
--  Provide a query that shows the count of customers assigned
--  to each sales agent.

SELECT e.LastName, e.FirstName,
count(c.CustomerId) numberofCustomers
 FROM Employee e 
left JOIN Customer c on e.EmployeeId = c.SupportRepId
 where e.Title = 'Sales Support Agent'
 group by e.FirstName, e.LastName
; 






