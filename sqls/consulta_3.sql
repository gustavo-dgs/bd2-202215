-- 3. Información del candidato y de la oferta de trabajo 
-- en la que el postulante y el puesto coincidan en, al menos, 
-- tres habilidades.

SELECT sp.empresa, e.nombre, sp.vacante, sp.candidato, c.nombre
FROM se_postulan sp, habilidades_c hc,
    candidatos c, vacantes v, empresas e
WHERE sp.candidato = hc.candidato
AND e.rif = sp.empresa
AND c.cedula = sp.candidato
AND hc.habilidad IN (SELECT hv.habilidad
                        FROM habilidades_v hv
                        WHERE hv.empresa = sp.empresa
                        AND hv.vacante = sp.vacante)
GROUP BY 1,2,3
HAVING COUNT(hc.habilidad) > 3;
