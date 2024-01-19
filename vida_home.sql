/*
 Navicat Premium Data Transfer

 Source Server         : 1.12
 Source Server Type    : MySQL
 Source Server Version : 50524 (5.5.24-log)
 Source Host           : 192.168.1.12:3306
 Source Schema         : vida_home

 Target Server Type    : MySQL
 Target Server Version : 50524 (5.5.24-log)
 File Encoding         : 65001

 Date: 05/12/2023 16:52:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for archivos_iso
-- ----------------------------
DROP TABLE IF EXISTS `archivos_iso`;
CREATE TABLE `archivos_iso`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tipo_iso` int(1) NULL DEFAULT NULL,
  `activo` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of archivos_iso
-- ----------------------------
INSERT INTO `archivos_iso` VALUES (1, 'Curso 1 - Introducción a seguridad de la información', 'CURSO 1_INTRODUCCIÓN SEGURIDAD INFORMACIÓN.pdf', 'Material_ISO/', 'material_cursos', NULL, 1);
INSERT INTO `archivos_iso` VALUES (2, 'Curso 2 - ISO 27001', 'CURSO 2_ISO 27001.pdf', 'Material_ISO/', 'material_cursos', NULL, 1);
INSERT INTO `archivos_iso` VALUES (3, 'Políticas específicas de seguridad de la información', 'VIDA_M3_MANUAL DE POLÍTICAS ESPECÍFICAS DE SI.pdf', 'Material_ISO/', 'material_politicas', NULL, 1);
INSERT INTO `archivos_iso` VALUES (4, 'Video Curso 1 - Introducción a seguridad de la información', 'VIDA_CURSO 1_INTRO SGSI.MP4', 'Videos_ISO/', 'material_videos', 1, 1);
INSERT INTO `archivos_iso` VALUES (5, 'Video Curso 2 - ISO 27001', 'VIDA_CURSO 2_ISO 27001.MP4', 'Videos_ISO/', 'material_videos', 1, 1);
INSERT INTO `archivos_iso` VALUES (6, 'Video Curso 1 - Importancia seguridad información', 'VIDA_CURSO 1_IMPORTANCIA SEGURIDAD INFORMACION.MP4', 'Videos_ISO/', 'material_videos', 1, 1);
INSERT INTO `archivos_iso` VALUES (7, 'Video Curso 2 - Consecuencias de no gestionar la seguridad de la información', 'VIDA_CURSO 2_CONSECUENCIAS DE NO GESTIONAR LA SEGURIDAD INFO.MP4', 'Videos_ISO/', 'material_videos', 1, 1);
INSERT INTO `archivos_iso` VALUES (8, 'Video Curso 2 - Amenaza, vulnerabilidad y riesgo', 'VIDA_CURSO 3_AMENAZA, VULNERABILIDAD Y RIESGO.MP4', 'Videos_ISO/', 'material_videos', 1, 1);
INSERT INTO `archivos_iso` VALUES (9, 'Video capacitación de reciclaje', 'Meet_Capacitacion reciclaje.MP4', 'Videos_ISO/', 'material_videos', 2, 1);
INSERT INTO `archivos_iso` VALUES (10, 'Video sistema gestión ambiental ISO 14001', 'VIDA_ISO 14001.WEBM', 'Videos_ISO/', 'material_videos', 2, 1);
INSERT INTO `archivos_iso` VALUES (11, 'Video capacitaciones ISO 9001', 'Capacitación ISO.MP4', 'Videos_ISO/', 'material_videos', 3, 1);

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of areas
-- ----------------------------
INSERT INTO `areas` VALUES (1, 'Gerencia Administración');
INSERT INTO `areas` VALUES (2, 'Cajas y Pagos');
INSERT INTO `areas` VALUES (3, 'Asuntos Internos');
INSERT INTO `areas` VALUES (4, 'Auditoría');
INSERT INTO `areas` VALUES (5, 'Bienvenida');
INSERT INTO `areas` VALUES (6, 'Cadetería');
INSERT INTO `areas` VALUES (7, 'Calidad');
INSERT INTO `areas` VALUES (8, 'Capacitación');
INSERT INTO `areas` VALUES (9, 'Comercial');
INSERT INTO `areas` VALUES (10, 'Coordinación');
INSERT INTO `areas` VALUES (11, 'Gerencia Coordinación');
INSERT INTO `areas` VALUES (12, 'Legajos');
INSERT INTO `areas` VALUES (13, 'Legal');
INSERT INTO `areas` VALUES (14, 'Morosidad');
INSERT INTO `areas` VALUES (15, 'Personal');
INSERT INTO `areas` VALUES (16, 'Recepción');
INSERT INTO `areas` VALUES (17, 'RRHH');
INSERT INTO `areas` VALUES (18, 'Toma Pedidos');
INSERT INTO `areas` VALUES (19, 'Diseño');
INSERT INTO `areas` VALUES (20, 'Desarrollo');
INSERT INTO `areas` VALUES (21, 'Infraestructura');
INSERT INTO `areas` VALUES (22, 'Secretaría');
INSERT INTO `areas` VALUES (23, 'Cobranzas');

-- ----------------------------
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, 'Artigas');
INSERT INTO `departamentos` VALUES (2, 'Canelones');
INSERT INTO `departamentos` VALUES (3, 'Cerro Largo');
INSERT INTO `departamentos` VALUES (4, 'Colonia');
INSERT INTO `departamentos` VALUES (5, 'Durazno');
INSERT INTO `departamentos` VALUES (6, 'Flores');
INSERT INTO `departamentos` VALUES (7, 'Florida');
INSERT INTO `departamentos` VALUES (8, 'Lavalleja');
INSERT INTO `departamentos` VALUES (9, 'Maldonado');
INSERT INTO `departamentos` VALUES (10, 'Montevideo');
INSERT INTO `departamentos` VALUES (11, 'Paysandú');
INSERT INTO `departamentos` VALUES (12, 'Río Negro');
INSERT INTO `departamentos` VALUES (13, 'Rivera');
INSERT INTO `departamentos` VALUES (14, 'Rocha');
INSERT INTO `departamentos` VALUES (15, 'Salto');
INSERT INTO `departamentos` VALUES (16, 'San José');
INSERT INTO `departamentos` VALUES (17, 'Soriano');
INSERT INTO `departamentos` VALUES (18, 'Tacuarembó');
INSERT INTO `departamentos` VALUES (19, 'Treinta y Tres');

-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emails
-- ----------------------------
INSERT INTO `emails` VALUES (1, '2', 'f.pagliano@vida.com.uy');
INSERT INTO `emails` VALUES (2, '3', 'l.maza@vida.com.uy');
INSERT INTO `emails` VALUES (3, '4', 'cajaypagos2@vida.com.uy');
INSERT INTO `emails` VALUES (4, '5', 'cajaypagos4@vida.com.uy');
INSERT INTO `emails` VALUES (5, '6', 'cajaypagos1@vida.com.uy');
INSERT INTO `emails` VALUES (6, '7', 'adm.cajas@vida.com.uy');
INSERT INTO `emails` VALUES (7, '8', 'cajaypagos3@vida.com.uy');
INSERT INTO `emails` VALUES (8, '9', 'v.cedres@vida.com.uy');
INSERT INTO `emails` VALUES (9, '10', 'adm.cajas@vida.com.uy');
INSERT INTO `emails` VALUES (10, '11', 'cajaypagos3@vida.com.uy');
INSERT INTO `emails` VALUES (11, '12', 'centralizados@vida.com.uy');
INSERT INTO `emails` VALUES (12, '13', 'cobranzas2@vida.com.uy');
INSERT INTO `emails` VALUES (13, '14', 'adm.cajas@vida.com.uy');
INSERT INTO `emails` VALUES (14, '15', '3rrhh@vida.com.uy');
INSERT INTO `emails` VALUES (15, '16', 'rrhh6@vida.com.uy');
INSERT INTO `emails` VALUES (16, '17', 'alvaro.deleon@vida.com.uy');
INSERT INTO `emails` VALUES (17, '18', 'am.lopez@vida.com.uy');
INSERT INTO `emails` VALUES (18, '19', 'c.braggio@vida.com.uy');
INSERT INTO `emails` VALUES (19, '20', 'a.horvat@vida.com.uy');
INSERT INTO `emails` VALUES (20, '21', 'asuntosinternos@vida.com.uy');
INSERT INTO `emails` VALUES (21, '22', 'asuntosinternos@vida.com.uy');
INSERT INTO `emails` VALUES (22, '23', 'n.horvat@vida.com.uy');
INSERT INTO `emails` VALUES (23, '24', 'auditoria1@vida.com.uy');
INSERT INTO `emails` VALUES (24, '25', 'bienvenida@vida.com.uy');
INSERT INTO `emails` VALUES (25, '26', 'bienvenida@vida.com.uy');
INSERT INTO `emails` VALUES (26, '27', 'bienvenida@vida.com.uy');
INSERT INTO `emails` VALUES (27, '28', 'p.pagano@vida.com.uy');
INSERT INTO `emails` VALUES (28, '29', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (29, '30', 'calidadinterior@vida.com.uy');
INSERT INTO `emails` VALUES (30, '31', 'bajas@vida.com.uy');
INSERT INTO `emails` VALUES (31, '32', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (32, '33', 'bajas@vida.com.uy');
INSERT INTO `emails` VALUES (33, '34', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (34, '35', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (35, '36', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (36, '37', 'bajas@vida.com.uy');
INSERT INTO `emails` VALUES (37, '38', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (38, '39', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (39, '40', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (40, '41', 'nicolas.g@vida.com.uy');
INSERT INTO `emails` VALUES (41, '42', 'f.estevez@vida.com.uy');
INSERT INTO `emails` VALUES (42, '43', 'x.vela@vida.com.uy');
INSERT INTO `emails` VALUES (43, '44', 'digitador@vida.com.uy');
INSERT INTO `emails` VALUES (44, '45', 'carolina.p@vida.com.uy');
INSERT INTO `emails` VALUES (45, '46', 'rrhh@vida.com.uy');
INSERT INTO `emails` VALUES (46, '47', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (47, '48', 'viaticos@vida.com.uy');
INSERT INTO `emails` VALUES (48, '49', 'canelonescoord@vida.com.uy');
INSERT INTO `emails` VALUES (49, '50', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (50, '52', 'supervisora@vida.com.uy');
INSERT INTO `emails` VALUES (51, '53', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (52, '54', 'coloniacoord@vida.com.uy');
INSERT INTO `emails` VALUES (53, '55', 'coordtacuarembo@vida.com.uy');
INSERT INTO `emails` VALUES (54, '56', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (55, '57', 'coloniacoord@vida.com.uy');
INSERT INTO `emails` VALUES (56, '58', 'coordtacuarembo@vida.com.uy');
INSERT INTO `emails` VALUES (57, '59', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (58, '60', 'coordsalto@vida.com.uy');
INSERT INTO `emails` VALUES (59, '61', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (60, '62', 'coordsalto@vida.com.uy');
INSERT INTO `emails` VALUES (61, '63', 'coordmercedes@vida.com.uy');
INSERT INTO `emails` VALUES (62, '64', 'coordminas@vida.com.uy');
INSERT INTO `emails` VALUES (63, '65', 'coordmelo@vida.com.uy');
INSERT INTO `emails` VALUES (64, '66', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (65, '68', 'coordmercedes@vida.com.uy');
INSERT INTO `emails` VALUES (66, '69', 'coordminas@vida.com.uy');
INSERT INTO `emails` VALUES (67, '70', 'coordmelo@vida.com.uy');
INSERT INTO `emails` VALUES (68, '71', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (69, '73', 'f.moreira@vida.com.uy');
INSERT INTO `emails` VALUES (70, '74', 'rrhh4@vida.com.uy');
INSERT INTO `emails` VALUES (71, '75', 'rrhh4@vida.com.uy');
INSERT INTO `emails` VALUES (73, '76', 'calidadinterna@vida.com.uy');
INSERT INTO `emails` VALUES (74, '77', 'atencioninterna2@vida.com.uy');
INSERT INTO `emails` VALUES (75, '78', 'atencioninterna3@vida.com.uy');
INSERT INTO `emails` VALUES (76, '79', 'elite@vida.com.uy');
INSERT INTO `emails` VALUES (77, '80', 'hanna.gu@vida.com.uy');
INSERT INTO `emails` VALUES (78, '81', 'mcentralizada@vida.com.uy');
INSERT INTO `emails` VALUES (79, '90', 'v.desouza@vida.com.uy');
INSERT INTO `emails` VALUES (80, '51', 'controladora@vida.com.uy');
INSERT INTO `emails` VALUES (81, '91', 'controladora@gmail.com');
INSERT INTO `emails` VALUES (82, '92', 'coordsanjose@vida.com.uy');
INSERT INTO `emails` VALUES (83, '82', 'recepcion@vida.com.uy');
INSERT INTO `emails` VALUES (84, '83', 'recepcion@vida.com.uy');
INSERT INTO `emails` VALUES (85, '84', 'correspondencia@vida.com.uy');
INSERT INTO `emails` VALUES (86, '1', 'sistemas@vida.com.uy');
INSERT INTO `emails` VALUES (87, '93', 'sistemas@vida.com.uy');
INSERT INTO `emails` VALUES (88, '94', 'sistemas@vida.com.uy');
INSERT INTO `emails` VALUES (89, '95', 'c.dasilva@vida.com.uy');
INSERT INTO `emails` VALUES (90, '96', 'programacion@vida.com.uy');
INSERT INTO `emails` VALUES (91, '97', 'antonio.roba@vida.com.uy');
INSERT INTO `emails` VALUES (92, '98', 'a.beron@vida.com.uy');
INSERT INTO `emails` VALUES (93, '99', 'a.paiva@vida.com.uy');
INSERT INTO `emails` VALUES (94, '100', 's.nunez@vida.com.uy');
INSERT INTO `emails` VALUES (95, '101', 'r.baptista@vida.com.uy');
INSERT INTO `emails` VALUES (102, '85', 'calidad@vida.com.uy');
INSERT INTO `emails` VALUES (101, '104', 'bienvenida@vida.com.uy');
INSERT INTO `emails` VALUES (103, '105', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (104, '67', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (105, '106', 'canelonescoord@vida.com.uy');
INSERT INTO `emails` VALUES (106, '107', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (107, '108', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (108, '109', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (109, '86', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (110, '87', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (111, '88', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (112, '110', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (113, '89', 'asuntosinternos@vida.com.uy');
INSERT INTO `emails` VALUES (114, '111', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (115, '112', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (116, '113', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (117, '72', 'coordina@vida.com.uy');
INSERT INTO `emails` VALUES (118, '114', 'a@gmail.com');
INSERT INTO `emails` VALUES (120, '116', 'viaticos@vida.com.uy');
INSERT INTO `emails` VALUES (121, '117', 'maldonadocoord@vida.com.uy');

-- ----------------------------
-- Table structure for emails_filiales
-- ----------------------------
DROP TABLE IF EXISTS `emails_filiales`;
CREATE TABLE `emails_filiales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_filial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emails_filiales
-- ----------------------------
INSERT INTO `emails_filiales` VALUES (1, '1', 'artigas@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (2, '2', 'administracion@acompanar.com.uy');
INSERT INTO `emails_filiales` VALUES (3, '3', 'canelones@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (4, '4', 'carmelo@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (5, '5', 'colonia@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (6, '5', 'juanlacaze@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (7, '5', 'rosario@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (8, '6', 'costadeoro@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (9, '7', 'durazno@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (10, '8', 'flores@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (11, '9', 'florida@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (12, '10', 'fraybentos@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (13, '11', 'inspira@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (14, '12', 'laspiedras@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (15, '13', 'maldonado@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (16, '14', 'mercedes@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (17, '15', 'dolores@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (18, '16', 'melo@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (19, '17', 'minas@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (20, '18', 'pando@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (21, '19', 'paysandu@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (22, '20', 'rivera@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (23, '21', 'rocha@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (24, '22', 'salto@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (25, '23', 'sancarlos@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (26, '24', 'sanjose@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (27, '25', 'santalucia@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (28, '26', 'tacuarembo@vida.com.uy');
INSERT INTO `emails_filiales` VALUES (29, '27', 'treintaytres@vida.com.uy');

-- ----------------------------
-- Table structure for filiales
-- ----------------------------
DROP TABLE IF EXISTS `filiales`;
CREATE TABLE `filiales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `departamento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `activo` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of filiales
-- ----------------------------
INSERT INTO `filiales` VALUES (1, 'Artigas', 'Artigas', 1);
INSERT INTO `filiales` VALUES (2, 'Acompañar', 'Departamento', 1);
INSERT INTO `filiales` VALUES (3, 'Canelones', 'Canelones', 1);
INSERT INTO `filiales` VALUES (4, 'Carmelo', 'Carmelo', 1);
INSERT INTO `filiales` VALUES (5, 'Colonia', 'Colonia', 1);
INSERT INTO `filiales` VALUES (6, 'Costa de Oro', 'Canelones', 1);
INSERT INTO `filiales` VALUES (7, 'Durazno', 'Durazno', 1);
INSERT INTO `filiales` VALUES (8, 'Flores', 'Flores', 1);
INSERT INTO `filiales` VALUES (9, 'Florida', 'Florida', 1);
INSERT INTO `filiales` VALUES (10, 'Fray Bentos', 'Fray Bentos', 1);
INSERT INTO `filiales` VALUES (11, 'Inspira', 'Fray Bentos', 1);
INSERT INTO `filiales` VALUES (12, 'Las Piedras', 'Canelones', 1);
INSERT INTO `filiales` VALUES (13, 'Maldonado', 'Canelones', 1);
INSERT INTO `filiales` VALUES (14, 'Mercedes', 'Soriano', 1);
INSERT INTO `filiales` VALUES (15, 'Dolores', 'Soriano', 1);
INSERT INTO `filiales` VALUES (16, 'Melo', 'Cerro Largo', 1);
INSERT INTO `filiales` VALUES (17, 'Minas', 'Lavalleja', 1);
INSERT INTO `filiales` VALUES (18, 'Pando', 'Canelones', 1);
INSERT INTO `filiales` VALUES (19, 'Paysandú', 'Paysandú', 1);
INSERT INTO `filiales` VALUES (20, 'Rivera', 'Rivera', 1);
INSERT INTO `filiales` VALUES (21, 'Rocha', 'Rocha', 1);
INSERT INTO `filiales` VALUES (22, 'Salto', 'Salto', 1);
INSERT INTO `filiales` VALUES (23, 'San Carlos', 'San Carlos', 1);
INSERT INTO `filiales` VALUES (24, 'San José', 'San José', 1);
INSERT INTO `filiales` VALUES (25, 'Santa Lucía', 'Canelones', 1);
INSERT INTO `filiales` VALUES (26, 'Tacuarembó', 'Tacuarembó', 1);
INSERT INTO `filiales` VALUES (27, 'Treinta y Tres', 'Treinta y Tres', 1);

-- ----------------------------
-- Table structure for historial_logs
-- ----------------------------
DROP TABLE IF EXISTS `historial_logs`;
CREATE TABLE `historial_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fecha` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of historial_logs
-- ----------------------------

-- ----------------------------
-- Table structure for internos_filiales
-- ----------------------------
DROP TABLE IF EXISTS `internos_filiales`;
CREATE TABLE `internos_filiales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_filial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `interno` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of internos_filiales
-- ----------------------------
INSERT INTO `internos_filiales` VALUES (1, '1', 4471);
INSERT INTO `internos_filiales` VALUES (2, '1', 4472);
INSERT INTO `internos_filiales` VALUES (3, '2', 1221);
INSERT INTO `internos_filiales` VALUES (4, '2', 1222);
INSERT INTO `internos_filiales` VALUES (5, '2', 1223);
INSERT INTO `internos_filiales` VALUES (6, '3', 3301);
INSERT INTO `internos_filiales` VALUES (7, '3', 3302);
INSERT INTO `internos_filiales` VALUES (8, '3', 3303);
INSERT INTO `internos_filiales` VALUES (9, '4', 5204);
INSERT INTO `internos_filiales` VALUES (10, '4', 5205);
INSERT INTO `internos_filiales` VALUES (11, '5', 5201);
INSERT INTO `internos_filiales` VALUES (12, '5', 5202);
INSERT INTO `internos_filiales` VALUES (13, '5', 5203);
INSERT INTO `internos_filiales` VALUES (14, '6', 3701);
INSERT INTO `internos_filiales` VALUES (15, '6', 3702);
INSERT INTO `internos_filiales` VALUES (16, '7', 3601);
INSERT INTO `internos_filiales` VALUES (17, '7', 3602);
INSERT INTO `internos_filiales` VALUES (18, '8', 36401);
INSERT INTO `internos_filiales` VALUES (19, '8', 36402);
INSERT INTO `internos_filiales` VALUES (20, '9', 3501);
INSERT INTO `internos_filiales` VALUES (21, '9', 3502);
INSERT INTO `internos_filiales` VALUES (22, '10', 5601);
INSERT INTO `internos_filiales` VALUES (23, '10', 5602);
INSERT INTO `internos_filiales` VALUES (24, '11', 1301);
INSERT INTO `internos_filiales` VALUES (25, '11', 1302);
INSERT INTO `internos_filiales` VALUES (26, '11', 1303);
INSERT INTO `internos_filiales` VALUES (27, '12', 3304);
INSERT INTO `internos_filiales` VALUES (28, '12', 3305);
INSERT INTO `internos_filiales` VALUES (29, '13', 4201);
INSERT INTO `internos_filiales` VALUES (30, '13', 4202);
INSERT INTO `internos_filiales` VALUES (31, '13', 4203);
INSERT INTO `internos_filiales` VALUES (32, '13', 4204);
INSERT INTO `internos_filiales` VALUES (33, '14', 5301);
INSERT INTO `internos_filiales` VALUES (34, '14', 5302);
INSERT INTO `internos_filiales` VALUES (35, '15', 5401);
INSERT INTO `internos_filiales` VALUES (36, '16', 4641);
INSERT INTO `internos_filiales` VALUES (37, '16', 4642);
INSERT INTO `internos_filiales` VALUES (38, '17', 4401);
INSERT INTO `internos_filiales` VALUES (39, '18', 2201);
INSERT INTO `internos_filiales` VALUES (40, '18', 2202);
INSERT INTO `internos_filiales` VALUES (41, '19', 7201);
INSERT INTO `internos_filiales` VALUES (42, '19', 7202);
INSERT INTO `internos_filiales` VALUES (43, '20', 6201);
INSERT INTO `internos_filiales` VALUES (44, '20', 6202);
INSERT INTO `internos_filiales` VALUES (45, '21', 4701);
INSERT INTO `internos_filiales` VALUES (46, '21', 4702);
INSERT INTO `internos_filiales` VALUES (47, '22', 7301);
INSERT INTO `internos_filiales` VALUES (48, '22', 7302);
INSERT INTO `internos_filiales` VALUES (49, '23', 44205);
INSERT INTO `internos_filiales` VALUES (50, '23', 44206);
INSERT INTO `internos_filiales` VALUES (51, '24', 3401);
INSERT INTO `internos_filiales` VALUES (52, '24', 3402);
INSERT INTO `internos_filiales` VALUES (53, '25', 3306);
INSERT INTO `internos_filiales` VALUES (54, '25', 3307);
INSERT INTO `internos_filiales` VALUES (55, '26', 6301);
INSERT INTO `internos_filiales` VALUES (56, '26', 6302);
INSERT INTO `internos_filiales` VALUES (57, '27', 4501);
INSERT INTO `internos_filiales` VALUES (58, '27', 4502);

-- ----------------------------
-- Table structure for internos_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `internos_usuarios`;
CREATE TABLE `internos_usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NULL DEFAULT NULL,
  `interno` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of internos_usuarios
-- ----------------------------
INSERT INTO `internos_usuarios` VALUES (1, 1, 504);
INSERT INTO `internos_usuarios` VALUES (2, 2, 604);
INSERT INTO `internos_usuarios` VALUES (3, 3, 615);
INSERT INTO `internos_usuarios` VALUES (4, 4, 716);
INSERT INTO `internos_usuarios` VALUES (5, 5, 621);
INSERT INTO `internos_usuarios` VALUES (6, 6, 616);
INSERT INTO `internos_usuarios` VALUES (7, 7, 622);
INSERT INTO `internos_usuarios` VALUES (8, 8, 610);
INSERT INTO `internos_usuarios` VALUES (9, 9, 603);
INSERT INTO `internos_usuarios` VALUES (10, 10, 602);
INSERT INTO `internos_usuarios` VALUES (11, 11, 605);
INSERT INTO `internos_usuarios` VALUES (12, 12, 617);
INSERT INTO `internos_usuarios` VALUES (13, 13, 619);
INSERT INTO `internos_usuarios` VALUES (14, 14, 618);
INSERT INTO `internos_usuarios` VALUES (15, 15, 611);
INSERT INTO `internos_usuarios` VALUES (16, 16, 608);
INSERT INTO `internos_usuarios` VALUES (17, 17, 624);
INSERT INTO `internos_usuarios` VALUES (18, 18, 612);
INSERT INTO `internos_usuarios` VALUES (19, 19, 613);
INSERT INTO `internos_usuarios` VALUES (20, 20, 112);
INSERT INTO `internos_usuarios` VALUES (21, 21, 153);
INSERT INTO `internos_usuarios` VALUES (22, 22, 153);
INSERT INTO `internos_usuarios` VALUES (23, 23, 406);
INSERT INTO `internos_usuarios` VALUES (24, 24, 412);
INSERT INTO `internos_usuarios` VALUES (25, 25, 144);
INSERT INTO `internos_usuarios` VALUES (26, 26, 117);
INSERT INTO `internos_usuarios` VALUES (27, 27, 129);
INSERT INTO `internos_usuarios` VALUES (28, 28, 711);
INSERT INTO `internos_usuarios` VALUES (29, 29, 718);
INSERT INTO `internos_usuarios` VALUES (30, 30, 726);
INSERT INTO `internos_usuarios` VALUES (31, 31, 724);
INSERT INTO `internos_usuarios` VALUES (32, 32, 717);
INSERT INTO `internos_usuarios` VALUES (33, 33, 725);
INSERT INTO `internos_usuarios` VALUES (34, 34, 722);
INSERT INTO `internos_usuarios` VALUES (35, 35, 723);
INSERT INTO `internos_usuarios` VALUES (36, 36, 720);
INSERT INTO `internos_usuarios` VALUES (37, 37, 714);
INSERT INTO `internos_usuarios` VALUES (38, 38, 710);
INSERT INTO `internos_usuarios` VALUES (39, 39, 727);
INSERT INTO `internos_usuarios` VALUES (40, 40, 730);
INSERT INTO `internos_usuarios` VALUES (41, 41, 202);
INSERT INTO `internos_usuarios` VALUES (42, 42, 204);
INSERT INTO `internos_usuarios` VALUES (43, 43, 203);
INSERT INTO `internos_usuarios` VALUES (44, 44, 201);
INSERT INTO `internos_usuarios` VALUES (45, 45, 207);
INSERT INTO `internos_usuarios` VALUES (46, 46, 304);
INSERT INTO `internos_usuarios` VALUES (47, 47, 336);
INSERT INTO `internos_usuarios` VALUES (48, 48, 331);
INSERT INTO `internos_usuarios` VALUES (49, 49, 307);
INSERT INTO `internos_usuarios` VALUES (50, 50, 310);
INSERT INTO `internos_usuarios` VALUES (51, 51, 303);
INSERT INTO `internos_usuarios` VALUES (52, 52, 312);
INSERT INTO `internos_usuarios` VALUES (53, 53, 301);
INSERT INTO `internos_usuarios` VALUES (54, 54, 311);
INSERT INTO `internos_usuarios` VALUES (55, 55, 316);
INSERT INTO `internos_usuarios` VALUES (56, 56, 301);
INSERT INTO `internos_usuarios` VALUES (57, 57, 311);
INSERT INTO `internos_usuarios` VALUES (58, 58, 316);
INSERT INTO `internos_usuarios` VALUES (59, 59, 314);
INSERT INTO `internos_usuarios` VALUES (60, 60, 313);
INSERT INTO `internos_usuarios` VALUES (61, 61, 314);
INSERT INTO `internos_usuarios` VALUES (62, 62, 313);
INSERT INTO `internos_usuarios` VALUES (63, 63, 319);
INSERT INTO `internos_usuarios` VALUES (64, 64, 327);
INSERT INTO `internos_usuarios` VALUES (65, 65, 328);
INSERT INTO `internos_usuarios` VALUES (66, 66, 324);
INSERT INTO `internos_usuarios` VALUES (67, 67, 320);
INSERT INTO `internos_usuarios` VALUES (68, 68, 319);
INSERT INTO `internos_usuarios` VALUES (69, 69, 327);
INSERT INTO `internos_usuarios` VALUES (70, 70, 328);
INSERT INTO `internos_usuarios` VALUES (71, 71, 324);
INSERT INTO `internos_usuarios` VALUES (72, 72, 305);
INSERT INTO `internos_usuarios` VALUES (73, 73, 309);
INSERT INTO `internos_usuarios` VALUES (74, 74, 206);
INSERT INTO `internos_usuarios` VALUES (75, 75, 209);
INSERT INTO `internos_usuarios` VALUES (76, 76, 116);
INSERT INTO `internos_usuarios` VALUES (77, 77, 147);
INSERT INTO `internos_usuarios` VALUES (78, 78, 146);
INSERT INTO `internos_usuarios` VALUES (79, 79, 148);
INSERT INTO `internos_usuarios` VALUES (80, 80, 140);
INSERT INTO `internos_usuarios` VALUES (81, 81, 154);
INSERT INTO `internos_usuarios` VALUES (82, 82, 101);
INSERT INTO `internos_usuarios` VALUES (83, 82, 105);
INSERT INTO `internos_usuarios` VALUES (84, 83, 106);
INSERT INTO `internos_usuarios` VALUES (85, 84, 108);
INSERT INTO `internos_usuarios` VALUES (86, 85, 302);
INSERT INTO `internos_usuarios` VALUES (87, 86, 308);
INSERT INTO `internos_usuarios` VALUES (88, 87, 323);
INSERT INTO `internos_usuarios` VALUES (89, 88, 321);
INSERT INTO `internos_usuarios` VALUES (90, 89, 302);
INSERT INTO `internos_usuarios` VALUES (91, 90, 401);
INSERT INTO `internos_usuarios` VALUES (92, 91, 303);
INSERT INTO `internos_usuarios` VALUES (93, 92, 315);
INSERT INTO `internos_usuarios` VALUES (94, 93, 502);
INSERT INTO `internos_usuarios` VALUES (95, 94, 503);
INSERT INTO `internos_usuarios` VALUES (96, 95, 505);
INSERT INTO `internos_usuarios` VALUES (97, 96, 506);
INSERT INTO `internos_usuarios` VALUES (98, 97, 507);
INSERT INTO `internos_usuarios` VALUES (99, 98, 511);
INSERT INTO `internos_usuarios` VALUES (100, 99, 512);
INSERT INTO `internos_usuarios` VALUES (101, 100, 508);
INSERT INTO `internos_usuarios` VALUES (102, 101, 510);
INSERT INTO `internos_usuarios` VALUES (108, 104, 118);
INSERT INTO `internos_usuarios` VALUES (109, 105, 334);
INSERT INTO `internos_usuarios` VALUES (110, 67, 336);
INSERT INTO `internos_usuarios` VALUES (111, 106, 307);
INSERT INTO `internos_usuarios` VALUES (112, 107, 335);
INSERT INTO `internos_usuarios` VALUES (113, 108, 320);
INSERT INTO `internos_usuarios` VALUES (114, 109, 305);
INSERT INTO `internos_usuarios` VALUES (115, 110, 322);
INSERT INTO `internos_usuarios` VALUES (116, 111, 308);
INSERT INTO `internos_usuarios` VALUES (117, 112, 323);
INSERT INTO `internos_usuarios` VALUES (118, 113, 321);
INSERT INTO `internos_usuarios` VALUES (119, 114, 111);
INSERT INTO `internos_usuarios` VALUES (121, 116, 331);
INSERT INTO `internos_usuarios` VALUES (122, 117, 315);

-- ----------------------------
-- Table structure for logs_correctos
-- ----------------------------
DROP TABLE IF EXISTS `logs_correctos`;
CREATE TABLE `logs_correctos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consulta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_historial_logs` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs_correctos
-- ----------------------------

-- ----------------------------
-- Table structure for logs_errores
-- ----------------------------
DROP TABLE IF EXISTS `logs_errores`;
CREATE TABLE `logs_errores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `consulta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `id_historial_logs` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs_errores
-- ----------------------------

-- ----------------------------
-- Table structure for marcadores
-- ----------------------------
DROP TABLE IF EXISTS `marcadores`;
CREATE TABLE `marcadores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_titulo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `variantes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `activo` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of marcadores
-- ----------------------------
INSERT INTO `marcadores` VALUES (1, 'mail.png', 'https://mail.google.com/mail/u/0/#inbox', 'Email', NULL, '1', 1);
INSERT INTO `marcadores` VALUES (2, 'VidaSig.png', NULL, 'VidaSig', NULL, '2', 1);
INSERT INTO `marcadores` VALUES (3, 'coordinacion.png', 'http://192.168.250.11/coordinacion/', 'Coordinación', 'Política y Procedimientos', '3', 1);
INSERT INTO `marcadores` VALUES (4, 'rrhh.png', NULL, 'Ingreso RRHH', NULL, '2', 1);
INSERT INTO `marcadores` VALUES (5, 'padron.png', 'http://192.168.1.250:82/ene3/', 'Padrón', '', '1', 1);
INSERT INTO `marcadores` VALUES (6, 'cobrado.png', 'http://192.168.250.11/cobrado/', 'Cobrado', NULL, '1', 1);
INSERT INTO `marcadores` VALUES (7, 'abm.png', 'http://192.168.1.250:82/abmv2/', 'ABM', NULL, '4', 1);
INSERT INTO `marcadores` VALUES (8, 'crm.png', 'http://192.168.1.250:82/crm/', 'CRM', NULL, '1', 1);
INSERT INTO `marcadores` VALUES (9, 'logovidanet.png', 'http://192.168.1.12/wordpress', 'VidaNet', NULL, '1', 1);
INSERT INTO `marcadores` VALUES (10, 'icontusrecibos.png', 'http://tusrecibos.com.uy', 'Tus Recibos', NULL, '1', 1);
INSERT INTO `marcadores` VALUES (18, 'TFXT0G7MRLEMKGII9PJR.png', 'https://vida-apps.com/sistema_reclamos/index.html', 'Sistema Reclamos', '', '1', 1);
INSERT INTO `marcadores` VALUES (17, 'X0ODLBVB953Z8QLYIGNK.png', 'http://192.168.1.250:82/newcoordinacomp/', 'CoordinaComp', '', '1', 1);
INSERT INTO `marcadores` VALUES (19, 'CON0WWOPJV4HVDEGHLKR.png', 'http://200.2.49.100/status/index.php', 'Status', '', '1', 1);
INSERT INTO `marcadores` VALUES (20, 'L1UA2GQCSCTJWN8PBVZO.jpg', 'https://www.vida.com.uy/', 'VIDA', '01', '3', 1);

-- ----------------------------
-- Table structure for marcadores_x_area
-- ----------------------------
DROP TABLE IF EXISTS `marcadores_x_area`;
CREATE TABLE `marcadores_x_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) NULL DEFAULT NULL,
  `id_marcador` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of marcadores_x_area
-- ----------------------------
INSERT INTO `marcadores_x_area` VALUES (1, 21, 1);
INSERT INTO `marcadores_x_area` VALUES (2, 21, 2);
INSERT INTO `marcadores_x_area` VALUES (3, 21, 3);
INSERT INTO `marcadores_x_area` VALUES (4, 21, 4);
INSERT INTO `marcadores_x_area` VALUES (5, 21, 5);
INSERT INTO `marcadores_x_area` VALUES (6, 21, 6);
INSERT INTO `marcadores_x_area` VALUES (7, 21, 7);
INSERT INTO `marcadores_x_area` VALUES (8, 21, 8);
INSERT INTO `marcadores_x_area` VALUES (9, 21, 9);
INSERT INTO `marcadores_x_area` VALUES (10, 21, 10);
INSERT INTO `marcadores_x_area` VALUES (17, 19, 1);
INSERT INTO `marcadores_x_area` VALUES (18, 19, 2);
INSERT INTO `marcadores_x_area` VALUES (19, 19, 3);
INSERT INTO `marcadores_x_area` VALUES (20, 19, 4);
INSERT INTO `marcadores_x_area` VALUES (21, 19, 5);
INSERT INTO `marcadores_x_area` VALUES (22, 19, 6);
INSERT INTO `marcadores_x_area` VALUES (23, 19, 7);
INSERT INTO `marcadores_x_area` VALUES (24, 19, 8);
INSERT INTO `marcadores_x_area` VALUES (25, 19, 9);
INSERT INTO `marcadores_x_area` VALUES (26, 19, 10);
INSERT INTO `marcadores_x_area` VALUES (27, 3, 3);
INSERT INTO `marcadores_x_area` VALUES (28, 3, 5);
INSERT INTO `marcadores_x_area` VALUES (29, 3, 6);
INSERT INTO `marcadores_x_area` VALUES (30, 4, 5);
INSERT INTO `marcadores_x_area` VALUES (31, 4, 8);
INSERT INTO `marcadores_x_area` VALUES (32, 4, 3);
INSERT INTO `marcadores_x_area` VALUES (33, 4, 9);
INSERT INTO `marcadores_x_area` VALUES (34, 4, 2);
INSERT INTO `marcadores_x_area` VALUES (35, 4, 6);
INSERT INTO `marcadores_x_area` VALUES (36, 5, 5);
INSERT INTO `marcadores_x_area` VALUES (37, 5, 9);
INSERT INTO `marcadores_x_area` VALUES (38, 5, 10);
INSERT INTO `marcadores_x_area` VALUES (39, 5, 7);
INSERT INTO `marcadores_x_area` VALUES (40, 6, 1);
INSERT INTO `marcadores_x_area` VALUES (41, 6, 10);
INSERT INTO `marcadores_x_area` VALUES (42, 2, 2);
INSERT INTO `marcadores_x_area` VALUES (43, 2, 9);
INSERT INTO `marcadores_x_area` VALUES (44, 2, 3);
INSERT INTO `marcadores_x_area` VALUES (45, 2, 10);
INSERT INTO `marcadores_x_area` VALUES (46, 2, 1);
INSERT INTO `marcadores_x_area` VALUES (47, 3, 1);
INSERT INTO `marcadores_x_area` VALUES (48, 3, 10);
INSERT INTO `marcadores_x_area` VALUES (49, 4, 1);
INSERT INTO `marcadores_x_area` VALUES (50, 4, 10);
INSERT INTO `marcadores_x_area` VALUES (51, 5, 1);
INSERT INTO `marcadores_x_area` VALUES (52, 7, 1);
INSERT INTO `marcadores_x_area` VALUES (53, 7, 10);
INSERT INTO `marcadores_x_area` VALUES (54, 7, 9);
INSERT INTO `marcadores_x_area` VALUES (55, 7, 8);
INSERT INTO `marcadores_x_area` VALUES (56, 7, 5);
INSERT INTO `marcadores_x_area` VALUES (57, 7, 6);
INSERT INTO `marcadores_x_area` VALUES (58, 7, 3);
INSERT INTO `marcadores_x_area` VALUES (59, 23, 6);
INSERT INTO `marcadores_x_area` VALUES (60, 23, 5);
INSERT INTO `marcadores_x_area` VALUES (61, 23, 9);
INSERT INTO `marcadores_x_area` VALUES (62, 23, 10);
INSERT INTO `marcadores_x_area` VALUES (63, 23, 1);
INSERT INTO `marcadores_x_area` VALUES (64, 23, 3);
INSERT INTO `marcadores_x_area` VALUES (65, 9, 8);
INSERT INTO `marcadores_x_area` VALUES (66, 9, 7);
INSERT INTO `marcadores_x_area` VALUES (67, 9, 6);
INSERT INTO `marcadores_x_area` VALUES (68, 9, 10);
INSERT INTO `marcadores_x_area` VALUES (69, 9, 1);
INSERT INTO `marcadores_x_area` VALUES (70, 9, 9);
INSERT INTO `marcadores_x_area` VALUES (71, 9, 4);
INSERT INTO `marcadores_x_area` VALUES (72, 11, 1);
INSERT INTO `marcadores_x_area` VALUES (73, 11, 3);
INSERT INTO `marcadores_x_area` VALUES (74, 11, 10);
INSERT INTO `marcadores_x_area` VALUES (75, 12, 1);
INSERT INTO `marcadores_x_area` VALUES (76, 12, 10);
INSERT INTO `marcadores_x_area` VALUES (77, 12, 8);
INSERT INTO `marcadores_x_area` VALUES (78, 12, 5);
INSERT INTO `marcadores_x_area` VALUES (79, 12, 3);
INSERT INTO `marcadores_x_area` VALUES (80, 14, 1);
INSERT INTO `marcadores_x_area` VALUES (81, 14, 10);
INSERT INTO `marcadores_x_area` VALUES (82, 14, 2);
INSERT INTO `marcadores_x_area` VALUES (83, 14, 8);
INSERT INTO `marcadores_x_area` VALUES (84, 14, 3);
INSERT INTO `marcadores_x_area` VALUES (85, 14, 5);
INSERT INTO `marcadores_x_area` VALUES (86, 14, 6);
INSERT INTO `marcadores_x_area` VALUES (87, 13, 1);
INSERT INTO `marcadores_x_area` VALUES (88, 13, 10);
INSERT INTO `marcadores_x_area` VALUES (89, 15, 1);
INSERT INTO `marcadores_x_area` VALUES (90, 15, 10);
INSERT INTO `marcadores_x_area` VALUES (91, 15, 2);
INSERT INTO `marcadores_x_area` VALUES (92, 15, 9);
INSERT INTO `marcadores_x_area` VALUES (93, 15, 4);
INSERT INTO `marcadores_x_area` VALUES (94, 10, 1);
INSERT INTO `marcadores_x_area` VALUES (95, 10, 10);
INSERT INTO `marcadores_x_area` VALUES (96, 16, 1);
INSERT INTO `marcadores_x_area` VALUES (97, 16, 10);
INSERT INTO `marcadores_x_area` VALUES (98, 16, 8);
INSERT INTO `marcadores_x_area` VALUES (99, 17, 1);
INSERT INTO `marcadores_x_area` VALUES (100, 17, 10);
INSERT INTO `marcadores_x_area` VALUES (101, 17, 9);
INSERT INTO `marcadores_x_area` VALUES (102, 17, 4);
INSERT INTO `marcadores_x_area` VALUES (103, 17, 3);
INSERT INTO `marcadores_x_area` VALUES (104, 17, 5);
INSERT INTO `marcadores_x_area` VALUES (105, 18, 1);
INSERT INTO `marcadores_x_area` VALUES (106, 18, 10);
INSERT INTO `marcadores_x_area` VALUES (107, 18, 9);
INSERT INTO `marcadores_x_area` VALUES (108, 18, 3);
INSERT INTO `marcadores_x_area` VALUES (109, 18, 6);
INSERT INTO `marcadores_x_area` VALUES (110, 18, 5);
INSERT INTO `marcadores_x_area` VALUES (111, 10, 9);
INSERT INTO `marcadores_x_area` VALUES (112, 10, 3);
INSERT INTO `marcadores_x_area` VALUES (113, 10, 5);
INSERT INTO `marcadores_x_area` VALUES (114, 10, 6);
INSERT INTO `marcadores_x_area` VALUES (115, 20, 1);
INSERT INTO `marcadores_x_area` VALUES (116, 20, 10);
INSERT INTO `marcadores_x_area` VALUES (117, 22, 1);
INSERT INTO `marcadores_x_area` VALUES (118, 22, 10);
INSERT INTO `marcadores_x_area` VALUES (119, 18, 17);
INSERT INTO `marcadores_x_area` VALUES (123, 5, 18);
INSERT INTO `marcadores_x_area` VALUES (125, 7, 18);
INSERT INTO `marcadores_x_area` VALUES (127, 9, 18);
INSERT INTO `marcadores_x_area` VALUES (128, 10, 18);
INSERT INTO `marcadores_x_area` VALUES (132, 14, 18);
INSERT INTO `marcadores_x_area` VALUES (133, 15, 18);
INSERT INTO `marcadores_x_area` VALUES (137, 19, 18);
INSERT INTO `marcadores_x_area` VALUES (138, 20, 18);
INSERT INTO `marcadores_x_area` VALUES (139, 21, 18);
INSERT INTO `marcadores_x_area` VALUES (142, 18, 18);
INSERT INTO `marcadores_x_area` VALUES (143, 18, 19);

-- ----------------------------
-- Table structure for marcadores_x_persona
-- ----------------------------
DROP TABLE IF EXISTS `marcadores_x_persona`;
CREATE TABLE `marcadores_x_persona`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NULL DEFAULT NULL,
  `id_marcador` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of marcadores_x_persona
-- ----------------------------
INSERT INTO `marcadores_x_persona` VALUES (5, 0, 10);
INSERT INTO `marcadores_x_persona` VALUES (7, 0, 0);
INSERT INTO `marcadores_x_persona` VALUES (8, 0, 13);
INSERT INTO `marcadores_x_persona` VALUES (9, 114, 20);

-- ----------------------------
-- Table structure for nombre_iso
-- ----------------------------
DROP TABLE IF EXISTS `nombre_iso`;
CREATE TABLE `nombre_iso`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nombre_iso
-- ----------------------------
INSERT INTO `nombre_iso` VALUES (1, 'ISO 27001');
INSERT INTO `nombre_iso` VALUES (2, 'ISO 14001');
INSERT INTO `nombre_iso` VALUES (3, 'ISO 9001');

-- ----------------------------
-- Table structure for tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tipo_usuario
-- ----------------------------
INSERT INTO `tipo_usuario` VALUES (1, 'Administrador');
INSERT INTO `tipo_usuario` VALUES (2, 'Cliente');

-- ----------------------------
-- Table structure for tipo_variante_marcadores
-- ----------------------------
DROP TABLE IF EXISTS `tipo_variante_marcadores`;
CREATE TABLE `tipo_variante_marcadores`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `activo` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_variante_marcadores
-- ----------------------------
INSERT INTO `tipo_variante_marcadores` VALUES (1, 'Común', 1);
INSERT INTO `tipo_variante_marcadores` VALUES (2, 'Proximamente', 1);
INSERT INTO `tipo_variante_marcadores` VALUES (3, 'Sub Título', 1);
INSERT INTO `tipo_variante_marcadores` VALUES (4, 'Primera Versión', 1);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `departamento` int(11) NULL DEFAULT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hash` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area` int(11) NULL DEFAULT NULL,
  `tipo` int(1) NULL DEFAULT 2,
  `activo` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (1, 'Sabrina', 'Gonzalez', 10, '43333983', '43333983', 'FPR1D8XLKSBDWY4SOEJ0NWCKMX65F9ARYVGL7ZPTTBHAEHUJCU', 21, 2, 1);
INSERT INTO `usuarios` VALUES (2, 'Flavia', 'Pagliano', 10, '43865770', '43865770', '8ADJCIZTJMOQFHNYLFSRNR6ECG4U7QU3WSAWKLXKEX1VGIPPO5', 2, 2, 1);
INSERT INTO `usuarios` VALUES (3, 'Lidice', 'Maza', 10, '25561865', '25561865', 'A2QKZAUZFOCMLS1UYVXEDHJBVWKM7GLQXFHIP3I5DE64OR9PN0', 2, 2, 1);
INSERT INTO `usuarios` VALUES (4, 'Noelia', 'Rodriguez', 10, '46872912', '46872912', 'YEOMUQ1CIRAZMFLW4UDZYVRQ9GPXBKFV3JX5W6CNKE0PTSJ72N', 2, 2, 1);
INSERT INTO `usuarios` VALUES (5, 'Fabricio', 'Bonilla', 10, '45432422', '45432422', 'JKOAQ02BN6SFIPZ1X7MHZF54UHEYWQGRCXMTJKVUERYC3LDBGT', 2, 2, 1);
INSERT INTO `usuarios` VALUES (6, 'Soledad', 'Senosiain', 10, '47054561', '47054561', 'R4AQ8ZWG7VISTBTEF6E23W9ACCLHX5BDHPYSOZVFU0MPM1KKUX', 2, 2, 1);
INSERT INTO `usuarios` VALUES (7, 'Alejandro', 'Barrios', 10, '52232360', '52232360', 'XABQLBXFR5Q7IFEZ36EJ2JV108UITAHTO4PSMVNMNWDDRKH9PC', 23, 2, 1);
INSERT INTO `usuarios` VALUES (8, 'Tania', 'Ingold', 10, '51318109', '51318109', 'IHAIT8PWPFWLYNVEKGSZ5L132SM7Y9OECRD4BUQ0JQTFCXOUGA', 2, 2, 1);
INSERT INTO `usuarios` VALUES (9, 'Veronica', 'Cedres', 10, '47070163', '47070163', 'WP7JLEVT6EXOFVSQLTARFHJCP8WO0XQAI53ZUYYSMRNUBDHZ2M', 23, 2, 1);
INSERT INTO `usuarios` VALUES (10, 'Alejandra', 'Montes de Oca', 10, '48657033', '48657033', 'QVFDP7CR0T6AEHGEMGAZJHKX8SZWRN2YLDOPNXC5SJUKIYQFL9', 23, 2, 1);
INSERT INTO `usuarios` VALUES (11, 'Andrea', 'Silva', 10, '44550227', '44550227', '7OYHHLUWCQDKA0PZJVBLNSX9MSECT2NFG8QPTJFYEX15O4ADU6', 2, 2, 1);
INSERT INTO `usuarios` VALUES (12, 'Patricia', 'Pelletti', 10, '41099410', '41099410', '2C4B3PKRIVMV6DZWLQOUZIQTGNUYKYJAF9HML1X78NSOCRP0GW', 23, 2, 1);
INSERT INTO `usuarios` VALUES (13, 'Noel', 'Marquez', 10, '46943737', '46943737', 'GF1QBD53CE0O7BS4APHT2J6LWXZWKYODZYNPK9VULI8QNUTIFH', 23, 2, 1);
INSERT INTO `usuarios` VALUES (14, 'Leandra', 'Piñero', 10, '64112425', '64112425', 'I5TRXZMNHM879WUK6VC3WUYELCQBZSREDOFQPPODJGNIYAAS2T', 23, 2, 1);
INSERT INTO `usuarios` VALUES (15, 'Federico', 'Bazzani', 10, '40600612', '40600612', 'YEVFWDT6RFVUG7QAPXZLDIGPSMMKQOATBBZCWSYOH219INCJR0', 15, 2, 1);
INSERT INTO `usuarios` VALUES (16, 'Carolina', 'Saldivia', 10, '26235124', '26235124', '7FCYUACHSRJKNG6WVW5XI8RPGNPMUZTXLZOEDBQLYIVQAJ9S3E', 15, 2, 1);
INSERT INTO `usuarios` VALUES (17, 'Alvaro', 'De León', 10, '40848002', '40848002', '3VECMQX1AQSD745ZHECJP9TZGBDFI6I8VKJOKAY2YXBN0POHRG', 15, 2, 1);
INSERT INTO `usuarios` VALUES (18, 'Ana Maria', 'Lopez', 10, '19444912', '19444912', 'YCGQH68RE9WTYSJ5BZLJCVPSREM1U7DAHUVK0W3MOQP2NKGTAN', 15, 2, 1);
INSERT INTO `usuarios` VALUES (19, 'Cesar', 'Braggio', 10, '44192069', '44192069', '2QPMZHRVJEDOS1LDS9U0AZRY578QWBLH43VIGTCTNNOBCJEYFA', 13, 2, 1);
INSERT INTO `usuarios` VALUES (20, 'Andrea', 'Horvat', 10, '18642149', '18642149', 'RBZ7V2GYOMA5TUKTVQYH14FXNGHCREF6ZMCIA3SPX9EUWLLDPD', 12, 2, 1);
INSERT INTO `usuarios` VALUES (21, 'Karina Paula', 'Barrera Silva', 10, '46874879', '46874879', 'WPHMZCV5DYMGBDURKSEN6KOJ0FU3HQXIQLGSY8ICTNJOAFB29E', 3, 2, 1);
INSERT INTO `usuarios` VALUES (22, 'Angi Carolina', 'Tovar Rivas', 10, '63039523', '63039523', 'UMHEPX9A06QSC8GYHIF2EQ3DMPVTGVJRZKJNAUK5R1BFZ47DOO', 3, 2, 1);
INSERT INTO `usuarios` VALUES (23, 'Nathalia', 'Horvat', 10, '37185392', '37185392', 'UCGWSTR4P1NIXRTEFQDIWEZM5KO9AYVA2ZV70DHFKLOSU8LYQC', 4, 2, 1);
INSERT INTO `usuarios` VALUES (24, 'Tatiana', 'Landa', 10, '50405274', '50405274', 'VO6YDGZUU4JWL9FNNT8TPSKQ5IS3KH2LEFMPXRABVO1QRBMECY', 4, 2, 1);
INSERT INTO `usuarios` VALUES (25, 'Ruth', 'Nieto', 10, '59680732', '59680732', 'LUTJ1CZ7WFYXI4M96QHSXA3RV08LA2SGGCN5NJEVFOBUKEYTDD', 5, 2, 1);
INSERT INTO `usuarios` VALUES (26, 'Gianina', 'Ibanez', 10, '42914471', '42914471', 'FJYDOCTMTZVHCWUDZAW0VHKOJGPEI5142NKERLBSPLRU8AQQIN', 5, 2, 1);
INSERT INTO `usuarios` VALUES (27, 'Jessica', 'Pereira', 10, '43580281', '43580281', 'PZYZ9WQDJEBHFM7VEWTUCU58KPMVIN3CRILOGA2L64GOR1DJNY', 5, 2, 1);
INSERT INTO `usuarios` VALUES (28, 'Paola', 'Pagano', 10, '43382081', '43382081', 'KNHBFTMFUAZ8GJ1SEXB0KCQMVOYIU365O9DX7IATLYSELPPRWH', 7, 2, 1);
INSERT INTO `usuarios` VALUES (29, 'Claudia', 'Melcon', 10, '30931550', '30931550', 'V5TIJNKFUXPOZ8QU9ID3CKEG7MJ4BYS6YHAVWLMREQXSWDGFR2', 7, 2, 1);
INSERT INTO `usuarios` VALUES (30, 'Florencia', 'Santucci', 10, '46579970', '46579970', 'YF6KB4WRSZVQ8T3SL7IHUNPXGEUDPRZIJLWOJG0NFMDACQ5HKC', 7, 2, 1);
INSERT INTO `usuarios` VALUES (31, 'Katherine', 'Camargo', 10, '50709395', '50709395', 'TZYONFRCQU1CTXHBVQBKF0DO6PJWXGDLJR9KE43ALS8GIHI2VN', 7, 2, 1);
INSERT INTO `usuarios` VALUES (32, 'Liliana', 'Gutierrez', 10, '46955506', '46955506', 'NIGFNZBQHRF8SABW0JHLLMQEA6MXCWUJUOIK4S2ODGZ3KCRYVD', 7, 2, 1);
INSERT INTO `usuarios` VALUES (33, 'Daniela', 'Alvarez', 10, '19585073', '19585073', 'RSHW7JNSO1K90RIKPTEZ3MUG8ZDFOGHQBWCLBYMXYJAXUAC4LV', 7, 2, 1);
INSERT INTO `usuarios` VALUES (34, 'Cristina', 'Marquez', 10, '45909437', '45909437', 'OFVE25ASX9TP6BZGDCGQYUFMO30MI7SNLHPNEAZCTWRQHLWJ1X', 7, 2, 1);
INSERT INTO `usuarios` VALUES (35, 'Florencia', 'Doublet', 10, '48936512', '48936512', 'NPKG3PXU1ZJWYTTAD0RQZNSY6BCOI9LEFVMCD2IXOB4GFAMU7E', 7, 2, 1);
INSERT INTO `usuarios` VALUES (36, 'Florencia', 'Couselo', 10, '49554284', '49554284', 'HUVGEUYNP4D5Z9F7YKDX2J1FQTBMIAP6N8VLBRCTLXEWOHMKRS', 7, 2, 1);
INSERT INTO `usuarios` VALUES (37, 'Sabrina', 'De León', 10, '44417851', '44417851', '4VNYHKOHPEFJ7UAI9B6GMJWL1S2YDTZEUMCNDT8VBSKZRFPOWI', 7, 2, 1);
INSERT INTO `usuarios` VALUES (38, 'Viridiana', 'Fontes', 10, '47525760', '47525760', 'TLGAFYQPZELNIJE3MJ8FWR7COSHS2MHNVDYUCZRTDU190KXBAO', 7, 2, 1);
INSERT INTO `usuarios` VALUES (39, 'Margarita', 'Arduino', 10, '63813422', '63813422', 'WXCJFRLGTPZOLV2H4BHGANMT8KUEAQDFRQJMXBDN3ESU96OZIY', 7, 2, 1);
INSERT INTO `usuarios` VALUES (40, 'Maria Natalia', 'Montero', 10, '46077712', '46077712', 'TOGC0UZJYIECFMGSLP7JDBUTFXNZYDAX8A52NKVQ143RWISWEL', 7, 2, 1);
INSERT INTO `usuarios` VALUES (41, 'Nicolás', 'Grinschpun', 10, '37568879', '37568879', 'OZJ7SCWRVUX4LRNFSYO69QCH5G8E0KLNMKFQBDMAIA13YGEJPU', 9, 2, 1);
INSERT INTO `usuarios` VALUES (42, 'Fernando', 'Estevez', 10, '44205282', '44205282', '7SRX6NYDX8KFGWEVQYTAJUZOUSC2B5JIK1CVWPMTBOZL3QHRHP', 9, 2, 1);
INSERT INTO `usuarios` VALUES (43, 'Ximena', 'Vela', 10, '38031867', '38031867', 'IYWXZGTQHBANEP2OXGQMW65IF7J90BKUAETJONVFLRZLMYVDC4', 9, 2, 1);
INSERT INTO `usuarios` VALUES (44, 'Florencia', 'Rodriguez', 10, '45034375', '45034375', 'WKUNDSCQV2PGRAOHV7L3RF8HQJZKXBL5GYYTEM4F09WJEXZMIU', 9, 2, 1);
INSERT INTO `usuarios` VALUES (45, 'Carolina', 'Pereira', 10, '55639375', '55639375', 'METTHZ0J6D1ANSVMACQKIGNSLP57PFDKXEYOICUBYRXQOF39W4', 9, 2, 1);
INSERT INTO `usuarios` VALUES (46, 'Liliana Beatriz', 'Mello Martinez', 10, '29643926', '29643926', '84WO35RFYOVZEMLQHTX7DZBHIUPRPYJTCNWMA2ANLV6DEG9CGS', 10, 2, 1);
INSERT INTO `usuarios` VALUES (47, 'Avril', 'Rodriguez Tuala', 10, '54154455', '54154455', 'R9BQIKMEFD0MVQPXJZWCCGYETS8OWZJXYPTGO5AUIHSN3L6FNA', 10, 2, 1);
INSERT INTO `usuarios` VALUES (48, 'Lourdes', 'Gorgoroso', 10, '43746992', '43746992', 'MN9LZ3QIK0JZYDUF6BGR2AHXQHWVET8LUBO5S1VTKSAW7PONX4', 10, 2, 1);
INSERT INTO `usuarios` VALUES (49, 'Micaela Camila', 'Rodriguez Grau', 10, '54463563', '54463563', 'ZBIYLUQG2HLPSXTI9EHJODVMYTEFSN67Q3K40FWRNAMXUP5VO8', 10, 2, 1);
INSERT INTO `usuarios` VALUES (50, 'Tania Lorena', 'Fernández Montebello', 10, '40046666', '40046666', 'MNCJXRZWZLIWAPJ2HD6YEAST7YKU1C59QKBGPXVHLOOVQFF84M', 10, 2, 1);
INSERT INTO `usuarios` VALUES (51, 'Maura Estrella', 'Valente Acuña', 10, '51076084', '51076084', 'WGUHNQSPVHMQ5AF6C9YMSKU0BPXONDD8LY1FEJGE4RBXLCJIA7', 10, 2, 1);
INSERT INTO `usuarios` VALUES (52, 'Cecilia Valentina', 'De los Santos Santurion', 10, '54608246', '54608246', '8MHPC3YBNJR0KZEVZXI1O6AHUIW5B4URQVJSLPLATFNCM2OTXK', 10, 2, 1);
INSERT INTO `usuarios` VALUES (53, 'Maria Victoria', 'Alanis Pacheco', 10, '39979945', '39979945', 'RZ68YMLXEP249COWJGQI5FKVSUBHTS7FNZDIWAJEAXOKTUP1HC', 10, 2, 1);
INSERT INTO `usuarios` VALUES (54, 'Ana Estefania', 'Benitez Alegre', 10, '51210224', '51210224', 'HQZG4E2RVHDBMSXU7P0YQEWXKZI1TFO8UDN3IV5BCARATYP69S', 10, 2, 1);
INSERT INTO `usuarios` VALUES (55, 'Romina Tatiana', 'Rodriguez Benitez', 10, '56482802', '56482802', 'UKVTMS4BWYQONOY7EHRGJLD2XEPZFKGMD6AW159V3HXL0ZINBT', 10, 2, 1);
INSERT INTO `usuarios` VALUES (56, 'Ana Lucia', 'Galeano Davila', 10, '55799353', '55799353', 'BIJKJUMO8XLVZX9N0RAC1VTYDPBOZUAQQS6FRE254CLIGGETNW', 10, 2, 1);
INSERT INTO `usuarios` VALUES (57, 'Leonor', 'Varela Martinez', 10, '51266615', '51266615', 'MACYVLQEXJVWIMI9AQF6P3NZKOTHJDK725Y0RPTS1LFNGZBDG8', 10, 2, 1);
INSERT INTO `usuarios` VALUES (58, 'Gabriela Esther', 'Fermin Graterol', 10, '65656957', '65656957', 'KHRHLTMOEJDFLR7N1V0XATIFU2SWZGC6IJK4YOSQG9ZCPWNQ5Y', 10, 2, 1);
INSERT INTO `usuarios` VALUES (59, 'Maria Cecilia', 'Garcia Esteche', 10, '42497762', '42497762', '9WLVZXWOLZASE0BUYTPKRBMHE4JXIG6D21F3QHSTDPN5VOYUAN', 10, 2, 1);
INSERT INTO `usuarios` VALUES (60, 'Laura', 'Delgado', 10, '46056201', '46056201', 'YZINQ6V3JR4A9Q5UCCBLPJTIVF7WGM1O0KXTFRKUYEDMNEXOZW', 10, 2, 1);
INSERT INTO `usuarios` VALUES (61, 'Sharon Stefanie', 'Rodal Severo', 10, '52983200', '52983200', 'FUSTIWBQK5NZCJLVWHAXVP8D1G6EXLF3PT7NY0REDKRIC4B2QO', 10, 2, 1);
INSERT INTO `usuarios` VALUES (62, 'Jeniffer Patricia', 'Ribeiro Dornel', 10, '54077893', '54077893', 'SR8Z4V1JLATO072SJFYBRWMYDPDCTMPUKG5GAON3IQE9HUB6QF', 10, 2, 1);
INSERT INTO `usuarios` VALUES (63, 'Romina Catherin', 'Giardelli Sosa', 10, '53672515', '53672515', 'KXOZ3IJWG62QCBNTB4SNH9RL805FYEESCUPJZHXOUIRFVA71PV', 10, 2, 1);
INSERT INTO `usuarios` VALUES (64, 'Liseth Johana', 'Barrios Villegas', 10, '63142116', '63142116', 'RTHADMQ5HF4UXXVPZ1EVBLUBO3NGLIK6KSC9P7MC2RJTIDSWQ0', 10, 2, 1);
INSERT INTO `usuarios` VALUES (65, 'Belén Elea', 'Casalla Conteris', 10, '45662130', '45662130', 'B3OA8VKQ7SDGTHJHQGW1U6BFMKER2IMYLZIX5NCRDOAPWTLSJP', 10, 2, 1);
INSERT INTO `usuarios` VALUES (66, 'Nelda Beatriz', 'Bentancor De Armas', 10, '16673946', '16673946', 'YLR7JSDZ6KJZWNP1UDVTKWQGO2MBO5XVBHHEPS8AGNCA30CUEL', 10, 2, 1);
INSERT INTO `usuarios` VALUES (67, 'Jimena Soledad', 'Prigue Rodriguez', 10, '46963915', '46963915', 'YFGV5YUOTKZN9WHB30JGLUANRSK6QV8EI2AEZPBLS4D1PMM7CQ', 10, 2, 1);
INSERT INTO `usuarios` VALUES (68, 'Jessica', 'Castro', 10, '53100168', '53100168', 'EVVXHKLNSAIWZKQOF2F5LMQGPOBPJU9WI47DYJ380AD61XRCRU', 10, 2, 1);
INSERT INTO `usuarios` VALUES (69, 'Victoria Elizabetch', 'Alvarez Moreira', 10, '48503999', '48503999', 'XCTMAHPOQQKKEPN13F8CZSGYD7SRGVWZ9BUNX4I5TEY0BOJRLW', 10, 2, 1);
INSERT INTO `usuarios` VALUES (70, 'Sofia Melissa', 'Sosa Martinez', 10, '49997195', '49997195', 'OAPC4SEONTKQ0ZRDPSGKYWL5YQ8GMH3FIIXNXT2BWZ16HBVDLR', 10, 2, 1);
INSERT INTO `usuarios` VALUES (71, 'Maria Fernanda', 'Gonzáles Olivera', 10, '48363664', '48363664', 'MUS9OPSX84GRFPHQQBNE1FVVCT3K7JY26ZNDBDRUX5JHLIAT0G', 10, 2, 1);
INSERT INTO `usuarios` VALUES (72, 'Tamara Tatiana', 'Cano Roibal', 10, '50885919', '50885919', 'FOVNZYHVLOUXQ3K48TRGMHGD5SI2YCEMD7QJ01WKANFTZXWBUI', 10, 2, 1);
INSERT INTO `usuarios` VALUES (73, 'Maria', 'Moreira', 10, '49651319', '49651319', 'GIOUODMPHTHDU6VW03E4ZACQTLK7NJ5SGLK9RFFBEBWYCVPXMX', 11, 2, 1);
INSERT INTO `usuarios` VALUES (74, 'Ivana', 'Bica', 10, '31416890', '31416890', 'YADMEKRLTQRPIDOYEVWMXCZF21WSO4J3PCJXIKZB7ANU6SVB0L', 17, 2, 1);
INSERT INTO `usuarios` VALUES (75, 'Valentina', 'Fernandez', 10, '45349590', '45349590', 'YZIDAOWGTCJ4PCGEFQRZFQYAPSWO3RUT5XU7H8MIVNBB0SVDK1', 17, 2, 1);
INSERT INTO `usuarios` VALUES (76, 'Pamela', 'Antúnez', 10, '55482964', '55482964', 'XECFYAO7VNFL59WP8RTRK6DZTOBCAU1S3P4JNG2DIGXHWMVHEZ', 14, 2, 1);
INSERT INTO `usuarios` VALUES (77, 'Veronica', 'Esteves', 10, '38299322', '38299322', 'YU7VTFREZKLXSXOHA9TNHFJ5WME8C4QPBVG0BOLRZD1AP62IIU', 14, 2, 1);
INSERT INTO `usuarios` VALUES (78, 'Maria Eugenia', 'Chterich', 10, '40696384', '40696384', 'VHVWOADZ1J7TRTOD3FRPWLYK8I2QNCJMEXIHUBSLCZ6AGEKQNS', 14, 2, 1);
INSERT INTO `usuarios` VALUES (79, 'Gabriela', 'Bianchi', 10, '44595796', '44595796', 'WRXGKBUVUY1JZMPCSWP49TEEIXD5D2NAHFOQ6YSIVL78TJNRBH', 14, 2, 1);
INSERT INTO `usuarios` VALUES (80, 'Hanna', 'Guilhot', 10, '38958988', '38958988', 'K4FDAEJLCHTEK9XBP32R0DQWRSNSUIZT6BHXMA8YIPGNQWV75V', 14, 2, 1);
INSERT INTO `usuarios` VALUES (81, 'Stefani Nicole', 'Machado', 10, '47263909', '47263909', 'X7ZEQMBNKHF9O61APLU8W5JBKV2SCAEQPXIZ0GNYW4J3IMLUGR', 14, 2, 1);
INSERT INTO `usuarios` VALUES (82, 'Carol', 'Molina', 10, '40479176', '40479176', 'SL3CDQEMRG87RF2JCPZKEJVNAHU1IU9NPVKWYTG0SF5MTWOAHX', 16, 2, 1);
INSERT INTO `usuarios` VALUES (83, 'Marcelo Daniel', 'Nuñez', 10, '31687714', '31687714', 'CVFHTGQRPJVAJRWA4D96YWQXIZ7PNCBHXMKKUB8OI2ULEMSNZG', 16, 2, 1);
INSERT INTO `usuarios` VALUES (84, 'Elbio', 'San Martin', 10, '46321424', '46321424', 'CEST8L3EDPKNBCJSLVDXYGHO6GANBZ79O4VUFJZXKMTH125AYR', 6, 2, 1);
INSERT INTO `usuarios` VALUES (85, 'Sabrina Yanet', 'Rossi Bordalde', 10, '51273337', '51273337', 'A1HUGLT3QAEWYRXWEMISH2UNTPQNPIMK9ZO0XKGCFYOCSDZV7V', 7, 2, 1);
INSERT INTO `usuarios` VALUES (86, 'Florencia', 'De León Perez', 10, '52182799', '52182799', '01UOJX29BMEQ5PBYDLQECLDGANIWSFKKVVYATRCNMWIXOUZP7S', 18, 2, 1);
INSERT INTO `usuarios` VALUES (87, 'Priscila Elizabeth', 'Santos Rosano', 10, '46011823', '46011823', '3ZQXPQSDOVD6P89UUAIWALLSM0YJVKTE21BB7YTXHKRH5CRZFO', 18, 2, 1);
INSERT INTO `usuarios` VALUES (88, 'Ana Gabriela', 'Curbelo Delfino', 10, '37172814', '37172814', 'NZL01RDTHYUBAJNZMOSEEUIW69MGWKDBOL2KQXGC7FPTF8JSVV', 18, 2, 1);
INSERT INTO `usuarios` VALUES (89, 'Luciana', 'Rios', 10, '65850606', '65850606', '4LUOWOGBSPQX2PKRDTK5HETXNMQHIZJUA7M8D6EINYVCJ0YSWV', 18, 2, 1);
INSERT INTO `usuarios` VALUES (90, 'Valeria', 'Piñon', 10, '45219248', '45219248', '8KPXRKZL9TDGIQFPUEYO5JCOZI0XMCDFANWMLJS3NEWSQG4YAH', 22, 2, 1);
INSERT INTO `usuarios` VALUES (91, 'Florencia Raquel', 'Machado Caballero', 10, '52605797', '52605797', 'R5X6CTZWLNJI7FKUBHCAPVKJEBQZDU4LMRXTIANDOSW9FSOHG1', 10, 2, 1);
INSERT INTO `usuarios` VALUES (92, 'Patricia Giovanna', 'Nuñez Corbo', 10, '28467155', '28467155', 'IHI8L39EK7O1VR2HNTTJMZZNQPDKEJVDBPG4FCAYFSOGXQYCWA', 10, 2, 1);
INSERT INTO `usuarios` VALUES (93, 'Leonardo', 'Piñon', 10, '45219668', '45219668', 'IUBEDAGRBUIVK1TTVXDHNJEPYN35JSO7KSC0Q2GZM8HAOFXQCF', 21, 2, 1);
INSERT INTO `usuarios` VALUES (94, 'Marcos', 'Rocca', 10, '43691757', '43691757', 'WYIMOVNOB2QX0DJTHRE8AL1LS73U4PBZEVP6MCNFRXCWT5KAZY', 21, 2, 1);
INSERT INTO `usuarios` VALUES (95, 'Claudio', 'Da Silva', 10, '49690317', '49690317', 'XIQFCFS7HZDL4KTXPWJCYOV3YRBSA0N2PDGLUJ1MBQRHGNKMET', 21, 2, 1);
INSERT INTO `usuarios` VALUES (96, 'Sebastian', 'Mainero', 10, '45889586', '45889586', 'EJJYIB6RGKPRK0MU1QCE8YHM5S3OILZWFDBWSXPDXVTNGA94FT', 20, 2, 1);
INSERT INTO `usuarios` VALUES (97, 'Antonio', 'Roba', 10, '50717986', '50717986', 'RUMXGGJSXSRB6LLWVZWFEDKNYPHMOTIK58ACFIEYN7B329ZVJ0', 20, 2, 1);
INSERT INTO `usuarios` VALUES (98, 'Alejandro', 'Beron', 10, '48278568', '48278568', 'IRY4BPS0KWTDQYI3HSACLNEJUV2ZF7LXN1VRBZHKTFAWCXE56U', 20, 2, 1);
INSERT INTO `usuarios` VALUES (99, 'Andres', 'Paiva', 10, '47681582', '47681582', 'HGBV0PRBYZP73SI6GXVYUO2SCLTRNEFDXNQADAHLJW4ZUOQJ9C', 20, 2, 1);
INSERT INTO `usuarios` VALUES (100, 'Sebastian', 'Nuñez', 10, '53249776', '53249776', 'RELWCFLEYKBDTZCHPYUXO7JWK41DN03XMQRGHVFTA5SBA2IU6P', 20, 2, 1);
INSERT INTO `usuarios` VALUES (101, 'Rodrigo', 'Baptista', 10, '47638682', '47638682', 'YDGMAV7UGBJNXFSLKXUOQPSWIIML3ETR2RF5NVWYE9ZQP61HOB', 19, 2, 1);
INSERT INTO `usuarios` VALUES (104, 'Narella', 'Delgado', 10, '52087060', '52087060', '7Q5JFSM6DXPIECLN9EBG2V3JTRUACUQAVOBGZO4ZTMPH0D8WSY', 5, 2, 1);
INSERT INTO `usuarios` VALUES (105, 'Karina Elizabeth', 'Corbo Martinez', 10, '43106120', '43106120', 'JNF3FXAQQHTV5D92ZVZYWW48LOGHDPPCNLESJ7BKGEMT6CUK1S', 10, 2, 1);
INSERT INTO `usuarios` VALUES (106, 'Patricia', 'Antuñano', 10, '14427402', '14427402', 'MSOIAECNP3D7VHQKTR0HEYUJQDFFLPZR1JBA692L5BXGTKIYN8', 10, 2, 1);
INSERT INTO `usuarios` VALUES (107, 'Flavia Ines', 'Roda Fiallo', 10, '46280181', '46280181', 'FM7HKH2PRQUVLWNGQLX6EO9N8D3W1IJ0KSTJRC5DYZYFZGAIP4', 10, 2, 1);
INSERT INTO `usuarios` VALUES (108, 'Giuliana Bárbara', 'Di Bartolomeo Pérez', 10, '52856433', '52856433', 'AMJBYS5PNI1K8OCX3NTAGJ29QYSO6DUTKWLVRDPREZ7XVIH0FC', 10, 2, 1);
INSERT INTO `usuarios` VALUES (109, 'Estefanu Dayana', 'Llanes Ramirez', 10, '49785714', '49785714', '4W37QUWXJCLL0UDZVPVNHR6IGBZ8JAOKFSMTIYF52NAGRO1XEP', 10, 2, 1);
INSERT INTO `usuarios` VALUES (110, 'Erica Elizabeth', 'Mena Pierre', 10, '52943725', '52943725', 'DFA3B0CYFQIY6RANVPNLXZUTX8TVDSQR9WCL4EO1GK75HHIBOU', 18, 2, 1);
INSERT INTO `usuarios` VALUES (111, 'Anarella', 'Sampayo', 10, '52339586', '52339586', 'P8SZF7QVD6NMUBWGI3DRUPTTO0EFGS9BZEJVAWYRKQXJX1NKYH', 18, 2, 1);
INSERT INTO `usuarios` VALUES (112, 'Soraya Fernanda', 'Dereste Castillo', 10, '63737983', '63737983', 'PNUFSKDAQIEFBOUZ2RG4MYTIVWPHC0LHJOCV3KEAXML69GTSWZ', 18, 2, 1);
INSERT INTO `usuarios` VALUES (113, 'Vanesa Magali', 'Lareiro Ledesma', 10, '55036785', '55036785', 'I7OZEACL9GKMY3GAN80IXR2DUZQBTPTUPFLBYDXEHCJHM14VSO', 18, 2, 1);
INSERT INTO `usuarios` VALUES (114, 'UNO', 'DOS', 10, '1', '1', 'ANZP0R5X1GG3SCEHEQ7K9AFPUVTOYIT2CKHSDLXR6ZOJMQVIDM', 10, 2, 1);
INSERT INTO `usuarios` VALUES (116, 'Claudio', 'De Sio', 10, '50115265', '50115265', 'JU5VZFM4XEH7S6ZYQWAMCUIPG0RKB23SFEAYD18QNPRGOWOV9H', 10, 2, 1);
INSERT INTO `usuarios` VALUES (117, 'Avril', 'González', 10, '53449128', '53449128', 'GOBL9JPUGFKOUA5CXPWN7LYKSVE2FYQBAXITWHQR0S4ZDD1HZV', 10, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
