ALTER TABLE agency
DROP FOREIGN KEY agency_ibfk_1;

ALTER TABLE agency
MODIFY diocese_id INT NULL;