CREATE DATABASE Thailand_tourism_data


-- Create the table in the specified schema
CREATE TABLE Thailand_tourism_data.dbo.tourism_stats
(
    period_start NVARCHAR(7), -- primary key column
    Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons DECIMAL(10,3),
    Rate_of_Accommodation_occupancy_Nationwide_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_South_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_North_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_Northeast_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Nationwide_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_South_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_North_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Northeast_Monthly_percent DECIMAL(5,2),
	Average_room_rental_rate_Nationwide_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_Central_including_Bangkok_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_South_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_North_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_Northeast_Monthly_Baht_per_room DECIMAL(10,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Nationwide_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_South_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_North_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Northeast_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Nationwide_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_South_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_North_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Northeast_Monthly_percent DECIMAL(5,2)
    -- specify more columns here
);

-- Create another table to store update data.
CREATE TABLE Thailand_tourism_data.dbo.update_tourism_stats
(
    period_start NVARCHAR(7),
    Number_of_foreign_tourists_visiting_Thailand_Monthly_Thousand_of_persons DECIMAL(10,3),
    Rate_of_Accommodation_occupancy_Nationwide_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_South_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_North_Monthly_percent DECIMAL(5,2),
    Rate_of_Accommodation_occupancy_Northeast_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Nationwide_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_South_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_North_Monthly_percent DECIMAL(5,2),
	Rate_of_3_month_advanced_booking_Northeast_Monthly_percent DECIMAL(5,2),
	Average_room_rental_rate_Nationwide_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_Central_including_Bangkok_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_South_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_North_Monthly_Baht_per_room DECIMAL(10,2),
	Average_room_rental_rate_Northeast_Monthly_Baht_per_room DECIMAL(10,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Nationwide_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_South_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_North_Monthly_percent DECIMAL(5,2),
	Share_of_revenue_from_conference_seminar_package_to_total_revenue_Northeast_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Nationwide_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Central_including_Bangkok_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_South_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_North_Monthly_percent DECIMAL(5,2),
	Share_of_foreign_tourists_to_total_guests_Northeast_Monthly_percent DECIMAL(5,2)
);
