/*2. Procedimiento Seleccionar Candidato:

Dada una publicación y un candidato postulado, indique que el mismo ha sido seleccionado.
*/

DROP PROCEDURE IF EXISTS seleccionar_candidato;

CREATE PROCEDURE seleccionar_candidato(
		empresa VARCHAR(30),
		vacante INT,
		candidato VARCHAR(10))
BEGIN
		
		IF candidato IN (SELECT sp.candidato
							FROM se_postulan sp
							WHERE sp.empresa = empresa
							AND sp.vacante = vacante) THEN
		
			UPDATE vacantes v
			SET v.candidato_seleccionado = candidato
			WHERE v.empresa = empresa
			AND v.cod_v = vacante;
			
		END IF;
		 
END;
