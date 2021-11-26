
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


