CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

CREATE TABLE IF NOT EXISTS `Tbl_bancos` (
  `Pk_idbancos` INT NOT NULL,
  `nombre_banco` VARCHAR(25) NULL,
  `direccion_banco` VARCHAR(45) NULL,
  `contacto_banco` VARCHAR(45) NULL,
  `Saldo_banco` FLOAT NOT NULL,
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
   `Pk_regTipoCambio` INT NOT NULL,
  `fecha_RtCambio` DATE NOT NULL,
  `compra_RtCambio` FLOAT NULL,
  `venta_RtCambio` FLOAT NULL,
  `Moneda_RtCambio` VARCHAR(20) NULL,
  PRIMARY KEY (`Pk_regTipoCambio`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE IF NOT EXISTS `Tbl_Cuentas` (
  `Pk_idCuentas` INT NOT NULL,
  `Nombre_cta` VARCHAR(45) NOT NULL,
  `estado_cta` VARCHAR(15) NOT NULL,
  `Saldos_cta` FLOAT NOT NULL,
  PRIMARY KEY (`Pk_idCuentas`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_tiposPagos` (
  `Pk_idTipoPagos` INT NOT NULL,
  `Concepto_Tipo` VARCHAR(25) NULL,
  PRIMARY KEY (`Pk_idTipoPagos`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  CREATE TABLE IF NOT EXISTS `Tbl_ConceptosBancario` (
  `Pk_idConcepto` INT NOT NULL,
  `Nombre_cbancario` VARCHAR(50) NOT NULL,
  `PorcentajeIva` float null,
  `Clasificacion` VARCHAR(5) NOT NULL,
  `Estado` TINYINT DEFAULT 0,
  PRIMARY KEY (`Pk_idConcepto`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Movimientos_bancos` (
  `Pk_idMovimientos` INT NOT NULL,
  `fk_tipo_pago` INT NULL,
  `fk_id_concepto` INT NOT NULL,
  `fecha_mov` DATE NULL,
  `fk_Cuenta_banco` INT NULL,
  `fk_Cuenta_rela` INT NULL,
  `fk_tipomoneda` INT NULL,
  `Monto` FLOAT NULL,
  `iva` FLOAT NULL,
  `fk_Banco_Mov` INT NULL,
PRIMARY KEY (`Pk_idMovimientos`),
FOREIGN KEY (`fk_tipo_pago`) REFERENCES `Tbl_tiposPagos` (`Pk_idTipoPagos`),
FOREIGN KEY (`fk_id_concepto`) REFERENCES `Tbl_ConceptosBancario` (`Pk_idConcepto`),
FOREIGN KEY (`fk_tipomoneda`) REFERENCES `Tbl_Reg_tipoCambio` (`Pk_regTipoCambio`),
FOREIGN KEY (`fk_Cuenta_banco`) REFERENCES `Tbl_bancos` (`Pk_idbancos`),
 FOREIGN KEY (`fk_Cuenta_rela`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`)
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
  FOREIGN KEY (`fk_id_cuentabancaria`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`),
    FOREIGN KEY (`fk_Banco_cheques`) REFERENCES `Tbl_bancos` (`Pk_idbancos`),
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




