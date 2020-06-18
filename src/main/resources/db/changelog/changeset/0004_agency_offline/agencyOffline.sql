ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `is_offline` tinyint(4) NOT NULL DEFAULT 0 AFTER `consulting_type`;