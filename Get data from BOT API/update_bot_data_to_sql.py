import pandas as pd
import pyodbc
from bot_api_functions import create_series_code_list, get_BOT_stat_data

# Configuration (replace placeholders with your actual values)
client_id = "your_client_id"  
series_code_list = create_series_code_list("EITOURISTM00267","EITOURISTM00292")
driver = '{ODBC Driver 17 for SQL Server}'
server = 'your_server_name' 
database = 'Thailand_tourism_data'
table_name = 'tourism_stats'
update_table_name = 'update_tourism_stats'

connectionString = f'DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=Yes'

def prepare_data_for_sql(df):
    """Prepares a Pandas DataFrame for insertion into SQL Server.

    Args:
        df (pd.DataFrame): The DataFrame to prepare.

    Returns:
        pd.DataFrame: The prepared DataFrame with cleaned column names and reset index. 
    """
    df = df.reset_index()
    col_names = []
    for name in df.columns:
        new_name = name.replace(" ", "_").replace("(", "").replace(")", "").replace("-", "_")
        col_names.append(new_name)
    df.columns = col_names
    return df 

def update_database(client_id, series_code_list):
    """Updates the "table_name" table in SQL Server with new data from the BOT API.

    Args:
        client_id (str): Your BOT API Client ID.
        series_code_list (list): A list of series codes to retrieve and update. 
    """
    conn = pyodbc.connect(connectionString)
    cursor = conn.cursor()

    # Get the last update date from the database (go back one year for potential revisions)
    last_period = pd.read_sql(f'SELECT TOP 1 period_start FROM {table_name} ORDER BY period_start DESC',conn)
    last_period_year = int(last_period.iloc[0,0][:4]) - 1

    # Retrieve updated data from the BOT API
    result = get_BOT_stat_data(client_id, series_code_list, last_period_year)

    # Prepare the DataFrame for SQL insertion
    result = prepare_data_for_sql(result)

    # Create column list for SQL statements
    cols = ",".join([str(i) for i in result.columns.tolist()])

    # Insert updated data into the 'update_table_name' table
    for index, row in result.iterrows():
        sql = f"INSERT INTO {update_table_name} ({cols}) VALUES ({','.join(['?']*len(result.columns))})" 
        cursor.execute(sql, tuple(row))
    conn.commit()

    # Update existing records in the 'table_name' table
    conn.execute(f'''
        UPDATE {database}.dbo.{table_name}
        SET {','.join([f'{col} = t2.{col}' for col in result.columns if col != 'period_start'])}
        FROM {table_name} AS t1
        INNER JOIN {update_table_name} AS t2 ON t1.period_start = t2.period_start;
    ''')
    conn.commit()

    # Insert new records into the 'table_name' table
    conn.execute(f'''
        INSERT INTO {table_name} ({cols})
        SELECT {cols} 
        FROM {update_table_name} t2
        WHERE NOT EXISTS (SELECT period_start FROM {table_name} t1 WHERE t1.period_start = t2.period_start);
    ''')
    conn.commit()

    # Clean up the update table
    conn.execute(f'DELETE FROM {update_table_name};')
    conn.commit()

    cursor.close()
    conn.close()

if __name__ == "__main__":
    update_database(client_id, series_code_list)
