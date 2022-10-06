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
insert into tbl_aplicaciones values ("x","y",1);
select * from tbl_aplicaciones;

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
alter table tbl_usuarios add pregunta varchar(50) not null;
alter table tbl_usuarios add respuesta varchar(50) not null;
select * from tbl_usuarios;
use colchoneria;
SELECT pregunta FROM tbl_usuarios WHERE username_usuario='daniel';

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
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES 
('8', '1');

-- vistas ------------------------------------------------------------------------
CREATE 
VIEW `colchoneria`.`vista_aplicacion_perfil` AS
    SELECT 
        `b`.`fk_id_perfil` AS `ID`,
        `a`.`nombre_perfil` AS `Perfil`,
        `b`.`fk_id_aplicacion` AS `Aplicacion`,
        `b`.`guardar_permiso` AS `Guardar`,
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
        `b`.`guardar_permiso` AS `Guardar`,
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
        
select * from vista_aplicacionusuario;
/*TABLAS DE CONTABILIDAD */

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
pkid_presupuesto int auto_increment,
primary key(codigo_tipocuenta, pkid_presupuesto),
FOREIGN KEY (`fk_pkid_presupuesto`) REFERENCES `tblpresupuesto` (`pkid_presupuesto`)
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

/*TABLAS DE COMPRAS */
/*-----Jason Ortega, George Mayén--------*/
create table tblProveedores(
PkId_Proveedores int auto_increment not null,
Nombre_Proveedores varchar(30) not null,
Dpi_Proveedores varchar(20) not null,
Telefono_Proveedores varchar(12) not null,
Nit_Proveedores varchar(20) not null,
Domicilio_PersonalBodega varchar(30) not null,
CorreoElectronico_PersonalBodega varchar(30),
CodigoPostal_Proveedores varchar(6) not null,
primary key(PkId_Proveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega, George Mayén--------*/
create table tblProducto(
PkId_Producto int auto_increment not null,
Nombre_Producto varchar(30) not null,
Descripcion_Producto varchar(50) not null,
FkId_Proveedores int not null,
PrecioUnidad_Producto float not null,
UnidadExistencias_Producto int not null,
primary key(PkId_Producto),
foreign key(FkId_Proveedores) references tblProveedores(PkId_Proveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblPersonalBodega(
PkId_PersonalBodega int auto_increment not null,
Nombre_PersonalBodega varchar(30) not null,
Dpi_PersonalBodega varchar(20) not null,
Puesto_PersonalBodega varchar(20) not null,
Telefono_PersonalBodega varchar(12) not null,
Salario_PersonalBodega float not null,
Nit_PersonalBodega varchar(20) not null,
Domicilio_PersonalBodega varchar(30) not null,
CorreoElectronico_PersonalBodega varchar(30),
primary key(PkId_PersonalBodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblBodega(
PkId_Bodega int auto_increment not null,
Nombre_Bodega varchar(30) not null,
Direccion_Bodega varchar(30) not null,
Telefono_Bodega varchar(12) not null,
FkId_PersonalBodega int not null,
primary key (PkId_Bodega),
foreign key(FkId_PersonalBodega) references tblPersonalBodega(PkId_PersonalBodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCobrador(
PkId_Cobrador int,
Nombre_Cobrador varchar(20),
Dpi_Cobrador varchar(15),
Domicilio_Cobrador varchar(50),
Telefono_Cobrador varchar(15),
Nit_Cobrador varchar(15),
Correo_Cobrador varchar(15),
primary key(PkId_Cobrador)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCliente(
PkId_Cliente int not null,
FkId_Cobrador int,
Nombre_cliente varchar(20),
Domicilio_Cliente varchar(50),
Telefono_Cliente varchar(15),
Correo_Cliente varchar(15),
primary key(PkId_Cliente),
foreign key (FkId_Cobrador) references tblCobrador (PkId_Cobrador)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCuentasPorPagarCobrar(
PkId_CuentasPorPagarCobrar int,
FkId_Cliente int,
FkId_Proveedor int,
Descripcion_CuentasPorPagarCobrar varchar(50),
Tipo_CuentasPorPagarCobrar varchar(15),
Valor_CuentasPorPagarCobrar float,
Fecha_CuentasPorPagarCobrar date,
Estado_CuentasPorPagarCobrar tinyint,
primary key(PkId_CuentasPorPagarCobrar),
foreign key (FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key (FkId_Proveedor) references tblProveedores(PkId_Proveedores)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblFactura(
PkId_Factura int auto_increment not null,
FkId_Producto int not null,
IvaPorCobrar_Factura float not null,
Nit_Factura varchar(20) not null,
FechaDeEmision date not null,
Subtotal_Factura float not null,
Total_Factura float not null,
primary key(PkId_Factura),
foreign key(FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblPago(
PkId_Pago int auto_increment not null,
FkId_Cliente int not null,
Cantidad_Pago float not null,
FkId_Factura int not null,
FechaEmision_Pago date not null,
Descripcion_Pago varchar(50) not null,
primary key(PkId_Pago),
foreign key(FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key(FkId_Factura) references tblFactura(PkId_Factura)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblEncabezadoFactura(
PkId_EncabezadoFactura int,
FkId_Factura int not null,
FkId_Cliente int not null,
Fecha_EncabezadoFactura date not null,
FkId_Pago int not null,
primary key(PkId_EncabezadoFactura),
foreign key(FkId_Factura) references tblFactura(PkId_Factura),
foreign key(FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key(FkId_Pago) references tblPago(PkId_Pago)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblDetalleFactura(
PkId_DetalleFactura int auto_increment not null,
FkId_Factura int not null,
FkId_Producto int not null,
Cantidad_DetalleFactura int not null,
primary key(PkId_DetalleFactura),
foreign key(FkId_Factura) references tblFactura(PkId_Factura),
foreign key(FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblCompras(
PkId_Compras int auto_increment not null,
FkId_Proveedores int not null,
FkId_Producto int not null,
Domicilio_Compras varchar(30) not null,
FkId_Bodega int not null,
Fecha_Compras date not null,
FechaRecepcion_Compras date not null,
primary key(PkId_Compras),
foreign key(FkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key(FkId_Producto) references tblProducto(PkId_Producto),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblDetalleCompras(
PkId_DetalleCompras int auto_increment not null,
FkId_Factura int not null,
FkId_Producto int not null,
FkId_Bodega int not null,
Cantidad_DetalleCompras int not null,
Costo_DetalleCompras float not null,
Total_DetalleCompras float not null,
primary key(PkId_DetalleCompras),
foreign key(FkId_Factura) references tblFactura(PkId_Factura),
foreign key(FkId_Producto) references tblProducto(PkId_Producto),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblEncabezadoCompras(
PkId_EncabezadoCompras int not null,
FkId_Factura int not null,
FkId_Bodega int not null,
FkId_Proveedores int not null,
FechaEmision_EncabezadoCompras date not null,
FechaVencimiento_EncabezadoCompras date not null,
FkId_CuentasPorPagarCobrar int not null,
EstatusFactura_EncabezadoCompras tinyint,
primary key(PkId_EncabezadoCompras),
foreign key(FkId_Factura) references tblFactura(PkId_Factura),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega),
foreign key(FkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key(FkId_CuentasPorPagarCobrar) references tblCuentasPorPagarCobrar(PkId_CuentasPorPagarCobrar)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblOrdenDeCompras(
PkId_OrdenDeCompras int auto_increment not null,
FkId_Compras int not null,
primary key(PkId_OrdenDeCompras),
foreign key(FkId_Compras) references tblCompras(PkId_Compras)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblEncabezadoOrdenCompras(
PkId_EncabezadoOrdenCompras int not null,
FkId_OrdenDeCompras int not null,
FkId_Bodega int not null,
FkId_Proveedores int not null,
FechaEmision_EncabezadoOrdenCompras date not null,
FechaEntrega_EncabezadoOrdenCompras date not null,
FkId_CuentasPorPagarCobrar int not null,
EstatusOrdenCompras_EncabezadoOrdenCompras tinyint,
foreign key(FkId_OrdenDeCompras) references tblOrdenDeCompras(PkId_OrdenDeCompras),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega),
foreign key(FkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key(FkId_CuentasPorPagarCobrar) references tblCuentasPorPagarCobrar(PkId_CuentasPorPagarCobrar)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblDetalleOrdenDeCompras(
PkId_DetalleOrdenCompras int auto_increment not null,
FkId_OrdenDeCompras int not null,
FkId_Producto int not null,
FkId_Bodega int not null,
Cantidad_DetalleOrdenCompras int not null,
Costo_DetalleOrdenCompras int not null,
Total_DetalleOrdenCompras int not null,
primary key(PkId_DetalleOrdenCompras),
foreign key(FkId_OrdenDeCompras) references tblOrdenDeCompras(PkId_OrdenDeCompras),
foreign key(FkId_Producto) references tblProducto(PkId_Producto),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblVendedor(
PkId_Vendedor int,
Nombre_Vendedor varchar(20),
Dpi_Vendedor varchar(15),
Domicilio_Vendedor varchar(50),
Telefono_Vendedor varchar(15),
Nit_Vendedor varchar(15),
Correo_Vendedor varchar(15),
primary key(PkId_Vendedor)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCobrosDelDia(
PkId_CobrosDelDia int,
FkId_Cliente int,
FkId_Vendedor int,
FechaCorteCobrosDelDia date,
primary key(PkId_CobrosDelDia),
foreign key (FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key (FkId_Vendedor) references tblVendedor(PKId_Vendedor)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblVentas(
PkId_Ventas int,
FkId_Vendedor int,
FkId_Cliente int,
FkId_Factura int,
Descripcion_Ventas varchar(50),
Fecha_Ventas date,
primary key(PKId_Ventas),
foreign key (FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key (FkId_Vendedor) references tblVendedor(PkId_Vendedor),
foreign key (FkId_Cliente) references tblCliente(PkId_Cliente),
foreign key (FkId_Factura) references tblFactura(PkId_Factura)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblMovimientoProveedores(
PkId_MovimientoProveedores int, 
FkId_Proveedor int,
FkId_Producto int,
RubroGiro_MovimientoProveedores varchar(50),
Servicios_MovimientoProveedores varchar(50),
primary key(PKId_MovimientoProveedores),
foreign key (FkId_Proveedor) references tblProveedores(PkId_Proveedores),
foreign key (FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*George Mayén 0901-19-11383*/
create table tblCuentaCorriente(
PkId_CuentaCorriente int not null,
FkId_Cliente int not null,
Descripcion_CuentaCorriente varchar(50),
Periodo_CuentaCorriente datetime,
Debito_CuentaCorriente float,
Credito_CuentaCorriente float,
Saldo_CuentaCorriente float,
primary key (PkId_CuentaCorriente),
foreign key (FkId_Cliente) references tblCliente(PkId_Cliente)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*TABLAS DE BANCOS*/
CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_bancos` (
  Pk_idbancos INT NOT NULL,
  nombreBanco VARCHAR(25) NULL,
  direccion VARCHAR(45) NULL,
  contacto VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idbancos`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Reportes` (
  `Pk_idReportes` INT NOT NULL,
  `fechas` DATE NULL,
  `conceptoR` VARCHAR(45) NULL,
  `NombreR` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(45) NULL,
  `BancoR` INT NULL,
  PRIMARY KEY (`Pk_idReportes`),
  CONSTRAINT `fkbanco`
    FOREIGN KEY (`BancoR`)
    REFERENCES `Bancos`.`Tbl_bancos` (`Pk_idbancos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `fkbanco_idx` ON `Bancos`.`Tbl_Reportes` (`BancoR` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Reg_tipoCambio` (
  `Pk_fecha` DATE NOT NULL,
  `compra` FLOAT NULL,
  `venta` FLOAT NULL,
  `Moneda` VARCHAR(20) NULL,
  `reporteCambio` INT NULL,
  PRIMARY KEY (`Pk_fecha`),
  CONSTRAINT `fkrepor`
    FOREIGN KEY (`reporteCambio`)
    REFERENCES `Bancos`.`Tbl_Reportes` (`Pk_idReportes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `repor_idx` ON `Bancos`.`Tbl_Reg_tipoCambio` (`reporteCambio` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Cuentas` (
  `Pk_idCuentas` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `estado_cta` VARCHAR(15) NOT NULL,
  `Saldos_cta` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idCuentas`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_tiposMov` (
  `Pk_idTipoMov` INT NOT NULL,
  `ConceptoTipo` VARCHAR(15) NULL,
  `DescripcionTipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idTipoMov`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Movimientos` (
  `Pk_idMovimientos` INT NOT NULL,
  `tipo_mov` INT NULL,
  `fecha_reg` DATE NULL,
  `forma_pago` VARCHAR(20) NULL,
  `Cuenta_rela` INT NULL,
  `Monto` FLOAT NULL,
  `iva` FLOAT NULL,
  PRIMARY KEY (`Pk_idMovimientos`),
  CONSTRAINT `fktipo`
    FOREIGN KEY (`tipo_mov`)
    REFERENCES `Bancos`.`Tbl_tiposMov` (`Pk_idTipoMov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkcuentass`
    FOREIGN KEY (`Cuenta_rela`)
    REFERENCES `Bancos`.`Tbl_Cuentas` (`Pk_idCuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `tipo_idx` ON `Bancos`.`Tbl_Movimientos` (`tipo_mov` ASC) VISIBLE;

CREATE INDEX `cuentass_idx` ON `Bancos`.`Tbl_Movimientos` (`Cuenta_rela` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Ctrl_cheques` (
  `Pk_idControl_cheques` INT NOT NULL,
  `concepto` VARCHAR(45) NULL,
  `monto` INT NULL,
  `cta_beneficiaria` INT NULL,
  `fecha` DATE NULL,
  `Banco` INT NULL,
  PRIMARY KEY (`Pk_idControl_cheques`),
  CONSTRAINT `fkcuenta`
    FOREIGN KEY (`cta_beneficiaria`)
    REFERENCES `Bancos`.`Tbl_Cuentas` (`Pk_idCuentas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkbancos`
    FOREIGN KEY (`Banco`)
    REFERENCES `Bancos`.`Tbl_bancos` (`Pk_idbancos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `cuenta_idx` ON `Bancos`.`Tbl_Ctrl_cheques` (`cta_beneficiaria` ASC) VISIBLE;

CREATE INDEX `bancos_idx` ON `Bancos`.`Tbl_Ctrl_cheques` (`Banco` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Conciliacion` (
  `Pk_idConciliacion` INT NOT NULL,
  `fecha_reg` DATE NULL,
  `descripcion` VARCHAR(45) NULL,
  `movimientos` INT NULL,
  PRIMARY KEY (`Pk_idConciliacion`),
  CONSTRAINT `fkmovi`
    FOREIGN KEY (`movimientos`)
    REFERENCES `Bancos`.`Tbl_Movimientos` (`Pk_idMovimientos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX `fkmovi_idx` ON `Bancos`.`Tbl_Conciliacion` (`movimientos` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `Bancos`.`Tbl_Disponibilidad` (
  Pk_idDispo INT NOT NULL,
  fecha_dispo DATE NULL,
  SaldoDispo FLOAT NULL,
  Comentario VARCHAR(45) NULL,
  cuentaDispo INT NULL,
  PRIMARY KEY (Pk_idDispo),
  CONSTRAINT fkcuenta
    FOREIGN KEY (cuentaDispo)
    REFERENCES `Bancos`.`Tbl_Cuentas` (Pk_idCuentas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;





