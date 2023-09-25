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