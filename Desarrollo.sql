DROP DATABASE  IF EXISTS `colchoneria`;
CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

DROP TABLE IF EXISTS `tbl_modulos`;
CREATE TABLE IF NOT EXISTS `tbl_modulos` (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (`pk_id_modulos`)
);

DROP TABLE IF EXISTS `tbl_aplicaciones`;
CREATE TABLE IF NOT EXISTS `tbl_aplicaciones` (
	pk_id_aplicacion INT AUTO_INCREMENT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (`pk_id_aplicacion`)
);

DROP TABLE IF EXISTS `tbl_AsignacionModuloAplicacion`;
CREATE TABLE IF NOT EXISTS `tbl_AsignacionModuloAplicacion` (
  fk_id_modulos INT NOT NULL,
  fk_id_aplicacion INT NOT NULL, 
  PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion` ),
  FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  pk_id_usuario INT AUTO_INCREMENT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  apellido_usuario VARCHAR(50) NOT NULL,
  username_usuario VARCHAR(20) NOT NULL,
  password_usuario VARCHAR(100) NOT NULL,
  email_usuario VARCHAR(50) NOT NULL,
  ultima_conexion_usuario DATETIME NULL DEFAULT NULL,
  estado_usuario TINYINT DEFAULT 0 NOT NULL,
  PRIMARY KEY (`pk_id_usuario`)
);

DROP TABLE IF EXISTS `tbl_perfiles`;
CREATE TABLE IF NOT EXISTS `tbl_perfiles` (
	pk_id_perfil INT AUTO_INCREMENT NOT NULL,
    nombre_perfil VARCHAR(50) NOT NULL,
    descripcion_perfil VARCHAR(150) NOT NULL,
    estado_perfil TINYINT DEFAULT 0,
    primary key (pk_id_perfil)
);

DROP TABLE IF EXISTS `tbl_permisosAplicacionesUsuario`;
CREATE TABLE IF NOT EXISTS `tbl_permisosAplicacionesUsuario` (
  fk_id_aplicacion INT NOT NULL, 
  fk_id_usuario INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_permisosAplicacionPerfil`;
CREATE TABLE IF NOT EXISTS `tbl_permisosAplicacionPerfil` (
  fk_id_perfil INT NOT NULL, 
  fk_id_aplicacion INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacionesPerfilsUsuario`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionesPerfilsUsuario` (
  fk_id_usuario INT NOT NULL, 
  fk_id_perfil INT NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil` ),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_bitacoraDeEventos`;
CREATE TABLE IF NOT EXISTS `tbl_bitacoraDeEventos` (
  pk_id_bitacora INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL,
  fk_id_aplicacion INT NOT NULL,
  fecha_bitacora DATE NOT NULL,
  hora_bitacora TIME NOT NULL,
  host_bitacora VARCHAR(45) NOT NULL,
  ip_bitacora VARCHAR(25) NOT NULL,
  accion_bitacora VARCHAR(10) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


-- -----MODULOS
INSERT INTO `tbl_modulos` VALUES 
('1000', 'Seguridad', 'Seguridad', 1),
('2000', 'Logistica', 'Logistica', 1),
('3000', 'Compras', 'Compras', 1),
('4000', 'Ventas', 'Ventas', 1),
('5000', 'Produccion', 'Produccion', 1),
('6000', 'Nominas', 'Nominas', 1),
('7000', 'Bancos', 'Bancos', 1),
('8000', 'Contabilidad', 'Contabilidad', 1);

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES 
('1000', 'MDI', 'PARA SEGURIDAD', '1'), 
('2000', 'MDI', 'PARA LOGISTICA', '1'), 
('3000', 'MDI', 'PARA COMPRAS', '1'), 
('4000', 'MDI', 'PARA VENTAS', '1'), 
('5000', 'MDI', 'PARA', '1'), 
('6000', 'MDI', 'PARA', '1'), 
('7000', 'MDI', 'PARA', '1'), 
('8000', 'MDI', 'PARA', '1');

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES 
('1000', '1000'), 
('2000', '2000'), 
('3000', '3000'), 
('4000', '4000'), 
('5000', '5000');

-- -----USUARIOS
INSERT INTO `tbl_usuarios` VALUES 
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '2022-07-02 21:00:48', '1'),
('2', 'leonel', 'dominguez', 'laionel', 'HO0aGo4nM94=', 'laionel@gmail.com', '2022-07-02 21:00:48', '1');

-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES 
('1', 'Administrador', 'contiene todos los permisos del programa', 1),
('2', 'Tester', 'tiene acceso a ciertas aplicaciones', 1);

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES 
('1', '1000', '1', '1', '1', '1', '1'),
('1', '2000', '1', '1', '1', '1', '1'),
('1', '3000', '1', '1', '1', '1', '1'),
('1', '4000', '1', '1', '1', '1', '1'),
('1', '5000', '1', '1', '1', '1', '1');

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES 
('1', '1'),('1', '2');

/*Contabilidad*/
USE `Contabilidad`;

DROP TABLE IF EXISTS `tbl_PolizasLocales`;   /*dos partes referencias  , crear tabala cuentas*/
CREATE TABLE IF NOT EXISTS `tbl_PolizasLocales` (
	pk_PolizasLocales INT NOT NULL,
    emision_poliza varchar(40) not null,
    concepto_poliza varchar(15) not null,
    detalle_poliza varchar(40) not null,
    totalcargo_poliza varchar(15) not null,
    totalbono_poliza varchar(15) not null,
    diferencia_poliza varchar(15) not null,
    
    primary key (pk_PolizasLocales)
);

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
);

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
);

create table tbl_TipoCuenta(
pkid_tipocuenta int auto_increment,
codigo_tipocuenta varchar(50) not null,
serie_tipocuenta varchar(2) not null,
control_tipocuenta varchar(30) not null,
sincontrol_tipocuenta varchar(30) not null,
afecta_tipocuenta varchar(30) not null,
noafecta_tipocuenta varchar(30) not null,
estatus varchar(30) not null,
pkid_presupuesto int auto_increment,
primary key(codigo_tipocuenta, pkid_presupuesto),
FOREIGN KEY (`fk_pkid_presupuesto`) REFERENCES `tblpresupuesto` (`pkid_presupuesto`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS `tbl_CierreContable`;
CREATE TABLE IF NOT EXISTS `tbl_CierreContable` (
	pk_CierreContable INT AUTO_INCREMENT NOT NULL,
   
    primary key (pk_CierreContable)
);

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