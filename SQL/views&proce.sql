CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN students s ON t.studAdmin = s.adminNo
WHERE s.stage = 3;

CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
JOIN students s ON t.studAdmin = s.adminNo
WHERE c.aciCountry = 'A' AND s.stage = 3;

CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
JOIN students s ON t.studAdmin = s.adminNo
WHERE c.aciCountry = 'A' AND op.programType = 'Overseas internship program' AND s.stage = 3;


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
JOIN OIMPdetails od ON t.studAdmin = od.studAdmin AND t.programID = od.programID
WHERE s.stage = 3;


DELIMITER //
CREATE PROCEDURE getProgramAcronym(programType VARCHAR(64), OUT acronym CHAR(3))
BEGIN
    CASE programType
    WHEN 'Overseas educational trip' THEN SET acronym = 'OET';
    WHEN 'Overseas internship program' THEN SET acronym = 'OIP';
    WHEN 'Overseas immersion program' THEN SET acronym = 'IMP';
    WHEN 'Overseas Competition/Exchange' THEN SET acronym = 'OCP';
    WHEN 'Overseas Leadership Training' THEN SET acronym = 'OLT';
    WHEN 'Overseas Leadership Training with Outward Bound' THEN SET acronym = 'TOB';
    WHEN 'Overseas Service Learning-Youth Expedition Programme' THEN SET acronym = 'YEP';
    ELSE SET acronym = '';
    END CASE;
END//
DELIMITER //
-- programID format 
-- programType in shortcut as 1st,2nd,3rd,position
-- Overseas educational trip (OET),
-- Overseas internship program (OIP), 
-- Overseas immersion program (IMP), 
-- Overseas Competition/Exchange (OCP), 
-- Overseas Leadership Training (OLT), 
-- Overseas Leadership Training with Outward Bound (TOB),
-- Overseas Service Learning-Youth Expedition Programme (YEP)

-- Year as 4th and 5th position

-- ACI or NON-ACI as 6th position
-- N = NON-ACI
-- A = ACI

-- 000-999 as sequence of program that happened in the year as 7th,8th,9th position
-- e.g., OET23A001 = Overseas educational trip in ACI country ,this program is the 1st program of all overseas programs in year 2023
-- IMP23N002 = Overseas immersion program in NON-ACI country ,this program is the 2nd program of all overseas programs in year 2023

DELIMITER //
CREATE TRIGGER programID_Before_Insert
BEFORE INSERT
ON overseasPrograms FOR EACH ROW
BEGIN
    DECLARE acronym CHAR(3);
    DECLARE year CHAR(4);
    DECLARE aciChar CHAR(1);
    DECLARE seqNum CHAR(3); -- change this line
    DECLARE newProgramID CHAR(9);

    -- Call the stored procedure to get the acronym
    CALL getProgramAcronym(NEW.programType, acronym);

    -- Get the year from the startDate
    SET year = SUBSTRING(YEAR(NEW.startDate), 3, 2);

    -- Get the ACI or NON-ACI character directly from the countries table
    SET aciChar = (SELECT aciCountry FROM countries WHERE countryCode = NEW.countryCode);

    -- Get the next sequence number
    SET seqNum = LPAD((SELECT COUNT(*) + 1 FROM overseasPrograms WHERE SUBSTRING(programID, 4, 2) = year), 3, '0');

    -- Construct the new programID
    SET newProgramID = CONCAT(acronym, year, aciChar, seqNum);

    -- Set the new programID
    SET NEW.programID = newProgramID;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_dates_before_insert
BEFORE INSERT ON plannedTrips
FOR EACH ROW 
BEGIN
    DECLARE startD DATE;
    DECLARE endD DATE;

    SELECT startDate, endDate INTO startD, endD
    FROM overseasPrograms 
    WHERE overseasPrograms.programID = NEW.programID;

    SET NEW.startDate = startD;
    SET NEW.endDate = endD;
END//
DELIMITER ;

CREATE VIEW Planned_Trips AS
SELECT
    op.programType,
    CASE c.aciCountry
        WHEN 'A' THEN 'Yes'
        WHEN 'N' THEN 'No'
    END AS aciCountry,
    op.city,
    pt.startDate AS `Trip Start Date`,
    pt.endDate AS `Trip End Date`,
    pt.NumStaff AS `No. of Staff`,
    pt.EstNumStudents AS `Est. No. of Students`,
    pt.Approved
FROM plannedTrips pt
JOIN overseasPrograms op ON pt.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode;


DELIMITER //
CREATE PROCEDURE DeleteCountry(IN p_countryCode CHAR(2))
BEGIN
    DELETE FROM countries WHERE countryCode = p_countryCode;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudentStage(IN p_adminNo CHAR(7), IN p_stage TINYINT)
BEGIN
    UPDATE students SET stage = p_stage WHERE adminNo = p_adminNo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE updateCitizenship(IN p_adminNo CHAR(7), IN p_citizenshipStatus ENUM('Singapore citizen', 'Permanent resident', 'Foreigner'))
BEGIN
    UPDATE students SET citizenshipStatus = p_citizenshipStatus WHERE adminNo = p_adminNo;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateStudentCourse(IN p_adminNo CHAR(7), IN p_course CHAR(3))
BEGIN
    UPDATE students SET course = p_course WHERE adminNo = p_adminNo;
END //
DELIMITER 

DELIMITER //
CREATE PROCEDURE DeletePemGroup(IN p_pemGroupId CHAR(6))
BEGIN
    DELETE FROM pemGroup WHERE pemGroupId = p_pemGroupId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteCourse(IN p_courseCode CHAR(3))
BEGIN
    DELETE FROM course WHERE courseCode = p_courseCode;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UpdateCourseManager(IN p_courseCode CHAR(3), IN p_courseManager VARCHAR(64))
BEGIN
    UPDATE course SET courseManager = p_courseManager WHERE courseCode = p_courseCode;
END //
DELIMITER ;


