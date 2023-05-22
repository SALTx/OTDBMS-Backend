CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT studAdmin) AS StudentCount
FROM trips;

CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes';

CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
WHERE c.aciCountry = 'Yes' AND op.programType = 'OITP';

CREATE VIEW OIMPdetailsView AS
SELECT 
    t.studAdmin, 
    t.programID, 
    op.programName,
    op.city,
    op.partnerName,
    s.course,
    od.gsmCode,
    od.courseCode,
    od.gsmName
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN students s ON t.studAdmin = s.adminNo
JOIN OIMPdetails od ON t.studAdmin = od.studAdmin AND t.programID = od.programID;

