# Import Libraries
import pandas as pd 
import psycopg2 as psy
import io
from sqlalchemy import create_engine
from password import password

# Prompt User for information to connect with Database
#dbIPaddress = input(f'Please enter local IP address for Database: ')
#dbName = input(f'Please enter the Database Name: ')
#userID = input(f'Please enter your User Name for Postgres: ')
#pgPassword = input(f'Please enter your Postgres Password: ')
#portNumber = input(f'Please enter the Port Number your Database is on: ')

# Connect to the DB
#conn = psy.connect(
#       host = dbIPaddress,
#       database = dbName,
#       user = userID,
#       password = pgPassword,
#       port = int(portNumber)
#   )

#-------------------------------------------------------------
# Connect to the DB (no User Data Query for debugging purpose)
# Input your Static fields below:
conn = psy.connect(
        host = '127.0.0.1',
        database = "testingPlayground",
        user = "postgres",
        password = password,
        port = 5432
    )
#-------------------------------------------------------------

# SQL to grab table
sql = "SELECT * FROM peter;"

# Store SQL Query into Pandas Dataframe
database = pd.read_sql_query(sql, conn)

# Cast database column as string
database = database.astype({"invoicedate": str})


def querysearch(startdate, enddate, password=password, dataframe = database):
   
   dropTest = dataframe[dataframe['productdescription'] != 'Test']
   dropItemCost = dropTest[dropTest['itemcost'] != 0]
   dropStore = dropItemCost[dropItemCost['consignorid'] != 500]
   
   aquired_df = dropStore[dropStore['invoicedate'] >= startdate]
   aquired_df2 = aquired_df[aquired_df['invoicedate'] <= enddate]
   group_dict = {'itemcost':'sum','rent':'mean'}
   aquired_df3 = aquired_df2.groupby(['vendorname'], as_index=False).agg(group_dict)
   aquired_df3['margin'] = aquired_df3['itemcost'] - aquired_df3['rent']
   
   aquired_df3['margin'] = round(aquired_df3['margin'], 2)
   aquired_df3['itemcost'] = round(aquired_df3['itemcost'], 2)
   
   host = '127.0.0.1'
   database = "testingPlayground"
   user = "postgres"
   #password = password
   port = 5432

   engine = create_engine(f'postgresql+psycopg2://{user}:{password}@{host}:{port}/{database}')

   aquired_df3.head(0).to_sql('results', engine, if_exists='replace',index=False) #truncates the table

   conn = engine.raw_connection()
   cur = conn.cursor()
   output = io.StringIO()
   aquired_df3.to_csv(output, sep='\t', header=False, index=False)
   output.seek(0)
   contents = output.getvalue()
   cur.copy_from(output, 'results', null="") # null values become ''
   conn.commit()      
   
   return(print(aquired_df3)) 

# Debugging Purpose 
querysearch("2019-08-10", "2019-08-31")

#startdate = input(f'Please input a Starting Date in YYYY-MM-DD format: ')
#enddate = input(f'Please input a Ending Date in YYYY-MM-DD format: ')

#querysearch(str(startdate), str(enddate))