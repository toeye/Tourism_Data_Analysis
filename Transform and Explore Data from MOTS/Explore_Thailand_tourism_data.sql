USE [Thailand_tourism_data]

-- Table overview
SELECT
	TOP 10 *
FROM Thailand_tourism_stats_by_provinces2
ORDER BY Year,Month

-- Table overview
SELECT
	TOP 10 *
FROM Number_of_Foreign_Tourists_in_Thailand
ORDER BY Year,Month

-- Create view
-- Exclude region level data.
Create View Tourist_Stats_by_Provinces AS
select *
from Thailand_tourism_stats_by_provinces2
where Region is not null



--1. Overall Visitor Trends & The Impact of COVID-19:


-- Total visitor per year (full year)
SELECT
	Year,
	SUM([Total number of visitors (people)]) AS TotalVisitors,
	(SUM([Total number of visitors (people)]) - LAG(SUM([Total number of visitors (people)]),1) OVER (order by Year)) *100.0
	/ LAG(SUM([Total number of visitors (people)]),1) OVER (order by Year) AS PercentChange
FROM Tourist_Stats_by_Provinces
WHERE Year < 2024
GROUP BY Year
ORDER BY Year

-- Foreign visitor per year (full year)
SELECT
	Year,
	SUM([Number of foreign visitors (people)]) AS ForeignVisitors,
	(SUM([Number of foreign visitors (people)]) - LAG(SUM([Number of foreign visitors (people)]),1) OVER (order by Year)) *100.0
	/ LAG(SUM([Number of foreign visitors (people)]),1) OVER (order by Year) AS PercentChange
FROM Tourist_Stats_by_Provinces
WHERE Year < 2024
GROUP BY Year
ORDER BY Year




--2. Regional Variations in Tourism Performance:
SELECT
	Year,
	Region,
	SUM([Number of foreign visitors (people)]) AS ForeignVisitors,
	SUM([Income from foreign visitors (million baht)]) AS ForeignIncome,
	SUM([Income from foreign visitors (million baht)])*100.0 
	/ SUM(SUM([Income from foreign visitors (million baht)])) OVER (PARTITION BY Year) AS IncomeContribution
FROM Tourist_Stats_by_Provinces
WHERE Year < 2024
GROUP BY Year, Region
ORDER BY Year, Region



--3. Foreign Tourist Origins and Spending Patterns:

-- Top 5 source countries for foreign tourists in 2019
SELECT
	TOP 5 Country,
	SUM([Number of Tourists]) AS TouristArrivals
FROM Number_of_Foreign_Tourists_in_Thailand
WHERE Year = 2019
GROUP BY Country
ORDER BY TouristArrivals DESC

-- Top 5 source countries for foreign tourists in 2023
SELECT
	TOP 5 Country,
	SUM([Number of Tourists]) AS TouristArrivals
FROM Number_of_Foreign_Tourists_in_Thailand
WHERE Year = 2023
GROUP BY Country
ORDER BY TouristArrivals DESC


-- Income per foreign tourist.
WITH ForeignTouristsArrivalYearly AS (
SELECT
	Year,
	SUM([Number of Tourists]) AS ForeignTouristsArrival
FROM Number_of_Foreign_Tourists_in_Thailand
GROUP BY Year
),
IncomeForeignVisitorYearly AS (
SELECT
	Year,
	SUM([Income from foreign visitors (million baht)]*1000000) AS ForeignIncome
FROM Tourist_Stats_by_Provinces 
GROUP BY Year
)
SELECT
	fta.Year,
	ForeignTouristsArrival,
	ForeignIncome,
	ifv.ForeignIncome / fta.ForeignTouristsArrival AS IncomePerTourists
FROM ForeignTouristsArrivalYearly fta
JOIN IncomeForeignVisitorYearly ifv ON fta.Year = ifv.Year
ORDER BY fta.Year



-- Top 5 source countries for foreign tourists in 2021.
SELECT
	TOP 5 Country,
	SUM([Number of Tourists]) AS TouristArrivals
FROM Number_of_Foreign_Tourists_in_Thailand
WHERE Year = 2021
GROUP BY Country
ORDER BY TouristArrivals DESC



--4. Concentration Analysis (Top Provinces):

-- Ranking of provinces by income from foreign visitors in 2023
SELECT
	Provinces,
	SUM([Income from foreign visitors (million baht)]) AS ForeignIncome,
	RANK() OVER (ORDER BY SUM([Income from foreign visitors (million baht)]) DESC) AS Rank,
	(SUM(SUM([Income from foreign visitors (million baht)])) 
	OVER (ORDER BY SUM([Income from foreign visitors (million baht)]) DESC)) AS RunningTotalForeignIncome,
	(
	SUM(SUM([Income from foreign visitors (million baht)])) 
	OVER (ORDER BY SUM([Income from foreign visitors (million baht)]) DESC)*100.0
	/ SUM(SUM([Income from foreign visitors (million baht)])) OVER()
	) AS RunningTotalConcentration
FROM Tourist_Stats_by_Provinces
WHERE Year = 2023
GROUP BY Provinces
ORDER BY Rank



--5. Untapped Potential and Opportunities (Using Ratios):
SELECT
	Provinces,
	SUM([Income from foreign visitors (million baht)]) AS ForeignIncome,
	SUM([Income from Thai visitors (million baht)]) AS ThaiIncome,
	SUM([Income from foreign visitors (million baht)]) / SUM([Income from Thai visitors (million baht)]) AS ForeignVSThIncomeRatio
FROM Tourist_Stats_by_Provinces
WHERE Year=2023
GROUP BY Provinces
ORDER BY ThaiIncome DESC