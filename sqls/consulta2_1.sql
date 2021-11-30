-- Obtenga al mejor candidato para un puesto dado, 
-- en función a las características del mismo y de 
-- los candidatos postulados para el puesto. 

CREATE TEMPORARY TABLE R1
SELECT sp.candidato, COUNT(hc.habilidad) +
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
FROM se_postulan sp, habilidades_c hc, vacantes v,
     candidatos c
WHERE sp.candidato = hc.candidato
AND v.empresa = sp.empresa
AND v.cod_v = sp.vacante
AND c.cedula = sp.candidato
AND sp.empresa = ? -- colocar codigo de empresa
AND sp.vacante = ? -- colocar codigo de vavante
AND hc.habilidad IN (SELECT hv.habilidad
                        FROM habilidades_v hv
                        WHERE hv.empresa = sp.empresa
                        AND hv.vacante = sp.vacante)
GROUP BY 1;

SELECT candidato
FROM R1
WHERE puntaje = (SELECT MAX(puntaje) FROM R1);

DROP TABLE R1;

