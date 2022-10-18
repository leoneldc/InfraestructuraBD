CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

CREATE TABLE IF NOT EXISTS `tbl_PolizasLocales` (
	pk_PolizasLocales INT NOT NULL,
    emision_poliza varchar(40) not null,
    concepto_poliza varchar(15) not null,
    detalle_poliza varchar(40) not null,
    totalcargo_poliza varchar(15) not null,
    totalbono_poliza varchar(15) not null,
    diferencia_poliza varchar(15) not null,
    primary key (pk_PolizasLocales)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_ActivosFijos`;
CREATE TABLE IF NOT EXISTS `tbl_ActivosFijos` (
	pk_ActivosFijos INT AUTO_INCREMENT NOT NULL,
    Edificaiones varchar(45) NOT NULL,
    Muebles varchar(45) NOT NULL,
    Equipos varchar(45) NOT NULL,
    Maquinaria varchar(45) NOT NULL,
    Herramientas varchar(45) NOT NULL,
    EquipoComputo varchar(45) NOT NULL,
    primary key (pk_ActivosFijos)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_Presupuesto`;
CREATE TABLE IF NOT EXISTS `tbl_Presupuesto` (
  pk_Presupuesto INT AUTO_INCREMENT NOT NULL,
  ombre_presupuesto varchar(50) not null,
  año_presupuesto date,
  mes_presupuesto date,
  ingresos_presupuesto varchar(30) not null,
  gastos_presupuesto varchar(30) not null,
  totalpresu_presupuesto varchar(30) not null,
  estado varchar(30) not null,
  Salarios varchar(45) NOT NULL,
  Prestaciones varchar(45) NOT NULL,
  CApacitaciones varchar(45) NOT NULL,
  Papeleria varchar(45) NOT NULL,
  Agua varchar(45) NOT NULL,
  luz varchar(45) NOT NULL,
  telefono varchar(45) NOT NULL,
  PRIMARY KEY (`pk_Presupuesto`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_TipoCuenta(
pkid_tipocuenta int auto_increment,
codigo_tipocuenta varchar(50) not null,
serie_tipocuenta varchar(2) not null,
control_tipocuenta varchar(30) not null,
sincontrol_tipocuenta varchar(30) not null,
afecta_tipocuenta varchar(30) not null,
noafecta_tipocuenta varchar(30) not null,
estatus varchar(30) not null,
fkid_presupuesto int not null,
primary key(pkid_tipocuenta, fkid_presupuesto),
FOREIGN KEY (`fkid_presupuesto`) REFERENCES `tbl_presupuesto` (`pk_Presupuesto`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_CierreContable`;
CREATE TABLE IF NOT EXISTS `tbl_CierreContable` (
	pk_CierreContable INT AUTO_INCREMENT NOT NULL,
    primary key (pk_CierreContable)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_EstadosFinancieros`;
CREATE TABLE IF NOT EXISTS `tbl_EstadosFinancieros` (
  pk_EstadosFinancieros INT NOT NULL, 
  descripcion_estadofiancniero varchar(50) not null,
  primary key (pk_EstadosFinancieros)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_Mantenimiento`;
CREATE TABLE IF NOT EXISTS `tbl_Mantenimiento` (
  fk_Mantenimientos INT NOT NULL, 
  PRIMARY KEY (`fk_Mantenimientos`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;