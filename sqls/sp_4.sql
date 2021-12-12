/*4. Suspender Vacantes:

Pasa a inactivas todas las vacantes que no se han pagado o que ya se vencieron.
Una vacante puede estar tres días desde su publicación disponible para consulta
(sin permitir postulaciones), período en el que la misma debe pagarse o ser 
suspendida.
*/

DROP PROCEDURE IF EXISTS suspender_vacantes;

CREATE PROCEDURE suspender_vacantes()
BEGIN

	UPDATE vacantes
	SET activa = 'N'
	WHERE DATEDIFF(NOW(), fecha_vencimiento) > 0
	OR (DATEDIFF(NOW(), fecha_publicacion) >= 3 AND
		pagada = 'N');
		

END;