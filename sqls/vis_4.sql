/*Una vista de lectura, que permita modificar la
"Espectativa salarial" en las ofertas publicadas*/

CREATE VIEW vista2 AS
SELECT empresa, cod_V, nombre_v, salario as espectativa_salarial
FROM vacantes;