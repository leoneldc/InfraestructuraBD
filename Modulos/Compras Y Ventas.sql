<<<<<<< HEAD
CREATE DATABASE IF NOT EXISTS `colchoneria`;
USE `colchoneria`;

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
=======
USE `colchoneria`;
>>>>>>> a257c89b32cae4c48478569fc69e3435d7cc83f0
