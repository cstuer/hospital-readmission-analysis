-- State Level Readmission Averages

SELECT 
    state,
    ROUND(AVG(excess_readmission_ratio)::numeric, 3) AS avg_readmission_ratio
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL
GROUP BY state
ORDER BY avg_readmission_ratio DESC;

