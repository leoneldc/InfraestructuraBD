DROP TABLE IF EXISTS `tbl_departamentos`;-- KEVIN 
CREATE TABLE IF NOT EXISTS `tbl_departamentos` (
	pk_id_departamento  INT AUTO_INCREMENT NOT NULL,
    nombre_departamento VARCHAR(40) NOT NULL,
    descripcion_departamento  VARCHAR(75) NOT NULL,
    estado_departamento TINYINT DEFAULT 0,
    primary key (`pk_id_departamento`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_puestosdetrabajo`; -- LEONEL DOMINGUEZ
CREATE TABLE IF NOT EXISTS `tbl_puestosdetrabajo` (
	pk_id_puesto INT AUTO_INCREMENT NOT NULL,
    nombre_puesto VARCHAR(50) NOT NULL,
    estado_puesto  TINYINT DEFAULT 0,
    primary key (`pk_id_puesto`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_contrato`;
CREATE TABLE IF NOT EXISTS `tbl_contrato` (
	pk_id_contrato INT AUTO_INCREMENT NOT NULL,
    salario_contrato  FLOAT NOT NULL,
    tipoJornada_contrato TINYINT NOT NULL,
    cantdidadHorasMensuales_contrato INT NOT NULL,
    tipoPago_contrato TINYINT NOT NULL,
    estado_contrato TINYINT DEFAULT 0,
    primary key (`pk_id_contrato`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_percepciones`;
CREATE TABLE IF NOT EXISTS `tbl_percepciones` (
	pk_id_prestdeduc INT AUTO_INCREMENT NOT NULL,
    nombre_prestdeduc VARCHAR(40) NOT NULL,
    tipo_prestdeduc  TINYINT NOT NULL,
    porcentaje_prestdeduc FLOAT DEFAULT 0,
    valorFijo_prestdeduc FLOAT DEFAULT 0,
    estado_prestdeduc TINYINT DEFAULT 0,
    primary key (`pk_id_prestdeduc`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_trabajador`;-- LUIS LEE
CREATE TABLE IF NOT EXISTS `tbl_trabajador` (
	pk_id_trabajador INT AUTO_INCREMENT NOT NULL,
    fechaAlta_departamento DATE NOT NULL,
    nombre_trabajador VARCHAR(100) NOT NULL,
    email_trabajador VARCHAR(20) NOT NULL,
    direccion_trabajador VARCHAR(50) NOT NULL,
    telefono_trabajador INT(8) NOT NULL,
    estado_trabajador TINYINT DEFAULT 0,
    primary key (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_horasextras`;
CREATE TABLE IF NOT EXISTS `tbl_horasextras` (
	fk_id_trabajador  INT NOT NULL,
    fecha_horasextras DATE NOT NULL,
    cantidadHorasr_horasextras FLOAT NOT NULL,
    primary key (`fk_id_trabajador`,`fecha_horasextras`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_controlfaltas`;
CREATE TABLE IF NOT EXISTS `tbl_controlfaltas` (
	pk_id_faltas INT AUTO_INCREMENT NOT NULL,
    fk_clave_empleado INT NOT NULL, 
    fecha_falta DATE NOT NULL,
    mes_falta INT NOT NULL,
    justificacion_falta VARCHAR(100),
    primary key (`pk_id_faltas`),
    FOREIGN KEY (`fk_clave_empleado`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacion_puestodepartamento`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion_puestodepartamento` (
	fk_id_puesto INT NOT NULL,
	fk_id_departamento  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_departamento`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_departamento`) REFERENCES `tbl_departamentos` (`pk_id_departamento`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacion_puestotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion_puestotrabajador` (
	fk_id_puesto INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacion_contratopercepciones`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion_contratopercepciones` (
	fk_id_contrato INT NOT NULL,
	fk_id_prestdeduc  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_prestdeduc`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_prestdeduc`) REFERENCES `tbl_percepciones` (`pk_id_prestdeduc`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacion_contratotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion_contratotrabajador` (
	fk_id_contrato INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_prestacionesindividuales`;
CREATE TABLE IF NOT EXISTS `tbl_prestacionesindividuales` (
	pk_id_prestdeducext INT AUTO_INCREMENT NOT NULL,
	fk_id_prestdeduc INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    mes_prestdeducext INT NOT NULL,
    cantidad_prestdeducext FLOAT DEFAULT 0,
    primary key (`pk_id_prestdeducext`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`),
    FOREIGN KEY (`fk_id_prestdeduc`) REFERENCES `tbl_percepciones` (`pk_id_prestdeduc`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_encabezadoNominas`;
CREATE TABLE IF NOT EXISTS `tbl_encabezadoNominas` (
	pk_id_nomina INT NOT NULL,
    fechaPago_nomina DATE NOT NULL,
    tipoPago_nomina TINYINT NOT NULL,
    mesPagado_nomina VARCHAR(50) NOT NULL,
    anioPagado_nomina VARCHAR(50) NOT NULL,
    total_nomina FLOAT DEFAULT 0,
    primary key (`pk_id_nomina`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_detalleNominas`;
CREATE TABLE IF NOT EXISTS `tbl_detalleNominas` (
	pk_id_nomina INT NOT NULL,
    fk_id_trabajador INT NOT NULL,
    salario_nomina FLOAT NOT NULL,
    totalHorasExtras_nomina FLOAT NOT NULL,
    totalPercepciones_nomina FLOAT DEFAULT 0,
    totalDeducciones_nomina FLOAT DEFAULT 0,
    liquidez_nomina FLOAT NOT NULL,
    primary key (`pk_id_nomina`,`fk_id_trabajador`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;