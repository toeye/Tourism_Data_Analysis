import pyodbc
from bot_api_functions import create_series_code_list, get_BOT_stat_data

# Configuration (replace placeholders with your actual values)
client_id = "your_client_id" 
series_code_list = create_series_code_list("EITOURISTM00267", "EITOURISTM00292") 
start_year = 2019 
driver = '{ODBC Driver 17 for SQL Server}'
server = 'your_server_name'  
database = 'Thailand_tourism_data' 
table_name = 'tourism_stats' 

connectionString = f'DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=Yes'

def main():
    """Retrieves data from BOT API, prepares it, and inserts it into SQL Server."""

    # Get data
    result = get_BOT_stat_data(client_id, series_code_list, start_year)

    # Rename columns for SQL compatibility 
    result = result.reset_index()
    col_names = []
    for name in result.columns:
        new_name = name.replace(" ", "_").replace("(", "").replace(")", "").replace("-", "_")
        col_names.append(new_name)
    result.columns = col_names

    # Create column list for SQL INSERT statement
    cols = ",".join([str(i) for i in result.columns.tolist()])

    # Connect to SQL Server 
    conn = pyodbc.connect(connectionString)
    cursor = conn.cursor()

    # Insert data into SQL Server
    for index, row in result.iterrows():
        sql = f"INSERT INTO {table_name} ({cols}) VALUES ({','.join(['?']*len(result.columns))})"  
        cursor.execute(sql, tuple(row))
    
    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()
