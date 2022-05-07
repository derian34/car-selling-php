--
-- Current Database: `car_selling`
--

CREATE DATABASE /*!32312 IF NOT EXISTS */ `car_selling` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci */;

USE `car_selling`;
-- -----------------------------------------------------
-- Table `car_selling`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_selling`.`car` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `concern` VARCHAR(225) NOT NULL,
    `model` VARCHAR(225) NOT NULL,
    `kW` INT NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `car_selling`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_selling`.`customer` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(225) NOT NULL,
    `surname` VARCHAR(225) NOT NULL,
    `bithday` DATETIME NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `car_selling`.`marketing_campaign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_selling`.`marketing_campaign` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(225) NOT NULL,
    `from` DATETIME NOT NULL,
    `to` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_selling`.`car_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_selling`.`car_customer` (
    `car_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    PRIMARY KEY (`car_id`, `customer_id`),
    INDEX `fk_car_has_customer_customer1_idx` (`customer_id` ASC),
    INDEX `fk_car_has_customer_car_idx` (`car_id` ASC),
    CONSTRAINT `fk_car_has_customer_car`
    FOREIGN KEY (`car_id`)
    REFERENCES `car_selling`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_car_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `car_selling`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_selling`.`customer_has_marketing_campaign`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_selling`.`customer_has_marketing_campaign` (
    `customer_id` INT NOT NULL,
    `marketing_campaign_id` INT NOT NULL,
    `car_id` INT NOT NULL,
    PRIMARY KEY (`customer_id`, `marketing_campaign_id`, `car_id`),
    INDEX `fk_customer_has_marketing_campaign_marketing_campaign1_idx` (`marketing_campaign_id` ASC),
    INDEX `fk_customer_has_marketing_campaign_customer1_idx` (`customer_id` ASC),
    INDEX `fk_customer_has_marketing_campaign_car1_idx` (`car_id` ASC),
    CONSTRAINT `fk_customer_has_marketing_campaign_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `car_selling`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_customer_has_marketing_campaign_marketing_campaign1`
    FOREIGN KEY (`marketing_campaign_id`)
    REFERENCES `car_selling`.`marketing_campaign` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_customer_has_marketing_campaign_car1`
    FOREIGN KEY (`car_id`)
    REFERENCES `car_selling`.`car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;

INSERT INTO `car` (`id`, `concern`, `model`, `kW`)
VALUES
    (1, 'Audi', 'A1', 99),
    (2, 'Audi', 'A5', 109),
    (3, 'Audi', 'A6', 189),
    (4, 'BMW', 'X5', 199),
    (5, 'BMW', '5', 119),
    (6, 'BMW', '4', 109),
    (7, 'BMW', '3', 125),
    (8, 'Mercedes', 'C', 149),
    (9, 'Mercedes', 'C', 109),
    (10, 'Mercedes', 'S', 299),
    (11, 'Mercedes', 'GLS', 299);

INSERT INTO `customer` (`id`, `name`, `surname`, `bithday`)
VALUES
    (1, 'Petr', 'Novák', '1985-05-01'),
    (2, 'Johny', 'Mareček', '1986-05-01'),
    (3, 'Tomáš', 'Marný', '1989-05-01'),
    (4, 'Pablo', 'Escobar', '1976-05-01'),
    (5, 'Jan', 'Icneudělal', '1993-05-01'),
    (6, 'Rodrigo', 'Novák', '1991-05-01');

INSERT INTO `marketing_campaign` (`id`, `name`, `from`, `to`)
VALUES
    (1, 'Velikonoční výprodej', '2021-02-01 00:00:00', '2021-04-30 00:00:00'),
    (2, 'Akce 50% sleva', '2021-06-01 00:00:00', '2021-09-30 00:00:00');

INSERT INTO `car_customer` (`car_id`, `customer_id`) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3),
    (5, 3),
    (6, 4);

INSERT INTO `customer_has_marketing_campaign` (`customer_id`, `marketing_campaign_id`, `car_id`) VALUES
    (3, 1, 4);
