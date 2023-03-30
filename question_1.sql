--1. What range of years for baseball games played does the provided database cover? 

SELECT MIN(yearid) AS first_year,
	   MAX(yearid) AS last_year,
	   MAX(yearid) - MIN(yearid) AS total_years
FROM appearances;

--The dataset begins with the year 1871 and ends in 2016, representing data from 145 years of baseball. 