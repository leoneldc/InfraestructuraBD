USE `colchoneria`;
/*-----Jason Ortega 0901-19-22658--------*/
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



/*-----Jason Ortega 0901-19-22658--------*/
/*create table tblAsociacion(
PkId_Asociacion int not null,
FkId_Vendedores int not null,
FkId_Clientes int not null,
primary key(PkId_Asociacion),
foreign key(FkId_Vendedores) references tblVendedores(PkId_Vendedores),
foreign key(FkId_Clientes) references tblClientes(PkId_Clientes)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; */

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



