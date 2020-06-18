CREATE TRIGGER `agencyservice`.`agency_update` BEFORE UPDATE ON `agencyservice`.`agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END //
CREATE TRIGGER `agencyservice`.`agency_postcode_range_update` BEFORE UPDATE ON `agencyservice`.`agency_postcode_range` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END //
CREATE TRIGGER `agencyservice`.`diocese_update` BEFORE UPDATE ON `agencyservice`.`diocese` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END //