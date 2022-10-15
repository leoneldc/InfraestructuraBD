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
	pk_id_aplicacion INT NOT NULL,
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
  pregunta varchar(50) not null,
  respuesta varchar(50) not null,
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
  ip_bitacora VARCHAR(100) NOT NULL,
  accion_bitacora VARCHAR(50) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- vistas ------------------------------------------------------------------------
CREATE 
VIEW `colchoneria`.`vista_aplicacion_perfil` AS 
    SELECT 
        `b`.`fk_id_perfil` AS `ID`,
        `a`.`nombre_perfil` AS `Perfil`,
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `b`.`guardar_permiso` AS `Insertar`,
        `b`.`modificar_permiso` AS `Modificar`,
        `b`.`eliminar_permiso` AS `Eliminar`,
        `b`.`buscar_permiso` AS `Buscar`,
        `b`.`imprimir_permiso` AS `Reporte`
    FROM
        (`colchoneria`.`tbl_permisosaplicacionperfil` `b`
        JOIN `colchoneria`.`tbl_perfiles` `a` ON ((`a`.`pk_id_perfil` = `b`.`fk_id_perfil`)));
        
CREATE 
VIEW `colchoneria`.`vista_aplicacionusuario` AS
    SELECT 
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `b`.`fk_id_usuario` AS `ID`,
        `a`.`nombre_usuario` AS `Usuario`,
        `b`.`guardar_permiso` AS `Insertar`,
        `b`.`modificar_permiso` AS `Editar`,
        `b`.`eliminar_permiso` AS `Eliminar`,
        `b`.`buscar_permiso` AS `Buscar`,
        `b`.`imprimir_permiso` AS `Reporte`
    FROM
        (`colchoneria`.`tbl_permisosaplicacionesusuario` `b`
        JOIN `colchoneria`.`tbl_usuarios` `a` ON ((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)));
        
CREATE 
VIEW `colchoneria`.`vista_modulo_aplicacion` AS
    SELECT 
        `b`.`fk_id_modulos` AS `ID`,
        `a`.`nombre_modulo` AS `Modulo`,
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `c`.`nombre_aplicacion` AS `Nombre`,
        `c`.`descripcion_aplicacion` AS `Descripcion`
    FROM
        ((`colchoneria`.`tbl_asignacionmoduloaplicacion` `b`
        JOIN `colchoneria`.`tbl_modulos` `a` ON ((`a`.`pk_id_modulos` = `b`.`fk_id_modulos`)))
        JOIN `colchoneria`.`tbl_aplicaciones` `c` ON ((`c`.`pk_id_aplicacion` = `b`.`fk_id_aplicacion`)));
        
CREATE 
VIEW `colchoneria`.`vista_perfil_usuario` AS
    SELECT 
        `b`.`fk_id_usuario` AS `ID`,
        `a`.`nombre_usuario` AS `Usuario`,
        `a`.`username_usuario` AS `nickName`,
        `b`.`fk_id_perfil` AS `perfil`,
        `c`.`nombre_perfil` AS `Nombre`
    FROM
        ((`colchoneria`.`tbl_asignacionesperfilsusuario` `b`
        JOIN `colchoneria`.`tbl_usuarios` `a` ON ((`a`.`pk_id_usuario` = `b`.`fk_id_usuario`)))
        JOIN `colchoneria`.`tbl_perfiles` `c` ON ((`c`.`pk_id_perfil` = `b`.`fk_id_perfil`)));
        





