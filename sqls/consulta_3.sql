-- 3. Información del candidato y de la oferta de trabajo 
-- en la que el postulante y el puesto coincidan en, al menos, 
-- tres habilidades.

SELECT e.nombre AS empresa, sp.vacante AS codigo_vacante,
				v.nombre_v AS vacante, c.nombre AS candidato
FROM se_postulan sp, habilidades_c hc,
		 vacantes v, empresas e, candidatos c
WHERE sp.candidato = hc.candidato
AND v.empresa = sp.empresa
AND v.cod_v = sp.vacante
AND e.rif = v.empresa
AND c.cedula = sp.candidato
AND hc.habilidad IN (SELECT hv.habilidad
                        FROM habilidades_v hv
                        WHERE hv.empresa = sp.empresa
                        AND hv.vacante = sp.vacante)
GROUP BY 1,2,3,4
HAVING COUNT(hc.habilidad) > 3;
