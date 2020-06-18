ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `delete_date` datetime NULL DEFAULT NULL AFTER `update_date`;