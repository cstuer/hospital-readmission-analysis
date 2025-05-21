--Original table accounting for import before alter
CREATE TABLE hospital_readmissions (
    facility_name VARCHAR(255),
    facility_id FLOAT,
    state VARCHAR(50),
    measure_name VARCHAR(50),
    number_of_discharges VARCHAR(20),
    footnote VARCHAR(20),
    excess_readmission_ratio VARCHAR(20),
    predicted_readmission_rate VARCHAR(20),
    expected_readmission_rate VARCHAR(20),
    number_of_readmissions VARCHAR(50),
    start_date VARCHAR(50),
    end_date VARCHAR(50)
);

-- Clean dirty values (N/A, Too few to report)
UPDATE cms_readmissions.hospital_readmissions
SET number_of_discharges = NULL
WHERE number_of_discharges IN ('N/A', '', 'Too Few to Report');

UPDATE cms_readmissions.hospital_readmissions
SET excess_readmission_ratio = NULL
WHERE excess_readmission_ratio IN ('N/A', '', 'Too Few to Report');

UPDATE cms_readmissions.hospital_readmissions
SET number_of_readmissions = NULL
WHERE number_of_readmissions IN ('N/A', '', 'Too Few to Report');

--New columns as correct data types
ALTER TABLE cms_readmissions.hospital_readmissions
ADD COLUMN number_of_discharges_clean INT,
ADD COLUMN excess_readmission_ratio_clean FLOAT,
ADD COLUMN number_of_readmissions_clean INT,
ADD COLUMN start_date_clean DATE,
ADD COLUMN end_date_clean DATE;

UPDATE cms_readmissions.hospital_readmissions
SET number_of_discharges_clean = number_of_discharges::INT
WHERE number_of_discharges IS NOT NULL;

UPDATE cms_readmissions.hospital_readmissions
SET excess_readmission_ratio_clean = excess_readmission_ratio::FLOAT
WHERE excess_readmission_ratio IS NOT NULL;

UPDATE cms_readmissions.hospital_readmissions
SET number_of_readmissions_clean = number_of_readmissions::INT
WHERE number_of_readmissions ~ '^\d+$';

UPDATE cms_readmissions.hospital_readmissions
SET start_date_clean = TO_DATE(start_date, 'MM/DD/YYYY')
WHERE start_date IS NOT NULL;

UPDATE cms_readmissions.hospital_readmissions
SET end_date_clean = TO_DATE(end_date, 'MM/DD/YYYY')
WHERE end_date IS NOT NULL;

ALTER TABLE cms_readmissions.hospital_readmissions
ADD COLUMN predicted_readmission_rate_clean FLOAT,
ADD COLUMN expected_readmission_rate_clean FLOAT;

UPDATE cms_readmissions.hospital_readmissions
SET predicted_readmission_rate_clean = predicted_readmission_rate::FLOAT
WHERE predicted_readmission_rate ~ '^\d+(\.\d+)?$';

UPDATE cms_readmissions.hospital_readmissions
SET expected_readmission_rate_clean = expected_readmission_rate::FLOAT
WHERE expected_readmission_rate ~ '^\d+(\.\d+)?$';

--Drop dirty columns and rename clean
ALTER TABLE cms_readmissions.hospital_readmissions
DROP COLUMN number_of_discharges,
DROP COLUMN excess_readmission_ratio,
DROP COLUMN number_of_readmissions,
DROP COLUMN start_date,
DROP COLUMN end_date,
DROP COLUMN predicted_readmission_rate,
DROP COLUMN expected_readmission_rate;

ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN predicted_readmission_rate_clean TO predicted_readmission_rate;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN expected_readmission_rate_clean TO expected_readmission_rate;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN number_of_discharges_clean TO number_of_discharges;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN excess_readmission_ratio_clean TO excess_readmission_ratio;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN number_of_readmissions_clean TO number_of_readmissions;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN start_date_clean TO start_date;
ALTER TABLE cms_readmissions.hospital_readmissions RENAME COLUMN end_date_clean TO end_date;




