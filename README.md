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
