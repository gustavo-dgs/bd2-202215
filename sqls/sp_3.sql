/*3. Validar Correo: recibe dos parámetros, el 1ero es el id del candidato, 
el segundo es una clave, si esta es nula se genera un código aleatorio que se 
almacena en el campo "codigo_validacion" del candidato, si tiene un valor este 
debe compararse con el almacenado y de ser iguales marcar al mismo como "validado".
*/

DROP PROCEDURE IF EXISTS validar_correo;

CREATE PROCEDURE validar_correo(
		candidato VARCHAR(10),
		clave VARCHAR(32))
BEGIN
		
		IF clave IS NULL THEN
		
			UPDATE candidatos c
			SET c.codigo_validacion = MD5(RAND())
			WHERE c.cedula = candidato;
			
		 ELSEIF clave = (SELECT c.codigo_validacion
							FROM candidatos c
							WHERE c.cedula = candidato) THEN
			
			UPDATE candidatos c
			SET c.validado = 'S'
			WHERE c.cedula = candidato;
			
		END IF;
END;