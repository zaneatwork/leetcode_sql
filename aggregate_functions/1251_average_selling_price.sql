-- Table: Prices
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | start_date    | date    |
-- | end_date      | date    |
-- | price         | int     |
-- +---------------+---------+
-- (product_id, start_date, end_date) is the primary key (combination of columns 
-- with unique values) for this table.
-- Each row of this table indicates the price of the product_id in the period 
-- from start_date to end_date.
-- For each product_id there will be no two overlapping periods. That means 
-- there will be no two intersecting periods for the same product_id.
--
--  
--
-- Table: UnitsSold
--
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | purchase_date | date    |
-- | units         | int     |
-- +---------------+---------+
-- This table may contain duplicate rows.
-- Each row of this table indicates the date, units, and product_id of each 
-- product sold. 
--
--  
--
-- Write a solution to find the average selling price for each product. 
-- average_price should be rounded to 2 decimal places.
--
-- Return the result table in any order.

SELECT Prices.product_id, COALESCE(ROUND(SUM(UnitsSold.units*Prices.price)::decimal/SUM(UnitsSold.units)::decimal, 2), 0) AS average_price
FROM Prices 
LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date
GROUP BY Prices.product_id;
