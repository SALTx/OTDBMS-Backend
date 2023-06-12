CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN students s ON t.studAdmin = s.adminNo
WHERE s.stage = 3 AND s.citizenshipStatus IN ('Permanent resident', 'Singapore citizen');

CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
JOIN students s ON t.studAdmin = s.adminNo
WHERE c.aciCountry = 'A' AND s.stage = 3 AND s.citizenshipStatus IN ('Permanent resident', 'Singapore citizen');

CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT t.studAdmin) AS StudentCount
FROM trips t
JOIN overseasPrograms op ON t.programID = op.programID
JOIN countries c ON op.countryCode = c.countryCode
JOIN students s ON t.studAdmin = s.adminNo
WHERE c.aciCountry = 'A' AND op.programType = 'Overseas internship program' AND s.stage = 3 AND s.citizenshipStatus IN ('Permanent resident', 'Singapore citizen');



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

-- SELECT *,
-- CASE 
--     WHEN MONTH(startDate) BETWEEN 4 AND 6 THEN 'Q1'
--     WHEN MONTH(startDate) BETWEEN 7 AND 9 THEN 'Q2'
--     WHEN MONTH(startDate) BETWEEN 10 AND 12 THEN 'Q3'
--     WHEN MONTH(startDate) BETWEEN 1 AND 3 THEN 'Q4'
--     ELSE 'Unknown'
-- END AS customQuarter
-- FROM overseasPrograms;

-- SELECT * FROM (
--     SELECT *,
--     CASE 
--         WHEN MONTH(startDate) BETWEEN 4 AND 6 THEN 'Q1'
--         WHEN MONTH(startDate) BETWEEN 7 AND 9 THEN 'Q2'
--         WHEN MONTH(startDate) BETWEEN 10 AND 12 THEN 'Q3'
--         WHEN MONTH(startDate) BETWEEN 1 AND 3 THEN 'Q4'
--         ELSE 'Unknown'
--     END AS customQuarter
--     FROM overseasPrograms
-- ) AS subquery
-- WHERE customQuarter = 'Q2';

CREATE VIEW plannedTrips AS
SELECT programName, programType, ESTdate, countryCode, city, partnerName, tripLeaders, EstNumStudents, Approved
FROM overseasPrograms;


DELIMITER //

CREATE TRIGGER overseasPrograms_update_trigger
AFTER UPDATE ON overseasPrograms
FOR EACH ROW
BEGIN
    IF NEW.programID != OLD.programID THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'programID', OLD.programID, NEW.programID, NEW.programID);
    END IF;
    
    IF NEW.programName != OLD.programName THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'programName', OLD.programName, NEW.programName, NEW.programID);
    END IF;
    
    IF NEW.programType != OLD.programType THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'programType', OLD.programType, NEW.programType, NEW.programID);
    END IF;
    
    IF NEW.startDate != OLD.startDate THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'startDate', OLD.startDate, NEW.startDate, NEW.programID);
    END IF;
    
    IF NEW.endDate != OLD.endDate THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'endDate', OLD.endDate, NEW.endDate, NEW.programID);
    END IF;
    
    IF NEW.ESTdate != OLD.ESTdate THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'ESTdate', OLD.ESTdate, NEW.ESTdate, NEW.programID);
    END IF;
    
    IF NEW.countryCode != OLD.countryCode THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'countryCode', OLD.countryCode, NEW.countryCode, NEW.programID);
    END IF;
    
    IF NEW.city != OLD.city THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'city', OLD.city, NEW.city, NEW.programID);
    END IF;
    
    IF NEW.partnerName != OLD.partnerName THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'partnerName', OLD.partnerName, NEW.partnerName, NEW.programID);
    END IF;
    
    IF NEW.overseasPartnerType != OLD.overseasPartnerType THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'overseasPartnerType', OLD.overseasPartnerType, NEW.overseasPartnerType, NEW.programID);
    END IF;
    
    IF NEW.tripLeaders != OLD.tripLeaders THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'tripLeaders', OLD.tripLeaders, NEW.tripLeaders, NEW.programID);
    END IF;
    
    IF NEW.EstNumStudents != OLD.EstNumStudents THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'EstNumStudents', OLD.EstNumStudents, NEW.EstNumStudents, NEW.programID);
    END IF;
    
    IF NEW.Approved != OLD.Approved THEN
        INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
        VALUES ('overseasPrograms', 'Approved', OLD.Approved, NEW.Approved, NEW.programID);
END IF;
END //

DELIMITER ;








