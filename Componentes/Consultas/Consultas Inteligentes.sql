CREATE DATABASE IF NOT EXISTS colchoneria;
USE colchoneria;

DROP TABLE IF EXISTS tbl_consultainteligente;
CREATE TABLE IF NOT EXISTS tbl_consultainteligente (
 nombre_consulta varchar(40) not null,
    tabla_consulta varchar(40) not null,
    campos_consultas varchar(15) not null,
    alias_consultas varchar(15) not null,
    PkId INT NOT NULL,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente1; 
CREATE TABLE IF NOT EXISTS tbl_consultainteligente1 (
 operador_consulta varchar(40) not null,
    campos_consulta varchar(40) not null,
    valor_consultas varchar(15) not null,
    PkId INT NOT NULL,   
    metodo varchar(15) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS tbl_consultainteligente2;
CREATE TABLE IF NOT EXISTS tbl_consultainteligente2 (
    PkId INT NOT NULL,
    ordenar_consulta varchar(40) not null,
    campo_consulta varchar(40) not null,    
    metodo varchar(15) not null,
    PRIMARY KEY (`PkId`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

