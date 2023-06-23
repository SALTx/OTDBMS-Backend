
use opsystem_test;
DROP TABLE IF EXISTS `overseasPrograms`;
CREATE TABLE IF NOT EXISTS `overseasPrograms` (
  `Program ID` char(9) NOT NULL,
  `Program Name` varchar(64) NOT NULL,
  `Program Type` enum('Overseas educational trip','Overseas internship program','Overseas immersion program','Overseas Competition/Exchange','Overseas Leadership Training','Overseas Leadership Training with Outward Bound','Overseas Service Learning-Youth Expedition Programme') NOT NULL,
  `Date` varchar(64) DEFAULT NULL,
  `Country Code` char(2) NOT NULL,
  `City` varchar(64) NOT NULL,
  `Partner Name` varchar(64) DEFAULT NULL,
  `Overseas Partner Type` enum('Company','Institution','Others') NOT NULL,
  `Trip Leaders` varchar(255) DEFAULT NULL,
  `Estimated students` smallint DEFAULT NULL,
  `Approve status` enum('Approved','Rejected','Pending') NOT NULL,
  PRIMARY KEY (`Program ID`,`Country Code`,`City`),
  KEY `Country Code` (`Country Code`)
) ;

--
-- Dumping data for table `overseasPrograms`
--

INSERT INTO `overseasPrograms` (`Program ID`, `Program Name`, `Program Type`, `Date`, `Country Code`, `City`, `Partner Name`, `Overseas Partner Type`, `Trip Leaders`, `Estimated students`, `Approve status`) VALUES
('OIP23N142', 'Program PROG00146', 'Overseas internship program', '2023-03-14 to 2023-09-04', 'MT', 'City 146', 'Partner 146', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N111', 'Program PROG00145', 'Overseas immersion program', '2024-03-29 to 2024-04-06', 'GI', 'City 145', 'Partner 145', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N110', 'Program PROG00144', 'Overseas internship program', 'May 2024', 'BV', 'City 144', 'Partner 144', 'Others', 'Unassigned ', 1, 'Pending'),
('IMP24N109', 'Program PROG00143', 'Overseas immersion program', 'May 2024', 'WF', 'City 143', 'Partner 143', 'Others', 'Unassigned ', 1, 'Rejected'),
('OET22N122', 'Program PROG00141', 'Overseas educational trip', '2022-08-25 to 2022-09-07', 'LS', 'City 141', 'Partner 141', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N123', 'Program PROG00142', 'Overseas internship program', '2022-09-10 to 2023-03-02', 'CL', 'City 142', 'Partner 142', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N141', 'Program PROG00140', 'Overseas educational trip', '2023-12-29 to 2024-01-12', 'GN', 'City 140', 'Partner 140', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N140', 'Program PROG00139', 'Overseas educational trip', '2023-04-26 to 2023-05-08', 'WS', 'City 139', 'Partner 139', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N139', 'Program PROG00138', 'Overseas internship program', '2023-04-19 to 2023-09-08', 'MG', 'City 138', 'Partner 138', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N138', 'Program PROG00137', 'Overseas immersion program', '2023-02-12 to 2023-02-21', 'GY', 'City 137', 'Partner 137', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22A121', 'Program PROG00136', 'Overseas educational trip', '2022-05-26 to 2022-06-05', 'HK', 'City 136', 'Partner 136', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N137', 'Program PROG00134', 'Overseas internship program', '2023-10-16 to 2024-03-06', 'CO', 'City 134', 'Partner 134', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N120', 'Program PROG00135', 'Overseas internship program', '2022-04-25 to 2022-10-03', 'GH', 'City 135', 'Partner 135', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N136', 'Program PROG00133', 'Overseas immersion program', '2023-09-27 to 2023-10-11', 'BE', 'City 133', 'Partner 133', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24N108', 'Program PROG00132', 'Overseas educational trip', '2024-06-21 to 2024-06-28', 'GB', 'City 132', 'Partner 132', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N135', 'Program PROG00131', 'Overseas internship program', '2023-07-30 to 2023-12-27', 'KN', 'City 131', 'Partner 131', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N134', 'Program PROG00130', 'Overseas internship program', '2023-01-28 to 2023-06-21', 'GP', 'City 130', 'Partner 130', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N133', 'Program PROG00129', 'Overseas internship program', '2023-08-19 to 2024-02-03', 'RO', 'City 129', 'Partner 129', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22A119', 'Program PROG00128', 'Overseas immersion program', '2022-11-15 to 2022-11-29', 'SG', 'City 128', 'Partner 128', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N107', 'Program PROG00127', 'Overseas educational trip', 'May 2024', 'LY', 'City 127', 'Partner 127', 'Others', 'Unassigned ', 1, 'Pending'),
('OET23N132', 'Program PROG00125', 'Overseas educational trip', '2023-11-20 to 2023-12-03', 'CG', 'City 125', 'Partner 125', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N118', 'Program PROG00126', 'Overseas educational trip', '2022-07-14 to 2022-07-22', 'PN', 'City 126', 'Partner 126', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N117', 'Program PROG00124', 'Overseas educational trip', '2022-07-17 to 2022-07-29', 'CA', 'City 124', 'Partner 124', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N116', 'Program PROG00123', 'Overseas immersion program', '2022-11-27 to 2022-12-10', 'VC', 'City 123', 'Partner 123', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23A131', 'Program PROG00122', 'Overseas immersion program', '2023-02-11 to 2023-02-23', 'TW', 'City 122', 'Partner 122', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N129', 'Program PROG00120', 'Overseas internship program', '2023-10-19 to 2024-03-07', 'OM', 'City 120', 'Partner 120', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N130', 'Program PROG00121', 'Overseas immersion program', '2023-06-11 to 2023-06-19', 'TV', 'City 121', 'Partner 121', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N115', 'Program PROG00119', 'Overseas educational trip', '2022-10-10 to 2022-10-20', 'SC', 'City 119', 'Partner 119', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N128', 'Program PROG00118', 'Overseas educational trip', '2023-04-19 to 2023-04-29', 'CM', 'City 118', 'Partner 118', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N127', 'Program PROG00117', 'Overseas educational trip', '2023-03-27 to 2023-04-04', 'SR', 'City 117', 'Partner 117', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24A106', 'Program PROG00116', 'Overseas internship program', 'March 2024', 'TH', 'City 116', 'Partner 116', 'Institution', 'Unassigned ', 1, 'Pending'),
('OIP22N114', 'Program PROG00115', 'Overseas internship program', '2022-12-07 to 2023-05-02', 'US', 'City 115', 'Partner 115', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N126', 'Program PROG00114', 'Overseas educational trip', '2023-07-07 to 2023-07-14', 'GE', 'City 114', 'Partner 114', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22A113', 'Program PROG00113', 'Overseas internship program', '2022-08-28 to 2023-01-07', 'CN', 'City 113', 'Partner 113', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N112', 'Program PROG00112', 'Overseas internship program', '2022-08-16 to 2022-12-09', 'SY', 'City 112', 'Partner 112', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23A125', 'Program PROG00111', 'Overseas immersion program', '2023-11-15 to 2023-11-28', 'TW', 'City 111', 'Partner 111', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N124', 'Program PROG00110', 'Overseas immersion program', '2023-10-19 to 2023-10-30', 'PR', 'City 110', 'Partner 110', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N111', 'Program PROG00109', 'Overseas internship program', '2022-10-27 to 2023-03-22', 'MC', 'City 109', 'Partner 109', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N110', 'Program PROG00108', 'Overseas educational trip', '2022-10-03 to 2022-10-14', 'VU', 'City 108', 'Partner 108', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N109', 'Program PROG00107', 'Overseas internship program', '2022-04-23 to 2022-10-18', 'HU', 'City 107', 'Partner 107', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N123', 'Program PROG00106', 'Overseas immersion program', '2023-03-16 to 2023-03-25', 'AZ', 'City 106', 'Partner 106', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N122', 'Program PROG00105', 'Overseas immersion program', '2023-04-13 to 2023-04-23', 'CX', 'City 105', 'Partner 105', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N105', 'Program PROG00104', 'Overseas internship program', 'March 2024', 'BD', 'City 104', 'Partner 104', 'Others', 'Unassigned ', 1, 'Rejected'),
('OET22N108', 'Program PROG00102', 'Overseas educational trip', '2022-06-19 to 2022-07-01', 'RW', 'City 102', 'Partner 102', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N104', 'Program PROG00103', 'Overseas immersion program', '2024-11-26 to 2024-12-05', 'TL', 'City 103', 'Partner 103', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N121', 'Program PROG00101', 'Overseas internship program', '2023-05-30 to 2023-09-14', 'GW', 'City 101', 'Partner 101', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N107', 'Program PROG00100', 'Overseas internship program', '2022-11-29 to 2023-03-20', 'BY', 'City 100', 'Partner 100', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N106', 'Program PROG00099', 'Overseas internship program', '2022-10-15 to 2023-01-29', 'GM', 'City 99', 'Partner 99', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N120', 'Program PROG00098', 'Overseas educational trip', '2023-01-18 to 2023-01-28', 'AM', 'City 98', 'Partner 98', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N119', 'Program PROG00097', 'Overseas educational trip', '2023-08-16 to 2023-08-23', 'TJ', 'City 97', 'Partner 97', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N105', 'Program PROG00096', 'Overseas internship program', '2022-01-27 to 2022-07-17', 'AM', 'City 96', 'Partner 96', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N104', 'Program PROG00094', 'Overseas educational trip', '2022-07-26 to 2022-08-02', 'IS', 'City 94', 'Partner 94', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N118', 'Program PROG00095', 'Overseas educational trip', '2023-05-17 to 2023-05-26', 'GY', 'City 95', 'Partner 95', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N103', 'Program PROG00093', 'Overseas educational trip', '2022-04-17 to 2022-05-01', 'ES', 'City 93', 'Partner 93', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22A102', 'Program PROG00092', 'Overseas immersion program', '2022-08-17 to 2022-08-24', 'LA', 'City 92', 'Partner 92', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N117', 'Program PROG00091', 'Overseas educational trip', '2023-01-20 to 2023-01-27', 'GF', 'City 91', 'Partner 91', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N101', 'Program PROG00090', 'Overseas internship program', '2022-11-18 to 2023-03-10', 'DO', 'City 90', 'Partner 90', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N100', 'Program PROG00089', 'Overseas internship program', '2022-02-03 to 2022-05-26', 'SB', 'City 89', 'Partner 89', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N116', 'Program PROG00088', 'Overseas immersion program', '2023-11-15 to 2023-11-24', 'TM', 'City 88', 'Partner 88', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N099', 'Program PROG00087', 'Overseas immersion program', '2022-11-30 to 2022-12-11', 'SM', 'City 87', 'Partner 87', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N103', 'Program PROG00086', 'Overseas educational trip', 'August 2024', 'ST', 'City 86', 'Partner 86', 'Company', 'Unassigned ', 1, 'Rejected'),
('IMP24N102', 'Program PROG00085', 'Overseas immersion program', 'September 2024', 'NP', 'City 85', 'Partner 85', 'Company', 'Unassigned ', 1, 'Rejected'),
('IMP23N115', 'Program PROG00084', 'Overseas immersion program', '2023-09-19 to 2023-09-28', 'PR', 'City 84', 'Partner 84', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N101', 'Program PROG00083', 'Overseas educational trip', 'November 2024', 'NZ', 'City 83', 'Partner 83', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP23N114', 'Program PROG00082', 'Overseas immersion program', '2023-05-16 to 2023-05-23', 'SI', 'City 82', 'Partner 82', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N113', 'Program PROG00081', 'Overseas internship program', '2023-03-09 to 2023-08-08', 'VA', 'City 81', 'Partner 81', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N098', 'Program PROG00080', 'Overseas internship program', '2022-01-17 to 2022-07-01', 'RW', 'City 80', 'Partner 80', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N100', 'Program PROG00079', 'Overseas internship program', '2024-06-21 to 2024-11-03', 'RE', 'City 79', 'Partner 79', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N099', 'Program PROG00078', 'Overseas immersion program', 'March 2024', 'AW', 'City 78', 'Partner 78', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OET22N097', 'Program PROG00077', 'Overseas educational trip', '2022-09-25 to 2022-10-09', 'PM', 'City 77', 'Partner 77', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N112', 'Program PROG00076', 'Overseas internship program', '2023-03-17 to 2023-09-04', 'CI', 'City 76', 'Partner 76', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N098', 'Program PROG00075', 'Overseas internship program', '2024-08-02 to 2024-12-23', 'GL', 'City 75', 'Partner 75', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N097', 'Program PROG00074', 'Overseas immersion program', 'January 2024', 'GL', 'City 74', 'Partner 74', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP22N096', 'Program PROG00073', 'Overseas immersion program', '2022-03-06 to 2022-03-14', 'BM', 'City 73', 'Partner 73', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N096', 'Program PROG00072', 'Overseas immersion program', 'April 2024', 'CH', 'City 72', 'Partner 72', 'Institution', 'Unassigned ', 1, 'Pending'),
('IMP23N110', 'Program PROG00070', 'Overseas immersion program', '2023-12-20 to 2023-12-30', 'TL', 'City 70', 'Partner 70', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N111', 'Program PROG00071', 'Overseas internship program', '2023-12-31 to 2024-04-03', 'SR', 'City 71', 'Partner 71', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N095', 'Program PROG00069', 'Overseas internship program', '2022-08-14 to 2022-11-27', 'SD', 'City 69', 'Partner 69', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N108', 'Program PROG00067', 'Overseas internship program', '2023-05-08 to 2023-08-30', 'CI', 'City 67', 'Partner 67', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N109', 'Program PROG00068', 'Overseas internship program', '2023-11-02 to 2024-02-01', 'MX', 'City 68', 'Partner 68', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N107', 'Program PROG00066', 'Overseas educational trip', '2023-12-24 to 2024-01-05', 'GD', 'City 66', 'Partner 66', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N106', 'Program PROG00065', 'Overseas immersion program', '2023-04-17 to 2023-04-26', 'OM', 'City 65', 'Partner 65', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N105', 'Program PROG00064', 'Overseas immersion program', '2023-02-08 to 2023-02-15', 'KN', 'City 64', 'Partner 64', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N093', 'Program PROG00062', 'Overseas immersion program', '2022-02-09 to 2022-02-20', 'MG', 'City 62', 'Partner 62', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N094', 'Program PROG00063', 'Overseas internship program', '2022-12-05 to 2023-05-26', 'CX', 'City 63', 'Partner 63', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP24N095', 'Program PROG00061', 'Overseas immersion program', '2024-09-03 to 2024-09-16', 'TR', 'City 61', 'Partner 61', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N092', 'Program PROG00060', 'Overseas internship program', '2022-10-18 to 2023-03-23', 'AO', 'City 60', 'Partner 60', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N094', 'Program PROG00059', 'Overseas immersion program', '2024-03-17 to 2024-03-28', 'AM', 'City 59', 'Partner 59', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N091', 'Program PROG00058', 'Overseas educational trip', '2022-03-03 to 2022-03-12', 'NG', 'City 58', 'Partner 58', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N104', 'Program PROG00057', 'Overseas immersion program', '2023-04-01 to 2023-04-12', 'EE', 'City 57', 'Partner 57', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N093', 'Program PROG00056', 'Overseas internship program', '2024-03-12 to 2024-07-29', 'LR', 'City 56', 'Partner 56', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N092', 'Program PROG00054', 'Overseas educational trip', 'December 2024', 'GP', 'City 54', 'Partner 54', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP23N103', 'Program PROG00055', 'Overseas internship program', '2023-03-13 to 2023-07-16', 'SN', 'City 55', 'Partner 55', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N091', 'Program PROG00053', 'Overseas immersion program', 'November 2024', 'IS', 'City 53', 'Partner 53', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP22N090', 'Program PROG00052', 'Overseas internship program', '2022-08-15 to 2022-12-24', 'SO', 'City 52', 'Partner 52', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22A089', 'Program PROG00051', 'Overseas educational trip', '2022-05-09 to 2022-05-22', 'MM', 'City 51', 'Partner 51', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N088', 'Program PROG00050', 'Overseas immersion program', '2022-07-28 to 2022-08-08', 'AU', 'City 50', 'Partner 50', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N090', 'Program PROG00049', 'Overseas immersion program', 'March 2024', 'LK', 'City 49', 'Partner 49', 'Others', 'Unassigned ', 1, 'Rejected'),
('OET24N089', 'Program PROG00048', 'Overseas educational trip', '2024-11-20 to 2024-11-27', 'CO', 'City 48', 'Partner 48', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N088', 'Program PROG00047', 'Overseas internship program', '2024-02-26 to 2024-07-31', 'AW', 'City 47', 'Partner 47', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N087', 'Program PROG00045', 'Overseas educational trip', 'November 2024', 'AF', 'City 45', 'Partner 45', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP22N087', 'Program PROG00046', 'Overseas internship program', '2022-08-03 to 2022-11-10', 'KG', 'City 46', 'Partner 46', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N086', 'Program PROG00044', 'Overseas internship program', 'June 2024', 'MP', 'City 44', 'Partner 44', 'Company', 'Unassigned ', 1, 'Pending'),
('OET24N085', 'Program PROG00043', 'Overseas educational trip', 'April 2024', 'RO', 'City 43', 'Partner 43', 'Institution', 'Unassigned ', 1, 'Pending'),
('IMP24N084', 'Program PROG00042', 'Overseas immersion program', 'April 2024', 'MK', 'City 42', 'Partner 42', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP23N102', 'Program PROG00040', 'Overseas immersion program', '2023-02-20 to 2023-03-05', 'SL', 'City 40', 'Partner 40', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N086', 'Program PROG00041', 'Overseas internship program', '2022-11-29 to 2023-03-10', 'EC', 'City 41', 'Partner 41', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N083', 'Program PROG00039', 'Overseas immersion program', 'February 2024', 'RO', 'City 39', 'Partner 39', 'Others', 'Unassigned ', 1, 'Pending'),
('IMP23N101', 'Program PROG00038', 'Overseas immersion program', '2023-08-18 to 2023-08-27', 'NL', 'City 38', 'Partner 38', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N100', 'Program PROG00037', 'Overseas immersion program', '2023-11-30 to 2023-12-12', 'MK', 'City 37', 'Partner 37', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N085', 'Program PROG00036', 'Overseas immersion program', '2022-10-17 to 2022-10-26', 'ES', 'City 36', 'Partner 36', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N084', 'Program PROG00035', 'Overseas internship program', '2022-10-23 to 2023-03-26', 'CD', 'City 35', 'Partner 35', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N082', 'Program PROG00034', 'Overseas internship program', 'April 2024', 'IT', 'City 34', 'Partner 34', 'Others', 'Unassigned ', 1, 'Pending'),
('OET22A083', 'Program PROG00033', 'Overseas educational trip', '2022-07-17 to 2022-07-24', 'VN', 'City 33', 'Partner 33', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N081', 'Program PROG00032', 'Overseas immersion program', 'December 2024', 'SN', 'City 32', 'Partner 32', 'Company', 'Unassigned ', 1, 'Rejected'),
('IMP23N099', 'Program PROG00030', 'Overseas immersion program', '2023-11-09 to 2023-11-22', 'BF', 'City 30', 'Partner 30', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24N080', 'Program PROG00031', 'Overseas educational trip', 'December 2024', 'VA', 'City 31', 'Partner 31', 'Others', 'Unassigned ', 1, 'Pending'),
('OIP22N082', 'Program PROG00029', 'Overseas internship program', '2022-10-15 to 2023-02-09', 'MR', 'City 29', 'Partner 29', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N079', 'Program PROG00028', 'Overseas educational trip', 'July 2024', 'TL', 'City 28', 'Partner 28', 'Institution', 'Unassigned ', 1, 'Pending'),
('IMP23N098', 'Program PROG00027', 'Overseas immersion program', '2023-12-31 to 2024-01-12', 'SO', 'City 27', 'Partner 27', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N097', 'Program PROG00026', 'Overseas immersion program', '2023-03-01 to 2023-03-09', 'AL', 'City 26', 'Partner 26', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N078', 'Program PROG00025', 'Overseas educational trip', 'May 2024', 'SB', 'City 25', 'Partner 25', 'Company', 'Unassigned ', 1, 'Pending'),
('IMP22N081', 'Program PROG00024', 'Overseas immersion program', '2022-04-14 to 2022-04-26', 'RU', 'City 24', 'Partner 24', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N080', 'Program PROG00023', 'Overseas internship program', '2022-02-12 to 2022-07-20', 'CL', 'City 23', 'Partner 23', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N077', 'Program PROG00022', 'Overseas immersion program', '2024-09-12 to 2024-09-20', 'TV', 'City 22', 'Partner 22', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N076', 'Program PROG00021', 'Overseas internship program', 'June 2024', 'PY', 'City 21', 'Partner 21', 'Company', 'Unassigned ', 1, 'Pending'),
('IMP23N096', 'Program PROG00020', 'Overseas immersion program', '2023-01-31 to 2023-02-13', 'CV', 'City 20', 'Partner 20', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP22N079', 'Program PROG00019', 'Overseas immersion program', '2022-02-15 to 2022-02-27', 'FR', 'City 19', 'Partner 19', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N095', 'Program PROG00018', 'Overseas immersion program', '2023-08-26 to 2023-09-08', 'PG', 'City 18', 'Partner 18', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N078', 'Program PROG00017', 'Overseas internship program', '2022-07-17 to 2022-10-22', 'LS', 'City 17', 'Partner 17', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N094', 'Program PROG00016', 'Overseas internship program', '2023-04-20 to 2023-07-31', 'NC', 'City 16', 'Partner 16', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N093', 'Program PROG00015', 'Overseas internship program', '2023-06-08 to 2023-11-01', 'MG', 'City 15', 'Partner 15', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N092', 'Program PROG00014', 'Overseas educational trip', '2023-04-21 to 2023-04-29', 'FM', 'City 14', 'Partner 14', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24A075', 'Program PROG00013', 'Overseas educational trip', '2024-02-23 to 2024-03-05', 'LA', 'City 13', 'Partner 13', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N077', 'Program PROG00012', 'Overseas immersion program', '2022-07-14 to 2022-07-25', 'EH', 'City 12', 'Partner 12', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N074', 'Program PROG00011', 'Overseas internship program', 'July 2024', 'MG', 'City 11', 'Partner 11', 'Company', 'Unassigned ', 1, 'Pending'),
('IMP22N076', 'Program PROG00010', 'Overseas immersion program', '2022-08-25 to 2022-09-07', 'NE', 'City 10', 'Partner 10', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N073', 'Program PROG00009', 'Overseas internship program', 'July 2024', 'VC', 'City 9', 'Partner 9', 'Company', 'Unassigned ', 1, 'Rejected'),
('IMP24N072', 'Program PROG00008', 'Overseas immersion program', 'July 2024', 'SZ', 'City 8', 'Partner 8', 'Others', 'Unassigned ', 1, 'Pending'),
('OIP24N071', 'Program PROG00007', 'Overseas internship program', 'June 2024', 'ZM', 'City 7', 'Partner 7', 'Company', 'Unassigned ', 1, 'Pending'),
('IMP23N091', 'Program PROG00006', 'Overseas immersion program', '2023-06-01 to 2023-06-10', 'DO', 'City 6', 'Partner 6', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP22N075', 'Program PROG00005', 'Overseas immersion program', '2022-10-30 to 2022-11-09', 'SI', 'City 5', 'Partner 5', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23A090', 'Program PROG00004', 'Overseas educational trip', '2023-02-26 to 2023-03-11', 'HK', 'City 4', 'Partner 4', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24A070', 'Program PROG00003', 'Overseas internship program', 'May 2024', 'SG', 'City 3', 'Partner 3', 'Institution', 'Unassigned ', 1, 'Pending'),
('IMP23N089', 'Program PROG00002', 'Overseas immersion program', '2023-03-31 to 2023-04-09', 'GW', 'City 2', 'Partner 2', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22A074', 'Program PROG00030', 'Overseas internship program', '2022-11-01 to 2023-04-15', 'VN', 'City 30', 'Partner 30', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N088', 'Program PROG00001', 'Overseas educational trip', '2023-03-05 to 2023-03-15', 'BF', 'City 1', 'Partner 1', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A087', 'Program PROG00029', 'Overseas internship program', '2023-07-07 to 2023-10-30', 'KH', 'City 29', 'Partner 29', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24A069', 'Program PROG00028', 'Overseas internship program', 'February 2024', 'BN', 'City 28', 'Partner 28', 'Others', 'Unassigned ', 1, 'Pending'),
('OIP22A073', 'Program PROG00027', 'Overseas internship program', '2022-07-16 to 2022-11-09', 'BN', 'City 27', 'Partner 27', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23A086', 'Program PROG00025', 'Overseas internship program', '2023-02-22 to 2023-06-02', 'VN', 'City 25', 'Partner 25', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22A072', 'Program PROG00026', 'Overseas internship program', '2022-05-30 to 2022-10-25', 'PH', 'City 26', 'Partner 26', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22A071', 'Program PROG00024', 'Overseas internship program', '2022-09-23 to 2023-01-24', 'PH', 'City 24', 'Partner 24', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A085', 'Program PROG00023', 'Overseas internship program', '2023-07-24 to 2024-01-16', 'HK', 'City 23', 'Partner 23', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22A070', 'Program PROG00022', 'Overseas internship program', '2022-01-06 to 2022-06-14', 'KH', 'City 22', 'Partner 22', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24A068', 'Program PROG00021', 'Overseas internship program', 'March 2024', 'KH', 'City 21', 'Partner 21', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP24A067', 'Program PROG00020', 'Overseas internship program', 'July 2024', 'KH', 'City 20', 'Partner 20', 'Others', 'Unassigned ', 1, 'Pending'),
('OIP24A066', 'Program PROG00019', 'Overseas internship program', 'July 2024', 'IN', 'City 19', 'Partner 19', 'Institution', 'Unassigned ', 1, 'Pending'),
('OIP22A069', 'Program PROG00018', 'Overseas internship program', '2022-07-08 to 2022-12-03', 'TH', 'City 18', 'Partner 18', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23A084', 'Program PROG00017', 'Overseas internship program', '2023-08-23 to 2024-02-15', 'PH', 'City 17', 'Partner 17', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A083', 'Program PROG00016', 'Overseas internship program', '2023-10-21 to 2024-02-13', 'TH', 'City 16', 'Partner 16', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A082', 'Program PROG00015', 'Overseas internship program', '2023-07-19 to 2024-01-06', 'VN', 'City 15', 'Partner 15', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23A081', 'Program PROG00014', 'Overseas internship program', '2023-04-11 to 2023-09-21', 'KH', 'City 14', 'Partner 14', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22A068', 'Program PROG00013', 'Overseas internship program', '2022-03-28 to 2022-08-06', 'SG', 'City 13', 'Partner 13', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22A067', 'Program PROG00011', 'Overseas internship program', '2022-04-11 to 2022-07-21', 'HK', 'City 11', 'Partner 11', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24A065', 'Program PROG00012', 'Overseas internship program', '2024-02-28 to 2024-07-24', 'MY', 'City 12', 'Partner 12', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24A064', 'Program PROG00010', 'Overseas internship program', 'June 2024', 'HK', 'City 10', 'Partner 10', 'Institution', 'Unassigned ', 1, 'Pending'),
('OIP23A080', 'Program PROG00009', 'Overseas internship program', '2023-03-25 to 2023-08-21', 'IN', 'City 9', 'Partner 9', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A078', 'Program PROG00007', 'Overseas internship program', '2023-10-22 to 2024-03-07', 'LA', 'City 7', 'Partner 7', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23A079', 'Program PROG00008', 'Overseas internship program', '2023-08-06 to 2023-11-23', 'BN', 'City 8', 'Partner 8', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23A077', 'Program PROG00006', 'Overseas internship program', '2023-12-21 to 2024-04-30', 'MM', 'City 6', 'Partner 6', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24A063', 'Program PROG00005', 'Overseas internship program', '2024-06-11 to 2024-09-17', 'IN', 'City 5', 'Partner 5', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23A076', 'Program PROG00004', 'Overseas internship program', '2023-12-06 to 2024-05-08', 'MM', 'City 4', 'Partner 4', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A075', 'Program PROG00003', 'Overseas internship program', '2023-05-24 to 2023-11-03', 'PH', 'City 3', 'Partner 3', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24A062', 'Program PROG00002', 'Overseas internship program', 'August 2024', 'HK', 'City 2', 'Partner 2', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP23A074', 'Program PROG00001', 'Overseas internship program', '2023-01-23 to 2023-06-02', 'MY', 'City 1', 'Partner 1', 'Company', 'Unassigned ', 1, 'Approved'),
('OLT23N073', 'Program PROG00199', 'Overseas Leadership Training', '2023-07-18 to 2023-07-28', 'BJ', 'City 199', 'Partner 199', 'Company', 'Unassigned ', 1, 'Approved'),
('TOB22N066', 'Program PROG00200', 'Overseas Leadership Training with Outward Bound', '2022-12-03 to 2022-12-11', 'NR', 'City 200', 'Partner 200', 'Others', 'Unassigned ', 1, 'Approved'),
('TOB22N065', 'Program PROG00198', 'Overseas Leadership Training with Outward Bound', '2022-09-16 to 2022-09-26', 'BE', 'City 198', 'Partner 198', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT22A064', 'Program PROG00197', 'Overseas Leadership Training', '2022-02-11 to 2022-02-19', 'HK', 'City 197', 'Partner 197', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT23N072', 'Program PROG00196', 'Overseas Leadership Training', '2023-03-25 to 2023-04-07', 'VI', 'City 196', 'Partner 196', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB22N063', 'Program PROG00195', 'Overseas Leadership Training with Outward Bound', '2022-07-26 to 2022-08-05', 'GS', 'City 195', 'Partner 195', 'Institution', 'Unassigned ', 1, 'Approved'),
('YEP24N060', 'Program PROG00192', 'Overseas Service Learning-Youth Expedition Programme', 'January 2024', 'ES', 'City 192', 'Partner 192', 'Others', 'Unassigned ', 1, 'Pending'),
('YEP24N061', 'Program PROG00194', 'Overseas Service Learning-Youth Expedition Programme', '2024-06-09 to 2024-06-21', 'ML', 'City 194', 'Partner 194', 'Institution', 'Unassigned ', 1, 'Approved'),
('OCP23N071', 'Program PROG00193', 'Overseas Competition/Exchange', '2023-10-15 to 2023-10-24', 'IT', 'City 193', 'Partner 193', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB23N070', 'Program PROG00191', 'Overseas Leadership Training with Outward Bound', '2023-08-22 to 2023-09-02', 'ER', 'City 191', 'Partner 191', 'Institution', 'Unassigned ', 1, 'Approved'),
('OCP24N059', 'Program PROG00190', 'Overseas Competition/Exchange', 'April 2024', 'AF', 'City 190', 'Partner 190', 'Company', 'Unassigned ', 1, 'Pending'),
('YEP24N058', 'Program PROG00189', 'Overseas Service Learning-Youth Expedition Programme', '2024-03-20 to 2024-03-30', 'GE', 'City 189', 'Partner 189', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT22N062', 'Program PROG00188', 'Overseas Leadership Training', '2022-07-15 to 2022-07-27', 'BS', 'City 188', 'Partner 188', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB22N061', 'Program PROG00187', 'Overseas Leadership Training with Outward Bound', '2022-09-25 to 2022-10-04', 'TL', 'City 187', 'Partner 187', 'Institution', 'Unassigned ', 1, 'Approved'),
('OCP23N069', 'Program PROG00184', 'Overseas Competition/Exchange', '2023-01-18 to 2023-01-25', 'MZ', 'City 184', 'Partner 184', 'Institution', 'Unassigned ', 1, 'Approved'),
('OLT24N056', 'Program PROG00185', 'Overseas Leadership Training', '2024-04-10 to 2024-04-23', 'SC', 'City 185', 'Partner 185', 'Others', 'Unassigned ', 1, 'Approved'),
('TOB24N057', 'Program PROG00186', 'Overseas Leadership Training with Outward Bound', '2024-10-24 to 2024-11-06', 'NI', 'City 186', 'Partner 186', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT23N068', 'Program PROG00183', 'Overseas Leadership Training', '2023-01-02 to 2023-01-15', 'PR', 'City 183', 'Partner 183', 'Company', 'Unassigned ', 1, 'Approved'),
('OCP22N059', 'Program PROG00181', 'Overseas Competition/Exchange', '2022-12-22 to 2023-01-04', 'AI', 'City 181', 'Partner 181', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB22N060', 'Program PROG00182', 'Overseas Leadership Training with Outward Bound', '2022-12-29 to 2023-01-06', 'N', 'City 182', 'Partner 182', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N058', 'Program PROG00178', 'Overseas immersion program', '2022-10-12 to 2022-10-26', 'CL', 'City 178', 'Partner 178', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N054', 'Program PROG00179', 'Overseas internship program', 'July 2024', 'US', 'City 179', 'Partner 179', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP24A055', 'Program PROG00180', 'Overseas internship program', 'January 2024', 'KH', 'City 180', 'Partner 180', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP24N053', 'Program PROG00177', 'Overseas internship program', 'May 2024', 'AQ', 'City 177', 'Partner 177', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP24N052', 'Program PROG00176', 'Overseas internship program', 'January 2024', 'AQ', 'City 176', 'Partner 176', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP24N051', 'Program PROG00175', 'Overseas internship program', 'April 2024', 'PR', 'City 175', 'Partner 175', 'Others', 'Unassigned ', 1, 'Pending'),
('OIP23N067', 'Program PROG00174', 'Overseas internship program', '2023-11-03 to 2024-04-28', 'BA', 'City 174', 'Partner 174', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N057', 'Program PROG00173', 'Overseas immersion program', '2022-06-28 to 2022-07-08', 'ER', 'City 173', 'Partner 173', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N056', 'Program PROG00172', 'Overseas immersion program', '2022-11-25 to 2022-12-09', 'GU', 'City 172', 'Partner 172', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N055', 'Program PROG00171', 'Overseas internship program', '2022-02-28 to 2022-08-26', 'TD', 'City 171', 'Partner 171', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N050', 'Program PROG00170', 'Overseas educational trip', '2024-11-25 to 2024-12-06', 'LS', 'City 170', 'Partner 170', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N054', 'Program PROG00169', 'Overseas educational trip', '2022-06-29 to 2022-07-09', 'VG', 'City 169', 'Partner 169', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N066', 'Program PROG00168', 'Overseas educational trip', '2023-10-07 to 2023-10-14', 'JP', 'City 168', 'Partner 168', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N065', 'Program PROG00167', 'Overseas immersion program', '2023-07-21 to 2023-07-28', 'KR', 'City 167', 'Partner 167', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N053', 'Program PROG00166', 'Overseas educational trip', '2022-01-23 to 2022-01-31', 'LV', 'City 166', 'Partner 166', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N052', 'Program PROG00165', 'Overseas internship program', '2022-12-16 to 2023-05-15', 'IQ', 'City 165', 'Partner 165', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N049', 'Program PROG00164', 'Overseas internship program', 'March 2024', 'MO', 'City 164', 'Partner 164', 'Company', 'Unassigned ', 1, 'Rejected'),
('OET22N051', 'Program PROG00163', 'Overseas educational trip', '2022-07-19 to 2022-07-28', 'AE', 'City 163', 'Partner 163', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N064', 'Program PROG00162', 'Overseas immersion program', '2023-04-03 to 2023-04-11', 'MO', 'City 162', 'Partner 162', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N063', 'Program PROG00161', 'Overseas internship program', '2023-04-28 to 2023-10-21', 'GD', 'City 161', 'Partner 161', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N048', 'Program PROG00160', 'Overseas internship program', 'March 2024', 'SH', 'City 160', 'Partner 160', 'Others', 'Unassigned ', 1, 'Pending'),
('IMP22N050', 'Program PROG00159', 'Overseas immersion program', '2022-04-03 to 2022-04-17', 'UZ', 'City 159', 'Partner 159', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N047', 'Program PROG00158', 'Overseas educational trip', 'January 2024', 'SV', 'City 158', 'Partner 158', 'Others', 'Unassigned ', 1, 'Pending'),
('OET24N046', 'Program PROG00157', 'Overseas educational trip', 'August 2024', 'BZ', 'City 157', 'Partner 157', 'Institution', 'Unassigned ', 1, 'Rejected'),
('IMP24N044', 'Program PROG00154', 'Overseas immersion program', '2024-01-29 to 2024-02-12', 'TF', 'City 154', 'Partner 154', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N045', 'Program PROG00156', 'Overseas internship program', 'February 2024', 'AU', 'City 156', 'Partner 156', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP23N062', 'Program PROG00155', 'Overseas internship program', '2023-08-14 to 2024-01-24', 'CR', 'City 155', 'Partner 155', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N061', 'Program PROG00153', 'Overseas immersion program', '2023-01-30 to 2023-02-08', 'EE', 'City 153', 'Partner 153', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N049', 'Program PROG00152', 'Overseas educational trip', '2022-04-25 to 2022-05-04', 'SH', 'City 152', 'Partner 152', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N060', 'Program PROG00151', 'Overseas educational trip', '2023-04-09 to 2023-04-23', 'GN', 'City 151', 'Partner 151', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N043', 'Program PROG00150', 'Overseas educational trip', 'August 2024', 'BO', 'City 150', 'Partner 150', 'Company', 'Unassigned ', 1, 'Rejected'),
('OET23N059', 'Program PROG00149', 'Overseas educational trip', '2023-06-19 to 2023-06-29', 'IE', 'City 149', 'Partner 149', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N058', 'Program PROG00148', 'Overseas immersion program', '2023-05-16 to 2023-05-26', 'PA', 'City 148', 'Partner 148', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N057', 'Program PROG00147', 'Overseas immersion program', '2023-09-09 to 2023-09-22', 'HN', 'City 147', 'Partner 147', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N056', 'Program PROG00146', 'Overseas educational trip', '2023-02-07 to 2023-02-17', 'PF', 'City 146', 'Partner 146', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N055', 'Program PROG00145', 'Overseas immersion program', '2023-01-16 to 2023-01-27', 'PW', 'City 145', 'Partner 145', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N042', 'Program PROG00144', 'Overseas internship program', '2024-03-15 to 2024-06-24', 'BR', 'City 144', 'Partner 144', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N048', 'Program PROG00143', 'Overseas educational trip', '2022-07-21 to 2022-07-29', 'GQ', 'City 143', 'Partner 143', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23A054', 'Program PROG00142', 'Overseas educational trip', '2023-02-28 to 2023-03-10', 'TW', 'City 142', 'Partner 142', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N053', 'Program PROG00141', 'Overseas educational trip', '2023-11-29 to 2023-12-08', 'HN', 'City 141', 'Partner 141', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N047', 'Program PROG00140', 'Overseas immersion program', '2022-12-30 to 2023-01-13', 'KM', 'City 140', 'Partner 140', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N046', 'Program PROG00139', 'Overseas educational trip', '2022-03-31 to 2022-04-09', 'PW', 'City 139', 'Partner 139', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N041', 'Program PROG00138', 'Overseas immersion program', 'January 2024', 'MP', 'City 138', 'Partner 138', 'Others', 'Unassigned ', 1, 'Rejected'),
('OET24N040', 'Program PROG00135', 'Overseas educational trip', 'August 2024', 'HN', 'City 135', 'Partner 135', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP22N045', 'Program PROG00137', 'Overseas internship program', '2022-01-06 to 2022-05-17', 'GS', 'City 137', 'Partner 137', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N044', 'Program PROG00136', 'Overseas internship program', '2022-04-10 to 2022-08-02', 'PA', 'City 136', 'Partner 136', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N052', 'Program PROG00134', 'Overseas immersion program', '2023-02-11 to 2023-02-22', 'TZ', 'City 134', 'Partner 134', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N043', 'Program PROG00131', 'Overseas internship program', '2022-10-05 to 2023-01-04', 'ZA', 'City 131', 'Partner 131', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N039', 'Program PROG00133', 'Overseas educational trip', 'December 2024', 'VI', 'City 133', 'Partner 133', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP24N038', 'Program PROG00132', 'Overseas internship program', 'August 2024', 'GY', 'City 132', 'Partner 132', 'Company', 'Unassigned ', 1, 'Pending'),
('OET22N042', 'Program PROG00130', 'Overseas educational trip', '2022-09-05 to 2022-09-18', 'ER', 'City 130', 'Partner 130', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N051', 'Program PROG00129', 'Overseas educational trip', '2023-01-21 to 2023-02-04', 'FM', 'City 129', 'Partner 129', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N050', 'Program PROG00128', 'Overseas immersion program', '2023-08-01 to 2023-08-13', 'NP', 'City 128', 'Partner 128', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N049', 'Program PROG00127', 'Overseas immersion program', '2023-07-05 to 2023-07-13', 'AW', 'City 127', 'Partner 127', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24A037', 'Program PROG00126', 'Overseas internship program', '2024-05-19 to 2024-09-29', 'HK', 'City 126', 'Partner 126', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N036', 'Program PROG00125', 'Overseas educational trip', '2024-02-16 to 2024-02-24', 'BT', 'City 125', 'Partner 125', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N041', 'Program PROG00124', 'Overseas immersion program', '2022-09-01 to 2022-09-15', 'BS', 'City 124', 'Partner 124', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N048', 'Program PROG00123', 'Overseas educational trip', '2023-10-08 to 2023-10-21', 'GS', 'City 123', 'Partner 123', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N040', 'Program PROG00122', 'Overseas immersion program', '2022-09-16 to 2022-09-26', 'UZ', 'City 122', 'Partner 122', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N039', 'Program PROG00121', 'Overseas internship program', '2022-10-31 to 2023-02-07', 'NP', 'City 121', 'Partner 121', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N038', 'Program PROG00120', 'Overseas educational trip', '2022-01-15 to 2022-01-24', 'GH', 'City 120', 'Partner 120', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N047', 'Program PROG00119', 'Overseas internship program', '2023-03-04 to 2023-07-20', 'ES', 'City 119', 'Partner 119', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N037', 'Program PROG00118', 'Overseas immersion program', '2022-06-12 to 2022-06-19', 'MN', 'City 118', 'Partner 118', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N046', 'Program PROG00117', 'Overseas educational trip', '2023-06-16 to 2023-06-30', 'BI', 'City 117', 'Partner 117', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N036', 'Program PROG00116', 'Overseas educational trip', '2022-03-07 to 2022-03-17', 'BH', 'City 116', 'Partner 116', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N045', 'Program PROG00115', 'Overseas educational trip', '2023-05-31 to 2023-06-14', 'TL', 'City 115', 'Partner 115', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N044', 'Program PROG00114', 'Overseas internship program', '2023-02-14 to 2023-07-21', 'CA', 'City 114', 'Partner 114', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N043', 'Program PROG00113', 'Overseas educational trip', '2023-07-25 to 2023-08-06', 'MT', 'City 113', 'Partner 113', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N035', 'Program PROG00112', 'Overseas immersion program', '2024-01-13 to 2024-01-23', 'NA', 'City 112', 'Partner 112', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24A034', 'Program PROG00109', 'Overseas educational trip', 'January 2024', 'SG', 'City 109', 'Partner 109', 'Company', 'Unassigned ', 1, 'Rejected'),
('OET22N035', 'Program PROG00111', 'Overseas educational trip', '2022-05-07 to 2022-05-19', 'AO', 'City 111', 'Partner 111', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N042', 'Program PROG00110', 'Overseas educational trip', '2023-07-30 to 2023-08-12', 'BT', 'City 110', 'Partner 110', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N041', 'Program PROG00108', 'Overseas educational trip', '2023-07-07 to 2023-07-21', 'IO', 'City 108', 'Partner 108', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N033', 'Program PROG00107', 'Overseas educational trip', '2024-04-20 to 2024-05-03', 'DM', 'City 107', 'Partner 107', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23A040', 'Program PROG00106', 'Overseas educational trip', '2023-12-06 to 2023-12-16', 'VN', 'City 106', 'Partner 106', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N039', 'Program PROG00105', 'Overseas immersion program', '2023-07-28 to 2023-08-06', 'MN', 'City 105', 'Partner 105', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N032', 'Program PROG00104', 'Overseas immersion program', 'March 2024', 'AF', 'City 104', 'Partner 104', 'Others', 'Unassigned ', 1, 'Pending'),
('OET24N031', 'Program PROG00102', 'Overseas educational trip', 'December 2024', 'HU', 'City 102', 'Partner 102', 'Company', 'Unassigned ', 1, 'Rejected'),
('OIP23A038', 'Program PROG00103', 'Overseas internship program', '2023-10-21 to 2024-02-03', 'KH', 'City 103', 'Partner 103', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP24N030', 'Program PROG00101', 'Overseas immersion program', 'February 2024', 'BW', 'City 101', 'Partner 101', 'Institution', 'Unassigned ', 1, 'Pending'),
('OIP23N037', 'Program PROG00100', 'Overseas internship program', '2023-04-29 to 2023-10-14', 'KI', 'City 100', 'Partner 100', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23A036', 'Program PROG00099', 'Overseas internship program', '2023-01-06 to 2023-05-17', 'HK', 'City 99', 'Partner 99', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP22N034', 'Program PROG00098', 'Overseas immersion program', '2022-11-30 to 2022-12-13', 'PE', 'City 98', 'Partner 98', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24N029', 'Program PROG00097', 'Overseas educational trip', 'November 2024', 'NP', 'City 97', 'Partner 97', 'Company', 'Unassigned ', 1, 'Pending'),
('IMP23N035', 'Program PROG00096', 'Overseas immersion program', '2023-03-13 to 2023-03-25', 'BG', 'City 96', 'Partner 96', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N034', 'Program PROG00093', 'Overseas internship program', '2023-08-29 to 2023-12-17', 'VU', 'City 93', 'Partner 93', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N033', 'Program PROG00094', 'Overseas internship program', '2022-07-22 to 2022-10-25', 'RU', 'City 94', 'Partner 94', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N028', 'Program PROG00095', 'Overseas educational trip', '2024-03-07 to 2024-03-14', 'AT', 'City 95', 'Partner 95', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N033', 'Program PROG00092', 'Overseas immersion program', '2023-02-15 to 2023-02-23', 'CV', 'City 92', 'Partner 92', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N031', 'Program PROG00089', 'Overseas internship program', '2022-03-05 to 2022-07-29', 'RO', 'City 89', 'Partner 89', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N032', 'Program PROG00091', 'Overseas immersion program', '2022-02-02 to 2022-02-14', 'GL', 'City 91', 'Partner 91', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N027', 'Program PROG00090', 'Overseas internship program', 'February 2024', 'ZA', 'City 90', 'Partner 90', 'Institution', 'Unassigned ', 1, 'Pending'),
('IMP22A030', 'Program PROG00088', 'Overseas immersion program', '2022-08-24 to 2022-09-07', 'TH', 'City 88', 'Partner 88', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N032', 'Program PROG00087', 'Overseas immersion program', '2023-02-14 to 2023-02-28', 'ER', 'City 87', 'Partner 87', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N026', 'Program PROG00086', 'Overseas internship program', 'January 2024', 'GW', 'City 86', 'Partner 86', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP24A025', 'Program PROG00085', 'Overseas immersion program', 'April 2024', 'IN', 'City 85', 'Partner 85', 'Company', 'Unassigned ', 1, 'Rejected'),
('OIP24N024', 'Program PROG00084', 'Overseas internship program', '2024-05-01 to 2024-08-13', 'KN', 'City 84', 'Partner 84', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N029', 'Program PROG00083', 'Overseas internship program', '2022-08-06 to 2023-01-11', 'AZ', 'City 83', 'Partner 83', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N031', 'Program PROG00082', 'Overseas immersion program', '2023-10-18 to 2023-10-27', 'AR', 'City 82', 'Partner 82', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N023', 'Program PROG00081', 'Overseas educational trip', 'March 2024', 'FM', 'City 81', 'Partner 81', 'Institution', 'Unassigned ', 1, 'Rejected'),
('IMP22N028', 'Program PROG00080', 'Overseas immersion program', '2022-04-05 to 2022-04-17', 'AS', 'City 80', 'Partner 80', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N030', 'Program PROG00079', 'Overseas internship program', '2023-09-13 to 2024-02-01', 'AT', 'City 79', 'Partner 79', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N022', 'Program PROG00078', 'Overseas internship program', 'July 2024', 'BH', 'City 78', 'Partner 78', 'Institution', 'Unassigned ', 1, 'Pending'),
('OET23N027', 'Program PROG00075', 'Overseas educational trip', '2023-09-14 to 2023-09-21', 'MW', 'City 75', 'Partner 75', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N029', 'Program PROG00077', 'Overseas educational trip', '2023-10-11 to 2023-10-23', 'PS', 'City 77', 'Partner 77', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N028', 'Program PROG00076', 'Overseas immersion program', '2023-05-06 to 2023-05-19', 'SY', 'City 76', 'Partner 76', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N026', 'Program PROG00074', 'Overseas educational trip', '2023-11-08 to 2023-11-18', 'ZW', 'City 74', 'Partner 74', 'Company', 'Unassigned ', 1, 'Approved');
INSERT INTO `overseasPrograms` (`Program ID`, `Program Name`, `Program Type`, `Date`, `Country Code`, `City`, `Partner Name`, `Overseas Partner Type`, `Trip Leaders`, `Estimated students`, `Approve status`) VALUES
('IMP24N021', 'Program PROG00073', 'Overseas immersion program', 'June 2024', 'VE', 'City 73', 'Partner 73', 'Institution', 'Unassigned ', 1, 'Pending'),
('OET22N027', 'Program PROG00072', 'Overseas educational trip', '2022-07-13 to 2022-07-20', 'MW', 'City 72', 'Partner 72', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N026', 'Program PROG00071', 'Overseas immersion program', '2022-05-20 to 2022-06-01', 'ST', 'City 71', 'Partner 71', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N024', 'Program PROG00068', 'Overseas educational trip', '2022-03-06 to 2022-03-13', 'LR', 'City 68', 'Partner 68', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N025', 'Program PROG00070', 'Overseas educational trip', '2022-07-27 to 2022-08-09', 'NZ', 'City 70', 'Partner 70', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24N020', 'Program PROG00069', 'Overseas educational trip', 'April 2024', 'GR', 'City 69', 'Partner 69', 'Others', 'Unassigned ', 1, 'Rejected'),
('OIP22N023', 'Program PROG00067', 'Overseas internship program', '2022-01-27 to 2022-05-31', 'MX', 'City 67', 'Partner 67', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24A019', 'Program PROG00066', 'Overseas internship program', 'May 2024', 'BN', 'City 66', 'Partner 66', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP23A025', 'Program PROG00065', 'Overseas immersion program', '2023-05-08 to 2023-05-15', 'TH', 'City 65', 'Partner 65', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N018', 'Program PROG00064', 'Overseas immersion program', 'March 2024', 'BM', 'City 64', 'Partner 64', 'Company', 'Unassigned ', 1, 'Pending'),
('OIP23N024', 'Program PROG00063', 'Overseas internship program', '2023-08-30 to 2024-01-02', 'QA', 'City 63', 'Partner 63', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N023', 'Program PROG00062', 'Overseas immersion program', '2023-10-26 to 2023-11-02', 'PN', 'City 62', 'Partner 62', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP22N022', 'Program PROG00061', 'Overseas immersion program', '2022-05-19 to 2022-05-31', 'SR', 'City 61', 'Partner 61', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N021', 'Program PROG00060', 'Overseas educational trip', '2022-11-05 to 2022-11-19', 'BM', 'City 60', 'Partner 60', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N020', 'Program PROG00059', 'Overseas educational trip', '2022-11-24 to 2022-12-06', 'HM', 'City 59', 'Partner 59', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N019', 'Program PROG00058', 'Overseas immersion program', '2022-05-21 to 2022-05-28', 'SZ', 'City 58', 'Partner 58', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N017', 'Program PROG00057', 'Overseas internship program', '2024-01-11 to 2024-05-09', 'BD', 'City 57', 'Partner 57', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N016', 'Program PROG00056', 'Overseas internship program', '2024-05-15 to 2024-10-25', 'IO', 'City 56', 'Partner 56', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N015', 'Program PROG00055', 'Overseas immersion program', '2024-05-15 to 2024-05-29', 'IQ', 'City 55', 'Partner 55', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N022', 'Program PROG00054', 'Overseas educational trip', '2023-01-20 to 2023-02-02', 'JE', 'City 54', 'Partner 54', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N018', 'Program PROG00053', 'Overseas internship program', '2022-11-15 to 2023-04-02', 'MN', 'City 53', 'Partner 53', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N014', 'Program PROG00052', 'Overseas immersion program', 'April 2024', 'KI', 'City 52', 'Partner 52', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP23N021', 'Program PROG00049', 'Overseas internship program', '2023-03-20 to 2023-07-07', 'VU', 'City 49', 'Partner 49', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N013', 'Program PROG00051', 'Overseas educational trip', 'December 2024', 'GH', 'City 51', 'Partner 51', 'Others', 'Unassigned ', 1, 'Pending'),
('OET22N017', 'Program PROG00050', 'Overseas educational trip', '2022-11-08 to 2022-11-16', 'MN', 'City 50', 'Partner 50', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N016', 'Program PROG00048', 'Overseas educational trip', '2022-10-09 to 2022-10-19', 'NA', 'City 48', 'Partner 48', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N015', 'Program PROG00047', 'Overseas immersion program', '2022-02-23 to 2022-03-06', 'N', 'City 47', 'Partner 47', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N014', 'Program PROG00046', 'Overseas immersion program', '2022-10-08 to 2022-10-15', 'GM', 'City 46', 'Partner 46', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N013', 'Program PROG00045', 'Overseas educational trip', '2022-07-07 to 2022-07-17', 'GF', 'City 45', 'Partner 45', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N012', 'Program PROG00044', 'Overseas educational trip', '2024-12-20 to 2024-12-28', 'BS', 'City 44', 'Partner 44', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N020', 'Program PROG00043', 'Overseas internship program', '2023-05-26 to 2023-09-16', 'AW', 'City 43', 'Partner 43', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N012', 'Program PROG00042', 'Overseas immersion program', '2022-09-10 to 2022-09-19', 'NC', 'City 42', 'Partner 42', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP22N011', 'Program PROG00041', 'Overseas immersion program', '2022-07-04 to 2022-07-13', 'ZW', 'City 41', 'Partner 41', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N010', 'Program PROG00040', 'Overseas internship program', '2022-11-29 to 2023-04-26', 'GS', 'City 40', 'Partner 40', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N019', 'Program PROG00039', 'Overseas internship program', '2023-04-03 to 2023-07-30', 'SD', 'City 39', 'Partner 39', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N018', 'Program PROG00038', 'Overseas educational trip', '2023-12-19 to 2024-01-01', 'JP', 'City 38', 'Partner 38', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N011', 'Program PROG00037', 'Overseas immersion program', 'November 2024', 'IR', 'City 37', 'Partner 37', 'Company', 'Unassigned ', 1, 'Rejected'),
('OIP22N008', 'Program PROG00034', 'Overseas internship program', '2022-05-13 to 2022-09-01', 'CM', 'City 34', 'Partner 34', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N017', 'Program PROG00036', 'Overseas educational trip', '2023-11-25 to 2023-12-06', 'CA', 'City 36', 'Partner 36', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N009', 'Program PROG00035', 'Overseas internship program', '2022-03-22 to 2022-09-03', 'SZ', 'City 35', 'Partner 35', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP24N010', 'Program PROG00033', 'Overseas immersion program', '2024-04-02 to 2024-04-12', 'HR', 'City 33', 'Partner 33', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N009', 'Program PROG00032', 'Overseas immersion program', 'March 2024', 'GS', 'City 32', 'Partner 32', 'Company', 'Unassigned ', 1, 'Rejected'),
('OIP22N007', 'Program PROG00031', 'Overseas internship program', '2022-05-05 to 2022-08-24', 'UM', 'City 31', 'Partner 31', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23N016', 'Program PROG00030', 'Overseas internship program', '2023-03-30 to 2023-09-05', 'KY', 'City 30', 'Partner 30', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N008', 'Program PROG00029', 'Overseas educational trip', '2024-02-21 to 2024-03-04', 'IR', 'City 29', 'Partner 29', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N006', 'Program PROG00028', 'Overseas educational trip', '2022-09-14 to 2022-09-27', 'ST', 'City 28', 'Partner 28', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP24N007', 'Program PROG00027', 'Overseas internship program', '2024-04-06 to 2024-09-07', 'SY', 'City 27', 'Partner 27', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N015', 'Program PROG00026', 'Overseas immersion program', '2023-10-10 to 2023-10-21', 'AO', 'City 26', 'Partner 26', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N005', 'Program PROG00025', 'Overseas educational trip', '2022-01-03 to 2022-01-15', 'VC', 'City 25', 'Partner 25', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N004', 'Program PROG00024', 'Overseas immersion program', '2022-02-22 to 2022-03-02', 'FR', 'City 24', 'Partner 24', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N006', 'Program PROG00021', 'Overseas internship program', 'March 2024', 'AL', 'City 21', 'Partner 21', 'Company', 'Unassigned ', 1, 'Pending'),
('OIP23N014', 'Program PROG00023', 'Overseas internship program', '2023-08-05 to 2023-12-12', 'MG', 'City 23', 'Partner 23', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N013', 'Program PROG00022', 'Overseas internship program', '2023-09-27 to 2024-02-12', 'SC', 'City 22', 'Partner 22', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N012', 'Program PROG00020', 'Overseas educational trip', '2023-06-25 to 2023-07-09', 'AL', 'City 20', 'Partner 20', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23A011', 'Program PROG00019', 'Overseas educational trip', '2023-09-25 to 2023-10-06', 'TW', 'City 19', 'Partner 19', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N010', 'Program PROG00018', 'Overseas immersion program', '2023-08-02 to 2023-08-09', 'SV', 'City 18', 'Partner 18', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N003', 'Program PROG00017', 'Overseas educational trip', '2022-07-06 to 2022-07-20', 'GP', 'City 17', 'Partner 17', 'Others', 'Unassigned ', 1, 'Approved'),
('OET23N009', 'Program PROG00016', 'Overseas educational trip', '2023-05-11 to 2023-05-22', 'CV', 'City 16', 'Partner 16', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET23N008', 'Program PROG00015', 'Overseas educational trip', '2023-06-10 to 2023-06-19', 'CI', 'City 15', 'Partner 15', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N007', 'Program PROG00014', 'Overseas internship program', '2023-05-31 to 2023-11-05', 'PM', 'City 14', 'Partner 14', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N002', 'Program PROG00013', 'Overseas educational trip', '2022-12-12 to 2022-12-19', 'N', 'City 13', 'Partner 13', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP23A006', 'Program PROG00012', 'Overseas internship program', '2023-07-06 to 2023-10-04', 'ID', 'City 12', 'Partner 12', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N005', 'Program PROG00011', 'Overseas educational trip', 'March 2024', 'TJ', 'City 11', 'Partner 11', 'Others', 'Unassigned ', 1, 'Pending'),
('IMP24N003', 'Program PROG00008', 'Overseas immersion program', 'May 2024', 'SY', 'City 8', 'Partner 8', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OIP23N005', 'Program PROG00010', 'Overseas internship program', '2023-05-26 to 2023-11-02', 'GI', 'City 10', 'Partner 10', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N004', 'Program PROG00009', 'Overseas internship program', '2024-04-05 to 2024-09-29', 'LV', 'City 9', 'Partner 9', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N004', 'Program PROG00007', 'Overseas internship program', '2023-02-21 to 2023-08-03', 'PY', 'City 7', 'Partner 7', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N003', 'Program PROG00006', 'Overseas internship program', '2023-06-14 to 2023-12-09', 'IS', 'City 6', 'Partner 6', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N001', 'Program PROG00005', 'Overseas educational trip', '2022-01-25 to 2022-02-04', 'GA', 'City 5', 'Partner 5', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N002', 'Program PROG00004', 'Overseas educational trip', 'April 2024', 'VG', 'City 4', 'Partner 4', 'Others', 'Unassigned ', 1, 'Rejected'),
('IMP24N001', 'Program PROG00003', 'Overseas immersion program', '2024-07-04 to 2024-07-11', 'KY', 'City 3', 'Partner 3', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N002', 'Program PROG00002', 'Overseas immersion program', '2023-03-22 to 2023-04-01', 'VU', 'City 2', 'Partner 2', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N001', 'Program PROG00001', 'Overseas internship program', '2023-03-15 to 2023-07-08', 'IR', 'City 1', 'Partner 1', 'Others', 'Unassigned ', 1, 'Approved'),
('OET22N124', 'Program PROG00147', 'Overseas educational trip', '2022-05-24 to 2022-06-04', 'BE', 'City 147', 'Partner 147', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N143', 'Program PROG00148', 'Overseas immersion program', '2023-10-29 to 2023-11-07', 'MK', 'City 148', 'Partner 148', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N125', 'Program PROG00149', 'Overseas immersion program', '2022-07-23 to 2022-08-02', 'AM', 'City 149', 'Partner 149', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET22N126', 'Program PROG00150', 'Overseas educational trip', '2022-04-02 to 2022-04-15', 'PT', 'City 150', 'Partner 150', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N144', 'Program PROG00151', 'Overseas educational trip', '2023-06-05 to 2023-06-18', 'GB', 'City 151', 'Partner 151', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP22N127', 'Program PROG00152', 'Overseas internship program', '2022-11-25 to 2023-04-30', 'OM', 'City 152', 'Partner 152', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N128', 'Program PROG00153', 'Overseas internship program', '2022-12-04 to 2023-05-03', 'SA', 'City 153', 'Partner 153', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP23N145', 'Program PROG00154', 'Overseas internship program', '2023-08-19 to 2024-02-07', 'FR', 'City 154', 'Partner 154', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N112', 'Program PROG00155', 'Overseas immersion program', '2024-01-28 to 2024-02-07', 'TJ', 'City 155', 'Partner 155', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP22N129', 'Program PROG00156', 'Overseas immersion program', '2022-09-21 to 2022-09-29', 'DK', 'City 156', 'Partner 156', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N130', 'Program PROG00157', 'Overseas internship program', '2022-09-26 to 2023-01-08', 'TZ', 'City 157', 'Partner 157', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP22N131', 'Program PROG00158', 'Overseas internship program', '2022-03-18 to 2022-08-20', 'NA', 'City 158', 'Partner 158', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP23N146', 'Program PROG00159', 'Overseas internship program', '2023-10-15 to 2024-02-03', 'VA', 'City 159', 'Partner 159', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP22A132', 'Program PROG00160', 'Overseas immersion program', '2022-08-09 to 2022-08-21', 'IN', 'City 160', 'Partner 160', 'Others', 'Unassigned ', 1, 'Approved'),
('IMP23N147', 'Program PROG00161', 'Overseas immersion program', '2023-08-24 to 2023-09-03', 'PN', 'City 161', 'Partner 161', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP23N148', 'Program PROG00162', 'Overseas immersion program', '2023-04-29 to 2023-05-07', 'UY', 'City 162', 'Partner 162', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N133', 'Program PROG00163', 'Overseas educational trip', '2022-10-19 to 2022-10-28', 'AF', 'City 163', 'Partner 163', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP23N149', 'Program PROG00164', 'Overseas immersion program', '2023-10-31 to 2023-11-12', 'FJ', 'City 164', 'Partner 164', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N113', 'Program PROG00165', 'Overseas immersion program', '2024-06-25 to 2024-07-07', 'GE', 'City 165', 'Partner 165', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N114', 'Program PROG00166', 'Overseas educational trip', '2024-02-14 to 2024-02-21', 'GT', 'City 166', 'Partner 166', 'Institution', 'Unassigned ', 1, 'Approved'),
('OIP22N134', 'Program PROG00167', 'Overseas internship program', '2022-03-04 to 2022-07-13', 'TF', 'City 167', 'Partner 167', 'Institution', 'Unassigned ', 1, 'Approved'),
('IMP24N115', 'Program PROG00168', 'Overseas immersion program', '2024-07-17 to 2024-07-31', 'AL', 'City 168', 'Partner 168', 'Company', 'Unassigned ', 1, 'Approved'),
('IMP24N116', 'Program PROG00169', 'Overseas immersion program', '2024-08-02 to 2024-08-12', 'MV', 'City 169', 'Partner 169', 'Company', 'Unassigned ', 1, 'Approved'),
('OET23N150', 'Program PROG00170', 'Overseas educational trip', '2023-07-25 to 2023-08-06', 'TD', 'City 170', 'Partner 170', 'Institution', 'Unassigned ', 1, 'Approved'),
('OET24N117', 'Program PROG00171', 'Overseas educational trip', 'January 2024', 'MG', 'City 171', 'Partner 171', 'Institution', 'Unassigned ', 1, 'Pending'),
('OET24N118', 'Program PROG00172', 'Overseas educational trip', '2024-02-20 to 2024-03-02', 'KE', 'City 172', 'Partner 172', 'Others', 'Unassigned ', 1, 'Approved'),
('OIP24N119', 'Program PROG00173', 'Overseas internship program', 'March 2024', 'CR', 'City 173', 'Partner 173', 'Company', 'Unassigned ', 1, 'Pending'),
('OET22N135', 'Program PROG00174', 'Overseas educational trip', '2022-01-31 to 2022-02-07', 'AW', 'City 174', 'Partner 174', 'Others', 'Unassigned ', 1, 'Approved'),
('OET24N120', 'Program PROG00175', 'Overseas educational trip', 'February 2024', 'MH', 'City 175', 'Partner 175', 'Institution', 'Unassigned ', 1, 'Rejected'),
('IMP23N151', 'Program PROG00176', 'Overseas immersion program', '2023-07-29 to 2023-08-10', 'NC', 'City 176', 'Partner 176', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N121', 'Program PROG00177', 'Overseas internship program', '2024-03-14 to 2024-06-17', 'HU', 'City 177', 'Partner 177', 'Company', 'Unassigned ', 1, 'Approved'),
('OIP24N122', 'Program PROG00178', 'Overseas internship program', '2024-03-04 to 2024-08-31', 'GP', 'City 178', 'Partner 178', 'Company', 'Unassigned ', 1, 'Approved'),
('OET22N136', 'Program PROG00179', 'Overseas educational trip', '2022-12-27 to 2023-01-04', 'VG', 'City 179', 'Partner 179', 'Company', 'Unassigned ', 1, 'Approved'),
('OET24N123', 'Program PROG00180', 'Overseas educational trip', '2024-04-27 to 2024-05-09', 'TN', 'City 180', 'Partner 180', 'Company', 'Unassigned ', 1, 'Approved'),
('OCP24N124', 'Program PROG00181', 'Overseas Competition/Exchange', '2024-02-15 to 2024-02-25', 'CS', 'City 181', 'Partner 181', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB22N137', 'Program PROG00182', 'Overseas Leadership Training with Outward Bound', '2022-04-01 to 2022-04-10', 'KN', 'City 182', 'Partner 182', 'Others', 'Unassigned ', 1, 'Approved'),
('TOB22N138', 'Program PROG00183', 'Overseas Leadership Training with Outward Bound', '2022-04-19 to 2022-04-26', 'MQ', 'City 183', 'Partner 183', 'Others', 'Unassigned ', 1, 'Approved'),
('OCP22N139', 'Program PROG00184', 'Overseas Competition/Exchange', '2022-03-28 to 2022-04-04', 'BT', 'City 184', 'Partner 184', 'Company', 'Unassigned ', 1, 'Approved'),
('TOB22N140', 'Program PROG00185', 'Overseas Leadership Training with Outward Bound', '2022-04-19 to 2022-04-27', 'CA', 'City 185', 'Partner 185', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT24N125', 'Program PROG00186', 'Overseas Leadership Training', 'April 2024', 'OM', 'City 186', 'Partner 186', 'Others', 'Unassigned ', 1, 'Pending'),
('TOB23N152', 'Program PROG00187', 'Overseas Leadership Training with Outward Bound', '2023-08-18 to 2023-09-01', 'UY', 'City 187', 'Partner 187', 'Others', 'Unassigned ', 1, 'Approved'),
('YEP22N141', 'Program PROG00188', 'Overseas Service Learning-Youth Expedition Programme', '2022-04-30 to 2022-05-14', 'JE', 'City 188', 'Partner 188', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT23N153', 'Program PROG00189', 'Overseas Leadership Training', '2023-03-30 to 2023-04-10', 'TM', 'City 189', 'Partner 189', 'Company', 'Unassigned ', 1, 'Approved'),
('OLT24N126', 'Program PROG00190', 'Overseas Leadership Training', '2024-11-04 to 2024-11-12', 'AE', 'City 190', 'Partner 190', 'Institution', 'Unassigned ', 1, 'Approved'),
('OCP22N142', 'Program PROG00191', 'Overseas Competition/Exchange', '2022-09-15 to 2022-09-24', 'TZ', 'City 191', 'Partner 191', 'Others', 'Unassigned ', 1, 'Approved'),
('OLT24N127', 'Program PROG00192', 'Overseas Leadership Training', 'August 2024', 'SL', 'City 192', 'Partner 192', 'Institution', 'Unassigned ', 1, 'Pending'),
('YEP24N128', 'Program PROG00193', 'Overseas Service Learning-Youth Expedition Programme', 'November 2024', 'MO', 'City 193', 'Partner 193', 'Institution', 'Unassigned ', 1, 'Rejected'),
('TOB24N129', 'Program PROG00194', 'Overseas Leadership Training with Outward Bound', '2024-04-12 to 2024-04-24', 'US', 'City 194', 'Partner 194', 'Company', 'Unassigned ', 1, 'Approved'),
('YEP23N154', 'Program PROG00195', 'Overseas Service Learning-Youth Expedition Programme', '2023-03-04 to 2023-03-18', 'KM', 'City 195', 'Partner 195', 'Institution', 'Unassigned ', 1, 'Approved'),
('OCP24N130', 'Program PROG00196', 'Overseas Competition/Exchange', 'September 2024', 'AO', 'City 196', 'Partner 196', 'Institution', 'Unassigned ', 1, 'Rejected'),
('OCP22N143', 'Program PROG00197', 'Overseas Competition/Exchange', '2022-08-12 to 2022-08-25', 'TZ', 'City 197', 'Partner 197', 'Institution', 'Unassigned ', 1, 'Approved'),
('YEP23N155', 'Program PROG00198', 'Overseas Service Learning-Youth Expedition Programme', '2023-10-08 to 2023-10-20', 'ER', 'City 198', 'Partner 198', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB24A131', 'Program PROG00199', 'Overseas Leadership Training with Outward Bound', '2024-10-02 to 2024-10-10', 'MM', 'City 199', 'Partner 199', 'Institution', 'Unassigned ', 1, 'Approved'),
('TOB23N156', 'Program PROG00200', 'Overseas Leadership Training with Outward Bound', '2023-08-21 to 2023-09-02', 'DE', 'City 200', 'Partner 200', 'Company', 'Unassigned ', 1, 'Approved');

--
-- Triggers `overseasPrograms`
--
DROP TRIGGER IF EXISTS `overseasPrograms_delete_trigger`;
DELIMITER $$
CREATE TRIGGER `overseasPrograms_delete_trigger` AFTER DELETE ON `overseasPrograms` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `overseasPrograms_update_trigger`;
DELIMITER $$
CREATE TRIGGER `overseasPrograms_update_trigger` AFTER UPDATE ON `overseasPrograms` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `programIDBeforeInsert`;
DELIMITER $$
CREATE TRIGGER `programIDBeforeInsert` BEFORE INSERT ON `overseasPrograms` FOR EACH ROW BEGIN
    DECLARE acronym CHAR(3);
    DECLARE year CHAR(2);
    DECLARE aciChar CHAR(1);
    DECLARE seqNum CHAR(3);
    DECLARE newProgramID CHAR(9);
    DECLARE startDate DATE;
    DECLARE endDate DATE;

    -- Call the stored procedure to get the acronym
    CALL getProgramAcronym(NEW.`Program Type`, acronym);

    -- Check if the date format is 'yyyy-mm-dd to yyyy-mm-dd'
    IF INSTR(NEW.Date, ' to ') > 0 THEN
        SET startDate = STR_TO_DATE(SUBSTRING_INDEX(NEW.Date, ' to ', 1), '%Y-%m-%d');
        SET endDate = STR_TO_DATE(SUBSTRING_INDEX(NEW.Date, ' to ', -1), '%Y-%m-%d');
        -- Extract the last two digits of the year from the start date
        SET year = SUBSTRING(YEAR(startDate), -2);
    ELSE
        -- Extract the last two digits of the year from the date value
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
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `programID_Before_Insert`;
DELIMITER $$
CREATE TRIGGER `programID_Before_Insert` BEFORE INSERT ON `overseasPrograms` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
