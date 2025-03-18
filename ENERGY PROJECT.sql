--Retrieve all energy consumption data
SELECT * FROM energy_consumption;

--Find all records for a specific date (e.g., March 1, 2024)
SELECT * FROM energy_consumption WHERE date = '2024-03-01';

--Retrieve energy consumption for a specific region (e.g., "North")
SELECT * 
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
WHERE r.region_name = 'North';
 --Find total energy consumed per region
 SELECT r.region_name, SUM(ec.energy_consumed_mwh) AS total_energy
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
GROUP BY r.region_name;

--Find average energy consumption per hour for each region
SELECT r.region_name, AVG(ec.energy_consumed_mwh) AS Avg_energy
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
GROUP BY r.region_name;

--List energy records ordered by consumption in descending order.
SELECT * FROM energy_consumption ORDER BY energy_consumed_mwh DESC;

-- Find energy consumption between 500 and 1000 MWh.
SELECT * FROM energy_consumption WHERE energy_consumed_mwh BETWEEN 500 AND 1000;

-- Find regions containing "South" in the name.
SELECT * FROM regions WHERE region_name LIKE '%South%';

-- Retrieve the top 5 highest energy consumption records.
SELECT * FROM energy_consumption ORDER BY energy_consumed_mwh DESC LIMIT 5;
-- Count the total number of energy consumption records.
SELECT COUNT(*) FROM energy_consumption;
-- Find regions where total energy consumption is above 500 MWh.
SELECT r.region_name, SUM(ec.energy_consumed_mwh) AS total_energy
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
GROUP BY r.region_name
HAVING SUM(ec.energy_consumed_mwh) > 500;
-- Find energy consumption per region.
SELECT ec.date, r.region_name, ec.energy_consumed_mwh
FROM energy_consumption ec
INNER JOIN regions r ON ec.region_id = r.region_id;

-- Show all regions even if they have no energy data (LEFT JOIN).
SELECT r.region_name, ec.energy_consumed_mwh
FROM regions r
LEFT JOIN energy_consumption ec ON r.region_id = ec.region_id;
-- Find the region with the highest energy consumption.
SELECT region_name FROM regions WHERE region_id = (
    SELECT region_id FROM energy_consumption 
    GROUP BY region_id
    ORDER BY SUM(energy_consumed_mwh) DESC 
    LIMIT 1
);
-- Find energy records above the daily average.
SELECT * FROM energy_consumption ec
WHERE ec.energy_consumed_mwh > (
    SELECT AVG(energy_consumed_mwh) FROM energy_consumption WHERE ec.date = date
);

-- Find the top 3 energy-consuming regions.
WITH region_totals AS (
    SELECT r.region_name, SUM(ec.energy_consumed_mwh) AS total_energy
    FROM energy_consumption ec
    JOIN regions r ON ec.region_id = r.region_id
    GROUP BY r.region_name
)
SELECT * FROM region_totals ORDER BY total_energy DESC LIMIT 3;
-- Rank regions based on total energy consumption.
SELECT r.region_name, SUM(ec.energy_consumed_mwh) AS total_energy,
RANK() OVER (ORDER BY SUM(ec.energy_consumed_mwh) DESC) AS rank
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
GROUP BY r.region_name;
-- Rank regions based on total energy consumption.
SELECT r.region_name, SUM(ec.energy_consumed_mwh) AS total_energy,
RANK() OVER (ORDER BY SUM(ec.energy_consumed_mwh) DESC) AS rank
FROM energy_consumption ec
JOIN regions r ON ec.region_id = r.region_id
GROUP BY r.region_name;
-- Update energy consumption value.
UPDATE energy_consumption
SET energy_consumed_mwh = 800
WHERE region_id = 1;
-- Insert new energy consumption data.
INSERT INTO energy_consumption (region_id, date, hour_of_day, energy_consumed_mwh) 
VALUES (1, '2024-03-02', 14, 750.5);
-- Update energy consumption value.
UPDATE energy_consumption SET energy_consumed_mwh = 800 WHERE ec.region_id = 1;


-- Delete all energy data before 2020.
DELETE FROM energy_consumption WHERE date < '2020-01-01';
-- Add a new column to store population.
ALTER TABLE regions ADD COLUMN population INT;

-- Drop the regions table.
DROP TABLE regions;


