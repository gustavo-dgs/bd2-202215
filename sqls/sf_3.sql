-- 3. Desarrollar una función almacenada que reciba el id de 
-- una vacante y devuelva la próxima fecha de vencimiento, de 
-- la siguiente manera:

-- 7 días, si es publicada por primera vez.
-- 15 días, si es una republicación de la misma vacante.
-- 7 días adicionales si la publicación no ha recibido al menos 
-- -- 5 propuestas al momento de la republicación.

CREATE FUNCTION fecha_vencimiento_vacante(
    empresa VARCHAR(30),
		vacante INT)
RETURNS DATE
DETERMINISTIC

BEGIN

    DECLARE fecha_publicacion DATE;
		DECLARE republicacion CHAR(1);
		DECLARE num_postulantes INT;
    
		SELECT v.fecha_publicacion, v.republicacion
		INTO fecha_publicacion, republicacion
		FROM vacantes v
		WHERE v.empresa = empresa
		AND v.cod_v = vacante;
		
		SELECT COUNT(sp.candidato)
		INTO num_postulantes
		FROM se_postulan sp
		WHERE sp.empresa = empresa
		AND sp.vacante = vacante
		AND sp.fecha <= fecha_publicacion;
		
					
		IF (republicacion = 'S') THEN
				IF (num_postulantes < 5) THEN
						RETURN DATE_ADD(fecha_publicacion, INTERVAL 22 DAY);
				ELSE RETURN DATE_ADD(fecha_publicacion, INTERVAL 15 DAY);
				END IF;
		ELSE RETURN DATE_ADD(fecha_publicacion, INTERVAL 7 DAY);
		END IF;

END