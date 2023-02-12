
CREATE SCHEMA IF NOT EXISTS `MedG` DEFAULT CHARACTER SET utf8;
USE `MedG`;

CREATE TABLE IF NOT EXISTS `MedG`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(10) NOT NULL,
  `conselho_de_classe`VARCHAR(255) NULL,
  `estado_emissor`VARCHAR(255) NULL,
  `registro_no_conselho_de_classe`VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `user`VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `is_ativo` TINYINT NULL DEFAULT 1,
  `dt_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_autalizacao` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `MedG`.`pacientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `cns` VARCHAR(255) NOT NULL,
  `dt_de_nascimento` VARCHAR(255) NOT NULL,
  `sexo` VARCHAR(255) NOT NULL,
  `cor` VARCHAR(255) NOT NULL,
  `nome_da_mae` VARCHAR(255) NOT NULL,
  `nacionalidade` VARCHAR(255) NOT NULL,
  `municipio_de_nascimento` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `telefone_2` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `cep` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `numero` VARCHAR(255) NOT NULL,
  `complemento` VARCHAR(255) NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(255) NOT NULL,
  `estado_civil` VARCHAR(255) NULL,
  `ocupacao` VARCHAR(255) NULL,
  `dt_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_atualizacao` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `MedG`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;