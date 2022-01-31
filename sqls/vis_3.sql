/*
Una vista de lectura que muestre un listado de
todos los candidatos que aplicaron a una vacante, 
sin información de contacto.
*/

CREATE VIEW vista1 AS
SELECT v.empresa, v.cod_v, v.nombre_v, c.cedula, c.nombre, c.edad, c.institucion, c.nivel_edu, c.disponibilidad_de_viajar
FROM candidatos c
INNER JOIN se_postulan sp ON c.cedula = sp.candidato
INNER JOIN vacantes v ON sp.empresa = v.empresa AND sp.vacante = v.cod_v
