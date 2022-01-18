/*Disparador que impida que una postulación que no esté pagada reciba candidaturas. (Una publicación puede pasar hasta tres días disponible para consulta, período en el que debe pagarse antes de ser cancelada)*/

CREATE TRIGGER tg_before_se_postulan_insert_validar_vacante
	BEFORE INSERT
	ON se_postulan FOR EACH ROW
BEGIN
	IF ((SELECT pagada
			FROM vacantes
			WHERE empresa = NEW.empresa
			AND cod_v = NEW.vacante) = 'N')
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: la vacante no ha sido pagada';
    END IF;
END;