CREATE VIEW KPI1 AS
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 
    'KPI' AS `Course Code`,
    'Description' AS `Course Name`,
    'Trips for all Stage 3 local students' AS `Number of Students`;

CREATE VIEW KPI2 AS
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `ACI Trips Student Count`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 'KPI', 'Description', 'ACI Trips for all Stage 3 local students';

CREATE VIEW KPI3 AS
SELECT 
    course.courseCode AS `Course Code`,
    course.courseName AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `Number of Students`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN course ON students.`Course Code` = course.courseCode
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
        AND `Program Type` = 'Overseas internship program'
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
GROUP BY course.courseCode, course.courseName
UNION ALL
SELECT 
    'Total' AS `Course Code`,
    'Students' AS `Course Name`,
    COUNT(DISTINCT trips.`Student Admin`) AS `OITP ACI Trips Student Count`
FROM trips
JOIN students ON trips.`Student Admin` = students.`Admin Number`
JOIN (
    SELECT DISTINCT `Program ID`
    FROM overseasPrograms
    WHERE `Country Code` IN (SELECT countryCode FROM countries WHERE aciCountry = 'A')
        AND `Program Type` = 'Overseas internship program'
) AS overseasPrograms ON trips.`Program ID` = overseasPrograms.`Program ID`
WHERE students.`Study Stage` = 3 AND students.`Citizenship Status` IN ('Permanent resident', 'Singapore citizen')
UNION ALL
SELECT 'KPI', 'Description', 'ACI intern trips for all Stage 3 local students';
