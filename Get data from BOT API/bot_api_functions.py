import http.client
import pandas as pd

# Function to get data from BOT API.
def get_BOT_stat_data(client_id,series_code_list,start_year):
    
    """Retrieves data from the BOT API for multiple series codes.

    Args:
        client_id (str): Your BOT API Client ID.
        series_code_list (list): A list of series codes to retrieve.
        start_year (int): The starting year for data retrieval.

    Returns:
        pd.DataFrame: A Pandas DataFrame containing the combined data for all requested series. 
    """
    
    conn = http.client.HTTPSConnection("apigw1.bot.or.th")

    headers = {
        'x-ibm-client-id': client_id,
        'accept': "application/json"
        }
    result = pd.DataFrame()
    series_name = series_code_list

    for i in series_name:
        conn.request("GET", "/bot/public/observations/?series_code="+i+"&start_period="+str(start_year)+"-01-01", headers=headers)

        res = conn.getresponse()
        data = res.read()

        j = pd.io.json.loads(data.decode('utf-8'))
        df = pd.DataFrame(j['result']['series'][0]['observations'])
        column_name = str(j['result']['series'][0]['series_name_eng']) + " (" + str(j['result']['series'][0]['unit_eng']) + ")"
        df = df.rename(columns={'value':column_name})
        df[column_name] = pd.to_numeric(df[column_name])
        df.set_index('period_start',inplace=True)

        if result.empty:
            result = pd.concat([result,df])
        else:
            result = result.join(df)

    # print the last update date and the last period data to check that the last period data is really latest
    bot_last_update_date = j['result']['series'][0]["last_update_date"]
    print("BOT last update date: {}".format(bot_last_update_date))

    last_period_data = result.index[-1]
    print("Last period data: {}".format(last_period_data))

    return result


# Function to create series_code list.
def create_series_code_list(start,end):
    
    """Generates a list of series codes between a starting and ending code.

    Args:
        start (str): The starting series code.
        end (str): The ending series code.
    
    Returns:
        list: A list of series codes within the specified range.
    """

    def split_series_code(series_code):
        first_0 = series_code.find("0")
        length_of_int_in_series_code = len(str(int(series_code[first_0:])))
        cut_off_index = len(series_code)-length_of_int_in_series_code
        string_part = series_code[:cut_off_index]
        int_part = series_code[cut_off_index:]
        return string_part,int_part

    start_series_code = split_series_code(start)
    end_series_code = split_series_code(end)
    series_code_list = []
    counter = 0

    for i in range(int(end_series_code[1]) - int(start_series_code[1])+1):
        code = start_series_code[0]+str(int(start_series_code[1])+counter)
        series_code_list.append(code)
        counter+=1
    return series_code_list
