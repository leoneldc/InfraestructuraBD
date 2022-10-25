USE `colchoneria`;
alter table tbl_usuarios add pregunta varchar(50) not null;
alter table tbl_usuarios add respuesta varchar(50) not null;

-- STORE PROCEDURES
/** Reporteador **/
DELIMITER ;;
drop procedure if exists pa_registro_buscarvalor;
CREATE  PROCEDURE `pa_registro_buscarvalor`(
_valorbuscar varchar (45))
BEGIN
select *
from tbl_regreporteria
where nombre_archivo like concat('%',_valorbuscar,'%') || aplicacion like concat('%',_valorbuscar,'%');
END ;;
DELIMITER ;

DELIMITER ;;
CREATE PROCEDURE `pa_registro_eliminarporid`(
_idregistro int)
BEGIN
delete from tbl_regreporteria
where idregistro = _idregistro;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE `pa_registro_ver`()
BEGIN
 select *
    from tbl_regreporteria;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE `pa_registro_verporid`(
_idregistro int)
BEGIN
 select*
    from tbl_regreporteria
    where idregostrp = _idregistro;
END ;;
DELIMITER ;

DELIMITER ;;
CREATE  PROCEDURE `pa_reporteria_agregareditar`(
_idregistro int,
_ruta varchar(500),
_nombre_archivo varchar(45),
_aplicacion varchar(45),
_estado varchar (45)
)
BEGIN
if _idregistro = 0 then
 insert into tbl_regreporteria (ruta,nombre_archivo,aplicacion,estado)
    values (_ruta,_nombre_archivo,_aplicacion,_estado);
else
 update tbl_regreporteria
    set
  ruta = _ruta,
        nombre_archivo = _nombre_archivo,
        aplicacion = _aplicacion,
        estado = _estado
        where idregistro = _idregistro;
end if;
END ;;
DELIMITER ;

