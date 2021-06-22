ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `url` varchar(500) NULL DEFAULT NULL AFTER `is_offline`;
ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `is_external` tinyint(4) NOT NULL DEFAULT FALSE AFTER `url`;
