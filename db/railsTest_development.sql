SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `railstest_development` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `railstest_development`;

-- -----------------------------------------------------
-- Table `railstest_development`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `railstest_development`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `encrypted_username` VARCHAR(255) NOT NULL ,
  `firstname` VARCHAR(45) NOT NULL ,
  `lastname` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `username_index` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `railstest_development`.`addresses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `railstest_development`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `users_id` INT NOT NULL ,
  `address` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_addresses_users` (`users_id` ASC) ,
  CONSTRAINT `fk_addresses_users`
    FOREIGN KEY (`users_id` )
    REFERENCES `railstest_development`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
