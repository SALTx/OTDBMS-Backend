DELETE FROM `overseasprograms`;
DELETE FROM `trips`;
DROP TRIGGER programID_Before_Insert;

SELECT CONCAT('DROP VIEW IF EXISTS ', table_name, ';')
FROM information_schema.views
WHERE table_schema = 'your_database_name';
