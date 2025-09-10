Create Database Bike_Sharing_Data_Analysis;
Use Bike_Sharing_Data_Analysis;


--
-- SQL Project for a Fresher Data Analyst
--
-- Project Name: Bike-Sharing Data Analysis
-- Objective: Analyze bike trip data to uncover insights about usage patterns,
--            popular routes, and peak hours.
--
-- This script contains:
-- 1. A command to create a sample `bike_trips` table.
-- 2. Commands to insert sample data into the table.
-- 3. A series of commented-out SQL queries to answer specific analytical questions.
--    Uncomment and run them one by one to see the results.
--

-- ====================================================================
-- Step 1: Create the table
--
-- Note: The trip_id column was changed to VARCHAR(50) to work
--       with MySQL and other SQL dialects that require a key length.
-- ====================================================================
CREATE TABLE bike_trips (
    trip_id VARCHAR(50) PRIMARY KEY,
    bike_id TEXT,
    start_time TEXT,
    end_time TEXT,
    start_station_name TEXT,
    end_station_name TEXT,
    member_type TEXT,
    ride_duration_minutes INTEGER
);

-- ====================================================================
-- Step 2: Insert sample data
-- ====================================================================
INSERT INTO bike_trips (trip_id, bike_id, start_time, end_time, start_station_name, end_station_name, member_type, ride_duration_minutes) VALUES
('T1001', 'B01', '2023-08-01 07:00:00', '2023-08-01 07:15:00', 'Central Station', 'Park Avenue', 'member', 15),
('T1002', 'B02', '2023-08-01 07:05:00', '2023-08-01 07:25:00', 'City Hall', 'University Plaza', 'casual', 20),
('T1003', 'B03', '2023-08-01 08:30:00', '2023-08-01 08:45:00', 'Park Avenue', 'Central Station', 'member', 15),
('T1004', 'B04', '2023-08-01 09:10:00', '2023-08-01 09:30:00', 'University Plaza', 'City Hall', 'member', 20),
('T1005', 'B05', '2023-08-01 12:00:00', '2023-08-01 12:40:00', 'Central Station', 'Main Street', 'casual', 40),
('T1006', 'B06', '2023-08-01 17:00:00', '2023-08-01 17:10:00', 'Main Street', 'Central Station', 'member', 10),
('T1007', 'B07', '2023-08-02 08:00:00', '2023-08-02 08:15:00', 'Central Station', 'Park Avenue', 'member', 15),
('T1008', 'B08', '2023-08-02 10:00:00', '2023-08-02 10:00:00', 'City Hall', 'City Hall', 'member', 0), -- This is a trip to clean
('T1009', 'B09', '2023-08-02 18:30:00', '2023-08-02 18:50:00', 'University Plaza', 'Central Station', 'casual', 20),
('T1010', 'B10', '2023-08-02 19:00:00', '2023-08-02 19:10:00', 'Park Avenue', 'University Plaza', 'member', 10),
('T1011', 'B11', '2023-08-03 08:00:00', '2023-08-03 08:25:00', 'Central Station', 'Park Avenue', 'member', 25),
('T1012', 'B12', '2023-08-03 16:30:00', '2023-08-03 16:55:00', 'City Hall', 'Main Street', 'casual', 25);


-- ====================================================================
-- Step 3: Write and run your SQL queries
-- ====================================================================

-- Question 1: How many trips were taken by each member type (casual vs. member)?
-- This query uses COUNT and GROUP BY to show a basic distribution.
	 SELECT member_type, COUNT(*) AS total_trips
	 FROM bike_trips
	 GROUP BY member_type;

-- Question 2: What is the average trip duration for each member type?
-- This query uses AVG and GROUP BY to find the average.
	SELECT member_type, AVG(ride_duration_minutes) AS average_duration
	FROM bike_trips
	GROUP BY member_type;

-- Question 3: What are the 3 most popular starting stations?
-- This query uses COUNT, GROUP BY, ORDER BY, and LIMIT.
	SELECT start_station_name, COUNT(*) AS trip_count
	FROM bike_trips
	GROUP BY start_station_name
	ORDER BY trip_count DESC
	LIMIT 3;

-- Question 4: Find the most common route (start station to end station).
-- This query uses a composite GROUP BY to find the most frequent pair.
	SELECT start_station_name, end_station_name, COUNT(*) AS route_count
	FROM bike_trips
	GROUP BY start_station_name, end_station_name
	ORDER BY route_count DESC
	LIMIT 1;

-- Question 5: Identify the total number of trips for each hour of the day.
-- This query uses a function (strftime in SQLite) and GROUP BY to extract
-- a specific part of a date/time string.
		 SELECT HOUR(start_time) AS hour_of_day,
		   COUNT(*) AS trip_count
	FROM bike_trips
	GROUP BY hour_of_day
	ORDER BY hour_of_day;

-- Question 6: What's the shortest and longest trip duration, excluding trips of 0 minutes?
-- This query uses MIN, MAX, and a WHERE clause for data cleaning.
	SELECT MIN(ride_duration_minutes) AS shortest_trip,
			MAX(ride_duration_minutes) AS longest_trip
	 FROM bike_trips
	 WHERE ride_duration_minutes > 0;

-- Question 7: Find the total number of unique bikes used.
-- This query uses COUNT with the DISTINCT keyword.
	SELECT COUNT(DISTINCT bike_id) AS total_unique_bikes
	FROM bike_trips;
    
    select * from bike_trips;
    
    
