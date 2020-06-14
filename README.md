# ETL Project

## Participants:
David Tracy \n
Jon Wolgamott \n
Travis Christensen \n
Peter Nguyen

## Objective:
Demonstrate the Extract, Transform and Load of data from more than one source.

## Description:
We elected to use active client data from a local business.
Vendor Phone Numbers and Email’s were removed from the data.
Our aim was to Extract the data from it’s database location and supporting flat files,
Transform the data by removing records that were either testing rows/transactions,
zero value merchandise, and store owned inventory sales. Only Vendor/Consigned
merchandise sales were used in the process. The result would be the total sales
revenue due the vendor minus the space rent the vendor owed for their booth.
Provided in the resource folder are the 4 csv files used as well as an SQL file. First
open PgAdmin and run from the query the lines to create the four tables. Next,
manually import the tables into from the resource folded into PgAdmin. With the
tables loaded with data, the query lines to create a new table peter can be
executed. This will create a new table with all the appropriate joins and filters. Once
this table is completed you can now run the python file, also located in the
resources folder. Finally, return to PgAdmin to find the a new table, “results” with
the final output.
The following tables were created in Postgress and populated with data from the
store datafiles. Merchandise, Invdetails, Invoices, Vendors SQL was used to join
these tables, and this would represent the Extract portion of the project.
These tables were imported into a Pandas dataframe, and the bad rows were
removed.
In the same function, the aggregation of the data and the math to deduct the rent
was completed.
A rounding function was embedded to limit the number of decimals to 2.
A new table called “results” was created in the existing database and the results
were written.


## Outline
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

