-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hirdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hirdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hirdb` DEFAULT CHARACTER SET utf8 ;
USE `hirdb` ;

-- -----------------------------------------------------
-- Table `hirdb`.`hir`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hirdb`.`hir` ;

CREATE TABLE IF NOT EXISTS `hirdb`.`hir` (
  `idhir` INT NOT NULL AUTO_INCREMENT,
  `hircim` VARCHAR(45) NULL,
  `megjelenes` DATE NULL,
  `szoveg` VARCHAR(45) NULL,
  PRIMARY KEY (`idhir`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hirdb`.`hozzaszolas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hirdb`.`hozzaszolas` ;

CREATE TABLE IF NOT EXISTS `hirdb`.`hozzaszolas` (
  `idhozza` INT NOT NULL AUTO_INCREMENT,
  `szerzo` VARCHAR(45) NULL,
  `comment` VARCHAR(45) NULL,
  `hir_idhir` INT NOT NULL,
  PRIMARY KEY (`idhozza`, `hir_idhir`),
  INDEX `fk_hozzaszolas_hir_idx` (`hir_idhir` ASC),
  CONSTRAINT `fk_hozzaszolas_hir`
    FOREIGN KEY (`hir_idhir`)
    REFERENCES `hirdb`.`hir` (`idhir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO hir(hircim, megjelenes, szoveg) VALUES
("valami", '2024-01-21', "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww wwwwwwwwwwwwwwww wwwwww w"), 
("mégmég", '2010-05-30', "qqqqqqqqqqqqqqqqqqqqq qqqqq q");

SELECT * FROM hozzaszolas;

INSERT INTO hozzaszolas(szerzo,  `comment`, hir_idhir) VALUES
("gyuri", "kutya kutyakutya kutya kutyakutyakutya kutyakutya", 1 ),
("ede", "nem nem nem nem nem nem nem nemnem nem", 1), 
("károly", "cuiebviurbve uerbvbeurive verviuerverv n", 1);

SELECT hircim, count(idhozza) as szam, megjelenes, szoveg
FROM hir
left join hozzaszolas on idhir= hir_idhir
group by hircim


select szerzo, comment, hir_idhir 
from hozzaszolas

SELECT hircim, count(idhozza) as szam, megjelenes, szoveg, idhir
FROM hir
left join hozzaszolas on idhir= hir_idhir
where megjelenes > "2024-01-01"
group by hircim
order by megjelenes DESC
