-- KPI 1: National Average Readmission Ratio

SELECT 
    ROUND(AVG(excess_readmission_ratio)::numeric, 3) AS national_avg_readmission_ratio
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL;

-- KPI 2: Total Facilities Analyzed

SELECT 
    COUNT(DISTINCT facility_id) AS total_facilities
FROM cms_readmissions.hospital_readmissions;

-- KPI 3: State with Highest Average Readmission Ratio

SELECT 
    state, 
    ROUND(AVG(excess_readmission_ratio)::numeric, 3) AS avg_readmission_ratio
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL
GROUP BY state
ORDER BY avg_readmission_ratio DESC
LIMIT 1;

-- KPI 4: Percentage of Facilities Above Expected Rate (excess_readmission_ratio > 1)
SELECT 
    ROUND(
        100.0 * COUNT(CASE WHEN excess_readmission_ratio > 1 THEN 1 END) 
        / COUNT(*), 
        1
    ) AS percent_facilities_above_expected
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL;

