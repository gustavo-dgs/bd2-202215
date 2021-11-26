-- 4. Listado de ofertas activas de una empresa. 
-- Una oferta activa es aquella que está aún en su 
-- período de publicación (fecha actual > fecha publicación y
-- menor que fecha vencimiento) y además aún no se ha seleccionado un 
-- candidato para el cargo.

SELECT e.nombre, v.cod_v, v.nombre_v
FROM vacantes v, empresa e
WHERE v.empresa = e.rif
AND NOW() BETWEEN v.fecha_publicacion AND v.fecha_vencimiento
AND v.candidato_seleccionado IS NULL;