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

 Date: 07/12/2021 10:26:33
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
  `nivel_edu` int NOT NULL,
  `disponibilidad_de_viajar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cedula`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES ('10512968', 'Edwin Souquett', 40, '04128569874', 'edwin.s@gmail.com', 'UDO', 1, 'S');
INSERT INTO `candidatos` VALUES ('16451321', 'Jesús González', 19, '04169562845', 'jesus.gon@gmail.com', 'UCAB', 3, 'S');
INSERT INTO `candidatos` VALUES ('19565412', 'Nahum Giral', 21, '04266547157', 'nahum.giral@gmail.com', 'USB', 1, 'N');
INSERT INTO `candidatos` VALUES ('27506984', 'Gustavo', 21, '04120833879', 'gustavo.dgs@gmail.com', 'UCAB', 2, 'N');
INSERT INTO `candidatos` VALUES ('27951469', 'Luis Barreto', 21, '04164569842', 'barreto.exe@gmail.com', 'USB', 3, 'S');
INSERT INTO `candidatos` VALUES ('28512604', 'Jesus Gutiérrez', 19, '04121178304', 'jesus.alegs@gmail.com', 'UCAB', 2, 'N');
INSERT INTO `candidatos` VALUES ('28659564', 'María Guerra', 19, '04149695471', 'maria.guerra@gmail.com', 'UDO', 3, 'N');
INSERT INTO `candidatos` VALUES ('32569451', 'Monica Cuaulma', 20, '04162565432', 'monica.c@gmail.com', 'UDO', 2, 'N');
INSERT INTO `candidatos` VALUES ('33541235', 'Anthony Barrios', 19, '04123254796', 'anthony.b@gmail.com', 'UBA', 1, 'S');
INSERT INTO `candidatos` VALUES ('9951411', 'Homero Gutiérrez', 52, '04128593418', 'homero.sgp@gmail.com', 'UBA', 2, 'S');

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
INSERT INTO `habilidades_v` VALUES ('00003', 2, 'Programación en JAVA');
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
  `fecha` date NOT NULL,
  PRIMARY KEY (`candidato`, `empresa`, `vacante`) USING BTREE,
  INDEX `fk_se_postulan_Vacantes_1`(`empresa`, `vacante`) USING BTREE,
  CONSTRAINT `fk_se_postulan_Candidatos_1` FOREIGN KEY (`candidato`) REFERENCES `candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_se_postulan_Vacantes_1` FOREIGN KEY (`empresa`, `vacante`) REFERENCES `vacantes` (`empresa`, `cod_v`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of se_postulan
-- ----------------------------
INSERT INTO `se_postulan` VALUES ('10512968', '00003', 2, '2021-09-15');
INSERT INTO `se_postulan` VALUES ('16451321', '00005', 1, '2021-12-28');
INSERT INTO `se_postulan` VALUES ('19565412', '00001', 1, '2021-09-15');
INSERT INTO `se_postulan` VALUES ('19565412', '00002', 1, '2021-03-22');
INSERT INTO `se_postulan` VALUES ('27506984', '00001', 2, '2021-02-01');
INSERT INTO `se_postulan` VALUES ('27951469', '00004', 1, '2021-09-25');
INSERT INTO `se_postulan` VALUES ('28512604', '00001', 1, '2021-10-15');
INSERT INTO `se_postulan` VALUES ('28512604', '00004', 1, '2021-08-30');
INSERT INTO `se_postulan` VALUES ('28659564', '00001', 2, '2021-03-01');
INSERT INTO `se_postulan` VALUES ('32569451', '00002', 2, '2021-07-05');
INSERT INTO `se_postulan` VALUES ('33541235', '00003', 1, '2021-08-06');
INSERT INTO `se_postulan` VALUES ('9951411', '00003', 2, '2021-07-19');

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
  `educacion_min` int NOT NULL,
  `edad_min` int NOT NULL,
  `edad_max` int NULL DEFAULT NULL,
  `disponibilidad_de_viajar` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `candidato_seleccionado` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empresa`, `cod_v`) USING BTREE,
  INDEX `fk_Vacantes_Candidatos_1`(`candidato_seleccionado`) USING BTREE,
  CONSTRAINT `fk_Vacantes_Candidatos_1` FOREIGN KEY (`candidato_seleccionado`) REFERENCES `candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_Vacantes_Empresas_1` FOREIGN KEY (`empresa`) REFERENCES `empresas` (`rif`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vacantes
-- ----------------------------
INSERT INTO `vacantes` VALUES ('00001', 1, 'Asistente administrativo remoto', NULL, 200, 2, 25, 45, 'N', '2021-09-13', '2021-12-31', '19565412');
INSERT INTO `vacantes` VALUES ('00001', 2, 'Desarrollador C#', NULL, 350, 2, 20, 50, 'N', '2021-01-14', '2021-12-12', NULL);
INSERT INTO `vacantes` VALUES ('00002', 1, 'Redactor creativo', NULL, 350, 1, 18, 35, 'N', '2021-03-21', '2021-06-06', '19565412');
INSERT INTO `vacantes` VALUES ('00002', 2, 'Desarrollador Frontend', NULL, 400, 1, 25, 55, 'S', '2021-05-30', '2021-11-30', '32569451');
INSERT INTO `vacantes` VALUES ('00003', 1, 'Diseñador de producto', NULL, 400, 2, 20, 30, 'S', '2021-06-06', '2021-11-30', '33541235');
INSERT INTO `vacantes` VALUES ('00003', 2, 'Desrrollador JAVA', NULL, 350, 2, 18, 55, 'N', '2021-07-17', '2021-12-15', NULL);
INSERT INTO `vacantes` VALUES ('00003', 3, 'Asistente administrativo remoto', NULL, 250, 2, 20, 50, 'S', '2021-10-07', '2022-01-05', NULL);
INSERT INTO `vacantes` VALUES ('00003', 4, 'Diseñador gráfico', NULL, 300, 1, 18, 50, 'N', '2021-08-20', '2021-11-20', NULL);
INSERT INTO `vacantes` VALUES ('00003', 5, 'Disñador Frontend', NULL, 450, 1, 22, 45, 'N', '2021-11-01', '2021-12-01', NULL);
INSERT INTO `vacantes` VALUES ('00003', 6, 'Desarrollador C#', NULL, 360, 2, 18, 50, 'S', '2021-10-18', '2021-12-31', NULL);
INSERT INTO `vacantes` VALUES ('00004', 1, 'Diseñador Frontend', NULL, 300, 1, 21, 50, 'S', '2021-08-26', '2021-09-26', '27951469');
INSERT INTO `vacantes` VALUES ('00005', 1, 'Diseñador gráfico', NULL, 250, 2, 18, 35, 'N', '2021-09-06', '2021-12-31', '16451321');

-- ----------------------------
-- Function structure for is_activa
-- ----------------------------
DROP FUNCTION IF EXISTS `is_activa`;
delimiter ;;
CREATE FUNCTION `is_activa`(empresa VARCHAR(30),
    vacante INT)
 RETURNS varchar(30) CHARSET utf8mb4
  DETERMINISTIC
BEGIN

    DECLARE fecha_publicacion DATE;
    DECLARE fecha_vencimiento DATE;
    DECLARE candidato_seleccionado VARCHAR(10);

    SELECT v.fecha_publicacion, v.fecha_vencimiento, v.candidato_seleccionado
    INTO fecha_publicacion, fecha_vencimiento, candidato_seleccionado
    FROM vacantes v
    WHERE v.empresa = empresa
    AND v.cod_v = vacante;

    IF (NOW() BETWEEN fecha_publicacion AND fecha_vencimiento)
        AND candidato_seleccionado IS NULL THEN
        RETURN 'VERDADERO';
    ELSE RETURN 'FALSO';
    END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for is_alta_demanda
-- ----------------------------
DROP FUNCTION IF EXISTS `is_alta_demanda`;
delimiter ;;
CREATE FUNCTION `is_alta_demanda`(empresa VARCHAR(30))
 RETURNS varchar(30) CHARSET utf8mb4
  DETERMINISTIC
BEGIN

    DECLARE num_vacantes INT;
		DECLARE num_vacantes_ult_ano INT;
    DECLARE num_vacantes_10_postulaciones INT;
		
		-- numero de vacantes
		SELECT COUNT(v.cod_v)
		INTO num_vacantes
		FROM vacantes v
		WHERE v.empresa = empresa;
		
		-- nuemero de ofertas en el ultimo ano
		SELECT COUNT(*)
		INTO num_vacantes_ult_ano
		FROM vacantes v
		WHERE v.empresa = empresa
		AND DATEDIFF(NOW(), v.fecha_publicacion) <= 365;
		
		-- numero de vacantes que reciben al menos 10 postulaciones
		SELECT COUNT(*)
		INTO num_vacantes_10_postulaciones
		FROM (SELECT sp.vacante, COUNT(sp.candidato)
					FROM se_postulan sp
					WHERE sp.empresa = empresa
					GROUP BY sp.vacante
					HAVING COUNT(sp.candidato) >= 10) FINAL;
					
		IF (num_vacantes <= 0) THEN
				RETURN 'FALSO';
    ELSEIF (num_vacantes_ult_ano > 15)
        AND (num_vacantes_10_postulaciones > num_vacantes/2) THEN
        RETURN 'VERDADERO';
    ELSE RETURN 'FALSO';
    END IF;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
