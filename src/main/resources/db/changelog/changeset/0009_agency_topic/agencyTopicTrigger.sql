CREATE TRIGGER `agencyservice`.`agency_topic_update` BEFORE UPDATE ON `agencyservice`.`agency_topic` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END //
