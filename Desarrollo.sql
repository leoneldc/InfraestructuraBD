DROP DATABASE  IF EXISTS `colchoneria`;
CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

DROP TABLE IF EXISTS `tbl_modulos`;
CREATE TABLE IF NOT EXISTS `tbl_modulos` (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (pk_id_modulos)
);

DROP TABLE IF EXISTS `tbl_aplicaciones`;
CREATE TABLE IF NOT EXISTS `tbl_aplicaciones` (
	pk_id_aplicacion INT AUTO_INCREMENT NOT NULL,
    fk_id_modulo INT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (pk_id_aplicacion),
    FOREIGN KEY (fk_id_modulo) REFERENCES tbl_modulos(pk_id_modulos)
);

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
-- AGREGAR UN BOOLEANO PARA VER SI ES USUARIO NORMAL O ADMIN TOTAL

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

/*
-- -----MODULOS
INSERT INTO Modulos VALUES ('0000', 'A', 'A', 1),('1000', 'B', 'B', 1),('2000', 'C', 'C', 1);
-- -----APLICACIONES
INSERT INTO `aplicaciones` VALUES ('1', '0', 'APP1 A', 'A1', '1'), ('2', '0', 'APP2 A', 'A2', '1');
INSERT INTO `aplicaciones` VALUES ('1001', '1000', 'APP1 A', 'A1', '1'), ('1002', '1000', 'APP2 B', 'A2', '1');
INSERT INTO `aplicaciones` VALUES ('2001', '2000', 'APP1 B', 'A1', '1'), ('2002', '2000', 'APP2 C', 'A2', '1');
-- -----USUARIOS
INSERT INTO `Usuarios` VALUES ('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '2022-07-02 21:00:48', '1');
INSERT INTO `Usuarios` VALUES ('2', 'leonel', 'dominguez', 'laionel', 'HO0aGo4nM94=', 'laionel@gmail.com', '2022-07-02 21:00:48', '1');
-- -----PERFILES
INSERT INTO Perfiles VALUES ('1', 'Administrador', 'contiene todos los permisos del programa', 1),('2', 'Tester', 'tiene acceso a ciertas aplicaciones', 1);
-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `PermisosAplicacionPerfil` VALUES ('1', '1001', '1', '1', '1', '1', '1');
INSERT INTO `PermisosAplicacionPerfil` VALUES ('1', '2001', '1', '1', '1', '1', '1');
-- -----PERMISOS DE APLICACIONES A USUARIOS
INSERT INTO `PermisosAplicacionesUsuario` VALUES ('1001', '1', '1', '1', '1', '1', '1');
INSERT INTO `PermisosAplicacionesUsuario` VALUES ('2001', '1', '1', '1', '1', '1', '1');
INSERT INTO `PermisosAplicacionesUsuario` VALUES ('2001', '2', '1', '1', '1', '1', '1');
-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `AsignacionesPerfilsUsuario` VALUES ('1', '1');
INSERT INTO `AsignacionesPerfilsUsuario` VALUES ('2', '1');
*/
