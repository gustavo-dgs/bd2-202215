/*

Desarrollar una tarea programada, para que, mensualmente, elimine los usuarios 
registrados hace más de 6 meses y que nunca han validado su correo.

*/

CREATE EVENT ev_eliminarUsuariosNoValidados
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO

	DELETE FROM candidatos
	WHERE validado = 'N'
	AND DATEDIFF(NOW(), fecha_registro) > 180;