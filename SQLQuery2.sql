CREATE DATABASE hr;
USE hr;

SELECT *
FROM hr_data;

UPDATE hr_data
SET termdate = FORMAT(CONVERT(DATETIME, LEFT(termdate, 19), 120), 'yyyy-MM-dd');

ALTER TABLE hr_data
ADD new_termdate DATE;

--copy coverted time values from termdate to new_terdate

UPDATE hr_data
SET new_termdate = CASE
 WHEN termdate IS NOT NULL AND ISDATE(termdate) = 1 THEN CAST (termdate AS DATETIME) ELSE NULL END;

 -- create a new column "age"

 ALTER TABLE hr_data
 ADD age nvarchar(50);

 -- populate the new column with age

UPDATE hr_data
SET age = DATEDIFF(YEAR, birthdate, GETDATE());

