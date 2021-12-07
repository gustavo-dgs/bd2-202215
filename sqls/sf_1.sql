-- Desarrollar una función almacenada que reciba el id de una vacante 
-- y devuelva verdadero si la misma está activa.

CREATE FUNCTION is_activa(
    empresa VARCHAR(30),
    vacante INT )
RETURNS VARCHAR(30)
DETERMINISTIC

BEGIN

    DECLARE fecha_publicacion DATE;
    DECLARE fecha_vencimiento DATE;
    DECLARE candidato_seleccionado VARCHAR(10);

    SELECT v.fecha_publicacion, v.fecha_vencimiento, v.candidato_seleccionado
    INTO fecha_publicacion, fecha_vencimiento, candidato_seleccionado
    FROM vacantes
    WHERE v.empresa = empresa
    AND v.cod_v = vacante;

    IF (NOW() BETWEEN fecha_publicacion AND fecha_vencimiento)
        AND candidato_seleccionado IS NULL THEN
        RETURN 'VERDADERO';
    ELSE RETURN 'FALSO';
    END IF;

END