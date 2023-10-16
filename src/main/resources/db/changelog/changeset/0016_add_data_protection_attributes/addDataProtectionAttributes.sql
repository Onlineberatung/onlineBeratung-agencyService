ALTER TABLE `agencyservice`.`agency`
ADD COLUMN data_protection_responsible_entity varchar(100) NULL AFTER `counselling_relations`;

ALTER TABLE `agencyservice`.`agency`
ADD COLUMN data_protection_responsible_contact longtext NULL AFTER `data_protection_responsible_entity`;

ALTER TABLE `agencyservice`.`agency`
ADD COLUMN data_protection_officer_contact longtext NULL AFTER `data_protection_responsible_contact`;
