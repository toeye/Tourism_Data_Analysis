-- Create View for region level data
CREATE VIEW BOT_Tourist_Stats_View AS 
WITH tourism_stats_decimal AS (
-- Convert data type to DECIMAL(13,4) for all column.
-- UNPIVOT will raise error if there are multiple data types for unpivot columns.
 SELECT
  period_start,
  CAST(Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons AS DECIMAL(13,4)) AS Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons,
  CAST(Rate_of_Accommodation_occupancy_Nationwide_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_Accommodation_occupancy_Nationwide_Monthly_percent,
  CAST(Rate_of_Accommodation_occupancy_Central_including_Bangkok_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_Accommodation_occupancy_Central_including_Bangkok_Monthly_percent,
  CAST(Rate_of_Accommodation_occupancy_South_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_Accommodation_occupancy_South_Monthly_percent,
  CAST(Rate_of_Accommodation_occupancy_North_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_Accommodation_occupancy_North_Monthly_percent,
  CAST(Rate_of_Accommodation_occupancy_Northeast_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_Accommodation_occupancy_Northeast_Monthly_percent,
  CAST(Rate_of_3_month_advanced_booking_Nationwide_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_3_month_advanced_booking_Nationwide_Monthly_percent,
  CAST(Rate_of_3_month_advanced_booking_Central_including_Bangkok_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_3_month_advanced_booking_Central_including_Bangkok_Monthly_percent,
  CAST(Rate_of_3_month_advanced_booking_South_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_3_month_advanced_booking_South_Monthly_percent,
  CAST(Rate_of_3_month_advanced_booking_North_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_3_month_advanced_booking_North_Monthly_percent,
  CAST(Rate_of_3_month_advanced_booking_Northeast_Monthly_percent AS DECIMAL(13,4)) AS Rate_of_3_month_advanced_booking_Northeast_Monthly_percent,
  CAST(Average_room_rental_rate_Nationwide_Monthly_Baht_per_room AS DECIMAL(13,4)) AS Average_room_rental_rate_Nationwide_Monthly_Baht_per_room,
  CAST(Average_room_rental_rate_Central_including_Bangkok_Monthly_Baht_per_room AS DECIMAL(13,4)) AS Average_room_rental_rate_Central_including_Bangkok_Monthly_Baht_per_room,
  CAST(Average_room_rental_rate_South_Monthly_Baht_per_room AS DECIMAL(13,4)) AS Average_room_rental_rate_South_Monthly_Baht_per_room,
  CAST(Average_room_rental_rate_North_Monthly_Baht_per_room AS DECIMAL(13,4)) AS Average_room_rental_rate_North_Monthly_Baht_per_room,
  CAST(Average_room_rental_rate_Northeast_Monthly_Baht_per_room AS DECIMAL(13,4)) AS Average_room_rental_rate_Northeast_Monthly_Baht_per_room,
  CAST(Share_of_revenue_from_conference_seminar_package_to_total_revenue_Nationwide_Monthly_percent AS DECIMAL(13,4)) AS Share_of_revenue_from_conference_seminar_package_to_total_revenue_Nationwide_Monthly_percent,
  CAST(Share_of_revenue_from_conference_seminar_package_to_total_revenue_Central_including_Bangkok_Monthly_percent AS DECIMAL(13,4)) AS Share_of_revenue_from_conference_seminar_package_to_total_revenue_Central_including_Bangkok_Monthly_percent,
  CAST(Share_of_revenue_from_conference_seminar_package_to_total_revenue_South_Monthly_percent AS DECIMAL(13,4)) AS Share_of_revenue_from_conference_seminar_package_to_total_revenue_South_Monthly_percent,
  CAST(Share_of_revenue_from_conference_seminar_package_to_total_revenue_North_Monthly_percent AS DECIMAL(13,4)) AS Share_of_revenue_from_conference_seminar_package_to_total_revenue_North_Monthly_percent,
  CAST(Share_of_revenue_from_conference_seminar_package_to_total_revenue_Northeast_Monthly_percent AS DECIMAL(13,4)) AS Share_of_revenue_from_conference_seminar_package_to_total_revenue_Northeast_Monthly_percent,
  CAST(Share_of_foreign_tourists_to_total_guests_Nationwide_Monthly_percent AS DECIMAL(13,4)) AS Share_of_foreign_tourists_to_total_guests_Nationwide_Monthly_percent,
  CAST(Share_of_foreign_tourists_to_total_guests_Central_including_Bangkok_Monthly_percent AS DECIMAL(13,4)) AS Share_of_foreign_tourists_to_total_guests_Central_including_Bangkok_Monthly_percent,
  CAST(Share_of_foreign_tourists_to_total_guests_South_Monthly_percent AS DECIMAL(13,4)) AS Share_of_foreign_tourists_to_total_guests_South_Monthly_percent,
  CAST(Share_of_foreign_tourists_to_total_guests_North_Monthly_percent AS DECIMAL(13,4)) AS Share_of_foreign_tourists_to_total_guests_North_Monthly_percent,
  CAST(Share_of_foreign_tourists_to_total_guests_Northeast_Monthly_percent AS DECIMAL(13,4)) AS Share_of_foreign_tourists_to_total_guests_Northeast_Monthly_percent
 FROM tourism_stats
),

unpivot_tourist_stats AS (
 -- UNPIVOT all column
 SELECT period_start, temp_column, Value
 FROM (
  SELECT
   *
  FROM tourism_stats_decimal
 ) AS s
 UNPIVOT
 (
  Value FOR temp_column IN (Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons, Rate_of_Accommodation_occupancy_Nationwide_Monthly_percent, Rate_of_Accommodation_occupancy_Central_including_Bangkok_Monthly_percent, Rate_of_Accommodation_occupancy_South_Monthly_percent, Rate_of_Accommodation_occupancy_North_Monthly_percent, Rate_of_Accommodation_occupancy_Northeast_Monthly_percent, Rate_of_3_month_advanced_booking_Nationwide_Monthly_percent, Rate_of_3_month_advanced_booking_Central_including_Bangkok_Monthly_percent, Rate_of_3_month_advanced_booking_South_Monthly_percent, Rate_of_3_month_advanced_booking_North_Monthly_percent, Rate_of_3_month_advanced_booking_Northeast_Monthly_percent, Average_room_rental_rate_Nationwide_Monthly_Baht_per_room, Average_room_rental_rate_Central_including_Bangkok_Monthly_Baht_per_room, Average_room_rental_rate_South_Monthly_Baht_per_room, Average_room_rental_rate_North_Monthly_Baht_per_room, Average_room_rental_rate_Northeast_Monthly_Baht_per_room, Share_of_revenue_from_conference_seminar_package_to_total_revenue_Nationwide_Monthly_percent, Share_of_revenue_from_conference_seminar_package_to_total_revenue_Central_including_Bangkok_Monthly_percent, Share_of_revenue_from_conference_seminar_package_to_total_revenue_South_Monthly_percent, Share_of_revenue_from_conference_seminar_package_to_total_revenue_North_Monthly_percent, Share_of_revenue_from_conference_seminar_package_to_total_revenue_Northeast_Monthly_percent, Share_of_foreign_tourists_to_total_guests_Nationwide_Monthly_percent, Share_of_foreign_tourists_to_total_guests_Central_including_Bangkok_Monthly_percent, Share_of_foreign_tourists_to_total_guests_South_Monthly_percent, Share_of_foreign_tourists_to_total_guests_North_Monthly_percent, Share_of_foreign_tourists_to_total_guests_Northeast_Monthly_percent)
 ) AS unpvt

),

BOT_tourism_stats_for_join AS (
-- Create (Pivot) the stats from temp column.
 SELECT
  year,
  month_num,
  Region,
  SUM(CASE WHEN temp_column LIKE '%occupancy%' THEN Value END) AS occupancy_rate,
  SUM(CASE WHEN temp_column LIKE '%3_month_advanced%' THEN Value END) AS three_month_advanced_booking,
  SUM(CASE WHEN temp_column LIKE '%room_rental_rate%' THEN Value END) AS avg_room_rent_rate,
  SUM(CASE WHEN temp_column LIKE '%revenue_from_conference%' THEN Value END) AS share_rev_conference,
  SUM(CASE WHEN temp_column LIKE '%share_of_foreign%' THEN Value END) AS share_foreign_to_total_guests
 FROM (
-- Create year, month and region columns.
  SELECT
   LEFT(period_start,4) AS year,
   CAST( RIGHT(period_start,2) AS INT) AS month_num,
   CASE
    WHEN PATINDEX('%Nationwide%',temp_column)>0 THEN 'Nationwide'
    WHEN PATINDEX('%Central%',temp_column)>0 THEN 'Central'
    WHEN PATINDEX('%South%',temp_column)>0 THEN 'South'
    WHEN PATINDEX('%Northeast%',temp_column)>0 THEN 'Northeast'
    WHEN PATINDEX('%North%',temp_column)>0 THEN 'North'
    ELSE NULL
   END AS Region,
   temp_column,
   Value
  FROM unpivot_tourist_stats) AS subquery
 WHERE Region IS NOT NULL
 GROUP BY year, 
    month_num, 
    Region
)

SELECT
 EOMONTH( DATEFROMPARTS(Year,month_num,1)) AS date,
 Region,
 occupancy_rate,
 three_month_advanced_booking,
 avg_room_rent_rate,
 share_rev_conference,
 share_foreign_to_total_guests
FROM BOT_tourism_stats_for_join




-- Create View for nationwide level data
CREATE VIEW BOT_Tourist_Stats_View_Nationwide2 AS 
WITH BOT_Tourists_Stats_Nationwide AS (
 SELECT
  date,
  occupancy_rate,
  three_month_advanced_booking,
  avg_room_rent_rate,
  share_rev_conference,
  share_foreign_to_total_guests
 FROM BOT_Tourist_Stats_View
 WHERE Region='Nationwide'
),
NumberofForeignTourists AS (
 SELECT
  EOMONTH( DATEFROMPARTS(LEFT(period_start,4),CAST( RIGHT(period_start,2) AS INT),1)) AS date,
  Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons AS NumberOfForeignTourists
 FROM tourism_stats
)
SELECT
 btsn.date,
 NumberOfForeignTourists,
 occupancy_rate,
 three_month_advanced_booking,
 avg_room_rent_rate,
 share_rev_conference,
 share_foreign_to_total_guests
FROM NumberofForeignTourists nft
LEFT JOIN BOT_Tourists_Stats_Nationwide btsn
ON nft.date = btsn.date
