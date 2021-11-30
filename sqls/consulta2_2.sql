-- 2. Obtenga el puesto más indicado para un candidato, 
-- en función a sus características la de los puestos 
-- publicados disponibles. (Especifique los criterios 
-- utilizados incluidos en su modelo, para evaluar).

CREATE TEMPORARY TABLE R1
SELECT e.nombre, v.empresa, v.cod_v, COUNT(hc.habilidad) +
    (CASE
        WHEN c.edad BETWEEN v.edad_min AND v.edad_max THEN 1
        ELSE 0
     END) +
     (CASE
        WHEN c.nivel_edu >= v.educacion_min THEN 1
        ELSE 0
     END) +
     (CASE
        WHEN c.disponibilidad_de_viajar = 'S' AND v.disponibilidad_de_viajar = 'S' THEN 1
        ELSE 0
     END) AS puntaje
FROM habilidades_c hc, vacantes v, candidatos c, empresas e
WHERE c.cedula = hc.candidato
AND e.rif = v.empresa
AND c.cedula = ? -- colocar cedula del candidato
AND CONCAT(v.empresa, v.cod_v) IN (SELECT CONCAT(empresa, cod_v)
																	   FROM vacantes
                                     WHERE NOW() BETWEEN fecha_publicacion AND fecha_vencimiento
                                     AND candidato_seleccionado IS NULL)
AND hc.habilidad IN (SELECT hv.habilidad
                        FROM habilidades_v hv
                        WHERE hv.empresa = v.empresa
                        AND hv.vacante = v.cod_v)
GROUP BY 1,2,3;

SELECT nombre AS empresa, empresa AS rif, cod_v
FROM R1
WHERE puntaje = (SELECT MAX(puntaje) FROM R1);

DROP TABLE R1;
