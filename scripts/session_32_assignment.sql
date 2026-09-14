-- 1. Show records of 'male' patient from 'southwest' region.

SELECT * FROM insurance_data
WHERE gender = 'male' AND region = 'southwest';

SELECT COUNT(*) FROM insurance_data
WHERE gender = 'male' AND region = 'southwest';


-- 2. Show all records having bmi in range 30 to 45 both inclusive.

SELECT * FROM insurance_data
WHERE bmi BETWEEN 30 AND 45;

-- 3. Show minimum and maximum bloodpressure of diabetic patient who smokes. 
--    Make column names as MinBP and MaxBP respectively.

SELECT MIN(bloodpressure) FROM insurance_data
WHERE diabetic = 'Yes' AND smoker = 'Yes';
SELECT MAX(bloodpressure) FROM insurance_data
WHERE diabetic = 'Yes' AND smoker = 'Yes';

SELECT MIN(bloodpressure) AS 'MinBP', MAX(bloodpressure) AS 'MaxBP' 
FROM insurance_data 
WHERE diabetic = 'Yes' AND smoker = 'Yes';

-- 4. Find no of unique patients who are not from southwest region.

SELECT COUNT(DISTINCT(patientID)) FROM insurance_data
WHERE region NOT IN ('southwest');

-- 5. Total claim amount from male smoker.
SELECT SUM(claim) FROM insurance_data
WHERE gender = 'male';


-- 6. Select all records of south region.
SELECT * FROM insurance_data
WHERE region IN ('southeast', 'southwest');


-- 7. No of patient having normal blood pressure. Normal range[90-120]
SELECT COUNT(patientID) FROM insurance_data
WHERE bloodpressure BETWEEN 90 AND 120;

-- 8. No of pateints below 17 years of age having normal blood pressure as per below formula -
--    BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
--    Note: Formula taken just for practice, don't take in real sense.

SELECT COUNT(*) AS normal_bp_patient
FROM insurance_data
WHERE age < 17 
AND bloodpressure BETWEEN (80 + (age*2)) AND (100 + (age*2));

SELECT * FROM insurance_data
WHERE age < 17;

-- 9. What is the average claim amount for non-smoking female patients who are diabetic?
SELECT AVG(claim) AS avg_claim 
FROM insurance_data
WHERE gender = 'female' AND smoker = 'Yes' AND diabetic = 'Yes';

SELECT claim AS avg_claim, smoker, diabetic
FROM insurance_data
WHERE gender = 'female' AND smoker = 'Yes' AND diabetic = 'Yes';


-- 10. Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
SELECT * FROM insurance_data
WHERE patientID BETWEEN 1234 AND 5000;

UPDATE insurance_data
SET claim = (claim + 20000)
WHERE patientID BETWEEN 1234 AND 5000;


-- 11. Write a SQL query to delete all records for patients who are smokers and have no children.
SELECT * FROM insurance_data
WHERE smoker = 'Yes' AND children = 0;

DELETE FROM insurance_data
WHERE smoker = 'Yes' AND children = 0;






