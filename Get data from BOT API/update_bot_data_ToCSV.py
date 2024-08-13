import pandas as pd
from bot_api_functions import create_series_code_list, get_BOT_stat_data

def update_BOT_stat_data(client_id,series_code_list,csv_file_path):
    
    """Updates the csv file with the latest data from BOT API.

    Args:
        client_id (str): Your BOT API Client ID.
        series_code_list (list): A list of series codes to update.
        csv_file_path (str): Your csv file path.
    """
    
    # Get the last update date from the csv file
    # Get only the year
    # Go back 1 year just in case that some of the data had been revised
    csv_file = pd.read_csv(csv_file_path)
    last_period = csv_file.iloc[-1,0]
    last_period_num = last_period[:4]
    last_period_num = int(last_period_num)-1

    # Retrieve updated data from the BOT API
    latest_data_from_BOT = get_BOT_stat_data(client_id,series_code_list,last_period_num)

    # Update existing records in the csv
    csv_file.set_index('period_start',inplace=True)
    csv_file_dup = pd.concat([csv_file,latest_data_from_BOT])

    # Drop duplicate data
    csv_file_updated = csv_file_dup[~csv_file_dup.index.duplicated(keep='last')]
    csv_file_updated.to_csv(csv_file_path)
    

if __name__ == "__main__":
    client_id = "your_client_id" # Replace with your actual client ID
    series_code_list = create_series_code_list("EITOURISTM00267", "EITOURISTM00292") # Specify the desired series codes
    csv_file_path = 'tourism_data2.csv' # Specify the desired file path
    update_BOT_stat_data(client_id,series_code_list,csv_file_path)
