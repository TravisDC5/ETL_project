In the beginning we created 4 tables from Access (CSV or Direct from SQLALCHEMY) from a local database in our “query.sql” and extracted the table names from Access into a new CSV/Excel file called “Peter”.
Although our group completed the project guidelines given by Eric Leung, we added additional information to broaden the scope and concept.
Instead of have the final result as an CSV/Excel file, we needed to export the tables into Pandas and transfer the data to a Postgres DB. Our group ran into multiple hurdles and had to start from scratch.
Extract:
We exported the required tables we created from Access Into Pandas (InvDetails.InvoiceDetailID, Invoices.InvoiceID, Merchandise.ProductID, etc.) and constructed an engine to connect the data base.
Transform:
We grabbed the table from the “Peter” and store a SQL Query into Pandas Dataframe. We cleaned the data by removing certain fields using a querysearch (productdescription, itemcost, cosignorid, etc). This way helps reading the data easier where it is concise and straight to the point.
Load:
After cleaning up the data and coding, we transfer data to PostGres DB in a table name “results”
Although we only a limited timeline to complete the task, adding an additional month and year filter would help the end user to look up additional dates instead of looking at one specific date given on our code.


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
	CP# ties back to the sales records as consignorid
	Rent is what they are assessed against their sales each month.


Show the sales in a given month by vendor
Subtract the Rent
Record the amount owing the vendor or the store.


Tasks:
Extract
1: export the requied tables from Access and Excel as CSV files
   into PGAdmin.
2: Import the data into Pandas. 

Transform:
3: Clean the data: remove bad records
	0 value item cost.
	Test records
	Store owned activity (consignorid = 500)
4: Add up the item cost values by consignor name
	Subtract the booth rent
	Record the margin to be paid to the vendor.
Load:
5. Load the data into a results table in Postgres 

