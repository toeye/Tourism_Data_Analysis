# Analyzing Thailand's Tourism Industry with Power BI

This project provides a comprehensive analysis of Thailand's tourism industry using Power BI, offering insights into visitor trends, revenue, accommodation performance, and potential growth opportunities.

![Untitled](https://github.com/user-attachments/assets/ee3f2a66-c2a0-42b0-876b-96bdcda5f272)


## Project Overview

This project leverages data from the Ministry of Tourism and Sports (MOTS) and the Bank of Thailand (BOT) to create an interactive Power BI dashboard that explores various aspects of Thailand's tourism landscape. The dashboard consists of six pages, each focusing on a specific area of analysis. 

**Data Sources:**

* Ministry of Tourism and Sports (MOTS): https://www.mots.go.th/news/category/411
* Bank of Thailand (BOT): https://app.bot.or.th/BTWS_STAT/statistics/BOTWEBSTAT.aspx?reportID=875&language=TH

**Project Structure:**

This repository contains the following:

* **Power BI File (`.pbix`):**  The interactive Power BI dashboard.
* **Subfolders:**  Code and data from related projects used to prepare the data for this Power BI analysis:
    * **`Get data from BOT API`:**  Python scripts for automating data acquisition from the BOT API.
    * **`Transform and Explore Data from MOTS`:**  Power Query and SQL scripts for transforming and cleaning data from MOTS.
* **`README.md`:**  This file.


## Exploring the Dashboard

Follow this link: https://app.powerbi.com/view?r=eyJrIjoiNzdiZjg2M2EtNDYxMS00YzM5LWFlNWYtZjk5NmEyNTczYWExIiwidCI6IjVhZmYyYzQ2LTAwYmMtNDNiMC04N2NlLTU4ZTQ1ODFjMmJkNiIsImMiOjEwfQ==
or open the `.pbix` file in Power BI Desktop to interact with the dashboard and explore the data yourself.


## Dashboard Walkthrough

**Dashboard 1: Unveiling Thailand's Tourism Landscape: A Year-on-Year Perspective**

* Purpose:  Provides an overview of visitor arrival and revenue trends over time.
* Key Visualizations: Card visuals, line charts, and bar charts. 
* Interactive Features:  Year and month slicers, Region/Province slicer, slicer to switch between total, Thai, and foreign visitor data, drill-up functionality on line charts.
* Key Insights:  Impact of COVID-19, recovery trends, regional variations in performance, the importance of foreign tourists to revenue. 

**Dashboard 2: Decoding Demand: A Look at Accommodation Performance**

* Purpose: Explores trends in accommodation demand, analyzing guest numbers and occupancy rates.
* Key Visualizations:  Card visuals, line charts, and bar charts.
* Interactive Features: Year and month slicers, Region/Province slicer.
* Key Insights:  Provides a foundation for understanding accommodation demand, highlighting potential gaps between supply and demand.

**Dashboard 3: Global Appeal: Analyzing International Visitor Impact**

* Purpose:  Provides a focused analysis of foreign tourist arrivals, their origins, and economic impact.
* Key Visualizations: Card visual, line charts, and bar charts.
* Interactive Features: Year and month slicers, Region/Country filter.
* Key Insights:  Shifting dynamics in top source markets, the rise of Middle Eastern travelers, the impact of the Phuket Sandbox on income per tourist.

**Dashboard 4: Beyond the Headlines: Uncovering Hidden Patterns in Tourism Data**

* Purpose: Explores trends in four key tourism metrics: 3 Months Advance Booking Rate, Average Room Rate, Share of Conference Revenue, and Share of Foreign Guests. 
* Key Visualizations: Four line charts. 
* Interactive Features: Year and month slicers, Region/Nationwide toggle, Region filter. 
* Key Insights:  Reinforces recovery patterns, highlights the impact of demand and inflation on room rates, suggests a potential shift in business travel patterns, confirms regional variations in foreign visitor concentration. 

**Dashboard 5: Tourism Hotspots: Identifying Key Growth Areas**

* Purpose: Analyzes the concentration of tourism activity in specific provinces and source countries.
* Key Visualizations: Two tables for income from foreign visitors by province and the number of foreign tourists by country.
* Interactive Features: TopN filter to adjust the tables and show concentration percentages. 
* Key Insights:  Highlights the concentration of income in key provinces, indicating the need for diversification. Shows a decrease in tourist origin concentration since 2019, suggesting the need to attract a wider range of source markets. 

**Dashboard 6: Beyond the Tourist Trail: Insights for Growth and Diversification**

* Purpose:  Identifies untapped opportunities for growth and diversification using calculated ratios.
* Key Visualizations: Two tables for Foreign vs. Thai Income Ratio and Stay vs. Pass-Through Ratio.
* Interactive Features: Year filter and Region/Province filter.
* Key Insights:  Identifies provinces with potential for attracting more foreign visitors and provinces where accommodation supply might not be meeting demand. 


## Related Projects

* Automated Data Acquisition with Python and SQL:  https://github.com/toeye/Tourism_Data_Analysis/tree/main/Get%20data%20from%20BOT%20API
* Data Transformation and Exploration with Power Query and SQL:  https://github.com/toeye/Tourism_Data_Analysis/tree/main/Transform%20and%20Explore%20Data%20from%20MOTS


##  Further Exploration

For a detailed walkthrough of the analysis and insights, check out my Medium post: https://medium.com/@toeyetoeyetoeye/from-data-to-insights-analyzing-thailands-tourism-industry-with-power-bi-7edef515ad8c
