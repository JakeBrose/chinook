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

--Provide a query showing only the Employees who are Sales Agents.
SELECT *
FROM   Employees
WHERE  Title = "Sales Support Agent"

--Provide a query showing a unique list of billing countries from the Invoice table.
SELECT
DISTINCT Invoice.BillingCountry
FROM     Invoice

--Provide a query that shows the invoices associated with each sales agent.
--The resultant table should include the Sales Agent's full name.
SELECT Employee.FirstName,
       Employee.LastName,
       Invoice.*
FROM   Employee,
       Invoice,
       Customer
WHERE  Customer.SupportRepId = Employee.EmployeeId
AND    Customer.CustomerId = Invoice.CustomerId

--Provide a query that shows the Invoice Total, Customer name, Country and Sales Agent name for all invoices and customers.
Select Invoice.Total,
       Customer.FirstName,
       Customer.LastName,
       Customer.Country,
       Employee.FirstName,
       Employee.LastName
FROM   Invoice,
       Customer,
       Employee
WHERE  Customer.SupportRepId = Employee.EmployeeId
AND    Customer.CustomerId = Invoice.CustomerId

--How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT
COUNT (Invoice.InvoiceDate)
AS    "Total Invoices",
SUM   (Invoice.Total)
As    "Total Sales"
FROM  Invoice
WHERE Invoice.InvoiceDate LIKE '%2009%'
OR    Invoice.InvoiceDate LIKE '%2011%'

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT
COUNT (*)
FROM InvoiceLine
WHERE InvoiceLine.InvoiceId = 37

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
--HINT: GROUP BY
SELECT
COUNT (*)
FROM InvoiceLine
GROUP BY InvoiceLine.InvoiceId