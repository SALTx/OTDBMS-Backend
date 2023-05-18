CREATE VIEW OIMP_View AS
SELECT op.programID, op.programName, op.programType, op.startDate, op.endDate, op.countryCode, op.city, op.partnerName, op.overseasPartnerType, od.gsmCode, od.gsmName
FROM overseasPrograms AS op
JOIN OIMPdetails AS od ON op.programID = od.programID
WHERE op.programType = 'OIMP';
SELECT * FROM OIMP_View;

---------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW StudentDetails AS
SELECT s.adminNo, s.name, s.gender, s.citizenshipStatus, c.courseName, COALESCE(o.programName, 'No trip records') AS programName
FROM students AS s
JOIN course AS c ON s.course = c.courseCode
LEFT JOIN trips AS t ON s.adminNo = t.studentAdminNo
LEFT JOIN overseasPrograms AS o ON t.programID = o.programID;
---------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW students_trip_status AS
SELECT
    s.adminNo,
    s.name,
    CASE WHEN t.studentAdminNo IS NOT NULL THEN 'Went for Trip' ELSE 'Did not go for Trip' END AS tripStatus
FROM
    students s
LEFT JOIN
    trips t ON s.adminNo = t.studentAdminNo;
    ---------------------------------------------------------------------------------------------------------------------------------------



