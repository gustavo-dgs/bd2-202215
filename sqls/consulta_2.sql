-- 2. Las empresas que han ofertado más de 5 puestos de
-- trabajo en el último semestre y la cantidad de puestos 
-- que han ofrecido en total (no solamente en el semestre).

CREATE TEMPORARY TABLE R1
SELECT empresa, COUNT(nombre_v) AS cantidad_vacantes
FROM vacantes
WHERE fecha_apertura BETWEEN '2021-05-01' AND '2021-11-25'
GROUP BY 1;

SELECT e.rif, e.nombre, COUNT(v.nombre_v) AS cantidad_vacantes
FROM empresas e, vacantes v
WHERE e.rif = v.empresa
AND e.rif IN (SELECT empresa
                FROM R1
                WHERE cantidad_vacantes > 5)
GROUP BY 1, 2;
