
ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    ADD COLUMN `fecha_apertura` date NULL AFTER `disponibilidad_de_viajar`;
ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    MODIFY COLUMN `fecha_apertura` date NOT NULL AFTER `disponibilidad_de_viajar`;


ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    CHANGE COLUMN `fecha_apertura` `fecha_publicacion` date NOT NULL AFTER `disponibilidad_de_viajar`,
    ADD COLUMN `fecha_vencimiento` date NULL AFTER `fecha_publicacion`,
    ADD COLUMN `candidato_seleccionado` varchar(10) NULL AFTER `fecha_vencimiento`,
    ADD CONSTRAINT `fk_Vacantes_Candidatos_1` FOREIGN KEY (`candidato_seleccionado`) 
        REFERENCES `bd2_202215_27506984`.`candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    MODIFY COLUMN `fecha_vencimiento` date NOT NULL AFTER `fecha_publicacion`;

ALTER TABLE `bd2_202215_27506984`.`se_postulan` 
    ADD COLUMN `fecha` date NULL AFTER `vacante`;
ALTER TABLE `bd2_202215_27506984`.`se_postulan` 
    MODIFY COLUMN `fecha` date NOT NULL AFTER `vacante`;

ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    MODIFY COLUMN `educacion_min` int NOT NULL AFTER `salario`;

ALTER TABLE `bd2_202215_27506984`.`candidatos` 
    MODIFY COLUMN `nivel_edu` int NOT NULL AFTER `institucion`;

ALTER TABLE `bd2_202215_27506984`.`vacantes` 
    ADD COLUMN `republicacion` char(1) NULL DEFAULT 'N' AFTER `candidato_seleccionado`;
ALTER TABLE `bd2_202215_27506984`.`vacantes`
    ADD CONSTRAINT `ck_republicacion` CHECK(`republicacion` IN ('S','N'));