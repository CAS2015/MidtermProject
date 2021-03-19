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
DROP USER IF EXISTS dduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'dduser'@'localhost' IDENTIFIED BY 'dduser';

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

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `location` (`id`, `location_name`, `region`, `country`, `water_type`, `minimum_temperature_celsius`, `maximum_temperature_celsius`, `description`, `img_url`) VALUES (1, 'NotReal Location Name', 'Sao Paolo', 'Brazil', 'fresh water', 10, 25, 'This place is great and has this awesome people', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dive_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `dive_type` (`id`, `name`, `description`) VALUES (1, 'Cave Dive', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `site`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `site` (`id`, `name`, `minimum_cert`, `location_id`, `dive_type_id`, `description`) VALUES (1, 'Fake Lake ', 'open water', 1, 1, 'Lots of stuff in this great diving site');

COMMIT;


-- -----------------------------------------------------
-- Data for table `log_entry`
-- -----------------------------------------------------
START TRANSACTION;
USE `deeperdivedb`;
INSERT INTO `log_entry` (`id`, `user_id`, `site_id`, `log_content`, `title`, `dive_date`, `entry_time`, `rating`, `max_depth_meters`, `equipment`, `img_url`, `end_time`, `visibility`, `created_at`, `last_updated`, `start_pressure_bar`, `end_pressure_bar`, `air_type`, `attraction`) VALUES (1, 1, 1, 'Where do I being? I was there all alone, and then I saw all of these wonderful things on this dive', 'My Best Fake Dive', '2020-12-31 23:59:59', '8:00:00', 5, 200, '3mm shortie, other stuff, split fins', 'www.fakeimages.com/squidfins.jpg', '10:00:00', '4', '2020-11-30 23:59:59', '2020-12-14 23:59:59', 200, 79, 'Nitrox', 'sunfish mola mola');

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

