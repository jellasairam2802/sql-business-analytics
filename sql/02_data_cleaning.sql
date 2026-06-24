USE dc_violations;

-- Check row counts

SELECT COUNT(*) AS violations_count
FROM violations;

SELECT COUNT(*) AS weather_count
FROM weather;

-- Check for NULL values

SELECT *
FROM violations
WHERE ticket_id IS NULL;

SELECT *
FROM weather
WHERE weather_date IS NULL;

-- Remove duplicate violation records

SELECT ticket_id,
       COUNT(*) AS duplicate_count
FROM violations
GROUP BY ticket_id
HAVING COUNT(*) > 1;

-- Verify date formats

SELECT DISTINCT weather_date
FROM violations
LIMIT 20;

SELECT DISTINCT weather_date
FROM weather
LIMIT 20;
