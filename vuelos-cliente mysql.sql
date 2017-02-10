/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 60011
Source Host           : localhost:3306
Source Database       : vuelos-cliente

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-02-10 01:11:57
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
  CONSTRAINT `vuelo_escala_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lugar_escala_fk` FOREIGN KEY (`lugar`) REFERENCES `lugar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `vuelo_ticket_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clase_ticket_fk` FOREIGN KEY (`clase`) REFERENCES `clase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

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
  CONSTRAINT `vuelo_vueloclase_fk` FOREIGN KEY (`vuelo`) REFERENCES `vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clase_vueloclase_fk` FOREIGN KEY (`clase`) REFERENCES `clase` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
