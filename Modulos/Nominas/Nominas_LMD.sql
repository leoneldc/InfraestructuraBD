INSERT INTO `tbl_departamentos` VALUES 
('2000', 'Logistica', 'DEPTO. LOGISTICA', '1'), 
('3000', 'Compras', 'DEPTO. COMPRAS', '1'), 
('4000', 'Comercial', 'DEPTO. COMERCIAL', '1'), 
('5000', 'Marketing Y Publicidad', 'DEPTO. Marketing y Publicidad', '0'), 
('6000', 'Recursos Humanos', 'DEPTO. RRHH', '0');

INSERT INTO `tbl_puestosdetrabajo` VALUES 
('2001', 'JEFE DE LOGISTICA', '1'), ('2002', 'ASISTENTE DE LOGISTICA', '0'), ('2003', 'ANALISTA DE ABASTECIMIENTO', '0'), 
('3001', 'GESTOR DE PROVEEDORES', '1'), ('3002', 'GESTOR DE PRODUCTOS', '1'), ('3003', 'ANALISTA DE COMPRAS', '0'), 
('4001', 'DIRECTOR COMERCIAL', '1'), ('4002', 'GERENTE DE VENTAS', '1'), ('4003', 'VENDEDOR', '0'), 
('5001', 'ANALISTA DE MARKETING', '1'), ('5002', 'SUPERVISOR DE MARKETING', '1'), ('5003', 'PUBLICISTA', '0'), 
('6001', 'DIRECTOR DE RRHH', '1'), ('6002', 'ADMINISTRADOR DE PERSONAL', '1'), ('6003', 'RECLUTADOR', '0');

INSERT INTO `tbl_trabajador` VALUES
(1, '2022-10-18', 'Amerigo', 'achalliss0@time.com', '4 Carpenter Court', '12345671', 1),
(2, '2022-10-19', 'Merrill', 'mfilipponi1@springer.com', '649 Vermont Avenue', '12345672', 1),
(3, '2022-10-21', 'Morgan', 'mstonhard2@bing.com', '48922 Bayside Avenue', '12345673', 1),
(4, '2022-10-18', 'Mirna', 'mstillwell3@japanpost.jp', '8 1st Center', '12345674', 1),
(5, '2022-10-23', 'Leilah', 'lgerlack4@pcworld.com', '38208 Miller Junction', '12345675', 1),
(6, '2022-10-18', 'Waite', 'wvanderbeken5@e-recht24.de', '2 Hoffman Lane', '12345676', 1),
(7, '2022-10-18', 'Fionnula', 'fgiraths6@japanpost.jp', '7 Talisman Lane', '12345677', 1),
(8, '2022-10-20', 'Giulietta', 'gchapellow7@123-reg.co.uk', '03806 Hanson Lane', '12345678', 1),
(9, '2022-10-19', 'Brande', 'bcosyns8@ustream.tv', '3 1st Center', '12345679', 1),
(10, '2022-10-19', 'Adrea', 'ahutchence9@fema.gov', '3094 Calypso Plaza', '12345670', 1),
(11, '2022-10-20', 'Wadsworth', 'wtrewetta@51.la', '87 Amoth Parkway', '12345680', 1),
(12, '2022-10-19', 'Dirk', 'dboliverb@issuu.com', '4000 Magdeline Park', '12345681', 1),
(13, '2022-10-23', 'Towny', 'tdurranc@blogtalkradio.com', '5 Barnett Way', '12345682', 1),
(14, '2022-10-23', 'Jinny', 'jlaxtond@google.com', '14 Forster Road', '12345683', 1),
(15, '2022-10-22', 'Hannah', 'hmerrelle@java.com', '21 Autumn Leaf Hill', '12345684', 1);

INSERT INTO `tbl_contrato` VALUES 
('1', '5000', '1', '80', '1', '1'), 
('2', '5000', '1', '80', '2', '1'),
('3', '10000', '2', '160', '2', '1'),
('4', '10000', '2', '160', '1', '1');

INSERT INTO `tbl_percepciones` VALUES 
('1', 'IGSS', '0', '4.83', '0', '1'), 
('2', 'FORMACIÓN PROFESIONAL', '0', '0.1', '0', '1'), 
('3', 'HORAS EXTRAS', '1', '150', '0', '1'), 
('4', 'BONIFICACIÓN INCENTIVO', '1', '0', '250', '1');

INSERT INTO `tbl_asignacion_puestodepartamento` VALUES 
('2001', '2000'), ('2002', '2000'), ('2003', '2000'), 
('3001', '3000'), ('3002', '3000'), ('3003', '3000'), 
('4001', '4000'), ('4002', '4000'), ('4003', '4000'), 
('5001', '5000'), ('5002', '5000'), ('5003', '5000'), 
('6001', '6000'), ('6002', '6000'), ('6003', '6000');

INSERT INTO `tbl_asignacion_puestotrabajador` VALUES 
('2001', '1'), ('2002', '2'), ('2003', '3'), 
('3001', '4'), ('3002', '5'), ('3003', '6'), 
('4001', '7'), ('4002', '8'), ('4003', '9'), 
('5001', '10'), ('5002', '11'), ('5003', '12'), 
('6001', '13'), ('6002', '14'), ('6003', '15');

INSERT INTO `tbl_asignacion_contratopercepciones` VALUES 
('1', '1'), ('1', '2'), ('1', '3');

INSERT INTO `tbl_asignacion_contratotrabajador` VALUES 
('1', '1'), ('1', '2'), ('1', '3'), ('1', '4');

INSERT INTO `tbl_horasextras` VALUES 
('1', '2022-10-26', '1.5'), ('1', '2022-10-27', '1.5');