CREATE DATABASE Colchoneria;
USE Colchoneria;

/* Contiene datos de la primera parte de la consulta */ 

CREATE TABLE IF NOT EXISTS `ConsultaInteligente`(
pk_Id_Nombre_Consulta INT AUTO_INCREMENT NOT NULL,
nombre_Consulta VARCHAR(45) NOT NULL,
pk_Id_Tabla INT NOT NULL,
pk_Id_Campo INT NOT NULL,
alias VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Nombre_Consulta`,`pk_Id_Tabla`,`pk_Id_Campo`),
FOREIGN KEY (`pk_Id_Tabla`) REFERENCES `TablaDato` (`pk_Id_Tabla`),
FOREIGN KEY (`pk_Id_Campo`) REFERENCES `TablaCampo` (`pk_Id_Campo`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

CREATE TABLE IF NOT EXISTS `Querys`(
pk_Id_Query INT AUTO_INCREMENT NOT NULL,
nombre_Query VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Query`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;


insert into colchoneria.Querys (nombre_Query) values ('Simple');
insert into colchoneria.Querys (nombre_Query) values ('Simple Todos');
insert into colchoneria.Querys (nombre_Query) values ('Compleja');
insert into colchoneria.Querys (nombre_Query) values ('Compleja Todos');

/* Contiene la informacion del combobox de la tabla Tabla y esta relacionada con la tabla consultas */

CREATE TABLE IF NOT EXISTS `TablaDato`(
pk_Id_Tabla INT AUTO_INCREMENT NOT NULL,
nombre_Tabla VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Tabla`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;


 /*Contiene la informacion del combobox de la tabla campo y va relacionada con la tabla consulta*/ 

CREATE TABLE IF NOT EXISTS `TablaCampo`(
pk_Id_Campo INT AUTO_INCREMENT NOT NULL,
nombre_Campo VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Campo`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

 /*Contiene la informacion del combobox de la tabla logico y esta relacionada con la tabla consulta*/ 

CREATE TABLE IF NOT EXISTS `TablaLogico`(
pk_Id_Logico INT AUTO_INCREMENT NOT NULL,
nombre_Logico VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_logico`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

 /*Contiene la informacion de los combobox de la tabla Comparacion y esta relacionada con Comparacion*/ 

CREATE TABLE IF NOT EXISTS `TablaComparador`(
pk_Id_Comparador INT AUTO_INCREMENT NOT NULL,
nombre_Comparador VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Comparador`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

 /*Contiene la informacion de los combobox de la tabla agrupar y esta relacionada con la tabla agrupar*/ 

CREATE TABLE IF NOT EXISTS `TablaAgruparOrdenar`(
pk_Id_Agrupar_Ordenar INT AUTO_INCREMENT NOT NULL,
nombre_Agrupar_Ordenar VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Agrupar_Ordenar`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

/*Contiene la informacion del combobox de la tabla orden y esta relacionada con la tabla Agrupar*/

CREATE TABLE IF NOT EXISTS `TablaOrden`(
pk_Id_Orden INT AUTO_INCREMENT NOT NULL,
nombre_Orden VARCHAR(45) NOT NULL,
PRIMARY KEY(`pk_Id_Orden`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;


/*Contiene la informacion de la parte logica y tiene relacion con la tabla campos */

CREATE TABLE IF NOT EXISTS `Logico`(
pk_Id_Logico INT AUTO_INCREMENT NOT NULL,
nombre_Logico VARCHAR(45) NOT NULL,
valor_Logico INT NOT NULL,
pk_Id_Campo INT NOT NULL,
PRIMARY KEY(`pk_Id_logico`),
FOREIGN KEY (`pk_Id_Campo`) REFERENCES `TablaCampo` (`pk_Id_Campo`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

/*Contiene la informacion de la parte Comparacion y tiene relacion con la tabla campos */

CREATE TABLE IF NOT EXISTS `Comparador`(
pk_Id_Comparador INT AUTO_INCREMENT NOT NULL,
pk_Id_Campo INT NOT NULL,
valor_Comparador INT NOT NULL,
PRIMARY KEY(`pk_Id_Comparador`),
FOREIGN KEY (`pk_Id_Campo`) REFERENCES `TablaCampo` (`pk_Id_Campo`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;

/*Contiene la informacion de la parte AgruparOrdenar y tiene relacion con la tabla campos y Orden*/
DROP TABLE `AgruparOrdenar`;
CREATE TABLE IF NOT EXISTS `AgruparOrdenar`(
pk_Id_Agrupar_Ordenar INT AUTO_INCREMENT NOT NULL,
pk_Id_Campo INT NOT NULL,
pk_Id_Orden INT NOT NULL,
valor_Comparador INT NOT NULL,
PRIMARY KEY(`pk_Id_Agrupar_Ordenar`),
FOREIGN KEY (`pk_Id_Campo`) REFERENCES `TablaCampo` (`pk_Id_Campo`),
FOREIGN KEY (`pk_Id_Orden`) REFERENCES `TablaOrden` (`pk_Id_Orden`)
)/*ENGINE = InnoDB DEFAULT CHARACTER SET = utf8*/;
/*Querys*/

insert into TablaDato (nombre_Tabla) values ('Bitacora');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Campos');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Categoria');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Clientes');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Compras');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Consulta');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Devoluciones');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Facturadetalle');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Facturaenca');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Horarios');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Indicetablas');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Indicetablas_consulta');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Inventario');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Nominas');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Productos');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Proveedores');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Puestos');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Sucursal');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Sueldos');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Transporte');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Usuarios');
insert into colchoneria.TablaDato (nombre_Tabla) values ('Ventas');

insert into colchoneria.tablaCampo (nombre_Campo) values ('IdProductos');
insert into colchoneria.tablaCampo (nombre_Campo) values ('NombreProductos');
insert into colchoneria.tablaCampo (nombre_Campo) values ('Descripcion');
insert into colchoneria.tablaCampo (nombre_Campo) values ('PrecioVenta');
insert into colchoneria.tablaCampo (nombre_Campo) values ('PrecioCompra');
insert into colchoneria.tablaCampo (nombre_Campo) values ('FechaIngreso');
insert into colchoneria.tablaCampo (nombre_Campo) values ('idCategoria');
insert into colchoneria.tablaCampo (nombre_Campo) values ('IdProveedores');

insert into colchoneria.TablaLogico (nombre_Logico) values ('OR');
insert into colchoneria.TablaLogico (nombre_Logico) values ('AND');
insert into colchoneria.TablaLogico (nombre_Logico) values ('NOT');

insert into colchoneria.TablaComparador (nombreComparador) values ('WHERE');

insert into colchoneria.TablaAgruparOrdenar (nombre_Agrupar_Ordenar) values ('AGRUPAR');
insert into colchoneria.TablaAgruparOrdenar (nombre_Agrupar_Ordenar) values ('ORDENAR');