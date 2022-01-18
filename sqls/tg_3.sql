/*Ajusta los valores de fecha de pago y vencimiento de la 
candidatura en el momento que esta cambia de estado.*/

DROP TRIGGER IF EXISTS tg_after_vacantes_update_actualizar_fechas;
		 
CREATE TRIGGER tg_after_vacantes_update_actualizar_fechas
	AFTER UPDATE
	ON vacantes FOR EACH ROW
BEGIN
	
	IF NEW.pagada = 'S' THEN
	BEGIN
	
		UPDATE vacantes v
		SET   v.fecha_pago = NOW(),
			  v.fecha_vencimiento = fecha_vencimiento_vacante(v.empresa, v.cod_v)
		 WHERE v.empresa = empresa
		 AND v.cod_v = vacante;
	
	END;
	END IF;
	
	
END;