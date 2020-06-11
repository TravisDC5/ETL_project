import pandas as pd 

filelink = "peter.CSV"
database = pd.read_csv(filelink)


def querysearch(startdate, enddate, dataframe = database):
    aquired_df = dataframe[dataframe['invoicedate'] >= startdate]
    aquired_df2 = aquired_df[aquired_df['invoicedate'] <= enddate]
    aquired_df3 = aquired_df2.groupby(['consignorid'], as_index=False)['itemcost'].sum()
    #aquired_df4 = aquired_df2.groupby('consignorid')['rent'].avg()
    return(print(aquired_df3))

#querysearch("2019-08-01", "2019-08-31")

startdate = input(f'Please input a Starting Date in YYYY-MM-DD format: ')
enddate = input(f'Please input a Ending Date in YYYY-MM-DD format: ')

querysearch(str(startdate), str(enddate))