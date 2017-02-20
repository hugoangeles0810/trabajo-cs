/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : vuelos-cliente

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-02-19 21:52:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `num_asientos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clase
-- ----------------------------
INSERT INTO `clase` VALUES ('1', 'economica', '70');
INSERT INTO `clase` VALUES ('2', 'premium', '50');
INSERT INTO `clase` VALUES ('3', 'primera', '20');

-- ----------------------------
-- Table structure for escala
-- ----------------------------
DROP TABLE IF EXISTS `escala`;
CREATE TABLE `escala` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vuelo` int(11) NOT NULL,
  `lugar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lugar_escala_fk` (`lugar`),
  KEY `vuelo_escala_fk` (`vuelo`),
  CONSTRAINT `lugar_escala_fk` FOREIGN KEY (`lugar`) REFERENCES `lugar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vuelo_escala_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of escala
-- ----------------------------

-- ----------------------------
-- Table structure for lugar
-- ----------------------------
DROP TABLE IF EXISTS `lugar`;
CREATE TABLE `lugar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lugar
-- ----------------------------
INSERT INTO `lugar` VALUES ('1', 'Lima, Peru');
INSERT INTO `lugar` VALUES ('2', 'Piura, Peru');
INSERT INTO `lugar` VALUES ('3', 'Arequipa, Peru');
INSERT INTO `lugar` VALUES ('4', 'Bogota, Colombia');
INSERT INTO `lugar` VALUES ('5', 'Santiago, Chile');
INSERT INTO `lugar` VALUES ('6', 'Caracas, Venezuela');
INSERT INTO `lugar` VALUES ('7', 'Buenos Aires, Argentina');
INSERT INTO `lugar` VALUES ('8', 'Montevideo, Uruguay');
INSERT INTO `lugar` VALUES ('9', 'Quito, Ecuador');
INSERT INTO `lugar` VALUES ('10', 'Brasilia, Brasil');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vuelo` int(11) NOT NULL,
  `clase` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clase_ticket_fk` (`clase`),
  KEY `vuelo_ticket_fk` (`vuelo`),
  CONSTRAINT `clase_ticket_fk` FOREIGN KEY (`clase`) REFERENCES `clase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vuelo_ticket_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for vuelo
-- ----------------------------
DROP TABLE IF EXISTS `vuelo`;
CREATE TABLE `vuelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `destino` int(11) NOT NULL,
  `origen` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lugar_vuelo_fk` (`destino`),
  KEY `lugar_vuelo_fk1` (`origen`),
  CONSTRAINT `lugar_vuelo_fk` FOREIGN KEY (`destino`) REFERENCES `lugar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lugar_vuelo_fk1` FOREIGN KEY (`origen`) REFERENCES `lugar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vuelo
-- ----------------------------
INSERT INTO `vuelo` VALUES ('1', '2017-03-06 00:56:15', '1', '2');
INSERT INTO `vuelo` VALUES ('2', '2017-03-06 00:56:15', '4', '3');
INSERT INTO `vuelo` VALUES ('3', '2017-03-07 00:56:15', '3', '1');
INSERT INTO `vuelo` VALUES ('4', '2017-03-07 00:56:15', '1', '3');
INSERT INTO `vuelo` VALUES ('5', '2017-03-08 00:56:15', '1', '3');
INSERT INTO `vuelo` VALUES ('6', '2017-03-08 00:56:15', '1', '2');
INSERT INTO `vuelo` VALUES ('7', '2017-03-09 00:56:15', '9', '10');
INSERT INTO `vuelo` VALUES ('9', '2017-03-09 00:56:15', '4', '5');
INSERT INTO `vuelo` VALUES ('10', '2017-03-10 00:56:15', '5', '8');
INSERT INTO `vuelo` VALUES ('11', '2017-03-10 00:56:15', '8', '4');
INSERT INTO `vuelo` VALUES ('12', '2017-03-11 00:56:15', '2', '6');
INSERT INTO `vuelo` VALUES ('13', '2017-03-11 00:56:15', '2', '3');
INSERT INTO `vuelo` VALUES ('14', '2017-03-12 00:56:15', '3', '6');
INSERT INTO `vuelo` VALUES ('15', '2017-03-12 00:56:15', '7', '1');
INSERT INTO `vuelo` VALUES ('16', '2017-03-13 00:56:15', '8', '2');
INSERT INTO `vuelo` VALUES ('17', '2017-03-13 00:56:15', '2', '3');
INSERT INTO `vuelo` VALUES ('18', '2017-03-14 00:56:15', '7', '10');
INSERT INTO `vuelo` VALUES ('19', '2017-03-14 00:56:15', '8', '4');
INSERT INTO `vuelo` VALUES ('20', '2017-03-15 00:56:15', '7', '3');
INSERT INTO `vuelo` VALUES ('21', '2017-03-15 00:56:15', '4', '2');
INSERT INTO `vuelo` VALUES ('22', '2017-03-16 00:56:15', '2', '8');
INSERT INTO `vuelo` VALUES ('23', '2017-03-16 00:56:15', '1', '10');
INSERT INTO `vuelo` VALUES ('24', '2017-03-17 00:56:15', '10', '7');
INSERT INTO `vuelo` VALUES ('25', '2017-03-17 00:56:15', '6', '4');
INSERT INTO `vuelo` VALUES ('26', '2017-03-18 00:56:15', '3', '4');
INSERT INTO `vuelo` VALUES ('27', '2017-03-18 00:56:15', '1', '2');
INSERT INTO `vuelo` VALUES ('28', '2017-03-19 00:56:15', '1', '4');
INSERT INTO `vuelo` VALUES ('29', '2017-03-19 00:56:15', '2', '4');
INSERT INTO `vuelo` VALUES ('30', '2017-03-20 00:56:15', '7', '8');
INSERT INTO `vuelo` VALUES ('31', '2017-03-20 00:56:15', '4', '10');
INSERT INTO `vuelo` VALUES ('33', '2017-03-21 00:56:15', '9', '3');
INSERT INTO `vuelo` VALUES ('34', '2017-03-21 00:56:15', '7', '3');
INSERT INTO `vuelo` VALUES ('35', '2017-03-22 00:56:15', '9', '10');
INSERT INTO `vuelo` VALUES ('36', '2017-03-22 00:56:15', '6', '3');
INSERT INTO `vuelo` VALUES ('37', '2017-03-23 00:56:15', '3', '8');
INSERT INTO `vuelo` VALUES ('38', '2017-03-23 00:56:15', '3', '6');
INSERT INTO `vuelo` VALUES ('39', '2017-03-24 00:56:15', '2', '10');
INSERT INTO `vuelo` VALUES ('40', '2017-03-24 00:56:15', '6', '3');
INSERT INTO `vuelo` VALUES ('41', '2017-03-25 00:56:15', '9', '2');
INSERT INTO `vuelo` VALUES ('42', '2017-03-25 00:56:15', '10', '5');
INSERT INTO `vuelo` VALUES ('43', '2017-03-26 00:56:15', '3', '5');
INSERT INTO `vuelo` VALUES ('44', '2017-03-26 00:56:15', '2', '1');
INSERT INTO `vuelo` VALUES ('45', '2017-03-27 00:56:15', '1', '2');
INSERT INTO `vuelo` VALUES ('46', '2017-03-27 00:56:15', '8', '2');
INSERT INTO `vuelo` VALUES ('47', '2017-03-28 00:56:15', '10', '4');
INSERT INTO `vuelo` VALUES ('48', '2017-03-28 00:56:15', '7', '3');
INSERT INTO `vuelo` VALUES ('49', '2017-03-29 00:56:15', '2', '8');
INSERT INTO `vuelo` VALUES ('50', '2017-03-29 00:56:15', '10', '9');
INSERT INTO `vuelo` VALUES ('51', '2017-03-30 00:56:15', '3', '4');
INSERT INTO `vuelo` VALUES ('52', '2017-03-31 00:56:15', '8', '7');
INSERT INTO `vuelo` VALUES ('53', '2017-03-31 00:56:15', '2', '1');
INSERT INTO `vuelo` VALUES ('54', '2017-03-01 00:56:15', '5', '6');
INSERT INTO `vuelo` VALUES ('55', '2017-03-01 00:56:15', '8', '7');
INSERT INTO `vuelo` VALUES ('56', '2017-03-02 00:56:15', '10', '4');
INSERT INTO `vuelo` VALUES ('57', '2017-03-02 00:56:15', '3', '8');
INSERT INTO `vuelo` VALUES ('58', '2017-03-03 00:56:15', '2', '7');
INSERT INTO `vuelo` VALUES ('59', '2017-03-04 00:56:15', '6', '3');
INSERT INTO `vuelo` VALUES ('60', '2017-03-04 00:56:15', '2', '10');

-- ----------------------------
-- Table structure for vueloclase
-- ----------------------------
DROP TABLE IF EXISTS `vueloclase`;
CREATE TABLE `vueloclase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clase` int(11) NOT NULL,
  `vuelo` int(11) NOT NULL,
  `preciomay` double NOT NULL,
  `preciomen` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clase_vueloclase_fk` (`clase`),
  KEY `vuelo_vueloclase_fk` (`vuelo`),
  CONSTRAINT `clase_vueloclase_fk` FOREIGN KEY (`clase`) REFERENCES `clase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vuelo_vueloclase_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vueloclase
-- ----------------------------
