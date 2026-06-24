USE dc_violations;

-- Top 10 Most Common Violations

SELECT violation_desc,
       COUNT(*) AS violation_count
FROM violations
GROUP BY violation_desc
ORDER BY violation_count DESC
LIMIT 10;

-- Violations by Hour

SELECT issue_hour,
       COUNT(*) AS violation_count
FROM violations
GROUP BY issue_hour
ORDER BY issue_hour;

-- Top Agencies by Citations

SELECT issuing_agency_name,
       COUNT(*) AS citations_issued
FROM violations
GROUP BY issuing_agency_name
ORDER BY citations_issued DESC
LIMIT 10;

-- Highest Revenue Violations

SELECT violation_desc,
       SUM(total_fine) AS total_fine_amount
FROM violations
GROUP BY violation_desc
ORDER BY total_fine_amount DESC
LIMIT 10;
