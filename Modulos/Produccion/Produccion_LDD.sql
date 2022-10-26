CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;
CREATE TABLE `colchoneria`.`tbl_recetas` (
  `pk_idrecetas_tbl_recetas` INT NOT NULL AUTO_INCREMENT,
  `producto_tbl_recetas` VARCHAR(45) NOT NULL,
  `nombre_material_tbl_recetas` VARCHAR(100) NOT NULL,
  `cantidad_tbl_recetas` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`pk_idrecetas_tbl_recetas`));

CREATE TABLE `colchoneria`.`tbl_ordenes` (
  `idordenes_tbl_ordenes` INT NOT NULL AUTO_INCREMENT,
  `idreceta_tbl_ordenes` INT NOT NULL,
  `prioridad_tbl_ordenes` VARCHAR(45) NOT NULL,
  `producto_fabricar_tbl_ordenes` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `fechaini_tbl_ordenes` VARCHAR(25) NOT NULL,
  `fechaent` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idordenes_tbl_ordenes`),
  INDEX `pkidreceta_idx` (`idreceta_tbl_ordenes` ASC) VISIBLE,
  CONSTRAINT `pkidreceta`
    FOREIGN KEY (`idreceta_tbl_ordenes`)
    REFERENCES `colchoneria`.`tbl_recetas` (`pk_idrecetas_tbl_recetas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `colchoneria`.`_tbl_procesoprod` (
  `pk_codigo_proceso` INT NOT NULL,
  `fk_idordenes_tbl_procesoprod` VARCHAR(45) NULL,
  `producto_fabricar_tbl_procesoprod` VARCHAR(60) NULL,
  `cantidad_fabricar_tbl_procesoprod` VARCHAR(60) NULL,
  `fecha_entrega_tbl_procesoprod` VARCHAR(20) NULL,
  `proceso_pro_tbl_procesoprod` VARCHAR(10) NULL,
  `estado_orden_tbl_procesoprod` VARCHAR(1) NULL,
  PRIMARY KEY (`pk_codigo_proceso`));