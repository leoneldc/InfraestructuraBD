use colchoneria;

CREATE TABLE tbl_regreporteria (
  idregistro int NOT NULL AUTO_INCREMENT,
  ruta varchar(500) NOT NULL,
  nombre_archivo varchar(45) NOT NULL,
  aplicacion varchar(45) NOT NULL,
  estado varchar(45) NOT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






