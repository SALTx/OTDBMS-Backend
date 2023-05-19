CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT t.studentAdminNo) AS uniqueStudents
FROM trips AS t
JOIN students AS s ON t.studentAdminNo = s.adminNo
WHERE s.stage = 3;

CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studentAdminNo) AS uniqueStudents
FROM trips AS t
JOIN overseasPrograms AS op ON t.programID = op.programID
JOIN countries AS c ON op.countryCode = c.countryCode
JOIN students AS s ON t.studentAdminNo = s.adminNo
WHERE c.aciCountry = 'Yes' AND s.stage = 3;

CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studentAdminNo) AS uniqueStudents
FROM trips AS t
JOIN overseasPrograms AS op ON t.programID = op.programID
JOIN countries AS c ON op.countryCode = c.countryCode
JOIN students AS s ON t.studentAdminNo = s.adminNo
WHERE c.aciCountry = 'Yes' AND op.programType = 'OITP' AND s.stage = 3;


-- single student gone to multiple trips to be counted as 1