DROP DATABASE  IF EXISTS `InfraestructuraBD`;
CREATE DATABASE IF NOT EXISTS `InfraestructuraBD`;
USE `InfraestructuraBD`;
-- ---AREA DE SEGURIDAD
DROP TABLE IF EXISTS `Modulos`;
CREATE TABLE IF NOT EXISTS `Modulos` (
	pk_id_modulos INT NOT NULL,
    nombre_modulo VARCHAR(50) NOT NULL,
    descripcion_modulo VARCHAR(150) NOT NULL,
    estado_modulo TINYINT DEFAULT 0,
    primary key (pk_id_modulos)
);
DROP TABLE IF EXISTS `Aplicaciones`;
CREATE TABLE IF NOT EXISTS `Aplicaciones` (
	pk_id_aplicacion INT AUTO_INCREMENT NOT NULL,
    fk_id_modulo INT NOT NULL,
    nombre_aplicacion VARCHAR(50) NOT NULL,
    descripcion_aplicacion VARCHAR(150) NOT NULL,
    estado_aplicacion TINYINT DEFAULT 0,
    primary key (pk_id_aplicacion),
    FOREIGN KEY (fk_id_modulo) REFERENCES Modulos(pk_id_modulos)
);
DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE IF NOT EXISTS `Usuarios` (
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
DROP TABLE IF EXISTS `Perfiles`;
CREATE TABLE IF NOT EXISTS `Perfiles` (
	pk_id_perfil INT AUTO_INCREMENT NOT NULL,
    nombre_perfil VARCHAR(50) NOT NULL,
    descripcion_perfil VARCHAR(150) NOT NULL,
    estado_perfil TINYINT DEFAULT 0,
    primary key (pk_id_perfil)
);
DROP TABLE IF EXISTS `PermisosAplicacionesPerfil`;
CREATE TABLE IF NOT EXISTS `PermisosAplicacionesPerfil` (
  pk_id_permiso INT AUTO_INCREMENT NOT NULL,
  fk_id_perfil INT NOT NULL, 
  fk_id_aplicacion INT NOT NULL, 
  guardar_permiso BOOLEAN DEFAULT FALSE,
  modificar_permiso BOOLEAN DEFAULT FALSE,
  eliminar_permiso BOOLEAN DEFAULT FALSE,
  buscar_permiso BOOLEAN DEFAULT FALSE,
  imprimir_permiso BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`pk_id_permiso`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `Aplicaciones` (`pk_id_aplicacion`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `Perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `AsignacionesPerfilsUsuario`;
CREATE TABLE IF NOT EXISTS `AsignacionesPermisosUsuario` (
  pk_id_asignacion INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL, 
  fk_id_perfil INT NOT NULL,
  PRIMARY KEY (`pk_id_asignacion`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `Usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_perfil`) REFERENCES `Perfiles` (`pk_id_perfil`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
DROP TABLE IF EXISTS `BitacoraDeEventos`;
CREATE TABLE IF NOT EXISTS `BitacoraDeEventos` (
  pk_id_bitacora INT AUTO_INCREMENT NOT NULL,
  fk_id_usuario INT NOT NULL,
  fk_id_aplicacion INT NOT NULL,
  fecha_bitacora DATE NOT NULL,
  hora_bitacora TIME NOT NULL,
  host_bitacora VARCHAR(45) NOT NULL,
  ip_bitacora VARCHAR(25) NOT NULL,
  accion_bitacora VARCHAR(10) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `Usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `Aplicaciones` (`pk_id_aplicacion`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

