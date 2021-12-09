/*
1. Procedimiento "Pagar" (Recibe el id de la publicación)

- Marca una publicación de empresa como "pagada".

- Calcula la nueva fecha de vencimiento de la publicación.
*/

DROP PROCEDURE IF EXISTS pagar;

CREATE PROCEDURE pagar(
		empresa VARCHAR(30),
		vacante INT)
BEGIN

		UPDATE vacantes v
		SET v.pagada = 'S',
			  v.fecha_vencimiento = fecha_vencimiento_vacante(v.empresa, v.cod_v)
		 WHERE v.empresa = empresa
		 AND v.cod_v = vacante;
		 
END;