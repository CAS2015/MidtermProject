-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema deeperdivedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `deeperdivedb` ;

-- -----------------------------------------------------
-- Schema deeperdivedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `deeperdivedb` DEFAULT CHARACTER SET utf8 ;
USE `deeperdivedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `create_date` DATETIME NULL,
  `img_url` VARCHAR(5000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(100) NULL,
  `region` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `water_type` VARCHAR(45) NULL,
  `minimum_temperature_celsius` INT NULL,
  `maximum_temperature_celsius` INT NULL,
  `description` TEXT NULL,
  `img_url` VARCHAR(5000) NULL,
  `latitude` DECIMAL(25,20) NULL,
  `longitude` DECIMAL(25,20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dive_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dive_type` ;

CREATE TABLE IF NOT EXISTS `dive_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `site` ;

CREATE TABLE IF NOT EXISTS `site` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `minimum_cert` VARCHAR(100) NULL,
  `location_id` INT NOT NULL,
  `dive_type_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_site_location1_idx` (`location_id` ASC),
  INDEX `fk_site_dive_type1_idx` (`dive_type_id` ASC),
  CONSTRAINT `fk_site_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_site_dive_type1`
    FOREIGN KEY (`dive_type_id`)
    REFERENCES `dive_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `log_entry` ;

CREATE TABLE IF NOT EXISTS `log_entry` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `site_id` INT NOT NULL,
  `log_content` TEXT NULL,
  `title` VARCHAR(100) NULL,
  `dive_date` DATE NULL,
  `entry_time` TIME NULL,
  `rating` INT NULL,
  `max_depth_meters` INT NULL,
  `equipment` TEXT NULL,
  `img_url` VARCHAR(5000) NULL,
  `end_time` TIME NULL,
  `visibility` VARCHAR(100) NULL,
  `created_at` DATETIME NULL,
  `last_updated` DATETIME NULL,
  `start_pressure_bar` INT NULL,
  `end_pressure_bar` INT NULL,
  `air_type` VARCHAR(45) NULL,
  `attraction` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_entry_user1_idx` (`user_id` ASC),
  INDEX `fk_log_entry_site1_idx` (`site_id` ASC),
  CONSTRAINT `fk_log_entry_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_entry_site1`
    FOREIGN KEY (`site_id`)
    REFERENCES `site` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `log_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `log_comment` ;

CREATE TABLE IF NOT EXISTS `log_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` DATETIME NULL,
  `log_entry_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_log_comment_log_entry1_idx` (`log_entry_id` ASC),
  INDEX `fk_log_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_log_comment_log_entry1`
    FOREIGN KEY (`log_entry_id`)
    REFERENCES `log_entry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location_comment` ;

CREATE TABLE IF NOT EXISTS `location_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `created_at` DATETIME NULL,
  `location_id` INT NOT NULL,
  `in_response_id` INT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_location_comment_location_idx` (`location_id` ASC),
  INDEX `fk_location_comment_location_comment1_idx` (`in_response_id` ASC),
  INDEX `fk_location_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_location_comment_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_comment_location_comment1`
    FOREIGN KEY (`in_response_id`)
    REFERENCES `location_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_location_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `friend` ;

CREATE TABLE IF NOT EXISTS `friend` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  INDEX `fk_friends_user1_idx` (`user_id` ASC),
  INDEX `fk_friends_user2_idx` (`friend_id` ASC),
  PRIMARY KEY (`user_id`, `friend_id`),
  CONSTRAINT `fk_friends_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friends_user2`
    FOREIGN KEY (`friend_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
-- DROP USER IF EXISTS dduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- CREATE USER 'dduser'@'localhost' IDENTIFIED BY 'dduser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'dduser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `create_date`, `img_url`) VALUES (1, 'admin', 'admin', 1, 'administrator', 'Robert', 'Roberts', '2021-03-19 23:59:59', 'www.freephotos.com/sunfish.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `create_date`, `img_url`) VALUES (2, 'user1', 'user1', 1, 'data_reader', 'Ringo', 'Starr', '2021-03-18 22:59:59', 'https://images.freeimages.com/images/large-previews/0c6/surfs-up-3-1539300.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `create_date`, `img_url`) VALUES (3, 'user2', 'user2', 1, 'data_writer', 'George', 'Harrison', '2021-03-19 04:00:00', 'https://images.freeimages.com/images/large-previews/0c6/surfs-up-3-1539300.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `create_date`, `img_url`) VALUES (4, 'user3', 'user3', 1, 'data_writer', 'John', 'Lennon', '2021-03-19 3:00:00', 'https://images.freeimages.com/images/large-previews/0c6/surfs-up-3-1539300.jpg');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `create_date`, `img_url`) VALUES (5, 'user2', 'user2', 1, 'data_writer', 'Paul', 'McCartney', '2021-03-11 5:00:00', 'https://images.freeimages.com/images/large-previews/0c6/surfs-up-3-1539300.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (1, 'NotReal Location Name', 'Sao Paolo', 'Brazil', 'fresh water', 10, 25, 'This place is great and has this awesome people', 'https://images.unsplash.com/photo-1605752696606-0abcfc95ba5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', -23.717307, -46.729570);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (2, 'Dutch Springs', 'Pennsylvania', 'United States', 'fresh water', 14, 22, 'It’s in Pennsylvania with an easy access and great people', 'https://images.unsplash.com/photo-1569671618687-9de58bd0a9cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', 40.685977471645, -75.353867334194);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (3, 'Kota Kinabalu', 'Sabah', 'Malaysia', 'salt water', 28, 30, 'A bit sketchy to get to this location, but the scene is amazing', 'https://images.unsplash.com/photo-1600427832593-264de8125129?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=3734&q=80', 6.005, 116.0245);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (4, 'Bunaken', 'North Sulawesi', 'Indonesia', 'salt water', 15, 29, 'Beautiful, and a the water is really calm on most days', 'https://images.unsplash.com/photo-1584265443673-d6849d6e099f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80', 1.6758, 124.7556);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (5, 'Lembeh', 'North Sulawesi', 'Indonesia', 'salt water', 27, 28, 'Mix of both worlds with gracious scenery but its can be very hard to get access', 'https://images.unsplash.com/photo-1504384517033-7bd20a6bf36d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', 1.424914, 125.2258);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (6, 'Komodo', 'East Nusa Tenggara', 'Indonesia', 'salt water', 27, 28, 'Exotic but really approachable and the atmosphere is phenomenal', 'https://images.unsplash.com/photo-1515650679378-22c165e451a0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80', -8.56175437636807, 119.602570172184);
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`, `latitude`, `longitude`) VALUES (7, 'Nusa Penida', 'Bali', 'Indonesia', 'salt water', 24, 30, 'Shockingly easy to get to, and the roads are very well done', 'https://images.unsplash.com/photo-1536168032936-9ce3b4b3165c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1348&q=80', -8.793385, 115.524567);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dive_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `dive_type` (`id`, `name`, `description`) VALUES (1, 'Cave Dive', 'Literally go in a cave underwater');
INSERT INTO `dive_type` (`id`, `name`, `description`) VALUES (2, 'Wall Dive', 'Next to a big drop, there will be a wall to explore');
INSERT INTO `dive_type` (`id`, `name`, `description`) VALUES (3, 'Wreck', 'Sunken ships, airplanes, or other');
INSERT INTO `dive_type` (`id`, `name`, `description`) VALUES (4, 'Reef', 'Observing the wonders of the reef');

COMMIT;


-- -----------------------------------------------------
-- Data for table `site`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (1, 'Fake Lake ', 'open water', 1, 1, 'Lots of stuff in this great diving site');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (2, 'Dutch Springs', 'open water', 2, 2, 'Plenty of things to do in this place');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (3, 'Lighthouse', 'open water', 3, 2, 'This site is the bomb, I tell you');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (4, 'Coral Garden ', 'open water', 3, 4, 'I can’t describe this site because its so gorgeous');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (5, 'Turtle Patch ', 'open water', 3, 4, 'What can I say about Turtle Patch that hasn’t been said before.');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (6, 'Unknown', 'open water', 3, 3, 'This site is amazing and want other people to ');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (7, 'Lokai 3 ', 'open water', 4, 2, 'The water is so warm and clear that you won’t believe it');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (8, 'Lokai 1 ', 'open water', 4, 2, 'A bit disappointing, but the guides at this sites were pretty nice.');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (9, 'Batu Sandar ', 'open water', 5, 4, 'Hard to get to, but really worth it. There are many sunken ships here.');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (10, 'Jahir ', 'open water', 5, 1, 'Fish galore, and you’ll be amazed at the clarity');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (11, 'Police Pier ', 'open water', 5, 2, 'Wide entrance to an underwater cave next to a reef');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (12, 'Mawan ', 'open water', 6, 3, 'Current was very weak, but the s');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (13, 'Siaba ', 'open water', 6, 1, 'Lots of turtles and wild life surrounding areas');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (14, 'Sebayur ', 'open water', 6, 3, 'Tigger fish rules this site and the current was really strong');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (15, 'Penga ', 'open water', 6, 4, 'Mostly corals and very specific biome for this area site');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (16, 'Manta Point ', 'open water', 7, 4, 'Manta rays of course, but the visibility can vary sometimes');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (17, 'Crystal Bay ', 'open water', 7, 4, 'The name says it all, it is super clear and the water is nice and warm');
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (18, 'Toyah Pakeh ', 'open water', 7, 4, 'Cold water and strong current but the people are great');

COMMIT;


-- -----------------------------------------------------
-- Data for table `log_entry`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (1, 4, 1, 'Where do I being? I was there all alone, and then I saw all of these wonderful things on this dive', 'My Best Fake Dive', '2020-12-31', '8:00:00', 5, 200, '3mm shortie, other stuff, split fins', 'https://images.freeimages.com/images/large-previews/9fc/lovin-scuba-1402120.jpg', '10:00:00', 'excellent', '2020-11-30 23:59:59', '2020-12-14 23:59:59', 200, 79, 'Nitrox', 'sunfish mola mola');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (2, 5, 16, 'It was a wild dive, but worth it. Skills include weight check, trim check, partial mask flood, regulator recovery/clear, underwater exploration, signals, tired diver tow, snorkel/reg exchange', 'And There I was', '2018-07-28', '10:12:00', 2, 12, '7 mm full plus hood gloves boots', 'https://www.australiangeographic.com.au/wp-content/uploads/2019/07/emperor-shrimp.jpg', '10:39:00', 'poor', '2020-11-11 21:50:50', '2020-11-11 21:50:50', 200, 76, 'Air', 'Nudibranch, Clownfish, Shoal Yellow Snappers, Damselfish, Parrotfish, Angelfish, Triggerfish, Coral Crab, Tuna, Cleaner Shrimp, Emperor Shrimp');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (3, 1, 13, 'First time for everything. Skills include orally inflate BCD, buoyancy control, mask clearing, alt. air supply use, DSMB deployment, remove/replace scuba, remove/replace weights', 'Never Again. Well Maybe.', '2018-07-28', '12:16:00', 2, 12, '7 mm full plus hood gloves boots', 'https://images.unsplash.com/photo-1613117908785-381bafe45361?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1345&q=80', '12:52:00', 'poor', '2020-11-21 22:52:52', '2020-11-21 22:52:52', 221, 131, 'Air', 'Clownfish, shoal yellow fish, damsel fish, parrotfish, angel fish, porcupine pufferfish, giant pufferfish, sweet lips, razorfish, extremely persistent ramora');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (4, 4, 12, 'Meet some great people there. Buoyancy control/oral inflation, mask remove/replace, cramp removal, surface swim with compass, underwater compass navigation, CESA ', 'In Good Company', '2018-07-28', '15:45:00', 2, 9, '7 mm full plus hood gloves boots', 'https://images.unsplash.com/photo-1595503072093-1e410b01b11b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=641&q=80', '16:14:00', 'poor', '2020-11-01 01:00:59', '2020-11-01 01:00:59', 221, 117, 'Air', 'Mimic octopus, pufferfish, cockatoo waspfish, lembeh velvetfish, peacock flounder, nudibranch, common seahorse');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (5, 1, 11, 'Whenever I started to get ready, I remembered I forgot my special lucky charm. Free descent without reference otherwise otherwise fun dive hitting max depth. Divemasters in dry suits… it’s just too cold and visibility was terrible', 'Lucky Charm For Diving', '2018-07-29', '09:31:00', 2, 18, '7 mm full plus hood gloves boots', 'https://www.petguide.com/wp-content/uploads/2016/04/Mandarinfish-668x445.jpg', '10:05:00', 'poor', '2020-11-23 19:59:59', '2020-11-23 19:59:59', 234, 97, 'Air', 'Sea dragon, ringed pipe fish, yellow lipped sea krait, bangai cardinal fish, barramundi juvenile, mandarin fish, peacock mantis shrimp, nudibranch');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (6, 1, 14, 'Got up early that day, and it was worth it. I had the best time. ', 'Early Riser', '2019-06-27', '09:02:00', 3, 18, '3 mm shortie', 'https://i.redd.it/z80iasowwr051.jpg', '09:46:00', 'fair', '2020-11-15 18:59:59', '2020-11-15 18:59:59', 200, 100, 'Air', 'Bamboo shark, sting ray, manta ray, mola mola!!!');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (7, 3, 15, 'There were so many things that went wrong, but it wasn’t my fault. ', 'Not Me', '2019-06-27', '11:21:00', 3, 14, '3 mm shortie', 'https://i.natgeofe.com/n/7c665f95-9f31-48cd-be5a-2e011b40e614/01WAQflounders.jpg', '12:17:00', 'excellent', '2020-11-14 23:14:59', '2020-11-14 23:14:59', 205, 110, 'Air', 'Flounder, goat fish, cleaner fish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (8, 5, 3, 'When you think of a great dive, you think of all of the perfect conditions and this was not it.', 'Picture Perfect', '2019-06-27', '14:35:00', 3, 17, '3 mm shortie', 'https://images.unsplash.com/photo-1613779628009-dfa5a2a541f6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', '15:22:00', 'fair', '2020-11-30 01:01:59', '2020-11-30 01:01:59', 200, 100, 'Air', 'Ribbon eel, snowflake eel, eel, cubbs, crown of thorns starfish, nudibranch, hawksbill turtle, orangutan crab.');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (9, 1, 5, 'Rather than me explaining the details, I will explain ', 'Maybe Try Harder', '2019-07-06', '15:02:00', 4, 18, '3 mm shortie', 'https://images.unsplash.com/photo-1565799556899-4a1aaf9c7a5e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=688&q=80', '15:47:00', 'excellent', '2020-11-22 22:22:59', '2020-11-22 22:22:59', 200, 90, 'Air', 'Damselfish, Parrotfish, Angelfish, Triggerfish, Coral Crab, Tuna, Cleaner Shrimp, Emperor Shrimp');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (10, 3, 9, 'Best time of my life, with the best partner I could’ve ever hoped for, and I’m definitely returning', 'I Will Never Stop', '2019-07-07', '08:27:00', 5, 20, '3 mm shortie', 'https://images.unsplash.com/photo-1583665933988-045d2add5ae4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=610&q=80', '09:08:00', 'excellent', '2020-11-09 08:59:08', '2020-11-09 08:59:08', 200, 105, 'Air', 'Boxfish, pufferfish, nudibranch, Berry\'s bobtail squid, stargazer, shrimp, clownfish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (11, 4, 7, 'What can I say about a dive that felt totally random.', 'Randomizer Dive', '2019-07-07', '10:27:00', 3, 21, '3 mm shortie', 'https://media.gettyimages.com/photos/scorpaena-scrofa-picture-id186498611?s=2048x2048', '11:13:00', 'fair', '2020-11-16 14:59:59', '2020-11-16 14:59:59', 210, 110, 'Air', 'Shoal Yellow Snapper, Damselfish, Scorpion fish, pufferfish, green turtles, sweet lips, cuttlefish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (12, 1, 8, 'I was told that this location was supposed to be the best, but it turned out to be just that!', 'Can’t Ask For More', '2019-07-08', '08:22:00', 5, 17, '3 mm shortie', 'https://images.unsplash.com/photo-1601219981211-fc62659ed308?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1295&q=80', '09:08:00', 'poor', '2020-11-16 23:59:59', '2020-11-16 23:59:59', 200, 105, 'Air', 'Nudibranch, hawksbill turtle, orangutan ');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (13, 5, 6, 'Let me begin by saying that the local people are fantastic, and the diving team was phenomenal.', 'Support Local Diving', '2019-07-08', '10:52:00', 5, 18, '3 mm shortie', 'https://images.unsplash.com/photo-1562742686-0b38a29473ab?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80', '11:40:00', 'poor', '2020-11-26 03:59:59', '2020-11-26 03:59:59', 210, 105, 'Air', 'Parrotfish, angel fish, porcupine pufferfish, giant pufferfish, sweet lips, razorfish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (14, 1, 4, 'Too many flashy people were trying to take over the dive, but we made it a point to stop it.', 'Don’t Outshine Me', '2019-07-08', '14:49:00', 5, 17, '3 mm shortie', 'https://images.unsplash.com/photo-1601220475188-c8319bab873e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1294&q=80', '15:35:00', 'poor', '2020-11-02 13:59:59', '2020-11-02 13:59:59', 200, 100, 'Air', 'Cockatoo waspfish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (15, 3, 2, 'We were slowly mustering up enough courage to make this dive happen, and it did.', 'We Were Brave', '2019-07-09', '08:20:00', 1, 17, '3 mm shortie', 'https://images.unsplash.com/photo-1560275619-4cc5fa59d3ae?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1119&q=80', '09:04:00', 'fair', '2020-11-04 07:59:59', '2020-11-04 07:59:59', 200, 100, 'Nitrox', 'Porcupine pufferfish, giant pufferfish,');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (16, 1, 17, 'Why can’t we all be on the same level on the same dive? I wish someone would have told me before I signed up.', 'League Of My Own', '2019-07-09', '10:31:00', 2, 18, '3 mm shortie', 'https://images.unsplash.com/photo-1510637234398-d25c9570a0a0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1349&q=80', '11:16:00', 'fair', '2020-11-06 11:59:59', '2020-11-06 11:59:59', 210, 100, 'Nitrox', 'Damselfish, Scorpion fish, pufferfish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (17, 4, 18, 'So, we decided to book this trip around the world, and this dive was the first in our iist.', 'All Over The World', '2019-07-16', '10:20:00', 3, 15, '3 mm shortie', 'https://images.unsplash.com/photo-1472715148636-92e348325950?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1267&q=80', '11:16:00', 'excellent', '2020-11-08 14:59:59', '2020-11-08 14:59:59', 220, 110, 'Nitrox', 'Nudibranch, hawksbill turtle, orangutan ');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (18, 5, 4, 'I want my money bad so bad, but the people there said that was impossible.', 'Refund Please', '2019-07-16', '12:57:00', 4, 9, '3 mm shortie', 'https://images.unsplash.com/photo-1584269660814-d7b1246612f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80', '13:50:00', 'excellent', '2020-11-24 17:59:59', '2020-11-24 17:59:59', 210, 100, 'Nitrox', 'Flounder, goat fish, cleaner fish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (19, 1, 10, 'This is the reason why I dive. Because of experiences like these, I can’t express in words how great it was.', 'Best Dive EVER!', '2019-07-16', '18:44:00', 4, 18, '3 mm full', 'https://images.unsplash.com/photo-1584265414416-523ddc0d0edd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80', '19:33:00', 'fair', '2020-11-25 19:59:59', '2020-11-25 19:59:59', 210, 100, 'Nitrox', 'Bamboo shark, sting ray');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (20, 1, 3, 'My girlfriend was afraid at first to take this dive, and I can totally see why now.', 'Guiding Below', '2019-07-17', '10:16:00', 4, 13, '3 mm full', 'https://images.unsplash.com/photo-1441555136638-e47c0158bfc9?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1353&q=80 ', '11:12:00', 'excellent', '2020-11-26 03:59:59', '2020-11-26 03:59:59', 210, 100, 'Nitrox', 'Flounder, goat fish, cleaner fish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (21, 3, 17, 'The water was perfect, the equipment was excellent, the people were amicable, all around great!', 'Can\'t Complain', '2019-07-17', '12:43:00', 5, 27, '3 mm full', ' https://images.unsplash.com/photo-1582032511796-a2aadc689117?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=637&q=80', '13:16:00', 'excellent', '2020-11-30 22:59:59', '2020-11-30 22:59:59', 220, 100, 'Nitrox', 'Mimic octopus, pufferfish, cockatoo waspfish, lembeh velvetfish, peacock flounder, nudibranch,');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (22, 4, 14, 'May I just say that safety is no joke, and that the dive team was super on point on bringing this topic to the forefront', 'Safety First', '2019-08-07', '10:05:00', 5, 27, '3 mm full plus 3 mm shortie', 'https://images.unsplash.com/photo-1501273812158-86b301cfc8db?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80', '10:38:00', 'poor', '2020-11-29 08:00:59', '2020-11-29 08:00:59', 210, 90, 'Air', 'Damselfish, Scorpion fish, pufferfish');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (23, 3, 1, 'When you pay this much for dive, you should expect a good experience.', 'Money’s Worth', '2019-08-07', '12:06:00', 5, 23, '3 mm full plus 3 mm shortie', 'https://images.unsplash.com/photo-1519327567471-ae47752b8089?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1351&q=80', '12:46:00', 'excellent', '2020-11-28 11:59:59', '2020-11-28 11:59:59', 210, 80, 'Air', 'Nudibranch, hawksbill turtle, orangutan ');
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (24, 5, 2, 'Can’t wait to get out here again! I still can’t believe how beautiful it all looked', 'Ideal Trip', '2019-08-07', '13:55:00', 4, 17, '3 mm full plus 3 mm shortie', 'https://images.unsplash.com/photo-1605315416167-614ff43936ad?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1320&q=80', '14:51:00', 'poor', '2020-11-27 17:59:59', '2020-12-14 23:59:59', 200, 60, 'Air', 'Bamboo shark, sting ray');

COMMIT;


-- -----------------------------------------------------
-- Data for table `log_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `log_comment` (`id`, `content`, `created_at`, `log_entry_id`, `user_id`) VALUES (1, 'I can\'t believe you went there, dude', '2021-03-18 22:59:59', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `location_comment` (`id`, `content`, `created_at`, `location_id`, `in_response_id`, `user_id`) VALUES (1, 'I think this location is great too', '2021-03-13 20:59:59', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `friend`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `friend` (`user_id`, `friend_id`) VALUES (1, 1);

COMMIT;
