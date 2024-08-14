# Exploring Thailand's Tourism Data: Power Query and SQL Analysis 

This project demonstrates how to prepare and analyze Thailand's tourism data using Power Query and SQL.  

## Project Overview

This project focuses on transforming raw tourism data from the Ministry of Tourism and Sports (MOTS) into a structured and analysis-ready format within a SQL Server database.

**Data Sources:**

* **Tourism Statistics by Provinces:**  [https://intelligencecenter.tat.or.th/articles/9907](https://intelligencecenter.tat.or.th/articles/9907)
* **Foreign Tourist Arrival in Thailand:**  [https://intelligencecenter.tat.or.th/articles/17309](https://intelligencecenter.tat.or.th/articles/17309)

**Key Steps:**

1. **Data Extraction:**  Raw data is extracted from Excel files provided by MOTS.
2. **Data Transformation (Power Query):** The data is cleaned, restructured, and transformed using Power Query within Excel to address formatting inconsistencies, create a date dimension, and prepare it for database storage. 
3. **Data Loading (DAX Studio):**  The transformed data is loaded into a SQL Server database using the DAX Studio tool. 
4. **Data Analysis (SQL):**  SQL queries are used to analyze the data, uncovering key trends in visitor arrivals, regional performance, tourist origins, and spending patterns. 
5. **Data Preparation for Visualization (SQL):**  Two analysis-ready SQL views are created – one for region-level data and one for nationwide data – to simplify further analysis and visualization in tools like Power BI.

## SQL Scripts

This repository contains SQL scripts for setting up the database and creating the analysis-ready views:

* **`create_tables.sql`:**  Creates the database (if applicable) and the necessary tables to store the data. 
* **`create_views.sql`:**  Creates the SQL views that restructure and organize the data for analysis. 

**Instructions for Using SQL Scripts:**

1. Ensure you have a SQL Server instance set up. 
2. Open SQL Server Management Studio (SSMS) or a similar tool. 
3. Connect to your SQL Server instance.
4. Execute the `create_tables.sql` script to create the database and tables. 
5. After loading the transformed data into the tables, execute the `create_views.sql` script to create the views.

## Key Findings from SQL Analysis

The SQL analysis revealed:

* The impact of COVID-19 on Thailand's tourism industry, highlighting different recovery rates for domestic and international tourism.
* The dominance of Bangkok, Phuket, and Chonburi as major tourism hubs.
* The emergence of the Northeast region as a potential growth area for foreign tourism.
* Shifts in top source countries for foreign tourists. 
* Opportunities for diversifying tourism revenue and attracting more international visitors to provinces beyond the traditional hubs. 

## Related Projects

* Automated Data Acquisition with Python and SQL:  [Link to your BOT API project repo]
* Interactive Power BI Dashboard: [Link to your Power BI project repo]

##  Further Exploration

For a detailed walkthrough of the Power Query transformations and SQL analysis, check out my Medium post: [Link to your Medium post]
