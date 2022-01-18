/*Postule automáticamente a un candidato los candidatos que 
coinciden en más de 6 habilidades con una vacante.*/

CREATE TRIGGER tg_after_vacantes_update_postular_candidato
	AFTER UPDATE
	ON vacantes FOR EACH ROW
BEGIN
	
	IF OLD.pagada = 'S' THEN
	BEGIN
	
		-- variables
		DECLARE myCandidato VARCHAR(255) DEFAULT "";
		DECLARE finished INTEGER DEFAULT 0;
		
		-- declarar cursor para candidatos
		DECLARE curCandidatos CURSOR FOR
			SELECT candidato
			FROM habilidades_c
			WHERE habilidad IN (SELECT habilidad
								FROM habilidades_v
								WHERE empresa = OLD.empresa
								AND vacante = OLD.cod_v)
			GROUP BY candidato
			HAVING COUNT(hc.habilidad) > 6;
			
		-- declare NOT FOUND handler
		DECLARE CONTINUE HANDLER 
		FOR NOT FOUND SET finished = 1;
		
		-- recorrer cursor
		OPEN curCandidatos;
		getCandidato: LOOP
				FETCH curCandidatos INTO myCandidato;
				IF finished = 1 THEN 
					LEAVE getCandidato;
				END IF;
				
				INSERT INTO se_postulan (candidato, empresa, vacante, fecha)
				VALUES (myCandidato, OLD.empresa, OLD.cod_v, NOW());
				
		END LOOP getCandidato;
		
		CLOSE curCandidatos;
	
	END;
	END IF;
	
	
END;