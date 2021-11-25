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

 Date: 24/11/2021 21:38:46
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

SET FOREIGN_KEY_CHECKS = 1;
