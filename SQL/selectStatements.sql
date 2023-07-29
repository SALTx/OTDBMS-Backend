-- Call out the 'countries' table
SELECT * FROM countries;

-- Call out the 'pemGroup' table
SELECT * FROM pemGroup;

-- Call out the 'course' table
SELECT * FROM course;

-- Call out the 'students' table
SELECT * FROM students;

-- Call out the 'overseasPrograms' table
SELECT * FROM overseasPrograms;

-- Call out the 'trips' table
SELECT * FROM trips;

-- Call out the 'oimpDetails' table
SELECT * FROM oimpDetails;

-- Call out the 'users' table
SELECT * FROM users;

-- Call out the 'auditTable' table
SELECT * FROM auditTable;

-- Call out filter by quater
CALL Q1(2023);
CALL Q2(2023);
CALL Q3(2023);
CALL Q4(2023);

-- Call out the 'totalKpiEstimation' view
SELECT * FROM totalKpiEstimation;

-- Call out the 'kpiEstimation' view
SELECT * FROM kpiEstimation;

-- Call out the 'KPI1' view
SELECT * FROM KPI1;

-- Call out the 'KPI2' view
SELECT * FROM KPI2;

-- Call out the 'KPI3' view
SELECT * FROM KPI3;

-- Call out the 'studentsView' view
SELECT * FROM studentsView;

-- Call out the 'overseasProgramsView' view
SELECT * FROM overseasProgramsView;

-- Call out the 'oimpDetailsView' view
SELECT * FROM oimpDetailsView;

-- Call out the 'tripDetails' view
SELECT * FROM tripDetails;

-- Call out the stored procedure 'getProgramAcronym'
CALL getProgramAcronym('Overseas internship program', @acronym);
SELECT @acronym;

-- Call out the function 'getAcronyms'
SELECT getAcronyms();

-- Call out the 'programIDBeforeInsert' trigger
-- Note: This trigger is automatically triggered on INSERT in the 'overseasPrograms' table.
-- It generates a new 'Program ID' based on specific conditions.
-- No separate SELECT query is needed for this trigger.

-- Call out the 'updateProgramCompletionStatus' trigger
-- Note: This trigger is automatically triggered on INSERT in the 'trips' table.
-- It updates the 'Approve status' in the 'overseasPrograms' table to 'Completed' for the corresponding 'Program ID'.
-- No separate SELECT query is needed for this trigger.

-- Call out the 'overseasProgramsUpdateTrigger' trigger
-- Note: This trigger is automatically triggered on UPDATE in the 'overseasPrograms' table.
-- It inserts audit records into the 'auditTable' for the changes made to the 'overseasPrograms' table.
-- No separate SELECT query is needed for this trigger.

-- Call out the 'overseasProgramsDeleteTrigger' trigger
-- Note: This trigger is automatically triggered on DELETE in the 'overseasPrograms' table.
-- It inserts an audit record into the 'auditTable' for the deleted record.
-- No separate SELECT query is needed for this trigger.



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









