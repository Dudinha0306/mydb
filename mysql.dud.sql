-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`aluno` ;

CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `idaluno` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `dt.nasc` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  `id.turma` VARCHAR(45) NULL,
  PRIMARY KEY (`idaluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`professor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `idprofessor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `especialização` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `mydb`.`disciplina` (
  `iddisciplina` INT NOT NULL,
  `carg.horária` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `cod.disc` VARCHAR(45) NULL,
  PRIMARY KEY (`iddisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`turma` ;

CREATE TABLE IF NOT EXISTS `mydb`.`turma` (
  `idturma` INT NOT NULL,
  `ano` VARCHAR(45) NULL,
  `turma` VARCHAR(45) NULL,
  PRIMARY KEY (`idturma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`leciona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`leciona` ;

CREATE TABLE IF NOT EXISTS `mydb`.`leciona` (
  `professor_idprofessor` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`professor_idprofessor`, `disciplina_iddisciplina`),
  INDEX `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_professor_has_disciplina_professor_idx` (`professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_disciplina_professor`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `mydb`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `mydb`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ministra` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ministra` (
  `aluno_idaluno` INT NOT NULL,
  `turma_idturma` INT NOT NULL,
  PRIMARY KEY (`aluno_idaluno`, `turma_idturma`),
  INDEX `fk_aluno_has_turma_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  INDEX `fk_aluno_has_turma_aluno1_idx` (`aluno_idaluno` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_has_turma_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `mydb`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_turma_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `mydb`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
