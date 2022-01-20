ALTER TABLE `agencyservice`.`agency`
ADD COLUMN `tenant_id` bigint(21) NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `agencyservice`.`diocese`
ADD COLUMN `tenant_id` bigint(21) NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `agencyservice`.`agency_postcode_range`
ADD COLUMN `tenant_id` bigint(21) NULL DEFAULT NULL AFTER `id`;