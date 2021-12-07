-- Desarrollar una función almacenada que reciba el id de una empresa
-- y devuelva verdadero si la misma es una "empresa de alta demanda".

-- mas de 15 ofertas en el ultimo ano
-- más de la mitad de sus ofertas reciben al menos 10 postulaciones

CREATE FUNCTION is_alta_demanda(
    empresa VARCHAR(30))
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE num_vacantes_ult_ano INT;
    DECLARE num_postulaciones INT;
		
		SELECT COUNT(*)
		INTO num_vacantes_ult_ano
		FROM vacantes v
		WHERE v.empresa = empresa
		AND DATEDIFF(NOW(), v.fecha_publicacion) < 365;
		
		SELECT COUNT(*)
		INTO num_postulaciones
		FROM se_postulan sp
		WHERE sp.empresa = empresa
		HAVING COUNT(sp.candidato) >= 10
		GROUP BY sp.vacante;
		

    IF (NOW() BETWEEN fecha_publicacion AND fecha_vencimiento)
        AND candidato_seleccionado IS NULL THEN
        RETURN 'VERDADERO';
    ELSE RETURN 'FALSO';
    END IF;

END