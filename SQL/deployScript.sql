create database `overseasProto`;
USE overseasProto;

CREATE TABLE IF NOT EXISTS countries (
    countryCode char(2) not null, 
    countryName varchar(64) not null,
    aciCountry enum ('A', 'N') not null,
    PRIMARY KEY (countryCode)
);
CREATE TABLE IF NOT EXISTS pemGroup (
    pemGroupId char(6) not null,
    pemName varchar(64) not null,
    PRIMARY KEY (pemGroupId)
);
CREATE TABLE IF NOT EXISTS course (
    courseCode char(6) not null,
    courseName varchar(64) not null,
    courseManager varchar(64) not null,
    PRIMARY KEY (courseCode)
);
CREATE TABLE IF NOT EXISTS students (
    `Admin Number` char(7) not null,
    `Student Name` varchar(64) not null,
    `Citizenship Status` enum ('Singapore citizen', 'Permanent resident', 'International Student') not null,
    `Study Stage` tinyint not null,
    `Course Code` char(6) not null,
    `PEM Group` char(6) not null,
    PRIMARY KEY (`Admin Number`),
    FOREIGN KEY (`Course Code`) REFERENCES course (courseCode),
    FOREIGN KEY ( `PEM Group`) REFERENCES pemGroup ( `PEM Group`)
);

CREATE TABLE IF NOT EXISTS overseasPrograms (
    `Program ID` CHAR(9) NOT NULL,
    `Program Name` VARCHAR(64) NOT NULL,
    `Program Type` ENUM (
        'Overseas educational trip',
        'Overseas internship program',
        'Overseas immersion program',
        'Overseas Competition/Exchange',
        'Overseas Leadership Training',
        'Overseas Leadership Training with Outward Bound',
        'Overseas Service Learning-Youth Expedition Programme'
    ) NOT NULL,
    Date VARCHAR(64),
    `Country Code` CHAR(2) NOT NULL,    
    City VARCHAR(64) NOT NULL,
    `Partner Name` VARCHAR(64),
    `Overseas Partner Type` ENUM ('Company', 'Institution', 'Others') NOT NULL,
    `Trip Leaders` VARCHAR(255),
    `Estimated students` SMALLINT,
    `Approve status` ENUM('Approved', 'Rejected', 'Pending') NOT NULL,
    PRIMARY KEY (`Program ID`, `Country Code`, City),
    FOREIGN KEY (`Country Code`) REFERENCES countries (countryCode)
);


CREATE TABLE IF NOT EXISTS trips (
    `Student Admin` CHAR(7) NOT NULL,
    `Program ID` CHAR(9) NOT NULL,
    Comments TEXT,
    PRIMARY KEY (`Student Admin`, `Program ID`),
    FOREIGN KEY (`Student Admin`) REFERENCES students ( `Admin Number`),
    FOREIGN KEY (`Program ID`) REFERENCES overseasPrograms (`Program ID`)
);
CREATE TABLE IF NOT EXISTS oimpDetails (
    gsmCode varchar(16) not null,
    courseCode char(6) not null,
    studAdmin char(7) not null,
    gsmName varchar(64) not null,
    PRIMARY KEY (studAdmin,gsmCode),
    FOREIGN KEY (courseCode) REFERENCES course (courseCode),
    FOREIGN KEY (studAdmin) REFERENCES students (adminNo)
);
CREATE TABLE IF NOT EXISTS users (
    username varchar(64) not null,
    password varchar(64) not null,
    accountType enum ('Admin', 'Teacher', 'Guest') not null,
    name varchar(64) not null,
    PRIMARY KEY (username)
);

CREATE TABLE auditTable (
    `Table Name` VARCHAR(100) NOT NULL,
    `Column Name` VARCHAR(100) NOT NULL,
    `Old Value` TEXT,
    `New Value` TEXT,
    `Program ID` CHAR(9) not null,
    timeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE VIEW KPI1 AS
SELECT 
    CASE WHEN course.courseCode IS NULL THEN 'Total' ELSE course.courseCode END AS `Course Code`,
    CASE WHEN course.courseName IS NULL THEN 'Students' ELSE course.courseName END AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
WITH ROLLUP
HAVING GROUPING(course.courseCode, course.courseName) = 0
UNION ALL
SELECT 'Total', 'Students', COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 'KPI', 'Description', 'Trips for all Stage 3 local students';

CREATE VIEW KPI2 AS
SELECT 
    CASE WHEN course.courseCode IS NULL THEN 'Total' ELSE course.courseCode END AS `Course Code`,
    CASE WHEN course.courseName IS NULL THEN 'Students' ELSE course.courseName END AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `ACI Trips Student Count`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
WHERE countries.aciCountry = 'A' AND students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
WITH ROLLUP
HAVING GROUPING(course.courseCode, course.courseName) = 0
UNION ALL
SELECT 'Total', 'Students', COUNT(DISTINCT trips.`Student Admin`) AS `ACI Trips Student Count`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode
JOIN students ON trips.`Student Admin` = students.`Admin Number`
WHERE countries.aciCountry = 'A' AND students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 'KPI', 'Description', 'ACI Trips for all Stage 3 local students';

CREATE VIEW KPI3 AS
SELECT 
    CASE WHEN course.courseCode IS NULL THEN 'Total' ELSE course.courseCode END AS `Course Code`,
    CASE WHEN course.courseName IS NULL THEN 'Students' ELSE course.courseName END AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `OITP ACI Trips Student Count`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
WHERE countries.aciCountry = 'A' AND overseasPrograms.`Program Type` = 'Overseas internship program' AND students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
WITH ROLLUP
HAVING GROUPING(course.courseCode, course.courseName) = 0
UNION ALL
SELECT 'Total', 'Students', COUNT(DISTINCT trips.`Student Admin`) AS `OITP ACI Trips Student Count`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode
JOIN students ON trips.`Student Admin` = students.`Admin Number`
WHERE countries.aciCountry = 'A' AND overseasPrograms.`Program Type` = 'Overseas internship program' AND students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 'KPI', 'Description', 'ACI intern trips for all Stage 3 local students';

CREATE VIEW oimpDetailsView AS
SELECT
    trips.`Student Admin`,
    trips.`Program ID`,
    overseasPrograms.`Program Name`,
    overseasPrograms.City,
    overseasPrograms.`Partner Name`,
    oimpDetails.gsmCode AS `GSM Code`,
    oimpDetails.courseCode AS `Course Code`,
    oimpDetails.gsmName AS `GSM Name`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN oimpDetails ON trips.`Student Admin` = oimpDetails.studAdmin
WHERE students.`Study Stage` = 3;

CREATE VIEW ProgramCountByType AS
SELECT `Program Type`, COUNT(*) AS `Program Count`
FROM overseasPrograms
GROUP BY `Program Type`;

CREATE VIEW stage3_student_count_view AS
SELECT op.`Program Type`, COUNT(DISTINCT s.`Admin Number`) AS `Student Count`
FROM overseasPrograms op
JOIN trips t ON op.`Program ID` = t.`Program ID`
JOIN students s ON t.`Student Admin` = s.`Admin Number`
WHERE s.`Study Stage` = 3
    AND s.`Citizenship Status` IN ('Singapore citizen', 'Permanent resident')
    AND op.`Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
GROUP BY op.`Program Type`;

CREATE VIEW plannedTrips AS
SELECT `Program Name`, `Program Type`, Date, `Country Code`, City, `Partner Name`, `Trip Leaders`, `Estimated students`, `Approve status`
FROM `overseasPrograms`;

CREATE VIEW tripDetails AS
SELECT
    students.`Admin Number`,
    students.`Student Name`,
    trips.`Program ID`,
    students.`Study Stage`,
    students.`Citizenship Status`,
    overseasPrograms.Date
FROM
    trips
JOIN
    students ON trips.`Student Admin` = students.`Admin Number`
JOIN
    overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`;


DELIMITER //
CREATE PROCEDURE getProgramAcronym(`Program Type` VARCHAR(64), OUT acronym CHAR(3))
BEGIN
    CASE `Program Type`
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
DELIMITER ;

DELIMITER //
CREATE TRIGGER programID_Before_Insert
BEFORE INSERT
ON `overseasPrograms` FOR EACH ROW
BEGIN
    DECLARE acronym CHAR(3);
    DECLARE year CHAR(2);
    DECLARE aciChar CHAR(1);
    DECLARE seqNum CHAR(3);
    DECLARE newProgramID CHAR(9);
    DECLARE startDate DATE;
    DECLARE endDate DATE;

    -- Call the stored procedure to get the acronym
    CALL getProgramAcronym(NEW.`Program Type`, acronym);

    -- Check if the date format is 'dd/mm/yyyy to dd/mm/yyyy'
    IF INSTR(NEW.Date, ' to ') > 0 THEN
        SET startDate = STR_TO_DATE(SUBSTRING_INDEX(NEW.Date, ' to ', 1), '%d/%m/%Y');
        SET endDate = STR_TO_DATE(SUBSTRING_INDEX(NEW.Date, ' to ', -1), '%d/%m/%Y');
        -- Extract the last two digits of the year from the start date
        SET year = SUBSTRING(YEAR(startDate), -2);
    ELSE
        -- Extract the year from the date value
        SET year = SUBSTRING(NEW.Date, -2);
        SET startDate = STR_TO_DATE(CONCAT('01/', NEW.Date), '%d/%M/%Y');
        SET endDate = startDate + INTERVAL 1 MONTH - INTERVAL 1 DAY;
    END IF;

    -- Get the ACI or NON-ACI character directly from the countries table
    SET aciChar = (SELECT aciCountry FROM countries WHERE countryCode = NEW.`Country Code`);

    -- Get the next sequence number
    SET seqNum = LPAD((SELECT COUNT(*) + 1 FROM overseasPrograms WHERE SUBSTRING(`Program ID`, 4, 2) = year), 3, '0');

    -- Construct the new programID
    SET newProgramID = CONCAT(acronym, year, aciChar, seqNum);

    -- Set the new `Program ID`
    SET NEW.`Program ID` = newProgramID;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER overseasPrograms_update_trigger
AFTER UPDATE ON overseasPrograms
FOR EACH ROW
BEGIN
    IF NEW.`Program ID` != OLD.`Program ID` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Program ID', OLD.`Program ID`, NEW.`Program ID`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Program Name` != OLD.`Program Name` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Program Name', OLD.`Program Name`, NEW.`Program Name`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Program Type` != OLD.`Program Type` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Program Type', OLD.`Program Type`, NEW.`Program Type`, NEW.`Program ID`);
    END IF;
    
    IF NEW.Date != OLD.Date THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Date', OLD.Date, NEW.Date, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Country Code` != OLD.`Country Code` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Country Code', OLD.`Country Code`, NEW.`Country Code`, NEW.`Program ID`);
    END IF;
    
    IF NEW.City != OLD.City THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'City', OLD.City, NEW.City, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Partner Name` != OLD.`Partner Name` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Partner Name', OLD.`Partner Name`, NEW.`Partner Name`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Overseas Partner Type` != OLD.`Overseas Partner Type` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Overseas Partner Type', OLD.`Overseas Partner Type`, NEW.`Overseas Partner Type`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Trip Leaders` != OLD.`Trip Leaders` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Trip Leaders', OLD.`Trip Leaders`, NEW.`Trip Leaders`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Estimated students` != OLD.`Estimated students` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Estimated students', OLD.`Estimated students`, NEW.`Estimated students`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Approve status` != OLD.`Approve status` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Approve status', OLD.`Approve status`, NEW.`Approve status`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Estimated students` IS NOT NULL AND OLD.`Estimated students` IS NULL THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Estimated students', 'Total Students', 'Total Students', NEW.`Program ID`);
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE TRIGGER overseasPrograms_delete_trigger
AFTER DELETE ON overseasPrograms
FOR EACH ROW
BEGIN
    DECLARE old_values TEXT;

    SET old_values = CONCAT(
        'Program ID:', COALESCE(OLD.`Program ID`, ''), ', ',
        'Program Name:', COALESCE(OLD.`Program Name`, ''), ', ',
        'Program Type:', COALESCE(OLD.`Program Type`, ''), ', ',
        'Date:', COALESCE(OLD.Date, ''), ', ',
        'Country Code:', COALESCE(OLD.`Country Code`, ''), ', ',
        'City:', COALESCE(OLD.City, ''), ', ',
        'Partner Name:', COALESCE(OLD.`Partner Name`, ''), ', ',
        'Overseas Partner Type:', COALESCE(OLD.`Overseas Partner Type`, ''), ', ',
        'Trip Leaders:', COALESCE(OLD.`Trip Leaders`, ''), ', ',
        'Estimated students:', COALESCE(OLD.`Estimated students`, ''), ', ',
        'Approve status:', COALESCE(OLD.`Approve status`, '')
    );
    
    INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
    VALUES ('overseasPrograms', 'FULL RECORD', old_values, 'data deleted', OLD.`Program ID`);
END //
DELIMITER ;




-- CREATE TRIGGER overseasPrograms_update_trigger
-- AFTER UPDATE ON overseasPrograms
-- FOR EACH ROW
-- BEGIN
--     IF NOT (
--         NEW.programID <=> OLD.programID AND
--         NEW.programName <=> OLD.programName AND
--         NEW.programType <=> OLD.programType AND
--         NEW.startDate <=> OLD.startDate AND
--         NEW.endDate <=> OLD.endDate AND
--         NEW.estDate <=> OLD.estDate AND
--         NEW.countryCode <=> OLD.countryCode AND
--         NEW.city <=> OLD.city AND
--         NEW.partnerName <=> OLD.partnerName AND
--         NEW.overseasPartnerType <=> OLD.overseasPartnerType AND
--         NEW.tripLeaders <=> OLD.tripLeaders AND
--         NEW.estNumStudents <=> OLD.estNumStudents AND
--         NEW.approved <=> OLD.approved
--     ) THEN
--         INSERT INTO auditTable (tableName, columnName, oldValue, newValue, programID)
--         VALUES ('overseasPrograms', 'row', 'old row values', 'new row values', NEW.programID);
--     END IF;
-- END;