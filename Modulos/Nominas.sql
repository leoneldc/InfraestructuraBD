USE `colchoneria`;

DROP TABLE IF EXISTS `tbl_departamentos`;-- KEVIN 
CREATE TABLE IF NOT EXISTS `tbl_departamentos` (
	pk_id_departamento  INT AUTO_INCREMENT NOT NULL,
    nombre_departamento VARCHAR(25) NOT NULL,
    descripcion_departamento  VARCHAR(75) NOT NULL,
    estado_departamento TINYINT DEFAULT 0,
    primary key (`pk_id_departamento`)
);

DROP TABLE IF EXISTS `tbl_puestosdetrabajo`; -- LEONEL DOMINGUEZ
CREATE TABLE IF NOT EXISTS `tbl_puestosdetrabajo` (
	pk_id_puesto INT AUTO_INCREMENT NOT NULL,
    nombre_puesto VARCHAR(25) NOT NULL,
    estado_puesto  TINYINT DEFAULT 0,
    primary key (`pk_id_puesto`)
);

DROP TABLE IF EXISTS `tbl_contrato`;
CREATE TABLE IF NOT EXISTS `tbl_contrato` (
	pk_id_contrato INT AUTO_INCREMENT NOT NULL,
    salario_contrato  FLOAT NOT NULL,
    tipoJornada_contrato TINYINT NOT NULL,
    cantdidadHorasMensuales_contrato INT NOT NULL,
    tipoPago_contrato TINYINT NOT NULL,
    estado_contrato TINYINT DEFAULT 0,
    primary key (`pk_id_contrato`)
);

DROP TABLE IF EXISTS `tbl_prestacionesydeducciones`;
CREATE TABLE IF NOT EXISTS `tbl_prestacionesydeducciones` (
	pk_id_prestdeduc INT AUTO_INCREMENT NOT NULL,
    nombre_prestdeduc VARCHAR(25) NOT NULL,
    tipo_prestdeduc  TINYINT NOT NULL,
    porcentaje_prestdeduc FLOAT DEFAULT 0,
    valorFijo_prestdeduc FLOAT DEFAULT 0,
    estado_prestdeduc TINYINT DEFAULT 0,
    primary key (`pk_id_prestdeduc`)
);

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
);

DROP TABLE IF EXISTS `tbl_horasextras`;
CREATE TABLE IF NOT EXISTS `tbl_horasextras` (
	pk_id_horasextras INT AUTO_INCREMENT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    fecha_horasextras DATE NOT NULL,
    cantidadHorasr_horasextras FLOAT NOT NULL,
    primary key (`pk_id_horasextras`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
);

DROP TABLE IF EXISTS `tbl_controlfaltas`;
CREATE TABLE IF NOT EXISTS `tbl_controlfaltas` (
	pk_id_faltas INT AUTO_INCREMENT NOT NULL,
    fk_clave_empleado INT NOT NULL, 
    fecha_falta DATE NOT NULL,
    mes_falta INT NOT NULL,
    justificacion_falta VARCHAR(50),
    primary key (`pk_id_faltas`),
    FOREIGN KEY (`fk_clave_empleado`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
);

DROP TABLE IF EXISTS `tbl_asignacionpuestodepartamento`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionpuestodepartamento` (
	fk_id_puesto INT NOT NULL,
	fk_id_departamento  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_departamento`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_departamento`) REFERENCES `tbl_departamentos` (`pk_id_departamento`)
);

DROP TABLE IF EXISTS `tbl_asignacionpuestotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionpuestotrabajador` (
	fk_id_puesto INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
);

DROP TABLE IF EXISTS `tbl_asignacioncontratoprestdeduc`;
CREATE TABLE IF NOT EXISTS `tbl_asignacioncontratoprestdeduc` (
	fk_id_contrato INT NOT NULL,
	fk_id_prestdeduc  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_prestdeduc`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_prestdeduc`) REFERENCES `tbl_prestacionesydeducciones` (`pk_id_prestdeduc`)
);

DROP TABLE IF EXISTS `tbl_asignacioncontratotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacioncontratotrabajador` (
	fk_id_contrato INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
);

DROP TABLE IF EXISTS `tbl_percydeducindividuales`;
CREATE TABLE IF NOT EXISTS `tbl_percydeducindividuales` (
	pk_id_prestdeducext INT AUTO_INCREMENT NOT NULL,
	fk_id_prestdeduc INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    mes_prestdeducext INT NOT NULL,
    cantidad_prestdeducext FLOAT DEFAULT 0,
    primary key (`pk_id_prestdeducext`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`),
    FOREIGN KEY (`fk_id_prestdeduc`) REFERENCES `tbl_prestacionesydeducciones` (`pk_id_prestdeduc`)
);

DROP TABLE IF EXISTS `tbl_nominas`;
CREATE TABLE IF NOT EXISTS `tbl_nominas` (
	pk_id_correlativo INT AUTO_INCREMENT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    fechaGenerado_nomina DATE NOT NULL,
    mesPagado_nomina INT NOT NULL,
    salario_nomina FLOAT NOT NULL,
    totalHorasExtras_nomina FLOAT NOT NULL,
    totalPercepciones_nomina FLOAT DEFAULT 0,
    totalDeducciones_nomina FLOAT DEFAULT 0,
    liquidez_nomina FLOAT NOT NULL,
    primary key (`pk_id_correlativo`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
);

