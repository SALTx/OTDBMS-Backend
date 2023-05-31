-- Sample data for pemGroup table
INSERT INTO pemGroup (pemGroupId, pemName) VALUES
('PEM001', 'Andy Lim'),
('PEM002', 'David Loo'),
('PEM003', 'Marry Lim');
INSERT INTO plannedTrips (programID, startDate, endDate, NumStaff, EstNumStudents, Approved)
VALUES ('IMP23A006', NULL, NULL, 5, 50, 'Yes');


-- Actual data for course table
INSERT INTO course (courseCode, courseName, courseManager) VALUES
('EGDF94', 'Common Engineering Programme', 'Siew Peng Shorn'),
('EGDF22', 'Advanced & Digital Manufacturing', 'Kent Loo'),
('EGDF11', 'Aeronautical & Aerospace Technology', 'Sneharaj Malankad'),
('EGDF12', 'Aerospace Systems & Management', 'Gan An Zhi'),
('EGDFPA', 'AI & Data Engineering', 'Sophia Wei'),
('EGDF09', 'Biomedical Engineering', 'Poh Kok Kiong'),
('EGDF20', 'Electronic & Computer Engineering', 'Chang Wai Yee'),
('EGDF17', 'Engineering with Business', 'Ang Wei Sin'),
('EGDF21', 'Infocomm & Media Engineering', 'Cheng Yu Hui'),
('EGDF13', 'Nanotechnology & Materials Science', 'Eunice Goh'),
('EGDF19', 'Robotics & Mechatronics', 'David Poh');

-- Sample data for students table
INSERT INTO students (adminNo, name, gender, citizenshipStatus, course, stage, pemGroup) VALUES
('191203', 'John Smith', 'Male', 'Singapore citizen', 'C75', 3, 'PEM001'),
('A123457', 'Jane Doe', 'Female', 'Permanent resident', 'C42', 3, 'PEM002'),
('A123458', 'Bob Johnson', 'Male', 'Foreigner', 'C71', 3, 'PEM003'),
('A123459', 'Emily Lee', 'Female', 'Singapore citizen', 'C42', 3, 'PEM002');



-- Sample data for overseasPrograms table

INSERT INTO overseasPrograms (programName, programType, startDate, endDate, countryCode, city, partnerName, overseasPartnerType)
VALUES
    ('Program 2', 'Overseas internship program', '2023-01-01', '2023-01-30', 'CN', 'Beijing', 'Partner 2', 'Company'),
    ('Program 3', 'Overseas immersion program', '2023-02-01', '2023-02-30', 'IN', 'New Delhi', 'Partner 3', 'Institution'),
    ('Program 4', 'Overseas Competition/Exchange', '2023-03-01', '2023-03-30', 'MY', 'Kuala Lumpur', 'Partner 4', 'Company'),
    ('Program 5', 'Overseas Leadership Training', '2023-4-01', '2023-4-30', 'JP', 'Tokyo', 'Partner 5', 'Company'),
    ('Program 6', 'Overseas Leadership Training with Outward Bound', '2023-5-01', '2023-5-30', 'AU', 'Sydney', 'Partner 6', 'Company'),
    ('Program 7', 'Overseas Service Learning-Youth Expedition Programme', '2023-6-01', '2023-6-30', 'DE', 'Berlin', 'Partner 7', 'Company'),
    ('Program 8', 'Overseas educational trip', '2023-07-01', '2023-07-30', 'FR', 'Paris', 'Partner 8', 'Company'),
    ('Program 9', 'Overseas internship program', '2023-08-01', '2023-08-28', 'IT', 'Rome', 'Partner 9', 'Company'),
    ('Program 10', 'Overseas immersion program', '2023-08-01', '2023-08-30', 'GB', 'London', 'Partner 10', 'Company'),
    ('Program 11', 'Overseas Competition/Exchange', '2023-09-01', '2023-09-30', 'CA', 'Toronto', 'Partner 11', 'Company'),
    ('Program 12', 'Overseas educational trip', '2023-09-01', '2023-09-30', 'ES', 'Madrid', 'Partner 12', 'Company'),
    ('Program 13', 'Overseas internship program', '2023-10-01', '2023-10-30', 'BR', 'Rio de Janeiro', 'Partner 13', 'Company'),
    ('Program 14', 'Overseas immersion program', '2023-010-01', '2023-010-30', 'RU', 'Moscow', 'Partner 14', 'Institution'),
    ('Program 15', 'Overseas Competition/Exchange', '2023-08-01', '2023-08-30', 'AU', 'Melbourne', 'Partner 15', 'Company'),
    ('Program 16', 'Overseas Leadership Training', '2023-09-01', '2023-09-30', 'SG', 'Singapore', 'Partner 16', 'Company'),
    ('Program 17', 'Overseas Leadership Training with Outward Bound', '2023-10-01', '2023-10-30', 'NZ', 'Auckland', 'Partner 17', 'Company'),
    ('Program 18', 'Overseas Service Learning-Youth Expedition Programme', '2023-11-01', '2023-11-30', 'MY', 'Kuala Lumpur', 'Partner 18', 'Company'),
    ('Program 19', 'Overseas educational trip', '2023-12-01', '2023-12-30', 'TH', 'Bangkok', 'Partner 19', 'Company'),
    ('Program 20', 'Overseas internship program', '2025-01-01', '2025-01-30', 'FR', 'Paris', 'Partner 20', 'Company'),
    ('Program 21', 'Overseas immersion program', '2025-02-01', '2025-02-28', 'JP', 'Tokyo', 'Partner 21', 'Institution'),
    ('Program 22', 'Overseas Competition/Exchange', '2025-03-01', '2025-03-30', 'US', 'Los Angeles', 'Partner 22', 'Company'),
    ('Program 23', 'Overseas Leadership Training', '2025-04-01', '2025-04-30', 'GB', 'London', 'Partner 23', 'Company'),
    ('Program 24', 'Overseas Leadership Training with Outward Bound', '2025-05-01', '2025-05-30', 'AU', 'Sydney', 'Partner 24', 'Company'),
    ('Program 25', 'Overseas Service Learning-Youth Expedition Programme', '2025-06-01', '2025-06-30', 'DE', 'Berlin', 'Partner 25', 'Company'),
    ('Program 26', 'Overseas educational trip', '2025-07-01', '2025-07-30', 'IT', 'Rome', 'Partner 26', 'Company');






INSERT INTO OIMPdetails (gsmCode, courseCode, studAdmin, gsmName, programID) VALUES
('sampledata1', 'C42', 'A123459', 'sampledata1', 'OP003');

-- Sample data for users table
INSERT INTO users (username, password, accountType, name) VALUES
('admin', 'adminpass', 'Admin', 'John Admin'),
('teacher1', 'teacher1pass', 'Teacher', 'Jane Teacher'),
('guest1', 'guest1pass', 'Guest', 'Bob Guest');

-- Sample data for trips table
INSERT INTO trips (studAdmin, programID, comments) VALUES
('A123456', 'OP001', 'Excited to start my summer internship at xxx!'),
('A123457', 'OP002', 'Looking forward to studying at University of India'),
('A123459', 'OP003', 'Happy to experience Chinese culture!'),
('A123458', 'OP004', 'Happy to experience Malaysian culture!');
