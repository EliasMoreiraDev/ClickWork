-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `ende_id` INT NOT NULL AUTO_INCREMENT,
  `ende_rua` VARCHAR(45) NOT NULL,
  `ende_bairro` VARCHAR(45) NOT NULL,
  `ende_numero` VARCHAR(45) NOT NULL,
  `ende_compleneto` VARCHAR(45) NOT NULL,
  `ende_cep` VARCHAR(8) NULL,
  PRIMARY KEY (`ende_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_telefone` VARCHAR(45) NOT NULL,
  `Endereco_PK` INT NOT NULL,
  `user_emal` VARCHAR(45) NOT NULL,
  `user_senha` VARCHAR(45) NOT NULL,
  `service_enable` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  INDEX `fk_Usuario_Endereco_idx` (`Endereco_PK` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Endereco`
    FOREIGN KEY (`Endereco_PK`)
    REFERENCES `mydb`.`Endereco` (`ende_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_cobranca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_cobranca` (
  `cobranca_id` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cobranca_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categorias` (
  `cate_id` INT NOT NULL AUTO_INCREMENT,
  `cate_tipo` VARCHAR(45) NOT NULL,
  `cate_qtd` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`cate_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servico` (
  `serv_id` INT NOT NULL AUTO_INCREMENT,
  `serv_titulo` VARCHAR(45) NOT NULL,
  `serv_descricao` VARCHAR(255) NOT NULL,
  `serv_valor` FLOAT NOT NULL,
  `Tipo_cobranca_PK` INT NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 0,
  `Usuario_FK` INT NOT NULL,
  `Categorias_FK` INT NOT NULL,
  PRIMARY KEY (`serv_id`),
  INDEX `fk_Servico_Tipo_cobranca1_idx` (`Tipo_cobranca_PK` ASC) VISIBLE,
  INDEX `fk_Servico_Usuario1_idx` (`Usuario_FK` ASC) VISIBLE,
  INDEX `fk_Servico_categorias1_idx` (`Categorias_FK` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_Tipo_cobranca1`
    FOREIGN KEY (`Tipo_cobranca_PK`)
    REFERENCES `mydb`.`Tipo_cobranca` (`cobranca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_Usuario1`
    FOREIGN KEY (`Usuario_FK`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_categorias1`
    FOREIGN KEY (`Categorias_FK`)
    REFERENCES `mydb`.`categorias` (`cate_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`imagensServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`imagensServico` (
  `idimagensServico` INT NOT NULL AUTO_INCREMENT,
  `url_imagem` VARCHAR(255) NOT NULL,
  `Servico_PK` INT NOT NULL,
  `img_capa` TINYINT NOT NULL,
  PRIMARY KEY (`idimagensServico`),
  INDEX `fk_imagensServico_Servico1_idx` (`Servico_PK` ASC) VISIBLE,
  CONSTRAINT `fk_imagensServico_Servico1`
    FOREIGN KEY (`Servico_PK`)
    REFERENCES `mydb`.`Servico` (`serv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Social` (
  `idSocial` INT NOT NULL AUTO_INCREMENT,
  `social_url` VARCHAR(255) NOT NULL,
  `Usuario_user_id` INT NOT NULL,
  `social_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSocial`),
  INDEX `fk_Social_Usuario1_idx` (`Usuario_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Social_Usuario1`
    FOREIGN KEY (`Usuario_user_id`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
  `idAvaliacao` INT NOT NULL AUTO_INCREMENT,
  `aval_titulo` VARCHAR(45) NOT NULL,
  `aval_descricao` VARCHAR(45) NOT NULL,
  `quant_estrela` INT NOT NULL,
  `Sevico_FK` INT NOT NULL,
  `Usuario_FK` INT NOT NULL,
  PRIMARY KEY (`idAvaliacao`),
  INDEX `fk_Avaliacao_Servico1_idx` (`Sevico_FK` ASC) VISIBLE,
  INDEX `fk_Avaliacao_Usuario1_idx` (`Usuario_FK` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliacao_Servico1`
    FOREIGN KEY (`Sevico_FK`)
    REFERENCES `mydb`.`Servico` (`serv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_Usuario1`
    FOREIGN KEY (`Usuario_FK`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `admin_nome` VARCHAR(45) NOT NULL,
  `admin_senha` VARCHAR(255) NOT NULL,
  `admin_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`admin_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Denuncias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Denuncias` (
  `denun_id` INT NOT NULL AUTO_INCREMENT,
  `Usuario_FK` INT NOT NULL,
  `Servico_FK` INT NOT NULL,
  `denun_descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`denun_id`),
  INDEX `fk_Denuncias_Usuario1_idx` (`Usuario_FK` ASC) VISIBLE,
  INDEX `fk_Denuncias_Servico1_idx` (`Servico_FK` ASC) VISIBLE,
  CONSTRAINT `fk_Denuncias_Usuario1`
    FOREIGN KEY (`Usuario_FK`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Denuncias_Servico1`
    FOREIGN KEY (`Servico_FK`)
    REFERENCES `mydb`.`Servico` (`serv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa_Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa_Fisica` (
  `Usuario_FK` INT NOT NULL,
  `pf_cpf` VARCHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  INDEX `fk_Pessoa_Fisica_Usuario1_idx` (`Usuario_FK` ASC) VISIBLE,
  PRIMARY KEY (`Usuario_FK`),
  CONSTRAINT `fk_Pessoa_Fisica_Usuario1`
    FOREIGN KEY (`Usuario_FK`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa_Juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa_Juridica` (
  `Usuario_FK` INT NOT NULL,
  `pj_nome_fantasia` VARCHAR(45) NOT NULL,
  `pj_razao_social` VARCHAR(45) NOT NULL,
  `pj_cnpj` VARCHAR(45) NOT NULL,
  INDEX `fk_Pessoa_Juridica_Usuario1_idx` (`Usuario_FK` ASC) VISIBLE,
  PRIMARY KEY (`Usuario_FK`),
  CONSTRAINT `fk_Pessoa_Juridica_Usuario1`
    FOREIGN KEY (`Usuario_FK`)
    REFERENCES `mydb`.`Usuario` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
