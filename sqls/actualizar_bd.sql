
ALTER TABLE `bd2_202215_27506984`.`vacantes` 
ADD COLUMN `fecha_apertura` date NULL AFTER `disponibilidad_de_viajar`;

ALTER TABLE `bd2_202215_27506984`.`vacantes` 
MODIFY COLUMN `fecha_apertura` date NOT NULL AFTER `disponibilidad_de_viajar`;
