SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `Review Database` ;
CREATE SCHEMA IF NOT EXISTS `Review Database` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `Review Database` ;

-- -----------------------------------------------------
-- Table `Review Database`.`Developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`developer` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`developer` (
  `idDeveloper` INT NOT NULL ,
  `developerName` VARCHAR(45) NULL ,
  `avgReviewScore` DOUBLE NULL ,
  PRIMARY KEY (`idDeveloper`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review Database`.`Game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`game` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`game` (
  `idGame` INT NOT NULL ,
  `title` VARCHAR(45) NOT NULL ,
  `dateOfRelease` DATETIME NOT NULL ,
  `idDeveloper` INT NOT NULL ,
  `console` VARCHAR(45) NULL ,
  PRIMARY KEY (`idGame`) ,
  INDEX `fk_Game_Developer1` (`idDeveloper` ASC) ,
  CONSTRAINT `fk_Game_Developer1`
    FOREIGN KEY (`idDeveloper` )
    REFERENCES `Review Database`.`Developer` (`idDeveloper` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review Database`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`author` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`author` (
  `idAuthor` INT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `publisher` VARCHAR(45) NULL ,
  PRIMARY KEY (`idAuthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review Database`.`Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`review` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`review` (
  `idReview` INT NOT NULL ,
  `date` DATETIME NOT NULL ,
  `source` TEXT NULL ,
  `gameScore` DOUBLE NOT NULL ,
  `reviewText` LONGTEXT NOT NULL ,
  `reviewScore` DOUBLE NULL ,
  `idGame` INT NOT NULL ,
  `idAuthor` INT NOT NULL ,
  PRIMARY KEY (`idReview`) ,
  INDEX `fk_Review_Game1` (`idGame` ASC) ,
  INDEX `fk_Review_Author1` (`idAuthor` ASC) ,
  CONSTRAINT `fk_Review_Game1`
    FOREIGN KEY (`idGame` )
    REFERENCES `Review Database`.`Game` (`idGame` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Author1`
    FOREIGN KEY (`idAuthor` )
    REFERENCES `Review Database`.`Author` (`idAuthor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review Database`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`user` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`user` (
  `idUser` INT NOT NULL ,
  `e-mail` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `idAuthor` INT NULL ,
  PRIMARY KEY (`idUser`) ,
  INDEX `fk_User_Author1` (`idAuthor` ASC) ,
  CONSTRAINT `fk_User_Author1`
    FOREIGN KEY (`idAuthor` )
    REFERENCES `Review Database`.`Author` (`idAuthor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review Database`.`errorReport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review Database`.`errorReport` ;

CREATE  TABLE IF NOT EXISTS `Review Database`.`errorReport` (
  `iderrorReport` INT NOT NULL ,
  `errorText` MEDIUMTEXT NULL ,
  `date` DATETIME NULL ,
  `user` VARCHAR(45) NULL ,
  `idUser` INT NOT NULL ,
  `idReview` INT NOT NULL ,
  PRIMARY KEY (`iderrorReport`) ,
  INDEX `fk_errorReport_User1` (`idUser` ASC) ,
  INDEX `fk_errorReport_Review1` (`idReview` ASC) ,
  CONSTRAINT `fk_errorReport_User1`
    FOREIGN KEY (`idUser` )
    REFERENCES `Review Database`.`User` (`idUser` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_errorReport_Review1`
    FOREIGN KEY (`idReview` )
    REFERENCES `Review Database`.`Review` (`idReview` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
