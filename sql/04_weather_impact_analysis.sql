USE dc_violations;

-- Join Weather and Violations

SELECT
    v.ticket_id,
    v.issue_date,
    v.violation_desc,
    v.total_fine,
    w.temp,
    w.precip,
    w.conditions
FROM violations v
LEFT JOIN weather w
ON STR_TO_DATE(v.weather_date,'%c/%e/%Y')
 = STR_TO_DATE(w.weather_date,'%c/%e/%Y');

-- Violations by Weather Condition

SELECT
    w.conditions,
    COUNT(v.ticket_id) AS violation_count
FROM violations v
LEFT JOIN weather w
ON STR_TO_DATE(v.weather_date,'%c/%e/%Y')
 = STR_TO_DATE(w.weather_date,'%c/%e/%Y')
GROUP BY w.conditions
ORDER BY violation_count DESC;

-- Average Fine by Weather Condition

SELECT
    w.conditions,
    ROUND(AVG(v.total_fine),2) AS avg_fine
FROM violations v
LEFT JOIN weather w
ON STR_TO_DATE(v.weather_date,'%c/%e/%Y')
 = STR_TO_DATE(w.weather_date,'%c/%e/%Y')
GROUP BY w.conditions
ORDER BY avg_fine DESC;
