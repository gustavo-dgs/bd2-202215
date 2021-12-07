/*
Desarrollar una función almacenada que reciba el id de una vacante 
y devuelve el precio de publicación de la misma, según el siguiente 
cálculo:

Precio Base + 35% si es cliente internacional + 15% En el primer mes de cada trimestre - 10% si el cliente tiene al menos 5 publicaciones activas - Un porcentaje promocional (almacenado en el campo porcentaje_promocional).

 
Nota: El Precio Base se recibe como parámetro.

Pregunta: cada porcentaje se calcula en base al anterior?
					a que campo pertenece el porcentaje_promocional?
*/


CREATE FUNCTION precio_vacante(
    empresa VARCHAR(30),
		vacante INT,
		precio_base FLOAT(255,2))
RETURNS FLOAT(255,2)
NOT DETERMINISTIC

BEGIN

    DECLARE is_internacional CHAR(1);
		DECLARE publicaciones_activas INT;
		DECLARE porcentaje_prom FLOAT (255,2);
    
		SELECT internacional
		INTO is_internacional
		FROM empresas
		WHERE rif = empresa;
		
		SELECT COUNT(*)
		INTO publicaciones_activas
		FROM (SELECT v.cod_v
					FROM vacantes v
					WHERE v.empresa=empresa
					AND is_activa(v.empresa, v.cod_v) = 'VERDADERO') FINAL;
					
		SELECT v.porcentaje_prom
		INTO porcentaje_prom
		FROM vacantes v
		WHERE v.empresa = empresa
		AND v.cod_v = vacante;
		
					
		IF (is_internacional = 'S') THEN
				SET precio_base = precio_base*1.35;
		END IF;
		
		IF  (EXTRACT(MONTH FROM NOW()) = 1 OR
			  EXTRACT(MONTH FROM NOW()) = 4 OR
				EXTRACT(MONTH FROM NOW()) = 7 OR
				EXTRACT(MONTH FROM NOW()) = 10) THEN
				SET precio_base = precio_base*1.15;
		END IF;
		
		IF (publicaciones_activas >= 5) THEN
				SET precio_base = precio_base*0.90;
		END IF;
		
		SET precio_base = precio_base*(1-porcentaje_prom);
		
		RETURN precio_base;

END