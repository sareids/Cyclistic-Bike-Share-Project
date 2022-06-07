-- Capstone Project - Cyclist Bike Share Project for Google Analyst Certification --

USE [SharedCyclingProject];

--Combine tables for all months into one table --

INSERT INTO [dbo].[Mar2021-tripdata]
SELECT * 
FROM [dbo].[Feb2022-tripdata];

--Total rows of data - 5,667,986 --

SELECT COUNT (*) 
FROM [dbo].[Mar2021-tripdata];

-- Remove duplicates - Total rows - 5,667,986 --

SELECT 
 DISTINCT *
FROM [dbo].[Mar2021-tripdata];

-- Remove NULL values from the data - Results: 0 rows --

SELECT *
FROM 
	[dbo].[Mar2021-tripdata]
WHERE
	[ride_id] IS NULL AND
	[rideable_type] IS NULL AND
	[started_at] IS NULL AND
	[ended_at] IS NULL AND
	[member_casual] IS NULL;

-- Create columns separting beginning and ending dates and times --
-- Add column to calculate ride length and rental day --

SELECT 
	[rideable_type],
	[member_casual],
	[start_station_name], 
	[end_station_name],
	[start_station_id],
	[end_station_id],
	[start_lat],
	[end_lat],
	CAST (started_at  AS date) AS start_date,
	CAST (ended_at AS date) AS end_date,
	CAST (started_at  AS time(0)) AS start_time,
	CAST (ended_at AS time(0)) AS end_time,
	DATEDIFF(minute,[started_at],[ended_at]) AS [ride_length],
	DATENAME(weekday,[started_at]) AS [rental_day]
FROM
	[dbo].[Mar2021-tripdata]

ALTER TABLE [dbo].[Mar2021-tripdata]
	ADD rental_day varchar(15);




	
	




















