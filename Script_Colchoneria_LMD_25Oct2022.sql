INSERT INTO `tbl_modulos` VALUES
('1000', 'SEGURIDAD', 'Seguridad', 1),
('2000', 'LOGISTICA', 'Logistica', 1),
('3000', 'COMPRAS Y VENTAS', 'Compras y Ventas', 1),
('5000', 'PRODUCCIÓN', 'Produccion', 1),
('6000', 'NOMINAS', 'Nominas', 1),
('7000', 'BANCOS', 'Bancos', 1),
('8000', 'CONTABILIDAD', 'Contabilidad', 1);

-- -----APLICACIONES
INSERT INTO `tbl_aplicaciones` VALUES
('1000', 'MDI SEGURIDAD', 'PARA SEGURIDAD', '1'),
('2000', 'MDI LOGISTICA', 'PARA LOGISTICA', '1'),
('3000', 'MDI COMPRAS Y VENTAS', 'PARA COMPRAS Y VENTAS', '1'),
('5000', 'MDI PRODUCCIÓN', 'PARA PRODUCCIÓN', '1'),
('6000', 'MDI NOMINAS', 'PARA NOMINAS', '1'),
('7000', 'MDI BANCOS', 'PARA BANCOS', '1'),
('8000', 'MDI CONTRABILIDAD', 'PARA CONTRABILIDAD', '1');

-- -----USUARIOS
INSERT INTO `tbl_usuarios` VALUES
('1', 'admin', 'admin', 'admin', 'HO0aGo4nM94=', 'esduardo@gmail.com', '2022-07-02 21:00:48', '1', 'COLOR FAVORITO', 'ROJO');

-- -----PERFILES
INSERT INTO `tbl_perfiles` VALUES
('1', 'ADMINISTRADOR', 'contiene todos los permisos del programa', 1),
('2', 'SEGURIDAD', 'contiene todos los permisos de seguridad', 1),
('3', 'LOGISTICA', 'contiene todos los permisos de logistica', 1),
('4', 'COMPRAS Y VENTAS', 'contiene todos los permisos de compras y ventas', 1),
('5', 'PRODUCCIÓN', 'contiene todos los permisos de producción', 1),
('6', 'NOMINAS', 'contiene todos los permisos de nominas', 1),
('7', 'BANCOS', 'contiene todos los permisos de bancos', 1),
('8', 'CONTABILIDAD', 'contiene todos los permisos de contabilidad', 1);

-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES
('1000', '1000'),
('2000', '2000'),
('3000', '3000'),
('5000', '5000'),
('6000', '6000'),
('7000', '7000'),
('8000', '8000');

-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO `tbl_permisosAplicacionPerfil` VALUES
('1', '1000', '1', '1', '1', '1', '1'),
('1', '2000', '1', '1', '1', '1', '1'),
('1', '3000', '1', '1', '1', '1', '1'),
('1', '5000', '1', '1', '1', '1', '1'),
('1', '6000', '1', '1', '1', '1', '1'),
('1', '7000', '1', '1', '1', '1', '1'),
('1', '8000', '1', '1', '1', '1', '1'),
('2', '1000', '1', '1', '1', '1', '1'),
('3', '2000', '1', '1', '1', '1', '1'),
('4', '3000', '1', '1', '1', '1', '1'),
('5', '5000', '1', '1', '1', '1', '1'),
('6', '6000', '1', '1', '1', '1', '1'),
('7', '7000', '1', '1', '1', '1', '1'),
('8', '8000', '1', '1', '1', '1', '1');

-- -----ASIGNACIÓN DE PERFIL A USUARIO
INSERT INTO `tbl_asignacionesPerfilsUsuario` VALUES
('1', '1'); 


-- --Bancos
insert into `Tbl_tiposPagos` values (1,"Efectivo");
insert into `Tbl_tiposPagos` values (2,"Cheque");
insert into `Tbl_tiposPagos` values (3,"Transferencia");
insert into `Tbl_tiposPagos` values (4,"Tarjeta de Credito");
insert into `Tbl_tiposPagos` values (5,"Otros");
