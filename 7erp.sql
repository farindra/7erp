/*
Navicat MySQL Data Transfer

Source Server         : phpmyadmin
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : 7erp

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-07 17:26:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('admin', '1', null);
INSERT INTO `auth_assignment` VALUES ('admin', '4', null);
INSERT INTO `auth_assignment` VALUES ('create-tabview', '2', null);

-- ----------------------------
-- Table structure for `auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1438576038', '1438576038');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1438576825', '1438576825');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1438576819', '1438576819');
INSERT INTO `auth_item` VALUES ('admin', '1', 'super user mother fucker', null, null, null, null);
INSERT INTO `auth_item` VALUES ('create-tabview', '1', 'membuat view', null, null, null, null);
INSERT INTO `auth_item` VALUES ('create-tabviewname', '1', 'membuat nama iv', null, null, null, null);

-- ----------------------------
-- Table structure for `auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('admin', 'create-tabview');
INSERT INTO `auth_item_child` VALUES ('admin', 'create-tabviewname');

-- ----------------------------
-- Table structure for `auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('SEO', 'O:25:\"common\\rbac\\UserGroupRule\":3:{s:4:\"name\";s:3:\"SEO\";s:9:\"createdAt\";i:1438577477;s:9:\"updatedAt\";i:1438577965;}', '1438577477', '1438577965');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Home', null, null, null, null);

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1436851773');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1436851778');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1438309134');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1438308510');

-- ----------------------------
-- Table structure for `tab_view`
-- ----------------------------
DROP TABLE IF EXISTS `tab_view`;
CREATE TABLE `tab_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `view_kd` varchar(255) NOT NULL DEFAULT '',
  `view_nm` varchar(255) DEFAULT NULL,
  `view_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`view_kd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tab_view
-- ----------------------------
INSERT INTO `tab_view` VALUES ('1', '0123', 'testing', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'farindra', 'MFwzNpJ3ucHt9CrVN8gn-rHWHuwh3oMB', '$2y$13$n3GL1tuSB8W73xuPbm9mGO4v1zjkDiU.2/6DGLaoSd7EJ.xpdCUX2', null, 'farindra.project@gmail.com', '10', '1436851844', '1436851844');
INSERT INTO `user` VALUES ('2', 'coba1', 'zqCSHLSomXQJOvS1L7k4kEtQhWsVWBxb', '$2y$13$Homreslym42OByPHPIDer.DvS/RP0uVv9bldVdp.Kv2nlSeqOCPt2', null, 'coba@coba.com', '10', '1438309286', '1438309286');
INSERT INTO `user` VALUES ('3', 'coba2', 'OcdfBFSi3tM_JUn7tCTk8r444m4KVC3q', '$2y$13$IGoRgJMFKL5kdBpT7Vyvh.U3RUqmyZ4s2pLJ77GdKfevZOOIr9GmC', null, 'coba2@coba.com', '10', '1438309310', '1438309310');
INSERT INTO `user` VALUES ('4', 'admin', '-SDvDgEmbmKyAbEcgUSo_gBPkikivKjs', '$2y$13$2LuxzR.zHlo4Smhr6/6/Iea2lUvH5HVORvpgxnjzTPCQeYeWq0fd6', null, 'putrakaya@ymail.com', '10', '1438309413', '1438309413');
