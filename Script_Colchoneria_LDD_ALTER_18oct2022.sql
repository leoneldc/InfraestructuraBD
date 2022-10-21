USE `colchoneria`;
alter table tbl_usuarios add pregunta varchar(50) not null;
alter table tbl_usuarios add respuesta varchar(50) not null;
alter table tblcotizaciones add column fk_codigo_producto int;
alter table tblcotizaciones add constraint fk2_codigo_producto foreign key (fk_codigo_producto ) references tbl_producto(pk_codigo_producto );
