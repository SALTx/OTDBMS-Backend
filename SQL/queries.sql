-- Sample data for students table
INSERT INTO students (adminNumber, name, gender, birthday, citizenshipStatus, diploma, pemName)
VALUES ('123456A', 'John Doe', 'Male', '2000-01-01', 'Singapore citizen', 'Diploma in Computer Science', 'John Smith');

INSERT INTO students (adminNumber, name, gender, birthday, citizenshipStatus, diploma, pemName)
VALUES ('234567B', 'Jane Doe', 'Female', '2001-02-03', 'Permanent resident', 'Diploma in Nursing', 'Megan Lee');

INSERT INTO students (adminNumber, name, gender, birthday, citizenshipStatus, diploma, pemName)
VALUES ('345678C', 'Dwayne Wayne', 'Male', '2002-05-06', 'Foreigner', 'Diploma in Business', 'William Gates');

-- Sample data for overseasPrograms table
INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, country, organization)
VALUES ('I87323', 'Bing Soon', 'Internship', '2023-06-01', '2023-09-01', 'Malaysia', 'IBM');

INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, country, organization)
VALUES ('E23223', 'Ramen Noodle', 'Exchange program', '2023-08-01', '2023-12-01', 'Japan', 'Tokyo Polytechnic University');

INSERT INTO overseasPrograms (programID, programName, programType, startDate, endDate, country, organization)
VALUES ('I76823', 'Walmart', 'Internship', '2023-05-01', '2023-08-01', 'USA', 'Walmart');

-- Sample data for countries table
INSERT INTO countries (countryCode, countryName, numberOfTrips, aciCountry)
VALUES ('TH', 'Thailand', 50, 'Yes');

INSERT INTO countries (countryCode, countryName, numberOfTrips, aciCountry)
VALUES ('JPN', 'Japan', 20, 'No');

INSERT INTO countries (countryCode, countryName, numberOfTrips, aciCountry)

VALUES ('USA', 'United States', 30, 'No');

-- Sample data for trips table
INSERT INTO trips (studentAdminNumber, programID, gradeReceived, comments)
VALUES ('123456A', 'I87323', 'A', 'Great experience overall!');

INSERT INTO trips (studentAdminNumber, programID, gradeReceived, comments)
VALUES ('234567B', 'E23223', 'B', 'Lots of new things learned!');

INSERT INTO trips (studentAdminNumber, programID, gradeReceived, comments)
VALUES ('345678C', 'I87323', 'C', 'Could have been better organized.');

-- example user accounts
INSERT INTO users VALUES ('admin', 'admin', 'Admin', 'John Smith');
INSERT INTO users VALUES ('teacher', 'password', 'Teacher', 'Mary Johnson');
INSERT INTO users VALUES ('guest', '123456', 'Guest', 'Samuel Lee');




