create database `opsystem_test`;
USE opsystem_test;

-- create database `overseasProto`;
-- USE overseasProto;
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
    `Admin Number` CHAR(7) NOT NULL,
    `Student Name` VARCHAR(64) NOT NULL,
    `Citizenship Status` ENUM ('Singapore citizen', 'Permanent resident', 'International Student') NOT NULL,
    `Study Stage` TINYINT NOT NULL,
    `Course Code` CHAR(6) NOT NULL,
    `PEM Group` CHAR(6) NOT NULL,
    PRIMARY KEY (`Admin Number`),
    FOREIGN KEY (`Course Code`) REFERENCES course (`courseCode`),
    FOREIGN KEY (`PEM Group`) REFERENCES pemGroup (`pemGroupId`)
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
    `Start Date` DATE NOT NULL,
    `End Date` DATE NOT NULL,
    `Estimated Date` varchar(32) NOT NULL,
    `Country Code` CHAR(2) NOT NULL,    
     City VARCHAR(64) NOT NULL,
    `Partner Name` VARCHAR(64),
    `Overseas Partner Type` ENUM ('Company', 'Institution', 'Others') NOT NULL,
    `Trip Leaders` VARCHAR(255),
    `Estimated students` SMALLINT,
    `Approve status` ENUM('Approved', 'Completed','Postponed', 'Planned','Cancelled') NOT NULL, 
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
    gsmCode VARCHAR(16) NOT NULL,
    courseCode CHAR(6) NOT NULL,
    studAdmin CHAR(7) NOT NULL,
    gsmName VARCHAR(64) NOT NULL,
    PRIMARY KEY (studAdmin, gsmCode),
    FOREIGN KEY (courseCode) REFERENCES course (courseCode),
    FOREIGN KEY (studAdmin) REFERENCES students (`Admin Number`)
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

DELIMITER //
CREATE PROCEDURE Q1(IN year INT)
BEGIN
    SELECT *,
        'Q1' AS customQuarter
    FROM overseasPrograms
    WHERE MONTH(`Start Date`) BETWEEN 4 AND 6 AND YEAR(`Start Date`) = year;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Q2(IN year INT)
BEGIN
    SELECT *,
        'Q2' AS customQuarter
    FROM overseasPrograms
    WHERE MONTH(`Start Date`) BETWEEN 7 AND 9 AND YEAR(`Start Date`) = year;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Q3(IN year INT)
BEGIN
    SELECT *,
        'Q3' AS customQuarter
    FROM overseasPrograms
    WHERE MONTH(`Start Date`) BETWEEN 10 AND 12 AND YEAR(`Start Date`) = year;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Q4(IN year INT)
BEGIN
    SELECT *,
        'Q4' AS customQuarter
    FROM overseasPrograms
    WHERE MONTH(`Start Date`) BETWEEN 1 AND 3 AND YEAR(`Start Date`) = year;
END //
DELIMITER ;

CREATE VIEW totalKpiEstimation AS
SELECT 
    -- Count of students in 'Study Stage' 1
    SUM(CASE WHEN students.`Study Stage` = 1 THEN 1 ELSE 0 END) AS stage1,
    
    -- Count of students in 'Study Stage' 2
    SUM(CASE WHEN students.`Study Stage` = 2 THEN 1 ELSE 0 END) AS stage2,
    
    -- Count of students in 'Study Stage' 3
    SUM(CASE WHEN students.`Study Stage` = 3 THEN 1 ELSE 0 END) AS stage3,
    
    -- Estimation for KPI1: 67% of students in 'Study Stage' 3, rounded to the nearest whole number
    ROUND(SUM(CASE WHEN students.`Study Stage` = 3 THEN 1 ELSE 0 END) * 0.67, 0) AS kpi1Estimation,
    
    -- Estimation for KPI2: 67% of KPI1, rounded to the nearest whole number
    ROUND(ROUND(SUM(CASE WHEN students.`Study Stage` = 3 THEN 1 ELSE 0 END) * 0.67, 0) * 0.67, 0) AS kpi2Estimation,
    
    -- Estimation for KPI3: A static value of 18
    18 AS kpi3Estimation
FROM students;

CREATE VIEW kpiEstimation AS
SELECT 
    course.courseCode,
    course.courseName,
    CEIL(totalKpiEstimation.kpi1Estimation * 
        CASE
            WHEN course.courseCode = 'EGDF20' THEN 0.17
            WHEN course.courseCode = 'EGDF21' THEN 0.16
            WHEN course.courseCode = 'EGDF11' THEN 0.11
            WHEN course.courseCode = 'EGDF19' THEN 0.11
            WHEN course.courseCode = 'EGDF17' THEN 0.08
            WHEN course.courseCode = 'EGDF09' THEN 0.08
            WHEN course.courseCode = 'EGDF22' THEN 0.08
            WHEN course.courseCode = 'EGDFPA' THEN 0.08
            WHEN course.courseCode = 'EGDF12' THEN 0.06
            WHEN course.courseCode = 'EGDF13' THEN 0.07
            ELSE 0
        END) AS kpi1,
    CEIL(totalKpiEstimation.kpi2Estimation * 
        CASE
            WHEN course.courseCode = 'EGDF20' THEN 0.17 
            WHEN course.courseCode = 'EGDF21' THEN 0.16 
            WHEN course.courseCode = 'EGDF11' THEN 0.11 
            WHEN course.courseCode = 'EGDF19' THEN 0.11 
            WHEN course.courseCode = 'EGDF17' THEN 0.08 
            WHEN course.courseCode = 'EGDF09' THEN 0.08 
            WHEN course.courseCode = 'EGDF22' THEN 0.08 
            WHEN course.courseCode = 'EGDFPA' THEN 0.08 
            WHEN course.courseCode = 'EGDF12' THEN 0.06 
            WHEN course.courseCode = 'EGDF13' THEN 0.07 
            ELSE 0
        END) AS kpi2,
    CEIL(totalKpiEstimation.kpi3Estimation * 
        CASE
            WHEN course.courseCode = 'EGDF20' THEN 0.17
            WHEN course.courseCode = 'EGDF21' THEN 0.16
            WHEN course.courseCode = 'EGDF11' THEN 0.11
            WHEN course.courseCode = 'EGDF19' THEN 0.11
            WHEN course.courseCode = 'EGDF17' THEN 0.08
            WHEN course.courseCode = 'EGDF09' THEN 0.08
            WHEN course.courseCode = 'EGDF22' THEN 0.08
            WHEN course.courseCode = 'EGDFPA' THEN 0.08
            WHEN course.courseCode = 'EGDF12' THEN 0.06
            WHEN course.courseCode = 'EGDF13' THEN 0.07
            ELSE 0
        END) AS kpi3
FROM course
JOIN totalKpiEstimation ON 1=1
WHERE course.courseCode <> 'EGDF94';

⁡⁣⁣⁢-- KPI1 VIEW⁡
CREATE VIEW KPI1 AS
-- Retrieves data for specific courses with their corresponding KPI estimations.
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`,
    kpiEstimation.kpi1 AS `Estimated`
-- Specifies source tables for data retrieval and performs LEFT JOIN with 'kpiEstimation' table to get corresponding KPI estimations for specific courses.
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
LEFT JOIN kpiEstimation ON course.courseCode = kpiEstimation.courseCode
-- Filters data based on conditions to consider students in 'Study Stage' 3 with specific citizenship statuses.
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
-- Groups results by 'courseCode' and 'courseName' for specific courses.
GROUP BY course.courseCode, course.courseName
-- The UNION ALL operator is used to combine the results of three SELECT statements into a single result set.
-- Retrieves the total count of students for all courses without specifying a course code or name.
-- this process is done in such a redundant way to prevent unsolved bugs that will occur otherwise.
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`,
    NULL AS `Estimated`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
-- Retrieves a KPI description without specifying a course code or name.
UNION ALL
SELECT 
    'KPI' AS `Course Code`,
    'Description' AS `Course Name`,
    'Trips for all Stage 3 local students' AS `Number of Students`,
    NULL AS `Estimated`;

⁡⁣⁣⁢-- KPI2 VIEW⁡
CREATE VIEW KPI2 AS
-- Retrieves data for specific courses with their corresponding KPI estimations for ACI trips.
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`,
    kpiEstimation.kpi2 AS `Estimated`
-- Specifies source tables for data retrieval and performs JOIN with a subquery to get distinct 'Program ID's of ACI trips.
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
-- Performs LEFT JOIN with 'kpiEstimation' table to get corresponding KPI estimations for specific courses.
LEFT JOIN kpiEstimation ON course.courseCode = kpiEstimation.courseCode
-- Filters data based on conditions to consider students in 'Study Stage' 3 with specific citizenship statuses and ACI trips with the specified 'aciCountry'.
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
-- Groups results by 'courseCode' and 'courseName' for specific courses.
GROUP BY course.courseCode, course.courseName
-- The UNION ALL operator is used to combine the results of three SELECT statements into a single result set.
-- Retrieves the total count of students in ACI trips without specifying a course code or name.
-- this process is done in such a redundant way to prevent unsolved bugs that will occur otherwise.
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `ACI Trips Student Count`,
    NULL AS `Estimated`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
-- Retrieves a KPI description for ACI trips without specifying a course code or name.
UNION ALL
SELECT 
    'KPI' AS `Course Code`,
    'Description' AS `Course Name`,
    'ACI Trips for all Stage 3 local students' AS `ACI Trips Student Count`,
    NULL AS `Estimated`;

⁡⁣⁣⁢-- KPI3 VIEW⁡
CREATE VIEW KPI3 AS
-- Retrieves data for specific courses with their corresponding KPI estimations for ACI intern trips.
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`,
    kpiEstimation.kpi3 AS `Estimated`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
        AND `Program Type` = 'Overseas internship program'
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
LEFT JOIN kpiEstimation ON course.courseCode = kpiEstimation.courseCode
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
-- Retrieves the total count of students in ACI intern trips without specifying a course code or name.
-- this process is done in such a redundant way to prevent unsolved bugs that will occur otherwise.
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `OITP ACI Trips Student Count`,
    NULL AS `Estimated`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
        AND `Program Type` = 'Overseas internship program'
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3
    AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
-- Retrieves a KPI description for ACI intern trips without specifying a course code or name.
UNION ALL
SELECT 
    'KPI' AS `Course Code`,
    'Description' AS `Course Name`,
    'ACI intern trips for all Stage 3 local students' AS `OITP ACI Trips Student Count`,
    NULL AS `Estimated`;
⁡⁣⁣⁢--studentsView⁡
CREATE VIEW studentsView AS
SELECT students.`Admin Number`, students.`Student Name`, students.`Citizenship Status`, students.`Study Stage`,
       course.courseName AS `Course`, students.`PEM Group`
FROM students
JOIN course ON students.`Course Code` = course.courseCode;

⁡⁣⁣⁢-- overseasProgramsView⁡⁡
CREATE VIEW overseasProgramsView AS
SELECT overseasPrograms.`Program ID`, overseasPrograms.`Program Name`, overseasPrograms.`Program Type`,
       overseasPrograms.`Start Date`, overseasPrograms.`End Date`, overseasPrograms.`Estimated Date`,
       countries.countryName AS `Country`, overseasPrograms.City, overseasPrograms.`Partner Name`,
       overseasPrograms.`Overseas Partner Type`, overseasPrograms.`Trip Leaders`, overseasPrograms.`Estimated students`,
       overseasPrograms.`Approve status`
FROM overseasPrograms
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode;

-⁡⁣⁣⁢- oimpDetailsView⁡⁡
CREATE VIEW oimpDetailsView AS
SELECT
    trips.`Student Admin`,
    trips.`Program ID`,
    overseasPrograms.`Program Name`,
    overseasPrograms.City,
    overseasPrograms.`Partner Name`,
    oimpDetails.gsmCode AS `GSM Code`,
    course.courseName AS `Course Name`, 
    oimpDetails.gsmName AS `GSM Name`
FROM trips
JOIN overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN oimpDetails ON trips.`Student Admin` = oimpDetails.studAdmin
JOIN course ON oimpDetails.courseCode = course.courseCode 
WHERE students.`Study Stage` = 3;

⁡⁣⁣⁢--tripDetails view⁡
CREATE VIEW tripDetails AS
SELECT
    students.`Admin Number`,
    students.`Student Name`,
    trips.`Program ID`,
    students.`Study Stage`,
    students.`Citizenship Status`,
    overseasPrograms.`Start Date` AS `Program Start Date`,
    overseasPrograms.`End Date` AS `Program End Date`,
    overseasPrograms.City
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

DELIMITER //
CREATE FUNCTION getAcronyms() RETURNS CHAR(64)
BEGIN
    DECLARE acronyms CHAR(64);
    SET acronyms = 'OET,OIP,IMP,OCP,OLT,TOB,YEP';
    RETURN acronyms;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER programIDBeforeInsert
BEFORE INSERT
ON overseasPrograms FOR EACH ROW
BEGIN
    DECLARE acronym CHAR(3);
    DECLARE year CHAR(4);
    DECLARE aciChar CHAR(1);
    DECLARE seqNum CHAR(3);
    DECLARE newProgramID CHAR(9);

    -- Call the stored procedure to get the acronym
    CALL getProgramAcronym(NEW.`Program Type`, acronym);

    -- Get the year from the startDate
    SET year = SUBSTRING(YEAR(NEW.`Start Date`), 3, 2);

    -- Get the ACI or NON-ACI character directly from the countries table
    SET aciChar = (SELECT aciCountry FROM countries WHERE countryCode = NEW.`Country Code`);

    -- Get the next sequence number
    SET seqNum = LPAD((SELECT COUNT(*) + 1 FROM overseasPrograms WHERE SUBSTRING(`Program ID`, 4, 2) = year), 3, '0');

    -- Construct the new programID
    SET newProgramID = CONCAT(acronym, year, aciChar, seqNum);

    -- Add condition here to prevent the trigger if the acronym already exists
    IF NOT FIND_IN_SET(SUBSTRING(NEW.`Program ID`, 1, 3), getAcronyms()) THEN
        -- Set the new programID
        SET NEW.`Program ID` = newProgramID;
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER updateProgramCompletionStatus
AFTER INSERT ON trips
FOR EACH ROW
BEGIN
    UPDATE overseasPrograms
    SET `Approve status` = 'Completed'
    WHERE `Program ID` = NEW.`Program ID`;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER overseasProgramsUpdateTrigger
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
    
    IF NEW.`Start Date` != OLD.`Start Date` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Start Date', OLD.`Start Date`, NEW.`Start Date`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`End Date` != OLD.`End Date` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'End Date', OLD.`End Date`, NEW.`End Date`, NEW.`Program ID`);
    END IF;
    
    IF NEW.`Estimated Date` != OLD.`Estimated Date` THEN
        INSERT INTO auditTable (`Table Name`, `Column Name`, `Old Value`, `New Value`, `Program ID`)
        VALUES ('overseasPrograms', 'Estimated Date', OLD.`Estimated Date`, NEW.`Estimated Date`, NEW.`Program ID`);
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
CREATE TRIGGER overseasProgramsDeleteTrigger
AFTER DELETE ON overseasPrograms
FOR EACH ROW
BEGIN
    DECLARE old_values TEXT;
    SET old_values = CONCAT(
        'Program ID:', COALESCE(OLD.`Program ID`, ''), ', ',
        'Program Name:', COALESCE(OLD.`Program Name`, ''), ', ',
        'Program Type:', COALESCE(OLD.`Program Type`, ''), ', ',
        'Start Date:', COALESCE(OLD.`Start Date`, ''), ', ',
        'End Date:', COALESCE(OLD.`End Date`, ''), ', ',
        'Estimated Date:', COALESCE(OLD.`Estimated Date`, ''), ', ',
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