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

