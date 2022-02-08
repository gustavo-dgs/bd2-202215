/*
Desarrollar una tarea programada para que diariamente a las 11pm 
se suspendan las publicaciones vencidas.
*/

CREATE EVENT ev_suspenderVacantesVencidas
ON SCHEDULE EVERY 1 DAY
STARTS '2022-2-7 23:00:00'
DO
   CALL suspender_vacantes();

