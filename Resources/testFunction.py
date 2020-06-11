import pandas as pd 

filelink = "peter.CSV"
database = pd.read_csv(filelink)

#print(database)

def querysearch(startdate, enddate, dataframe = database):
    aquired_df = dataframe[dataframe['invoicedate'] >= startdate]
    aquired_df2 = aquired_df[aquired_df['invoicedate'] <= enddate]

    return(print(aquired_df2))

querysearch("2019-08-01", "2019-08-31")