CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT studentAdminNo) AS uniqueStudents
FROM trips;

--
CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studentAdminNo) AS uniqueStudents
FROM trips AS t
JOIN overseasPrograms AS op ON t.programID = op.programID
JOIN countries AS c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes';


CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studentAdminNo) AS uniqueStudents
FROM trips AS t
JOIN overseasPrograms AS op ON t.programID = op.programID
JOIN countries AS c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes' AND op.programType = 'OITP';


-- single student gone to multiple trips to be counted as 1