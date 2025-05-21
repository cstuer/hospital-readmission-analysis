-- Average Excess Readmission Ratio by State

SELECT 
    state,
    ROUND(AVG(excess_readmission_ratio)::numeric, 3) AS avg_readmission_ratio
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL
GROUP BY state
ORDER BY avg_readmission_ratio DESC;

-- Top 10 Facilities with the Highest Readmission Ratios

SELECT 
    facility_name,
    state,
    excess_readmission_ratio
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL
ORDER BY excess_readmission_ratio DESC
LIMIT 10;

--Readmission Ratio Performance Categories

SELECT
    CASE 
        WHEN excess_readmission_ratio < 0.8 THEN 'Below 0.8'
        WHEN excess_readmission_ratio BETWEEN 0.8 AND 1.0 THEN '0.8 - 1.0'
        WHEN excess_readmission_ratio BETWEEN 1.0 AND 1.2 THEN '1.0 - 1.2'
        ELSE 'Above 1.2'
    END AS ratio_bucket,
    COUNT(*) AS facility_count
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL
GROUP BY ratio_bucket
ORDER BY ratio_bucket;

-- Total Number of Readmissions by State

SELECT 
    state,
    SUM(number_of_readmissions) AS total_readmissions
FROM cms_readmissions.hospital_readmissions
WHERE number_of_readmissions IS NOT NULL
GROUP BY state
ORDER BY total_readmissions DESC;

-- Predicted vs Expected Readmission Rates by State

SELECT 
    state,
    ROUND(AVG(predicted_readmission_rate::FLOAT)::numeric, 2) AS avg_predicted_rate,
    ROUND(AVG(expected_readmission_rate::FLOAT)::numeric, 2) AS avg_expected_rate
FROM cms_readmissions.hospital_readmissions
WHERE predicted_readmission_rate IS NOT NULL
  AND expected_readmission_rate IS NOT NULL
GROUP BY state
ORDER BY avg_predicted_rate DESC;



