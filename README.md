ETL Project	06-13-2020

Participants:
David Tracy
Jon Wolgamott
Travis Christensen
Peter Nguyen

Objective: 
Demonstrate the Extract, Transform and Load of data from more than one source.

Description:
We elected to use active client data from a local business.

Vendor Phone Numbers and Email’s were removed from the data.

Our aim was to Extract the data from it’s database location and supporting flat files, Transform the data by removing records that were either testing rows/transactions, zero value merchandise, and store owned inventory sales. Only Vendor/Consigned merchandise sales were used in the process. The result would be the total sales revenue due the vendor minus the space rent the vendor owed for their booth.

Begin Extract
The following tables were created in Postgress, and populated with data from the store datafiles.
merchandise
invdetails
invoices
vendors
SQL was used to join these tables and this would represent the Extract portion of the project.
End Extract

Begin Transform
These tables were imported into a Pandas dataframe, and the bad rows were removed.
In the same function, the aggregation of the data and the math to deduct the rent was completed.
A rounding function was embedded to limit the number of decimals to 2.
End Transform

Begin Load
A new table called “results” was created in the existing database and the results were written.
Vendor Name : Total Revenue : Rent : Margin (due the vendor, or negative values were due the store.
End Load

