-- Desarrollar una función almacenada que reciba el id de una empresa
-- y devuelva verdadero si la misma es una "empresa de alta demanda".

-- mas de 15 ofertas en el ultimo ano
-- más de la mitad de sus ofertas reciben al menos 10 postulaciones

CREATE FUNCTION is_alta_demanda(
    empresa VARCHAR(30))
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE num_vacantes INT;
		DECLARE num_vacantes_ult_ano INT;
    DECLARE num_vacantes_10_postulaciones INT;
		
		-- numero de vacantes
		SELECT COUNT(v.cod_v)
		INTO num_vacantes
		FROM vacantes v
		WHERE v.empresa = empresa;
		
		-- nuemero de ofertas en el ultimo ano
		SELECT COUNT(*)
		INTO num_vacantes_ult_ano
		FROM vacantes v
		WHERE v.empresa = empresa
		AND DATEDIFF(NOW(), v.fecha_publicacion) <= 365;
		
		-- numero de vacantes que reciben al menos 10 postulaciones
		SELECT COUNT(*)
		INTO num_vacantes_10_postulaciones
		FROM (SELECT sp.vacante, COUNT(sp.candidato)
					FROM se_postulan sp
					WHERE sp.empresa = empresa
					GROUP BY sp.vacante
					HAVING COUNT(sp.candidato) >= 10) FINAL;
					
		IF (num_vacantes <= 0) THEN
				RETURN 'FALSO';
    ELSEIF (num_vacantes_ult_ano > 15)
        AND (num_vacantes_10_postulaciones > num_vacantes/2) THEN
        RETURN 'VERDADERO';
    ELSE RETURN 'FALSO';
    END IF;

END