# ETL_project
Extract - Transform - Load
Access:
Store Sales
	Invoices
	InvDetails
	Merchandise
These tie together to make a sales and inventory record.

Vendor2020 
	Booth is the space number/name
	CP# ties back to the access database
	Rent is what they are assessed against their sales.


Show the sales in a given month by vendor.


Tasks:
1: export the requied tables from Access (CSV or Direct from SQLALCHEMY)
   into Pandas.
2: join with the data in the Excel 
3: Clean the data: remove bad records
4: Transfer data to PostGres DB for review with a note 
that explains what we did and why.


Relationships:

Here is the SQL to combine the tables and have just the columns we need:

SELECT InvDetails.InvoiceDetailID, Invoices.InvoiceID, Merchandise.ProductID, InvDetails.ProductPrice, InvDetails.ItemCost, InvDetails.ConsignorID, Merchandise.ProductDescription, Invoices.InvoiceDate
FROM Merchandise INNER JOIN (Invoices INNER JOIN InvDetails ON Invoices.InvoiceID = InvDetails.InvoiceID) ON Merchandise.ProductID = InvDetails.ProductID
Order by invoices.invoiceDate;

Cleanup:
Remove the rows with a price per unit of 0 (19)
Remove rows with no invoice date.(5)
Remove rows where the Product Description = Test or TEST

Final Columns for workload should be:
Invoice Detail
Invoice ID
ProductID
Price Per Unit
ItemCost
ConsignorID
ProductDescription
INvoice Date

Agregate the sales by subtracting the Item Cost from the Price Per Unit.
    Can add a column here: "Margin"
    
Vendors pay 15% of their sales to the store at the end of the month:
Subtract the rent from their margin value to see if they get a check, or have to pay up.

Output Table
Consignor Name (from the Vendor2020)
Total Sales
Margin
Rent
Amount due Store
Amount due Vendor


Output Table Store Sales (Agregate Values)
Total Sales
Margin
Rent Due from Vendor 
Vendor Expense (Checks)
Total Revenue




