-- 5. Cantidad de Ofertas recibidas para una publicación 
-- de puesto de trabajo por cada uno de los días que esa 
-- publicación estuvo activa.

SELECT sp.empresa, sp.vacante, COUNT(sp.candidato) AS num_ofertas
FROM se_postulan sp, vacantes v
WHERE sp.empresa = v.empresa
AND sp.vacante = v.cod_v
AND sp.fecha BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
GROUP BY 1,2;
