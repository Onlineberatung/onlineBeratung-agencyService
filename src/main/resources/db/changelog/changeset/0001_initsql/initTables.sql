CREATE TABLE `agencyservice`.`diocese` (
  `id` bigint(21) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_old` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  `update_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE SEQUENCE agencyservice.sequence_diocese
INCREMENT BY 1
MINVALUE = 0
NOMAXVALUE
START WITH 0
CACHE 0;
CREATE TABLE `agencyservice`.`agency` (
  `id` bigint(21) NOT NULL,
  `diocese_id` bigint(21) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT  NULL,
  `postcode` varchar(5) COLLATE utf8_unicode_ci DEFAULT  NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT  NULL,
  `is_team_agency` tinyint(4) NOT NULL DEFAULT '0',
  `id_old` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  `update_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  PRIMARY KEY (`id`),
  KEY `diocese_id` (`diocese_id`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`diocese_id`) REFERENCES `diocese` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE SEQUENCE agencyservice.sequence_agency
INCREMENT BY 1
MINVALUE = 0
NOMAXVALUE
START WITH 0
CACHE 10;
CREATE TABLE `agencyservice`.`agency_postcode_range` (
  `id` bigint(21) NOT NULL,
  `agency_id` bigint(21) NOT NULL,
  `postcode_from` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `postcode_to` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  `update_date` datetime NOT NULL DEFAULT (UTC_TIMESTAMP),
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `agency_postcode_range_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE SEQUENCE `agencyservice`.`sequence_agency_postcode_range`
INCREMENT BY 1
MINVALUE = 0
NOMAXVALUE
START WITH 0
CACHE 10;