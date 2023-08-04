CREATE VIEW countStudents AS
SELECT
    `Course Code`,
    SUM(`Study Stage` = 1) AS `Stage 1`,
    SUM(`Study Stage` = 2) AS `Stage 2`,
    SUM(`Study Stage` = 3) AS `Stage 3`
FROM students
GROUP BY `Course Code`
UNION ALL
SELECT
    'Total' AS `Course Code`,
    SUM(`Study Stage` = 1) AS `Stage 1`,
    SUM(`Study Stage` = 2) AS `Stage 2`,
    SUM(`Study Stage` = 3) AS `Stage 3`
FROM students;

CREATE VIEW programType AS
SELECT `Program Type`, COUNT(*) AS `Total Programs`
FROM overseasPrograms
GROUP BY `Program Type`;

CREATE VIEW aciPrograms AS
SELECT
    CASE
        WHEN countries.aciCountry = 'A' THEN 'ACI'
        WHEN countries.aciCountry = 'N' THEN 'NON ACI'
    END AS `ACI Status`,
    COUNT(*) AS `Total Programs`
FROM overseasPrograms
JOIN countries ON overseasPrograms.`Country Code` = countries.countryCode
GROUP BY `ACI Status`;
