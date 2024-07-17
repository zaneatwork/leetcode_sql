-- Table: Weather
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
--  
--
-- Write a solution to find all dates' Id with higher temperatures compared to 
-- its previous dates (yesterday).
--
-- Return the result table in any order.

SELECT w1.id
FROM Weather w1 JOIN Weather w2
ON DATE_PART('day', w1.recordDate::timestamp - w2.recordDate::timestamp) = 1 
AND w1.Temperature > w2.Temperature;
