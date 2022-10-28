CREATE TABLE `agencyservice`.`agency_topic` (
    `id` bigint(21) NOT NULL,
    `agency_id` bigint(21) NOT NULL,
    `topic_id` bigint(21) NOT NULL,
    `create_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
    `update_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
    PRIMARY KEY (`id`),
    KEY `agency_id` (`agency_id`),
    CONSTRAINT `agency_topic_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE SEQUENCE `agencyservice`.`sequence_agency_topic`
INCREMENT BY 1
MINVALUE = 0
NOMAXVALUE
START WITH 0
CACHE 10;