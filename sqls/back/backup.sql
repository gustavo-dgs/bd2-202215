/*
 Navicat Premium Data Transfer

 Source Server         : bd2-202215
 Source Server Type    : MySQL
 Source Server Version : 100507
 Source Host           : labs-dbservices01.ucab.edu.ve:3306
 Source Schema         : bd2_202215_27506984

 Target Server Type    : MySQL
 Target Server Version : 100507
 File Encoding         : 65001

 Date: 24/11/2021 21:40:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `cedula` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `edad` int NOT NULL,
  `telefono` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `institucion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nivel_edu` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `disponibilidad_de_viajar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cedula`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES ('10512968', 'Edwin Souquett', 40, '04128569874', 'edwin.s@gmail.com', 'UDO', 'TSU', 'S');
INSERT INTO `candidatos` VALUES ('16451321', 'Jesús González', 19, '04169562845', 'jesus.gon@gmail.com', 'UCAB', 'Posgrado', 'S');
INSERT INTO `candidatos` VALUES ('19565412', 'Nahum Giral', 21, '04266547157', 'nahum.giral@gmail.com', 'USB', 'TSU', 'N');
INSERT INTO `candidatos` VALUES ('27506984', 'Gustavo', 21, '04120833879', 'gustavo.dgs@gmail.com', 'UCAB', 'universitario', 'N');
INSERT INTO `candidatos` VALUES ('27951469', 'Luis Barreto', 21, '04164569842', 'barreto.exe@gmail.com', 'USB', 'Posgrado', 'S');
INSERT INTO `candidatos` VALUES ('28512604', 'Jesus Gutiérrez', 19, '04121178304', 'jesus.alegs@gmail.com', 'UCAB', 'universitario', 'N');
INSERT INTO `candidatos` VALUES ('28659564', 'María Guerra', 19, '04149695471', 'maria.guerra@gmail.com', 'UDO', 'Posgrado', 'N');
INSERT INTO `candidatos` VALUES ('32569451', 'Monica Cuaulma', 20, '04162565432', 'monica.c@gmail.com', 'UDO', 'universitario', 'N');
INSERT INTO `candidatos` VALUES ('33541235', 'Anthony Barrios', 19, '04123254796', 'anthony.b@gmail.com', 'UBA', 'TSU', 'S');
INSERT INTO `candidatos` VALUES ('9951411', 'Homero Gutiérrez', 52, '04128593418', 'homero.sgp@gmail.com', 'UBA', 'universitario', 'S');

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas`  (
  `rif` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of empresas
-- ----------------------------
INSERT INTO `empresas` VALUES ('00001', 'MacDonal\'s', 'Los Olivos');
INSERT INTO `empresas` VALUES ('00002', 'Redemerca', 'Zona industrial Guatire');
INSERT INTO `empresas` VALUES ('00003', 'UCAB', 'Parroquia universidad');
INSERT INTO `empresas` VALUES ('00004', 'Microsoft', 'Tel Aviv');
INSERT INTO `empresas` VALUES ('00005', 'Apple', 'El imperio');

-- ----------------------------
-- Table structure for habilidades_c
-- ----------------------------
DROP TABLE IF EXISTS `habilidades_c`;
CREATE TABLE `habilidades_c`  (
  `candidato` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `habilidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`candidato`, `habilidad`) USING BTREE,
  CONSTRAINT `fk_habilidades_c_Candidatos_1` FOREIGN KEY (`candidato`) REFERENCES `candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of habilidades_c
-- ----------------------------
INSERT INTO `habilidades_c` VALUES ('10512968', 'Programación en C++');
INSERT INTO `habilidades_c` VALUES ('10512968', 'Programación en JAVA');
INSERT INTO `habilidades_c` VALUES ('16451321', 'Adobe Ilustrator');
INSERT INTO `habilidades_c` VALUES ('16451321', 'Adobe Photoshop');
INSERT INTO `habilidades_c` VALUES ('19565412', 'Facebook Ads');
INSERT INTO `habilidades_c` VALUES ('19565412', 'Inglés B2');
INSERT INTO `habilidades_c` VALUES ('19565412', 'Manejo de Excel');
INSERT INTO `habilidades_c` VALUES ('27506984', 'Programación .NET, ASP.NET, .NET');
INSERT INTO `habilidades_c` VALUES ('27506984', 'SQL Server');
INSERT INTO `habilidades_c` VALUES ('27951469', 'API REST');
INSERT INTO `habilidades_c` VALUES ('27951469', 'HTML, CSS, JS');
INSERT INTO `habilidades_c` VALUES ('28512604', 'Inglés B2');
INSERT INTO `habilidades_c` VALUES ('28512604', 'React');
INSERT INTO `habilidades_c` VALUES ('28659564', 'Manejo de Azure');
INSERT INTO `habilidades_c` VALUES ('28659564', 'Programación .NET, ASP.NET, .NET');
INSERT INTO `habilidades_c` VALUES ('32569451', 'HTML, CSS, JS');
INSERT INTO `habilidades_c` VALUES ('32569451', 'WordPress');
INSERT INTO `habilidades_c` VALUES ('33541235', 'Adobe Ilustrator');
INSERT INTO `habilidades_c` VALUES ('33541235', 'Adobe Photoshop');
INSERT INTO `habilidades_c` VALUES ('33541235', 'Desarrollo de producto');
INSERT INTO `habilidades_c` VALUES ('9951411', 'Programación en JAVA');
INSERT INTO `habilidades_c` VALUES ('9951411', 'SQL Server');

-- ----------------------------
-- Table structure for habilidades_v
-- ----------------------------
DROP TABLE IF EXISTS `habilidades_v`;
CREATE TABLE `habilidades_v`  (
  `empresa` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vacante` int NOT NULL,
  `habilidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`empresa`, `vacante`, `habilidad`) USING BTREE,
  CONSTRAINT `fk_habilidades_v_Vacantes_1` FOREIGN KEY (`empresa`, `vacante`) REFERENCES `vacantes` (`empresa`, `cod_v`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of habilidades_v
-- ----------------------------
INSERT INTO `habilidades_v` VALUES ('00001', 1, 'Inglés B2');
INSERT INTO `habilidades_v` VALUES ('00001', 1, 'Manejo de Excel');
INSERT INTO `habilidades_v` VALUES ('00001', 2, 'Programación .NET, ASP.NET, .NET');
INSERT INTO `habilidades_v` VALUES ('00001', 2, 'SQL Server');
INSERT INTO `habilidades_v` VALUES ('00002', 1, 'Facebook Ads');
INSERT INTO `habilidades_v` VALUES ('00002', 1, 'Inglés B2');
INSERT INTO `habilidades_v` VALUES ('00002', 2, 'HTML, CSS, JS');
INSERT INTO `habilidades_v` VALUES ('00002', 2, 'WordPress');
INSERT INTO `habilidades_v` VALUES ('00003', 1, 'Adobe Photoshop');
INSERT INTO `habilidades_v` VALUES ('00003', 1, 'Desarrollo de producto');
INSERT INTO `habilidades_v` VALUES ('00003', 2, 'Programación JAVA');
INSERT INTO `habilidades_v` VALUES ('00004', 1, 'API REST');
INSERT INTO `habilidades_v` VALUES ('00004', 1, 'HTML, CSS, JS');
INSERT INTO `habilidades_v` VALUES ('00005', 1, 'Adobe Ilustrator');
INSERT INTO `habilidades_v` VALUES ('00005', 1, 'Adobe Photoshop');

-- ----------------------------
-- Table structure for se_postulan
-- ----------------------------
DROP TABLE IF EXISTS `se_postulan`;
CREATE TABLE `se_postulan`  (
  `candidato` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `empresa` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vacante` int NOT NULL,
  PRIMARY KEY (`candidato`, `empresa`, `vacante`) USING BTREE,
  INDEX `fk_se_postulan_Vacantes_1`(`empresa`, `vacante`) USING BTREE,
  CONSTRAINT `fk_se_postulan_Candidatos_1` FOREIGN KEY (`candidato`) REFERENCES `candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_se_postulan_Vacantes_1` FOREIGN KEY (`empresa`, `vacante`) REFERENCES `vacantes` (`empresa`, `cod_v`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of se_postulan
-- ----------------------------
INSERT INTO `se_postulan` VALUES ('10512968', '00003', 2);
INSERT INTO `se_postulan` VALUES ('16451321', '00005', 1);
INSERT INTO `se_postulan` VALUES ('19565412', '00001', 1);
INSERT INTO `se_postulan` VALUES ('19565412', '00002', 1);
INSERT INTO `se_postulan` VALUES ('27506984', '00001', 2);
INSERT INTO `se_postulan` VALUES ('27951469', '00004', 1);
INSERT INTO `se_postulan` VALUES ('28512604', '00001', 1);
INSERT INTO `se_postulan` VALUES ('28512604', '00004', 1);
INSERT INTO `se_postulan` VALUES ('28659564', '00001', 2);
INSERT INTO `se_postulan` VALUES ('32569451', '00002', 2);
INSERT INTO `se_postulan` VALUES ('33541235', '00003', 1);
INSERT INTO `se_postulan` VALUES ('9951411', '00003', 2);

-- ----------------------------
-- Table structure for vacantes
-- ----------------------------
DROP TABLE IF EXISTS `vacantes`;
CREATE TABLE `vacantes`  (
  `empresa` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cod_v` int NOT NULL,
  `nombre_v` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `salario` int NOT NULL,
  `educacion_min` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `edad_min` int NOT NULL,
  `edad_max` int NULL DEFAULT NULL,
  `disponibilidad_de_viajar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empresa`, `cod_v`) USING BTREE,
  CONSTRAINT `fk_Vacantes_Empresas_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`rif`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacantes
-- ----------------------------
INSERT INTO `vacantes` VALUES ('00001', 1, 'Asistente administrativo remoto', '', 200, 'universitario', 25, 45, 'N');
INSERT INTO `vacantes` VALUES ('00001', 2, 'Desarrollador C#', NULL, 350, 'universitario', 20, 50, 'N');
INSERT INTO `vacantes` VALUES ('00002', 1, 'Redactor creativo', NULL, 350, 'TSU', 18, 35, 'N');
INSERT INTO `vacantes` VALUES ('00002', 2, 'Desarrollador Frontend', NULL, 400, 'TSU', 25, 55, 'S');
INSERT INTO `vacantes` VALUES ('00003', 1, 'Diseñador de producto', NULL, 400, 'universitario', 20, 30, 'S');
INSERT INTO `vacantes` VALUES ('00003', 2, 'Desrrollador JAVA', NULL, 350, 'universitario', 18, 55, 'N');
INSERT INTO `vacantes` VALUES ('00004', 1, 'Diseñador Frontend', NULL, 300, 'TSU', 21, 50, 'S');
INSERT INTO `vacantes` VALUES ('00005', 1, 'Diseñador gráfico', NULL, 250, 'universitario', 18, 35, 'N');

SET FOREIGN_KEY_CHECKS = 1;
