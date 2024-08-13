from bot_api_functions import create_series_code_list, get_BOT_stat_data

# Get data 
client_id = "your_client_id"  # Replace with your actual client ID
series_code_list = create_series_code_list("EITOURISTM00267", "EITOURISTM00292") # Specify the desired series codes
start_year = 2019 # Modify if you want to retrieve data from a different starting year
result = get_BOT_stat_data(client_id, series_code_list, start_year)

# Save the result dataframe into csv.
result.to_csv('tourism_data.csv') # Specify the desired file path
