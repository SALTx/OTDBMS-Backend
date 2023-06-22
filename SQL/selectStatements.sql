SELECT `Citizenship Status`, `Study Stage`, COUNT(*) AS StudentCount
FROM students
GROUP BY `Citizenship Status`, `Study Stage`;

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








