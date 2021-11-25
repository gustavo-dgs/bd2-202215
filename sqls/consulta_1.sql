-- 1. Los puestos de trabajo / candidaturas, disponibles en función 
-- de las habilidades, y la información de la empresa que realiza la candidatura.

SELECT vacante
FROM habildades_v
WHERE empresa=?
AND habilidad LIKE ?;
