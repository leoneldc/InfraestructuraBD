CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

CREATE TABLE IF NOT EXISTS `Tbl_bancos` (
  `Pk_idbancos` INT NOT NULL,
  `nombre_banco` VARCHAR(25) NULL,
  `direccion_banco` VARCHAR(45) NULL,
  `contacto_banco` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idbancos`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Reportes` (
  `Pk_idReportes` INT NOT NULL,
  `fechas_Reportes` DATE NULL,
  `concepto_Reportes` VARCHAR(45) NULL,
  `Nombre_Reportes` VARCHAR(45) NULL,
  `ubicacion_Reportes` VARCHAR(45) NULL,
  `Banco_Reportes` INT NULL,
  PRIMARY KEY (`Pk_idReportes`),
  FOREIGN KEY (`Banco_Reportes`) REFERENCES  `Tbl_bancos` (`Pk_idbancos`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Reg_tipoCambio` (
  `Pk_fecha_RtCambio` DATE NOT NULL,
  `compra_RtCambio` FLOAT NULL,
  `venta_RtCambio` FLOAT NULL,
  `Moneda_RtCambio` VARCHAR(20) NULL,
  `reporteCambio_RtCambio` INT NULL,
  PRIMARY KEY (`Pk_fecha_RtCambio`),
  FOREIGN KEY (`reporteCambio_RtCambio`) REFERENCES `Tbl_Reportes` (`Pk_idReportes`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Cuentas` (
  `Pk_idCuentas` INT NOT NULL,
  `Nombre_cta` VARCHAR(45) NOT NULL,
  `estado_cta` VARCHAR(15) NOT NULL,
  `Saldos_cta` FLOAT NOT NULL,
  PRIMARY KEY (`Pk_idCuentas`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_tiposMov` (
  `Pk_idTipoMov` INT NOT NULL,
  `Concepto_Tipo` VARCHAR(15) NULL,
  `Descripcion_Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idTipoMov`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  CREATE TABLE IF NOT EXISTS `Tbl_ConceptosBancario` (
  `Pk_idConcepto` INT NOT NULL,
  `Nombre_cbancario` DATE NULL,
  `Descripción` VARCHAR(45) NULL,
  `Tipo` VARCHAR(10) NULL,
  PRIMARY KEY (`Pk_idDispo`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Movimientos_bancos` (
  `Pk_idMovimientos` INT NOT NULL,
  `tipo_mov` INT NULL,
  `fecha_reg` DATE NULL,
  `forma_pago` VARCHAR(20) NULL,
  `fk_id_concepto` int not null,
  `fechaApli_Movimientos` DATE NULL,
  `Cuenta_rela` INT NULL,
  `Monto` FLOAT NULL,
  `iva` FLOAT NULL,
PRIMARY KEY (`Pk_idMovimientos`),
FOREIGN KEY (`tipo_mov`) REFERENCES `Tbl_tiposMov` (`Pk_idTipoMov`),
FOREIGN KEY (`fk_id_concepto`) REFERENCES `Tbl_ConceptosBancario` (`Pk_idConcepto`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Ctrl_cheques` (
  `Pk_idControl_cheques` INT NOT NULL,
  `fk_id_cuentabancaria` INT NOT NULL,
  `fk_id_concepto` INT NOT NULL,
  `montoNum_cheques` FLOAT NOT NULL ,
  `fechaReg_cheques` DATE NULL,
  `fechaAplicacion_cheques` DATE NULL,
  `MontoLet_cheques` VARCHAR (100) NULL,
  `fk_Banco_cheques` INT NULL,
  PRIMARY KEY (`Pk_idControl_cheques`),
  FOREIGN KEY (`fk_id_cta_Empleado_cheques`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`),
    FOREIGN KEY (`fk_Banco_cheques`) REFERENCES `Tbl_bancos` (`Pk_idbancos`),
    FOREIGN KEY (`fk_id_cuentabancaria`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`),
    FOREIGN KEY (`fk_id_concepto`) REFERENCES `Tbl_ConceptosBancario` (`Pk_idConcepto`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE IF NOT EXISTS `Tbl_Conciliacion` (
  `Pk_idConciliacion` INT NOT NULL,
  `fecha_reg_cnl` DATE NULL,
  `descripcion_cnl` VARCHAR(45) NULL,
  `movimientos_cnl` INT NULL,
  PRIMARY KEY (`Pk_idConciliacion`),
    FOREIGN KEY (`movimientos_cnl`) REFERENCES `Tbl_Movimientos_bancos` (`Pk_idMovimientos`)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Disponibilidad` (
  `Pk_idDispo` INT NOT NULL,
  `fecha_dispo` DATE NULL,
  `SaldoDispo` FLOAT NULL,
  `Comentario` VARCHAR(45) NULL,
  `cuentaDispo` INT NULL,
  PRIMARY KEY (`Pk_idDispo`),
FOREIGN KEY (`cuentaDispo`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



