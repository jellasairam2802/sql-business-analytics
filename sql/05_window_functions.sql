USE dc_violations;

-- Rank Violations by Frequency

SELECT
    violation_desc,
    COUNT(*) AS violation_count,
    RANK() OVER(
        ORDER BY COUNT(*) DESC
    ) AS violation_rank
FROM violations
GROUP BY violation_desc;

-- Rank Agencies by Fine Revenue

SELECT
    issuing_agency_name,
    SUM(total_fine) AS total_fines,
    DENSE_RANK() OVER(
        ORDER BY SUM(total_fine) DESC
    ) AS agency_rank
FROM violations
GROUP BY issuing_agency_name;

-- Running Total of Fine Revenue

SELECT
    issue_date,
    SUM(total_fine) AS daily_fine,
    SUM(SUM(total_fine))
    OVER(
        ORDER BY issue_date
    ) AS running_total
FROM violations
GROUP BY issue_date;
