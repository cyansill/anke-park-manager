-- Anke Park System Database Schema
DROP DATABASE IF EXISTS `anke`;
CREATE DATABASE `anke`;

-- Tables --
-- Tables: user
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `name` VARCHAR(36) NOT NULL COMMENT 'Account Name',
  `password` CHAR(32) NOT NULL COMMENT 'Account Pass Key',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE (`name`) USING BTREE
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

-- Tables: profile
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `user_id` CHAR(36) NOT NULL COMMENT 'User Id Link To User Account Table',
  `name` VARCHAR(36) NOT NULL COMMENT 'User Nickname',
  `phone` VARCHAR(20) NOT NULL COMMENT 'User Phone Number',
  `email` VARCHAR(64) NOT NULL COMMENT 'User Email',
  `avatar` VARCHAR(128) NOT NULL DEFAULT '/avatar/default.jpg' COMMENT 'User Avatar',
  `address` VARCHAR(256) NOT NULL COMMENT 'User Address',
  `gender` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'User Gender: 0-Male & 1-Female',
  `birthday` DATE NOT NULL DEFAULT '1999-01-01' COMMENT 'User Birthday',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX (`user_id`) USING HASH
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `user_id` CHAR(36) NOT NULL COMMENT 'User Id Link To User Account Table',
  `province` TINYINT NOT NULL COMMENT 'The Code Of Province Belonged By Car License',
  `code` CHAR(6) NOT NULL COMMENT 'Base License Code Of Car',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX (`user_id`) USING HASH,
  INDEX (`code`) USING HASH
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

-- Tables: address
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `description` VARCHAR(128) NOT NULL COMMENT 'Text Description Of Address',
  `latitude` DECIMAL(7, 4) NOT NULL COMMENT 'Latitude',
  `longitude` DECIMAL(7, 4) NOT NULL COMMENT 'Longitude',
  `province` INT NOT NULL COMMENT 'Province Code',
  `city` INT NOT NULL COMMENT 'City Code',
  `distinct` INT NOT NULL COMMENT 'Distinct Code',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE (`description`) USING BTREE,
  INDEX (`latitude`) USING HASH,
  INDEX (`longitude`) USING HASH,
  INDEX (`distinct`) USING BTREE
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

-- Tables: park
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `address_id` CHAR(36) NOT NULL COMMENT 'Park Address Id Link To Address Table',
  `maximum_capacity` INT NOT NULL COMMENT 'Maximum Vehicle Capacity In Park',
  `current_vehicle_count` INT NOT NULL COMMENT 'Number Of Vehicle In Park Currently',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

-- Tables: park fee rules
DROP TABLE IF EXISTS `park_fee_rules`;
CREATE TABLE `park_fee_rules` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `park_id` CHAR(36) NOT NULL COMMENT 'Park Id Link To Park Table',
  `fee` DECIMAL(5, 2) NOT NULL COMMENT 'Park Fee Per Unit Of Time',
  `time_unit` TINYINT NOT NULL DEFAULT 2 COMMENT
    'Time Unit: 0-Second & 1-Minute & 2-Hour & 3-Day & 4-Week & 5-HalfMonth & 6-Month & 7-HalfYear & 8-Year',
  `active_starting` DATETIME NOT NULL COMMENT 'Active Starting Datetime',
  `active_ending` DATETIME NULL COMMENT 'Active Ending Datetime, Endless If Null',
  `using_floor_when_non_integer` TINYINT NOT NULL DEFAULT 1 COMMENT
    'Using Floor When Duration Is Not A Integer?: 1-Yes & 0-No',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX (`park_id`) USING HASH
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

-- Tables: order
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` CHAR(36) NOT NULL COMMENT 'UUID',
  `park_id` CHAR(36) NOT NULL COMMENT 'Park Id Link To Park Table',
  `user_id` CHAR(36) NOT NULL COMMENT 'User Id Link To User Table',
  `car_id` CHAR(36) NOT NULL COMMENT 'Car Id Link To Car Table',
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT
    'Current Status Of Order: 0-Initial & 1-Booked & 2-Using & 3-WaitingPay & 4-Ending & 5-OverBookedTime & 6-Cancel',
  `total_cost` DECIMAL(8, 2) NOT NULL DEFAULT 0.00 COMMENT 'Total Cost By Order',
  `booked_at` DATETIME NULL COMMENT 'When Booked',
  `booked_starting` DATETIME NULL COMMENT 'When User Prepare To Arrive Park',
  `park_starting` DATETIME NULL COMMENT 'Starting Time Of Parking',
  `park_ending` DATETIME NULL COMMENT 'Ending Time Of Parking',

  `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Inserted',
  `updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime When Record Rewrote',
  `deleted` TINYINT NOT NULL DEFAULT 0 COMMENT 'Flag Of Logic Deleting: 0-Exists & 1-Deleted',

  PRIMARY KEY (`id`) USING BTREE,
  INDEX (`park_id`) USING HASH,
  INDEX (`user_id`) USING HASH
) ENGINE = 'InnoDB' CHARACTER SET = 'utf8mb4';

