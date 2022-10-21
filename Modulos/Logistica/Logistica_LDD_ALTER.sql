use bd_logistica;
alter table tbl_producto add column medida float(100,2);
alter table tbl_producto modify medida varchar(100);
alter table tbl_envio modify fecha_entrega varchar(100);
alter table tbl_envio add primary key (pk_envio);