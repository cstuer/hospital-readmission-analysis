-- Facility-Level Readmission Performance Data

SELECT 
    facility_name,
    state,
    number_of_discharges,
    excess_readmission_ratio,
    predicted_readmission_rate,
    expected_readmission_rate
FROM cms_readmissions.hospital_readmissions
WHERE excess_readmission_ratio IS NOT NULL;
