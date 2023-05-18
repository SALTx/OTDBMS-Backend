CREATE VIEW KPI1OverseasStudCount AS
SELECT COUNT(DISTINCT studentAdminNo) AS uniqueStudents
FROM trips;
--
CREATE VIEW KPI2ACIcount AS
SELECT COUNT(DISTINCT studentAdminNo) AS uniqueStudents
FROM trips
WHERE EXISTS (
    SELECT *
    FROM overseasPrograms
    WHERE trips.programID = overseasPrograms.programID
    AND (
        countryCode IN ('BRN', 'KHM', 'IDN', 'LAO', 'MYS', 'MMR', 'PHL', 'SGP', 'THA', 'VNM', 'CHN', 'HKG', 'TWN', 'IND')
    )
);

--
CREATE VIEW KPI3ACIoitp AS
SELECT COUNT(DISTINCT studentAdminNo) AS uniqueStudents
FROM trips
WHERE EXISTS (
    SELECT *
    FROM overseasPrograms
    WHERE trips.programID = overseasPrograms.programID
    AND programType = 'OITP'
    AND (
        countryCode IN ('BRN', 'KHM', 'IDN', 'LAO', 'MYS', 'MMR', 'PHL', 'SGP', 'THA', 'VNM', 'CHN', 'HKG', 'TWN', 'IND')
    )
);

