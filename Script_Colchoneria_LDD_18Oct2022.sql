/*BASE DE DATOS COLCHONERÍA*/
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
	nombre_consulta varchar(50) not null,
    tabla_consulta varchar(50) not null,
    campos_consultas varchar(50) not null,
    alias_consultas varchar(50) not null,
    cadena_consultas varchar(80) not null,
    PkId INT NOT NULL,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
 
CREATE TABLE IF NOT EXISTS tbl_consultainteligente1 (
 operador_consulta varchar(50) not null,
    campos_consulta varchar(50) not null,
    valor_consultas varchar(50) not null,
    PkId INT NOT NULL,   
    metodo varchar(50) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS tbl_consultainteligente2 (
    PkId INT NOT NULL,
    ordenar_consulta varchar(50) not null,
    campo_consulta varchar(50) not null,    
    metodo varchar(50) not null,
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
create table tblBodega(
PkId_Bodega int not null,
Direccion_Bodega varchar(30) not null,
Telefono_Bodega varchar(15) not null,
primary key(PkId_Bodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblClientes(
PkId_Clientes int not null,
Dpi_Clientes varchar(20),
Nit_Clientes varchar(20),
Nombre_Clientes varchar(20),
Domicilio_Clientes varchar(50),
Telefono_Cliente varchar(15),
Correo_Cliente varchar(15),
primary key(PkId_Clientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblProveedores(
PkId_Proveedores int not null,
Nombre_Proveedores varchar(30) not null,
Nit_Proveedores varchar(20) not null,
Telefono_Proveedores varchar(12) not null,
Domicilio_Proveedores varchar(30) not null,
Correo_Proveedores varchar(20),
RubroGiro_Proveedores varchar(20),
primary key(PkId_Proveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblEmpleados(
PkId_Empleados int not null,
NombreCompleto_Empleados varchar(50),
Telefono_Empleados varchar(15),
Puesto_Empleados varchar(15),
Direccion_Empleados varchar(50),
Correo_Empleados varchar(20),
primary key(PkId_Empleados)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblSucursal(
PkId_Sucursal int not null,
primary key(PkId_Sucursal)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblSerie(
PkId_Serie int not null,
primary key(PkId_Serie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblCertificacionFacturacion(
PkId_CertificacionFacturacion int not null,
primary key(PkId_CertificacionFacturacion)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblProducto(
PkId_Producto int not null,
Nombre_Producto varchar(30) not null,
Descripcion_Producto varchar(50) not null,
FkId_Bodega int not null,
FkId_Proveedores int not null,
PrecioUnidad_Producto float not null,
primary key(PkId_Producto),
foreign key(FkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key(FkId_Bodega) references tblBodega(PkId_Bodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblComprasEncabezado(
PkId_ComprasEncabezado int not null,
FkId_Sucursal int,
FkId_Serie int,
FkId_Proveedores int  not null,
FechaCompra_ComprasEncabezado date,
FechaVencimiento_ComprasEncabezado date,
Total_ComprasEncabezado float not null,
primary key (PkId_ComprasEncabezado),
foreign key (FkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key (FkId_Sucursal) references tblSucursal(PkId_Sucursal),
foreign key (FkId_Serie) references tblSerie(PkId_Serie)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblEncabezadoPedido(
PkId_EncabezadoPedido int not null,
FechaEntrega_EncabezadoPedido date,
EstatusOrdenCompra_EncabezadoPedido tinyint,
primary key(PkId_EncabezadoPedido)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblPagoProveedores(
PkId_PagoProveedores int not null,
FkId_ComprasEncabezado int not null,
TipoPago_PagoProveedores varchar(15) not null,
Total_PagoProveedores float not null,
primary key(PkId_PagoProveedores),
foreign key (FkId_ComprasEncabezado) references tblComprasEncabezado(PkId_ComprasEncabezado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblVentasEncabezado(
PkId_VentasEncabezado int not null,
FkId_Sucursal int not null,
FkId_Serie int not null,
/*FkId_Asociacion int,*/
FechaVenta_VentasEncabezado date,
FechaVencimiento_VentasEncabezado date, 
Total_VentasEncabezado int,
primary key (PkId_VentasEncabezado),
foreign key (FkId_Sucursal) references tblSucursal(PkId_Sucursal),
foreign key (FkId_Serie) references tblSerie(PkId_Serie)
/*foreign key (FkId_Asociacion) references tblAsociacion(PkId_Asociacion)*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblDetalleVenta(
PkId_DetalleVenta int not null,
FkId_Producto int not null,
FkId_Sucursal int not null,
FkId_Serie int not null,
FkId_EncabezadoPedido int not null,
PrecioProducto_DetalleVenta float not null,
Cantidad_DetalleVenta int, 
Costo_DetalleVenta float not null,
Total_DetalleVenta int, 
FkId_CertificacionFacturacion int,
primary key (PkId_DetalleVenta),
foreign key (FkId_Producto) references tblProducto(PkId_Producto),
foreign key (FkId_Sucursal) references tblSucursal(PkId_Sucursal),
foreign key (FkId_Serie) references tblSerie(PkId_Serie),
foreign key (FkId_EncabezadoPedido) references tblEncabezadoPedido(PkId_EncabezadoPedido),
foreign key (FkId_CertificacionFacturacion) references tblCertificacionFacturacion(PkId_CertificacionFacturacion)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblPagoClientes(
PkId_PagoClientes int not null,
FkId_VentasEncabezado int not null,
TipoPago_PagoClientes varchar(15),
Total_PagoClientes float,
primary key(PkId_PagoClientes),
foreign key (FkId_VentasEncabezado) references tblVentasEncabezado(PkId_VentasEncabezado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblFacturaClientes(
PkId_FacturaClientes int not null, 
FkId_VentasEncabezado int not null,
Nit_FacturaCliente varchar(20),
FechaEmision_FacturaClientes date not null,
/*FkId_Asociacion int,*/
Total_FacturaCliente float,
primary key (PkId_FacturaClientes),
foreign key (FkId_VentasEncabezado) references tblVentasEncabezado(PkId_VentasEncabezado)
/*foreign key (FkId_Asociacion) references tblAsociacion(PkId_Asociacion) */
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblDetalleFacturaClientes(
PkId_FacturaClientes int  not null,
FkId_Producto int,
Cantidad int,
IvaPorCobrar_DetalleFacturaCliente float,
subtotal_DetalleFacturaCliente float not null,
foreign key (PkId_FacturaClientes) references tblFacturaClientes(PkId_FacturaClientes),
foreign key (FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblVendedores(
PkId_Vendedores int not null,
FkId_Empleados int not null,
FkId_FacturaClientes int not null,
CantidadVentas_Vendedores int,
primary key(PkId_Vendedores),
foreign key (FkId_Empleados) references tblEmpleados(PkId_Empleados),
foreign key (FkId_FacturaClientes) references tblFacturaClientes(PkId_FacturaClientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblReciboClientes(
PkId_ReciboClientes int auto_increment not null,
FkId_VentasEncabezado int not null,
Nit_ReciboClientes varchar(20) not null,
fechaEmision_ReciboClientes date not null,
primary key (PkId_ReciboClientes),
foreign key (FkId_VentasEncabezado) references tblVentasEncabezado(PkId_VentasEncabezado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblDetalleReciboClientes(
PkId_ReciboClientes int not null,
FkId_Producto int not null,
Cantidad_DetalleReciboClientes int not null,
Iva_DetalleReciboClientes float not null,
Subtotal_DetalleReciboClientes float not null,
foreign key(PkId_ReciboClientes) references tblReciboClientes(PkId_ReciboClientes),
foreign key(FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblCajaClientes(
PkId_CajaClientes int not null,
FkId_PagoClientes int not null,
Saldo float not null,
FkId_FacturaClientes int not null,
FkId_ReciboClientes int not null,
primary key(PkId_CajaClientes),
foreign key(FkId_PagoClientes) references tblPagoClientes(PkId_PagoClientes),
foreign key(FkId_FacturaClientes) references tblFacturaClientes(PkId_FacturaClientes),
foreign key(FkId_ReciboClientes) references tblReciboClientes(PkId_ReciboClientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblDetallePedido(
PkId_EncabezadoPedido int not null,
FkId_Bodega int not null,
CantidadDetalle_DetallePedido int,
CostoDetalle_DetallePedido float,
TotalDetalle_DetallePedido float,
foreign key (PkId_EncabezadoPedido) references tblEncabezadoPedido(PkId_EncabezadoPedido),
foreign key (FkId_Bodega) references tblBodega(PkId_Bodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblMovimientoClientes(
PkId_Clientes int not null,
FkId_PagoClientes int not null,
Importe_MovimientoClientes float,
Abonos_MovimientoClientes float,
Saldo_MovimientoClientes float,
foreign key (PkId_Clientes) references tblClientes(PkId_Clientes),
foreign key (FkId_PagoClientes) references tblPagoClientes(PkId_PagoClientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCobrador(
PkId_Cobrador int not null,
FkId_Empleados int not null,
FkId_FacturaClientes int not null,
CantidadCobros_Cobrador int not null,
primary key(PkId_Cobrador),
foreign key (FkId_Empleados) references tblEmpleados(PkId_Empleados),
foreign key(FkId_FacturaClientes) references tblFacturaClientes(PkId_FacturaClientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblEncabezadoOrdenCompra(
PkId_EncabezadoOrdenCompra int not null,
FechaEntrega_EncabezadoOrdenCompra date,
Estatus_EncabezadoOrdenCompra tinyint,
primary key(PkId_EncabezadoOrdenCompra)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblDetalleCompra(
PkId_ComprasEncabezado int  not null,
FkId_Producto int not null,
FkId_Sucursal int not null,
FkId_Serie int not null,
FkId_EncabezadoOrdenCompra int not null,
Precio_DetalleCompra float,
Cantidad_DetalleCompra int not null,
Costo_DetalleCompra float,
Total_DetalleCompra float,
FkId_CertificacionFacturacion int not null,
foreign key (PkId_ComprasEncabezado) references tblComprasEncabezado(PkId_ComprasEncabezado),
foreign key (FkId_Producto) references tblProducto(PkId_Producto),
foreign key (FkId_Sucursal) references tblSucursal(PkId_Sucursal),
foreign key (FkId_EncabezadoOrdenCompra) references tblEncabezadoOrdenCompra(PkId_EncabezadoOrdenCompra),
foreign key (FkId_Serie) references tblSerie(PkId_Serie),
foreign key (FkId_CertificacionFacturacion) references tblCertificacionFacturacion(PkId_CertificacionFacturacion)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblFacturaProveedores(
PkId_FacturaProveedores int  not null,
FkId_ComprasEncabezado int,
Nit_FacturaProveedores varchar(20) not null,
fechaEmision_FacturaProveedor date,
/*FkId_Asociacion varchar(20),*/
total_FacturaProveedor float not null,
primary key (PkId_FacturaProveedores),
foreign key (FkId_ComprasEncabezado) references tblComprasEncabezado(PkId_ComprasEncabezado)
/*foreign key (FkId_Asociacion) references tblAsociacion(PkId_Asociacion)*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblDetalleFacturaProveedores(
PkId_FacturaProveedores int  not null,
FkId_Producto int not null,
Cantidad_DetalleFacturaProveedores int not null,
IvaPorPagar_DetalleFacturaProveedores int,
Total_DetalleFacturaProveedores float,
foreign key (FkId_Producto) references tblProducto(PkId_Producto),
foreign key (PkId_FacturaProveedores) references tblFacturaProveedores(PkId_FacturaProveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Cristian Jocol 0901-19-17747*/
create table tblReciboProveedores(
PkId_ReciboProveedores int  not null,
FkId_ComprasEncabezado int not null,
Nit_ReciboProveedores varchar(20) not null,
FechaEmision_ReciboProveedores date not null,
primary key (PkId_ReciboProveedores),
foreign key (FkId_ComprasEncabezado) references tblComprasEncabezado(PkId_ComprasEncabezado)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblDetalleReciboProveedores(
PkId_ReciboProveedores int not null,
FkId_Producto int not null,
Cantidad_DetalleReciboProveedores int not null,
Iva_DetalleReciboProveedores float not null,
Subtotal_DetalleReciboProveedores float not null,
foreign key(PkId_ReciboProveedores) references tblReciboProveedores(PkId_ReciboProveedores),
foreign key(FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblCajaProveedores(
PkId_CajaProveedores int not null,
FkId_PagoProveedores int not null,
Saldo float not null,
FkId_FacturaProveedores int not null,
FkId_ReciboProveedores int not null,
primary key(PkId_CajaProveedores),
foreign key(FkId_PagoProveedores) references tblPagoProveedores(PkId_PagoProveedores),
foreign key(FkId_FacturaProveedores) references tblFacturaProveedores(PkId_FacturaProveedores),
foreign key(FkId_ReciboProveedores) references tblReciboProveedores(PkId_ReciboProveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblDetalleOrdenCompra(
PkId_EncabezadoOrdenCompra int not null,
FkId_Bodega int not null,
Cantidad_DetalleOrdenCompra int,
Costo_DetalleOrdenCompra float,
Total_DetalleOrdenCompra float,
foreign key (PkId_EncabezadoOrdenCompra) references tblEncabezadoOrdenCompra(PkId_EncabezadoOrdenCompra),
foreign key (FkId_Bodega) references tblBodega(PkId_Bodega)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblMovimientoProveedores(
PkId_Proveedores int not null,
FkId_PagoProveedores int not null,
Importe_MovimientoProveedores float not null,
Abonos_MovimientoProveedores float not null,
Saldo_MovimientoProveedores float not null,
foreign key (PkId_Proveedores) references tblProveedores(PkId_Proveedores),
foreign key (FkId_PagoProveedores) references tblPagoProveedores(PkId_PagoProveedores)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblCotizaciones(
PkId_Cotizaciones int not null,
FkId_Vendedores int not null,
FkId_Clientes int not null,
Descripcion_Cotizaciones varchar(50),
FechaEmision_Cotizaciones date,
FechaVencimiento_Cotizaciones date,
Cuotas_Cotizaciones float,
Total_Cotizaciones float,
primary key(PkId_Cotizaciones),
foreign key (FkId_Vendedores) references tblVendedores(PkId_Vendedores),
foreign key (FkId_Clientes) references tblClientes(PkId_Clientes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*George Mayén 0901-19-11383*/
create table tblDetalleCotizaciones(
PkId_Cotizaciones int not null,
FkId_Producto int not null,
Cantidad_DetalleCotizaciones float,
Total_DetalleCotizaciones float,
foreign key (PkId_Cotizaciones) references tblCotizaciones(PkId_Cotizaciones),
foreign key (FkId_Producto) references tblProducto(PkId_Producto)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*-----Jason Ortega 0901-19-22658--------*/
create table tblComision(
PkId_Comision int not null,
FkId_Empleados int not null,
FkId_VentasEncabezado int not null,
Bono_Comision float,
primary key(PkId_Comision),
foreign key (FkId_Empleados) references tblEmpleados(PkId_Empleados),
foreign key (FkId_VentasEncabezado) references tblVentasEncabezado(PkId_VentasEncabezado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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

CREATE TABLE IF NOT EXISTS `Tbl_tiposMov` (
  `Pk_idTipoMov` INT NOT NULL,
  `Concepto_Tipo` VARCHAR(15) NULL,
  `Descripcion_Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Pk_idTipoMov`)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  CREATE TABLE IF NOT EXISTS `Tbl_ConceptosBancario` (
  `Pk_idConcepto` INT NOT NULL,
  `Nombre_cbancario` DATE NULL,
  `PorcentajeIva` float null,
  `Clasificacion` VARCHAR(5) NOT NULL,
  `Estado` TINYINT DEFAULT 0,
  PRIMARY KEY (`Pk_idConcepto`)
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
  FOREIGN KEY (`fk_id_cuentabancaria`) REFERENCES `Tbl_Cuentas` (`Pk_idCuentas`),
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




