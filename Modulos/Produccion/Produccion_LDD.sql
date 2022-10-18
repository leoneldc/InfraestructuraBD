CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

CREATE TABLE IF NOT EXISTS `tbl_recetas` (
  `pk_idrecetas_tbl_recetas` int NOT NULL,
  `producto_tbl_recetas` varchar(45) NOT NULL,
  `nombre_material_tbl_recetas` varchar(100) NOT NULL,
  `cantidad_tbl_recetas` varchar(100) NOT NULL,
  PRIMARY KEY (`pk_idrecetas_tbl_recetas`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `pk_idordenes_tbl_ordenes` int NOT NULL,
  `fk_idreceta_tbl_ordenes` int NOT NULL,
  `prioridad_tbl_ordenes` varchar(45) NOT NULL,
  `producto_fabricar_tbl_ordenes` varchar(45) DEFAULT NULL,
  `fechaini_tbl_ordenes` date DEFAULT NULL,
  `fechaent` date DEFAULT NULL,
  PRIMARY KEY (`pk_idordenes_tbl_ordenes`),
  FOREIGN KEY (`fk_idreceta_tbl_ordenes`) REFERENCES `tbl_recetas` (`pk_idrecetas_tbl_recetas`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS`_tbl_procesoprod` (
  `pk_codigo_proceso_tbl_procesoprod` int NOT NULL,
  `fk_idordenes_tbl_procesoprod` int NOT NULL,
  `producto_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `cantidad_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `fecha_entrega_tbl_procesoprod` varchar(20) NOT NULL,
  `proceso_pro_tbl_procesoprod` varchar(10) NOT NULL,
  `estado_orden_tbl_procesoprod` varchar(1) NOT NULL,
  PRIMARY KEY (`pk_codigo_proceso_tbl_procesoprod`),
  FOREIGN KEY (`fk_idordenes_tbl_procesoprod`) REFERENCES `tbl_ordenes` (`pk_idordenes_tbl_ordenes`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

