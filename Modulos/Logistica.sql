create database bd_logistica;
drop database bd_logistica;
use bd_logistica;

create table tbl_marca (
pk_codigo_marca int not null primary key auto_increment,
nombre_marca varchar(100)
);

create table tbl_linea (
pk_codigo_linea int not null primary key auto_increment,
nombre_linea varchar(100)
);

create table tbl_bodega (
pk_codigo_bodega int not null primary key auto_increment,
nombre_bodega varchar(100),
estatus_bodega varchar(1)
);

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
);

create table tbl_exisbodega (
fk_codigo_bodega int not null,
fk_codigo_producto int not null,
existencia float (100,2),
foreign key (fk_codigo_bodega) references tbl_bodega (pk_codigo_bodega),
foreign key (fk_codigo_producto) references tbl_producto (pk_codigo_producto),
primary key (fk_codigo_bodega, fk_codigo_producto)
);

create table tbl_movimientos(
pk_kardex int not null primary key auto_increment,
fecha date,
detalle varchar(100),
fk_producto int not null,
cantidad int not null,
foreign key (fk_producto) references tbl_producto(pk_codigo_producto)
);

create table tbl_lote(
pk_codigo_lote int not null primary key auto_increment, -- uno a varios --
fk_codigo_producto int not null,
cantidad int not null,
foreign key (fk_codigo_producto) references tbl_producto (pk_codigo_producto)
);

create table tbl_transporte(
pk_codigo_transporte int not null primary key auto_increment,
marca varchar(100),
tipo varchar(100),
peso int not null,
estado bool
);

create table tbl_ruta(
pk_codigo_ruta int not null primary key auto_increment,
zona varchar(100),
ciudad varchar(100),
descripcion varchar(100)
);

create table tbl_conductor(
pk_conductor int not null primary key auto_increment,
nombre varchar(100),
estado bool
);

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
);

create table tbl_ventap (
pk_venta int not null primary key auto_increment,
fk_producto int not null,
cantidad int,
foreign key (fk_producto) references tbl_producto (pk_codigo_producto)
);

create table tbl_comprap (
pk_compra int not null primary key auto_increment,
fk_producto int not null,
cantidad int,
foreign key (fk_producto) references tbl_producto (pk_codigo_producto)
);

insert into tbl_marca(nombre_marca) values ("APPLE");
insert into tbl_marca(nombre_marca) values ("ANDROID");
insert into tbl_marca(nombre_marca) values ("WINDOWS");

insert into tbl_linea(nombre_linea) values ("TV");
insert into tbl_linea(nombre_linea) values ("SMARTHPHONE");
insert into tbl_linea(nombre_linea) values ("COMPUTADORA");


-- agregar (listo)multi bodegas, (triggers falta)/(tabla listo)movimientos(salidas, entradas), (listo)lineas, marcas
