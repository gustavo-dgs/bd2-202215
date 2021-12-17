/*
Navicat MySQL Data Transfer

Source Server         : BBDD2
Source Server Version : 50505
Source Host           : labs-dbservices01.ucab.edu.ve:3306
Source Database       : bd2_202215_30453753

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-11-25 19:05:01
*/

-- SET FOREIGN_KEY_CHECKS=0;

/*-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos` (
  `cedula` varchar(8) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` (`cedula`, `nombre`, `email`,`telefono`) VALUES ('26564174', 'Carlos Ternera', 'carlitosdindo@gmail.com', '04249335712');
INSERT INTO `candidatos` (`cedula`, `nombre`, `email`,`telefono`) VALUES ('27562147', 'Freddy Reyes', 'progamerfred@gmail.com', '04125894521');
INSERT INTO `candidatos` (`cedula`, `nombre`, `email`,`telefono`) VALUES ('27894123', 'Jose Saad', 'josemsaad13@gmail.com', null);
INSERT INTO `candidatos` (`cedula`, `nombre`, `email`,`telefono`) VALUES ('28952146', 'Vanessa Lozano', 'vanessitasan@gmail.com', null);
INSERT INTO `candidatos` (`cedula`, `nombre`, `email`,`telefono`) VALUES ('30453753', 'Miguelanggelo Sumoza', 'miguelanggelo21@gmail.com', '04249125727');

/*-- ----------------------------
-- Table structure for habilidades_c
-- ----------------------------
DROP TABLE IF EXISTS `habilidades_c`;
CREATE TABLE `habilidades_c` (
  `cedcandidato` varchar(8) NOT NULL,
  `nombrehab` varchar(30) NOT NULL,
  PRIMARY KEY (`cedcandidato`,`nombrehab`),
  KEY `habilidad_idx` (`nombrehab`),
  CONSTRAINT `candidato` FOREIGN KEY (`cedcandidato`) REFERENCES `candidatos` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `habilidad` FOREIGN KEY (`nombrehab`) REFERENCES `habilidades` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of habilidades_c
-- ----------------------------
INSERT INTO `habilidades_c` VALUES ('26564174', 'Community Manager');
INSERT INTO `habilidades_c` VALUES ('27562147', 'Cantante');
INSERT INTO `habilidades_c` VALUES ('27894123', 'Programador Backend');
INSERT INTO `habilidades_c` VALUES ('27894123', 'Programador Frontend');
INSERT INTO `habilidades_c` VALUES ('28952146', 'Escritor');
INSERT INTO `habilidades_c` VALUES ('30453753', 'Programador Frontend');
INSERT INTO `habilidades_c` VALUES ('30453753', 'Tester');
INSERT INTO `habilidades_c` VALUES ('30453753', 'Traductor');

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
/*DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `rif` varchar(9) NOT NULL,
  `f_fundacion` date DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`rif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('205463781', 'Trabajos al dia', 'Canada', 'N', 'Tu empresa para asesorarte en todos tus trabajos');
INSERT INTO `empresas` VALUES ('260446980', 'Tecnomagic', 'Loma Linad', 'N', 'Lo mejor en tecnologia');
INSERT INTO `empresas` VALUES ('303848664', 'Dismarmol CA', 'Terrazas del Caroni', 'N', 'Empresa de mármol y granito');

-- ----------------------------
-- Table structure for se_postulan
-- ----------------------------
/*DROP TABLE IF EXISTS `se_postulan`;
CREATE TABLE `se_postulan` (
  `cedcandidato` varchar(8) NOT NULL,
  `idvacante` int(11) NOT NULL,
  `f_postulacion` date DEFAULT NULL,
  PRIMARY KEY (`cedcandidato`,`idvacante`),
  KEY `idVacante_idx` (`idvacante`),
  CONSTRAINT `se_postulanCan` FOREIGN KEY (`cedcandidato`) REFERENCES `candidatos` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vacanteCan` FOREIGN KEY (`idvacante`) REFERENCES `vacantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of se_postulan
-- ----------------------------
INSERT INTO `se_postulan` VALUES ('26564174', '260446980', 1, '2021-10-27');
INSERT INTO `se_postulan` VALUES ('27894123', '303848664', 1, '2021-10-27');
INSERT INTO `se_postulan` VALUES ('30453753', '303848664', 1, '2021-10-27');
INSERT INTO `se_postulan` VALUES ('30453753', '205463781', 1, '2021-10-27');

-- ----------------------------
-- Table structure for vacantes
-- ----------------------------
/*DROP TABLE IF EXISTS `vacantes`;
CREATE TABLE `vacantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `f_publicacion` date NOT NULL,
  `rifEmpresa` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rifempresa_idx` (`rifEmpresa`),
  CONSTRAINT `empresa` FOREIGN KEY (`rifEmpresa`) REFERENCES `empresas` (`rif`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of vacantes
-- ----------------------------
INSERT INTO `vacantes` VALUES ('303848664', 1, 'Community Manager para manejar cuenta de IG', 'Deberá subir 3 posts al dia durante 5 dias a la semana.',                     200, 2, 18, 50, 'N', '2021-10-27', '2021-11-04', null, 'N', 0, 'N', 'N');
INSERT INTO `vacantes` VALUES ('260446980', 1, 'Se busca programador frontend', 'Debe tener experiencia con react y angular.',                                               200, 2, 18, 50, 'N', '2021-10-27', '2021-11-30', null, 'N', 0, 'N', 'N');
INSERT INTO `vacantes` VALUES ('205463781', 1, 'En busca de traductor', 'Se necesita traductor que pueda dominar los siguientes idiomas: Inglés, Frances, Alemán y Español', 200, 2, 18, 50, 'N', '2021-10-27', '2021-11-30', null, 'N', 0, 'N', 'N');
INSERT INTO `vacantes` VALUES ('260446980', 2, 'Programador Frontend en React', 'Programador para realizar una pagina en React con la libreria de ChartJS',                  200, 2, 18, 50, 'N', '2021-11-25', '2021-11-30', null, 'N', 0, 'N', 'N');

-- ----------------------------
-- Table structure for habilidades_v
-- ----------------------------
/*DROP TABLE IF EXISTS `habilidades_v`;
CREATE TABLE `habilidades_v` (
  `idvacante` int(11) NOT NULL,
  `nombrehab` varchar(30) NOT NULL,
  PRIMARY KEY (`idvacante`,`nombrehab`),
  KEY `nombreHab_idx` (`nombrehab`),
  CONSTRAINT `nombreHab` FOREIGN KEY (`nombrehab`) REFERENCES `habilidades` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vanteId` FOREIGN KEY (`idvacante`) REFERENCES `vacantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;*/

-- ----------------------------
-- Records of habilidades_v
-- ----------------------------
INSERT INTO `habilidades_v` VALUES ('260446980', 1, 'Programador Frontend');
INSERT INTO `habilidades_v` VALUES ('303848664', 1, 'Community Manager');
INSERT INTO `habilidades_v` VALUES ('205463781', 1, 'Traductor');
INSERT INTO `habilidades_v` VALUES ('260446980', 2, 'Programador Frontend');
