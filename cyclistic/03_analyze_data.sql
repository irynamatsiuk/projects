-- Count how many trips were made by annual and casual members
SELECT 
    member_casual, COUNT(member_casual) AS total_rides
FROM
    vw_trips
GROUP BY member_casual;


-- Customers bike preferences 
SELECT 
    rideable_type,
    COUNT(CASE
        WHEN member_casual = 'member' THEN ride_id
    END) AS member_trips,
    COUNT(CASE
        WHEN member_casual = 'casual' THEN ride_id
    END) AS casual_trips
FROM
    vw_trips
GROUP BY rideable_type;


-- Average ride length in minutes 
SELECT 
    member_casual,
    ROUND(AVG(ride_length_min), 1) AS avg_trip_length
FROM
    vw_trips
GROUP BY member_casual;


-- Average ride length in minutes per type of bike
SELECT 
    rideable_type,
    ROUND(AVG(CASE
                WHEN member_casual = 'member' THEN ride_length_min
            END),
            1) AS member_avg_trip_length,
    ROUND(AVG(CASE
                WHEN member_casual = 'casual' THEN ride_length_min
            END),
            1) AS casual_avg_trip_length
FROM
    vw_trips
GROUP BY rideable_type;


-- Number of trips per memebership type and day 
SELECT 
    day_of_week,
    COUNT(CASE
        WHEN member_casual = 'member' THEN ride_id
    END) AS member_trips,
    COUNT(CASE
        WHEN member_casual = 'casual' THEN ride_id
    END) AS casual_trips
FROM
    vw_trips
GROUP BY day_of_week
ORDER BY FIELD(day_of_week,
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday');


-- Average trip length per memebership type and day
SELECT 
    day_of_week,
    ROUND(AVG(CASE
                WHEN member_casual = 'member' THEN ride_length_min
            END),
            1) AS member_avg_trip_length,
    ROUND(AVG(CASE
                WHEN member_casual = 'casual' THEN ride_length_min
            END),
            1) AS casual_avg_trip_length
FROM
    vw_trips
GROUP BY day_of_week
ORDER BY FIELD(day_of_week,
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday');


-- Trips count per memebership type and month
SELECT 
    month,
    COUNT(CASE
        WHEN member_casual = 'member' THEN ride_id
    END) AS member_trips,
    COUNT(CASE
        WHEN member_casual = 'casual' THEN ride_id
    END) AS casual_trips
FROM
    vw_trips
GROUP BY month
ORDER BY STR_TO_DATE(CONCAT('0001', month, '01'), '%Y %M %D');


-- Average trip length per membership type and  month
SELECT 
    month,
    ROUND(AVG(CASE
                WHEN member_casual = 'member' THEN ride_length_min
            END),
            1) AS member_avg_trip_length,
    ROUND(AVG(CASE
                WHEN member_casual = 'casual' THEN ride_length_min
            END),
            1) AS casual_avg_trip_length
FROM
    vw_trips
GROUP BY month
ORDER BY STR_TO_DATE(CONCAT('0001', month, '01'), '%Y %M %D');


-- Top 5 most populair start stations for members
SELECT 
    member_casual,
    start_station_name,
    COUNT(start_station_name) AS num_of_trips
FROM
    vw_trips
WHERE
    start_station_name IS NOT NULL
        AND member_casual = 'member'
GROUP BY member_casual , start_station_name
ORDER BY COUNT(start_station_name) DESC
LIMIT 5;


-- Top 5 most populair start stations for casual
SELECT 
    member_casual,
    start_station_name,
    COUNT(start_station_name) AS num_of_trips
FROM
    vw_trips
WHERE
    start_station_name IS NOT NULL
        AND member_casual = 'casual'
GROUP BY member_casual , start_station_name
ORDER BY COUNT(start_station_name) DESC
LIMIT 5;