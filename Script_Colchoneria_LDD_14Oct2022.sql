/*BASE DE DATOS COLCHONERÍA*/
DROP DATABASE  IF EXISTS `colchoneria`;
CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;
/*SEGURIDAD*/
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

/*CONSULTA INTELIGENTE*/
CREATE TABLE IF NOT EXISTS tbl_consultainteligente (
 nombre_consulta varchar(40) not null,
    tabla_consulta varchar(40) not null,
    campos_consultas varchar(15) not null,
    alias_consultas varchar(15) not null,
    PkId INT NOT NULL,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente1; 
CREATE TABLE IF NOT EXISTS tbl_consultainteligente1 (
 operador_consulta varchar(40) not null,
    campos_consulta varchar(40) not null,
    valor_consultas varchar(15) not null,
    PkId INT NOT NULL,   
    metodo varchar(15) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente2;
CREATE TABLE IF NOT EXISTS tbl_consultainteligente2 (
    PkId INT NOT NULL,
    ordenar_consulta varchar(40) not null,
    campo_consulta varchar(40) not null,    
    metodo varchar(15) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


/*MODULOS*/
/*LOGISTICA*/
create table tbl_marca (
pk_codigo_marca int not null primary key auto_increment,
nombre_marca varchar(100)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_linea (
pk_codigo_linea int not null primary key auto_increment,
nombre_linea varchar(100)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_bodega (
pk_codigo_bodega int not null primary key auto_increment,
nombre_bodega varchar(100),
estatus_bodega varchar(1)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_producto(
pk_codigo_producto int not null primary key auto_increment,
codigo_referencia varchar(100),
descripcion varchar(100),
fk_linea_inventario int not null, 
tipo varchar(50),
fk_marca int not null, 
existencia float (100,2),
costo_compra int,
precio_venta int,
estatus_producto varchar(1),
foreign key (fk_marca) references tbl_marca (pk_codigo_marca),
foreign key (fk_linea_inventario) references tbl_linea (pk_codigo_linea)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_exisbodega (
fk_codigo_bodega int not null,
fk_codigo_producto int not null,
existencia float (100,2),
foreign key (fk_codigo_bodega) references tbl_bodega (pk_codigo_bodega),
foreign key (fk_codigo_producto) references tbl_producto (pk_codigo_producto),
primary key (fk_codigo_bodega, fk_codigo_producto)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_movimientos(
pk_kardex int not null primary key auto_increment,
fecha date,
detalle varchar(100),
fk_producto int not null,
cantidad int not null,
foreign key (fk_producto) references tbl_producto(pk_codigo_producto)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_lote(
pk_codigo_lote int not null primary key auto_increment, -- uno a varios --
fk_codigo_producto int not null,
cantidad int not null,
foreign key (fk_codigo_producto) references tbl_producto (pk_codigo_producto)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_transporte(
pk_codigo_transporte int not null primary key auto_increment,
marca varchar(100),
tipo varchar(100),
peso int not null,
estado bool
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_ruta(
pk_codigo_ruta int not null primary key auto_increment,
zona varchar(100),
ciudad varchar(100),
descripcion varchar(100)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_conductor(
pk_conductor int not null primary key auto_increment,
nombre varchar(100),
estado bool
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_envio(
pk_envio int not null primary key auto_increment,
fk_transporte int not null,
fk_ruta int not null,
fk_conductor int not null,
tiempo_estimado varchar(100),
fecha_entrega datetime,
fk_lote int not null,
fk_bodega int not null,
cliente varchar(100),
observaciones varchar(100),
destino varchar(100),
foreign key (fk_transporte) references tbl_transporte (pk_codigo_transporte),
foreign key (fk_ruta) references tbl_ruta (pk_codigo_ruta),
foreign key (fk_conductor) references tbl_conductor (pk_conductor),
foreign key (fk_lote) references tbl_lote (pk_codigo_lote),
foreign key (fk_bodega) references tbl_bodega (pk_codigo_bodega)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_ventap (
pk_venta int not null primary key auto_increment,
fk_producto int not null,
cantidad int,
foreign key (fk_producto) references tbl_producto (pk_codigo_producto)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

create table tbl_comprap (
pk_compra int not null primary key auto_increment,
fk_producto int not null,
cantidad int,
foreign key (fk_producto) references tbl_producto (pk_codigo_producto)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

/*COMPRASYVENTAS*/
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

/*PRODUCCION*/
CREATE TABLE IF NOT EXISTS `tbl_recetas` (
  `pk_idrecetas_tbl_recetas` int NOT NULL,
  `producto_tbl_recetas` varchar(45) NOT NULL,
  `nombre_material_tbl_recetas` varchar(100) NOT NULL,
  `cantidad_tbl_recetas` varchar(100) NOT NULL,
  PRIMARY KEY (`pk_idrecetas_tbl_recetas`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `pk_idordenes_tbl_ordenes` int NOT NULL,
  `fk_idreceta_tbl_ordenes` int NOT NULL,
  `prioridad_tbl_ordenes` varchar(45) NOT NULL,
  `producto_fabricar_tbl_ordenes` varchar(45) DEFAULT NULL,
  `fechaini_tbl_ordenes` date DEFAULT NULL,
  `fechaent` date DEFAULT NULL,
  PRIMARY KEY (`pk_idordenes_tbl_ordenes`),
  FOREIGN KEY (`fk_idreceta_tbl_ordenes`) REFERENCES `tbl_recetas` (`pk_idrecetas_tbl_recetas`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS`_tbl_procesoprod` (
  `pk_codigo_proceso_tbl_procesoprod` int NOT NULL,
  `fk_idordenes_tbl_procesoprod` int NOT NULL,
  `producto_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `cantidad_fabricar_tbl_procesoprod` varchar(60) NOT NULL,
  `fecha_entrega_tbl_procesoprod` varchar(20) NOT NULL,
  `proceso_pro_tbl_procesoprod` varchar(10) NOT NULL,
  `estado_orden_tbl_procesoprod` varchar(1) NOT NULL,
  PRIMARY KEY (`pk_codigo_proceso_tbl_procesoprod`),
  FOREIGN KEY (`fk_idordenes_tbl_procesoprod`) REFERENCES `tbl_ordenes` (`pk_idordenes_tbl_ordenes`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
/*NOMINAS*/
CREATE TABLE IF NOT EXISTS `tbl_departamentos` (
	pk_id_departamento  INT AUTO_INCREMENT NOT NULL,
    nombre_departamento VARCHAR(25) NOT NULL,
    descripcion_departamento  VARCHAR(75) NOT NULL,
    estado_departamento TINYINT DEFAULT 0,
    primary key (`pk_id_departamento`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_puestosdetrabajo`; -- LEONEL DOMINGUEZ
CREATE TABLE IF NOT EXISTS `tbl_puestosdetrabajo` (
	pk_id_puesto INT AUTO_INCREMENT NOT NULL,
    nombre_puesto VARCHAR(25) NOT NULL,
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

DROP TABLE IF EXISTS `tbl_prestacionesydeducciones`;
CREATE TABLE IF NOT EXISTS `tbl_prestacionesydeducciones` (
	pk_id_prestdeduc INT AUTO_INCREMENT NOT NULL,
    nombre_prestdeduc VARCHAR(25) NOT NULL,
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
	pk_id_horasextras INT AUTO_INCREMENT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    fecha_horasextras DATE NOT NULL,
    cantidadHorasr_horasextras FLOAT NOT NULL,
    primary key (`pk_id_horasextras`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_controlfaltas`;
CREATE TABLE IF NOT EXISTS `tbl_controlfaltas` (
	pk_id_faltas INT AUTO_INCREMENT NOT NULL,
    fk_clave_empleado INT NOT NULL, 
    fecha_falta DATE NOT NULL,
    mes_falta INT NOT NULL,
    justificacion_falta VARCHAR(50),
    primary key (`pk_id_faltas`),
    FOREIGN KEY (`fk_clave_empleado`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacionpuestodepartamento`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionpuestodepartamento` (
	fk_id_puesto INT NOT NULL,
	fk_id_departamento  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_departamento`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_departamento`) REFERENCES `tbl_departamentos` (`pk_id_departamento`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacionpuestotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacionpuestotrabajador` (
	fk_id_puesto INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_puesto`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_puesto`) REFERENCES `tbl_puestosdetrabajo` (`pk_id_puesto`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacioncontratoprestdeduc`;
CREATE TABLE IF NOT EXISTS `tbl_asignacioncontratoprestdeduc` (
	fk_id_contrato INT NOT NULL,
	fk_id_prestdeduc  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_prestdeduc`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_prestdeduc`) REFERENCES `tbl_prestacionesydeducciones` (`pk_id_prestdeduc`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tbl_asignacioncontratotrabajador`;
CREATE TABLE IF NOT EXISTS `tbl_asignacioncontratotrabajador` (
	fk_id_contrato INT NOT NULL,
	fk_id_trabajador  INT NOT NULL,
    primary key (`fk_id_contrato`, `fk_id_trabajador`),
	FOREIGN KEY (`fk_id_contrato`) REFERENCES `tbl_contrato` (`pk_id_contrato`),
    FOREIGN KEY (`fk_id_trabajador`) REFERENCES `tbl_trabajador` (`pk_id_trabajador`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

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
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

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
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

/*BANCOS*/
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
  `Saldos_cta` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idCuentas`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_tiposMov` (
  `Pk_idTipoMov` INT NOT NULL,
  `Concepto_Tipo` VARCHAR(15) NULL,
  `Descripcion_Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idTipoMov`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Movimientos_bancos` (
  `Pk_idMovimientos` INT NOT NULL,
  `tipo_mov` INT NULL,
  `fecha_reg` DATE NULL,
  `forma_pago` VARCHAR(20) NULL,
  `Cuenta_rela` INT NULL,
  `Monto` FLOAT NULL,
  `iva` FLOAT NULL,
PRIMARY KEY (`Pk_idMovimientos`),
FOREIGN KEY (`tipo_mov`) REFERENCES `Tbl_tiposMov` (`Pk_idTipoMov`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `Tbl_Ctrl_cheques` (
  `Pk_idControl_cheques` INT NOT NULL,
  `concepto_cheques` VARCHAR(45) NULL,
  `monto_cheques` INT NULL,
  `cta_beneficiaria_cheques` INT NULL,
  `fecha_cheques` DATE NULL,
  `Banco_cheques` INT NULL,
  PRIMARY KEY (`Pk_idControl_cheques`),
  FOREIGN KEY (`cta_beneficiaria_cheques`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`),
    FOREIGN KEY (`Banco_cheques`) REFERENCES `Tbl_bancos` (`Pk_idbancos`)
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

/*CONTABILIDAD*/
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




