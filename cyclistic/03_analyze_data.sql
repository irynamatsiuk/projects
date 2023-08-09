-- Count how many trips were made by annual and casual members
SELECT 
    member_casual, COUNT(member_casual) AS total_rides
FROM
    vw_trips
GROUP BY member_casual;


-- Customers bike preferences 
SELECT 
    member_casual,
    rideable_type,
    COUNT(rideable_type) AS total_rides
FROM
    vw_trips
GROUP BY member_casual , rideable_type;


-- Average ride length in minutes 
SELECT 
    member_casual, AVG(ride_length_min) AS avg_trip_length
FROM
    vw_trips
GROUP BY member_casual;


-- Average ride length in minutes per type of bike
SELECT 
    member_casual,
    rideable_type,
    AVG(ride_length_min) AS avg_trip_length
FROM
    vw_trips
GROUP BY member_casual , rideable_type
ORDER BY avg_trip_length DESC;


-- Number of trips depending on weekday 
SELECT 
    member_casual, day_of_week, COUNT(ride_id) AS num_of_trips
FROM
    vw_trips
GROUP BY member_casual , day_of_week
ORDER BY num_of_trips DESC;

-- Average trip length per weekday
SELECT 
    member_casual,
    day_of_week,
    AVG(ride_length_min) AS avg_trip_length
FROM
    vw_trips
GROUP BY member_casual , day_of_week
ORDER BY avg_trip_length DESC;


-- Number of trips depending on month 
SELECT 
    member_casual, month, COUNT(ride_id) AS num_of_trips
FROM
    vw_trips
GROUP BY member_casual , month
ORDER BY num_of_trips DESC;


-- Average trip length per month
SELECT 
    member_casual,
    month,
    AVG(ride_length_min) AS avg_trip_length
FROM
    vw_trips
GROUP BY member_casual , month
ORDER BY avg_trip_length DESC;


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