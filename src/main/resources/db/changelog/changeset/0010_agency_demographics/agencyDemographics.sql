ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `age_from` SMALLINT NULL DEFAULT NULL AFTER `is_external`;

ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `age_to` SMALLINT NULL DEFAULT NULL AFTER `age_from`;

ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `gender` VARCHAR(50) NULL DEFAULT NULL AFTER `age_to`;
