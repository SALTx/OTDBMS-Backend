DELIMITER //

-- Stored procedure to update the date in the overseasprogramm table
CREATE PROCEDURE UpdateProgramDates(
  IN p_programID CHAR(6),
  IN p_startDate DATE,
  IN p_endDate DATE
)
BEGIN
  UPDATE overseasPrograms
  SET startDate = p_startDate, endDate = p_endDate
  WHERE programID = p_programID;
END //

--CALL UpdateProgramDates('OP001', '2023-06-01', '2023-08-31');
-- Stored procedure to update the comments in the trips table

CREATE PROCEDURE UpdateTripComments(
  IN p_studentAdminNo CHAR(7),
  IN p_programID CHAR(6),
  IN p_comments TEXT
)
BEGIN
    UPDATE trips SET comments = p_comments WHERE studentAdminNo = p_studentAdminNo AND programID = p_programID;
END //

--CALL UpdateTripComments('A123456', 'OP001', 'New comment');

CREATE PROCEDURE InsertCountry(
  IN p_countryCode CHAR(3),
  IN p_countryName VARCHAR(64),
  IN p_aciCountry ENUM('Yes', 'No')
)
BEGIN
  INSERT INTO countries (countryCode, countryName, aciCountry)
  VALUES (p_countryCode, p_countryName, p_aciCountry);
END //

--CALL InsertCountry('USA', 'United States', 'No');

DELIMITER ;
