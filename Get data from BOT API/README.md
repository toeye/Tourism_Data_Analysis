# Thailand Tourism Data Pipeline with Python and SQL Server

This project demonstrates how to automate the acquisition and management of data from the Bank of Thailand (BOT) API using Python and SQL Server. While this project focuses on retrieving Thailand's tourism data, the code and process can be easily adapted to retrieve any data series available through the BOT API.

![Getting data from API flow chart](https://github.com/user-attachments/assets/16ee4a38-cd31-407e-9b0d-d4f90dd9e682)

## Project Overview

This script retrieves monthly tourism data from the BOT API, stores it in a SQL Server database, and provides functions to automatically update the database with the latest information.  

**Key Features:**

* **Automated Data Extraction:**  Retrieves data for multiple data series using the BOT API.
* **Structured Data Storage:**  Stores data in a well-defined SQL Server database for efficient analysis. 
* **Automated Updates:**  Keeps the database synchronized with the latest data from the API, accounting for potential revisions.
* **Reusable Functions:**  Provides modular functions for data retrieval, processing, and database management. 

**Technologies Used:**

* Python 3
* SQL Server
* Python Libraries: `requests`, `pandas`, `pyodbc` 

## Instructions

**1. Prerequisites:**

* **Install Python:**  [https://www.python.org/downloads/](https://www.python.org/downloads/)
* **Install Required Python Libraries:** `pip install requests pandas pyodbc`
* **Install SQL Server:** [https://www.microsoft.com/en-us/sql-server/sql-server-downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
* **Obtain a BOT API Client ID:** Register for a free account and get your Client ID from the BOT API portal: [https://apiportal.bot.or.th/bot/public/start](https://apiportal.bot.or.th/bot/public/start)

**2.  Set up the Database:**

* **Create the database:** Execute the SQL script `create_tables.sql` to create the `Thailand_tourism_data` database and the necessary tables (`tourism_stats` and `update_tourism_stats`). You may want to modify the database and table names to reflect the specific data you are retrieving. 

**3.  Configure the Python Scripts:**

*  **`bot_api_functions.py`:**  No configuration needed. This file contains reusable functions.
*  **`get_bot_data_to_csv.py`:**  
    * Replace `"your_client_id"` with your actual BOT API Client ID.
    * Modify `series_code_list` and `start_year` to specify the data series you want to retrieve and the year from which you want to start retrieving data.
    *  Adjust the `csv_file_path` if you want to save the data to a different CSV file. 
* **`update_bot_data_to_csv.py`:**
    *  Replace `"your_client_id"` with your actual BOT API Client ID.
    *  Modify `series_code_list` as needed.
    *  Adjust the `csv_file_path` to match the path of your CSV file.
* **`get_bot_data_to_sql.py`:**
    * Replace `"your_client_id"` with your actual BOT API Client ID.
    *  Modify `series_code_list` and `start_year` if needed. 
    *  Update the `server`, `database`, and `table_name` variables to match your SQL Server configuration. 
* **`update_bot_data_to_sql.py`:**
    *  Replace `"your_client_id"` with your actual BOT API Client ID. 
    *  Modify `series_code_list` as needed.
    *  Update the `server`, `database`, `table_name`, and `update_table_name` variables to match your SQL Server configuration. 

**4. Run the Scripts:**

* **Initial Data Retrieval:** Execute `get_bot_data_to_sql.py` to retrieve data from the BOT API and store it in your SQL Server database. 
* **Updating Data:** Execute `update_bot_data_to_sql.py` to update your database with the latest data from the API. 

**5. Create Analysis-Ready Views (Optional):** 

* Execute the SQL script `create_views.sql` to create analysis-ready views for your data. You'll likely need to modify this script to match the specific data series you've retrieved and your desired table structure. 

## Example Usage

You can use the provided Python functions in your own scripts:

```python
from bot_api_functions import create_series_code_list, get_BOT_stat_data

# Generate a list of series codes
series_codes = create_series_code_list("EXRXXXXM00217", "EXRXXXXM00223")  # Example for exchange rates

# Retrieve exchange rate data starting from 2022
exchange_rate_data = get_BOT_stat_data("your_client_id", series_codes, 2022)
```

# Article on this project
Link: https://medium.com/@toeyetoeyetoeye/automating-data-acquisition-building-data-pipeline-with-python-and-sql-server-165c8e27cb05
