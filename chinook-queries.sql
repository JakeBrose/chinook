--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId,
       FirstName,
       LastName,
       Country
FROM   Customer
WHERE  Country != "USA"

--Provide a query only showing the Customers from Brazil.
SELECT *
FROM   Customer
WHERE  Country = "Brazil"

--Provide a query showing the Invoices of customers who are from Brazil.
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT Customer.FirstName,
       Customer.LastName,
       Invoice.InvoiceId,
       Invoice.InvoiceDate,
       Invoice.BillingCountry
FROM   Customer,
       Invoice
WHERE  Invoice.CustomerId = Customer.CustomerId
AND    Invoice.BillingCountry = Customer.Country