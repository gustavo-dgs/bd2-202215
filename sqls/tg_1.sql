/*Disparador que impida que un candidato que no esté validado 
pueda postularse a una candidatura.*/

CREATE TRIGGER tg_before_se_postulan_insert
	BEFORE INSERT
	ON se_postulan FOR EACH ROW
BEGIN
	IF ((SELECT validado
			FROM candidatos
			WHERE cedula = NEW.candidato) = 'N')
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el candidato no está validado';
    END IF;
END;