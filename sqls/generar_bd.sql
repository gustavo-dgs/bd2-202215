
----------- 18/10/2021 20:00 ------------

CREATE TABLE `candidatos`  (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `edad` integer NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `institucion` varchar(255) NOT NULL,
  `nivel_edu` varchar(30) NOT NULL,
  PRIMARY KEY (`cedula`)
);

CREATE TABLE `empresas`  (
  `rif` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`rif`)
);

CREATE TABLE `habilidades_c`  (
  `candidato` varchar(255) NOT NULL,
  `habilidad` varchar(255) NOT NULL,
  PRIMARY KEY (`candidato`, `habilidad`)
);

CREATE TABLE `habilidades_v`  (
  `empresa` varchar(30) NOT NULL,
  `vacante` integer NOT NULL,
  `habilidad` varchar(255) NOT NULL,
  PRIMARY KEY (`empresa`, `vacante`, `habilidad`)
);

CREATE TABLE `se_postulan`  (
  `candidato` varchar(10) NOT NULL,
  `empresa` varchar(30) NOT NULL,
  `vacante` integer NOT NULL,
  PRIMARY KEY (`candidato`, `empresa`, `vacante`)
);

CREATE TABLE `table_1`  (
  `Pk1` integer NOT NULL AUTO_INCREMENT,
  `prueba` varchar(255) NULL,
  PRIMARY KEY (`Pk1`)
);

CREATE TABLE `table_2`  (
  `Pk2` integer NOT NULL,
  `loco` varchar(255) NULL,
  `fk1` integer NULL,
  PRIMARY KEY (`Pk2`)
);

CREATE TABLE `vacantes`  (
  `empresa` varchar(30) NOT NULL,
  `cod_v` integer NOT NULL AUTO_INCREMENT,
  `nombre_v` varchar(255) NOT NULL,
  `descripcion` varchar NOT NULL,
  `salario` integer NOT NULL,
  `educacion_min` varchar(255) NOT NULL,
  `edad_min` integer NOT NULL,
  `edad_max` integer NULL,
  `disponibilidad_de_viajar` char(1) NULL,
  PRIMARY KEY (`empresa`, `cod_v`)
);

ALTER TABLE `habilidades_c` ADD CONSTRAINT `fk_habilidades_c_Candidatos_1` FOREIGN KEY (`candidato`) REFERENCES `candidatos` (`cedula`);
ALTER TABLE `habilidades_v` ADD CONSTRAINT `fk_habilidades_v_Vacantes_1` FOREIGN KEY (`empresa`, `vacante`) REFERENCES `vacantes` (`empresa`, `cod_v`);
ALTER TABLE `se_postulan` ADD CONSTRAINT `fk_se_postulan_Candidatos_1` FOREIGN KEY (`candidato`) REFERENCES `candidatos` (`cedula`);
ALTER TABLE `se_postulan` ADD CONSTRAINT `fk_se_postulan_Vacantes_1` FOREIGN KEY (`empresa`, `vacante`) REFERENCES `vacantes` (`empresa`, `cod_v`);
ALTER TABLE `table_2` ADD CONSTRAINT `fk_table_2_table_1_1` FOREIGN KEY (`fk1`) REFERENCES `table_1` (`Pk1`);
ALTER TABLE `vacantes` ADD CONSTRAINT `fk_Vacantes_Empresas_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`rif`);

