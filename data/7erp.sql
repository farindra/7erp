/*
Navicat MySQL Data Transfer

Source Server         : phpmyadmin
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : 7erp

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-09-04 13:18:14
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
-- Table structure for `menu_sidenav`
-- ----------------------------
DROP TABLE IF EXISTS `menu_sidenav`;
CREATE TABLE `menu_sidenav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kd_menu` varchar(50) NOT NULL,
  `nm_menu` varchar(200) NOT NULL,
  `jval` longtext,
  `note` text,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`,`kd_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu_sidenav
-- ----------------------------
INSERT INTO `menu_sidenav` VALUES ('1', 'sss_berita_acara', 'Berita Acara', '[{\"label\":\"<i class=\\\"fa fa-pencil\\\"></i> New\",\"url\":[\"new\"]},{\"label\":\"<i class=\\\"fa fa-suitcase\\\"></i> PM <span id=\\\"menu-badge-1\\\" class=\\\"badge badge-purple\\\" style=\\\"float: right\\\"></span>\",\"url\":[\"pm\"]},{\"label\":\"<i class=\\\"fa fa-inbox\\\"></i> Inbox\",\"url\":[\"inbox\"]},{\"label\":\"<i class=\\\"fa fa-send\\\"></i> Sent\",\"url\":[\"sent\"]},{\"label\":\"<i class=\\\"fa fa-folder-o\\\"></i> Draft\",\"url\":[\"draft\"]}]', '', '', null, '', '2015-08-24 12:03:37', '1');
INSERT INTO `menu_sidenav` VALUES ('2', 'sss_po', 'Purchase Order', '[{\"label\":\"<i class=\\\"fa fa-pencil\\\"></i> New\",\"url\":[\"new\"]},{\"label\":\"<i class=\\\"fa fa-suitcase\\\"></i> PO List<span id=\\\"menu-badge-1\\\" class=\\\"badge badge-purple\\\" style=\\\"float: right\\\"></span>\",\"url\":[\"list\"]},{\"label\":\"<i class=\\\"fa fa-inbox\\\"></i> Setup\",\"url\":[\"setup\"]}]', null, null, null, null, '2015-06-12 11:23:40', '1');
INSERT INTO `menu_sidenav` VALUES ('3', 'sss_report', 'Report', '[{\"label\":\"<i class=\\\"fa fa-pencil\\\"></i> Dashboard\",\"url\":[\"index\"]},{\"label\":\"<i class=\\\"fa fa-suitcase\\\"></i> Tenant Report<span id=\\\"menu-badge-1\\\" class=\\\"badge badge-purple\\\" style=\\\"float: right\\\"></span>\",\"url\":[\"#\"]},{\"label\":\"<i class=\\\"fa fa-inbox\\\"></i> Member Report\",\"url\":[\"#\"]}]', null, null, null, null, '2015-07-08 14:29:46', '1');

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
-- Table structure for `project_detail`
-- ----------------------------
DROP TABLE IF EXISTS `project_detail`;
CREATE TABLE `project_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_kd` varchar(20) NOT NULL,
  `issued` varchar(255) NOT NULL,
  `priority` longtext,
  `open` date DEFAULT NULL,
  `close` date DEFAULT NULL,
  `progress` float DEFAULT NULL,
  `person` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `note` text,
  `status` smallint(6) DEFAULT '1',
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`project_kd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `project_header`
-- ----------------------------
DROP TABLE IF EXISTS `project_header`;
CREATE TABLE `project_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_kd` varchar(20) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_val` longtext,
  `status` smallint(6) DEFAULT '1',
  `created_at` date DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`project_kd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_header
-- ----------------------------

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `create_at` datetime DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('7', 'Native Hawaiian0', 'fusce posuere felis sed lacus morbi', '0', '2015-06-17 21:46:48', 'rmorgan5', '2015-08-12 11:11:02', 'smurphy5');
INSERT INTO `settings` VALUES ('8', 'Malaysian', 'vestibulum velit id pretium iaculis diam erat fermentum justo', '1', '2014-08-16 15:07:50', 'sgraham6', '2015-05-21 22:02:53', 'lwagner6');
INSERT INTO `settings` VALUES ('9', 'Seminole', 'eu interdum eu tincidunt in', '0', '2014-09-25 02:17:45', 'aowens7', '2014-09-15 11:10:22', 'rnelson7');
INSERT INTO `settings` VALUES ('10', 'Argentinian', 'cursus urna ut tellus nulla', '0', '2015-06-04 19:14:33', 'atucker8', '2014-08-21 23:43:38', 'ebaker8');
INSERT INTO `settings` VALUES ('12', 'Thai', 'suscipit nulla elit ac nulla sed vel enim', '1', '2014-10-21 11:35:00', 'rharrisona', '2014-11-09 00:54:15', 'sperkinsa');
INSERT INTO `settings` VALUES ('13', 'Tongan', 'ac neque duis bibendum morbi non', '0', '2014-10-15 09:50:26', 'skellyb', '2015-02-16 11:35:39', 'kberryb');
INSERT INTO `settings` VALUES ('14', 'Yaqui', 'nullam varius nulla facilisi cras non velit nec nisi', '0', '2015-04-30 11:08:09', 'dwestc', '2014-11-11 19:54:06', 'fmontgomeryc');
INSERT INTO `settings` VALUES ('16', 'Osage', 'dolor morbi vel lectus in quam fringilla rhoncus mauris enim', '1', '2015-03-29 22:14:27', 'kramireze', '2015-07-18 13:34:49', 'ahowelle');
INSERT INTO `settings` VALUES ('17', 'Malaysian', 'et ultrices posuere cubilia curae mauris viverra diam vitae quam', '1', '2015-02-14 01:56:41', 'lsanchezf', '2014-09-03 05:49:11', 'jwardf');
INSERT INTO `settings` VALUES ('18', 'Panamanian', 'ac est lacinia nisi venenatis tristique', '1', '2015-05-12 07:05:28', 'mthomasg', '2015-06-18 13:28:40', 'breyesg');
INSERT INTO `settings` VALUES ('19', 'Nicaraguan', 'mauris viverra diam vitae quam suspendisse', '1', '2015-05-26 13:53:05', 'jtuckerh', '2014-09-20 05:17:06', 'jstevensh');
INSERT INTO `settings` VALUES ('21', 'Honduran', 'proin risus praesent lectus vestibulum quam sapien varius', '0', '2015-02-01 00:07:19', 'jwhitej', '2015-02-27 04:12:20', 'ewalkerj');
INSERT INTO `settings` VALUES ('23', 'Puerto Rican', 'eu orci mauris lacinia sapien quis libero nullam sit', '0', '2014-08-17 03:00:28', 'cwoodsl', '2014-12-28 01:21:16', 'smorrisl');
INSERT INTO `settings` VALUES ('24', 'Venezuelan', 'a libero nam dui proin leo odio porttitor', '1', '2015-04-26 13:55:48', 'jchavezm', '2015-03-24 05:18:11', 'hlittlem');
INSERT INTO `settings` VALUES ('25', 'Dominican (Dominican Republic)', 'rutrum rutrum neque aenean auctor gravida sem praesent id', '1', '2015-07-19 14:29:45', 'fbishopn', '2015-02-23 16:28:02', 'astewartn');
INSERT INTO `settings` VALUES ('26', 'Colville', 'non interdum in ante vestibulum ante ipsum primis in', '0', '2015-06-06 18:18:42', 'mjacksono', '2014-08-29 05:36:45', 'elaneo');
INSERT INTO `settings` VALUES ('27', 'Dominican (Dominican Republic)', 'integer tincidunt ante vel ipsum praesent blandit lacinia', '0', '2015-06-12 00:31:48', 'tpetersonp', '2014-08-23 23:23:16', 'cperkinsp');
INSERT INTO `settings` VALUES ('28', 'White', 'metus aenean fermentum donec ut', '1', '2014-08-27 01:56:37', 'awoodsq', '2015-06-06 13:31:03', 'hfullerq');
INSERT INTO `settings` VALUES ('29', 'Chilean', 'sit amet lobortis sapien sapien non mi integer', '1', '2014-10-29 07:10:54', 'jgreener', '2015-04-28 07:51:34', 'wricer');
INSERT INTO `settings` VALUES ('30', 'Apache', 'pede venenatis non sodales sed tincidunt eu felis', '0', '2015-06-13 21:25:34', 'bchapmans', '2014-09-09 10:52:02', 'bmoraless');
INSERT INTO `settings` VALUES ('31', 'Apache', 'in purus eu magna vulputate luctus cum', '1', '2015-05-24 00:59:57', 'thudsont', '2014-08-21 23:49:57', 'dreidt');
INSERT INTO `settings` VALUES ('32', 'Nicaraguan', 'sagittis sapien cum sociis natoque', '0', '2015-06-22 15:51:20', 'sromerou', '2014-10-03 10:01:25', 'drobertsonu');
INSERT INTO `settings` VALUES ('33', 'Melanesian', 'tellus nulla ut erat id mauris vulputate elementum nullam varius', '1', '2015-06-11 17:35:33', 'chillv', '2015-02-03 10:53:31', 'jwalkerv');
INSERT INTO `settings` VALUES ('34', 'Menominee', 'turpis integer aliquet massa id', '1', '2014-11-20 20:30:18', 'jperkinsw', '2015-07-03 01:07:46', 'rmorganw');
INSERT INTO `settings` VALUES ('35', 'Korean', 'sapien ut nunc vestibulum ante ipsum primis in faucibus', '0', '2014-12-22 10:53:43', 'cpattersonx', '2015-04-20 03:18:05', 'mfordx');
INSERT INTO `settings` VALUES ('36', 'Lumbee', 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet', '1', '2015-05-03 16:39:46', 'hcarrolly', '2015-01-26 00:06:02', 'apetersy');
INSERT INTO `settings` VALUES ('37', 'Melanesian', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci', '1', '2015-06-08 04:40:09', 'cbarnesz', '2014-08-30 03:48:42', 'jmasonz');
INSERT INTO `settings` VALUES ('38', 'Chippewa', 'non pretium quis lectus suspendisse potenti in', '1', '2015-03-26 19:01:46', 'cfernandez10', '2014-10-05 02:48:49', 'ayoung10');
INSERT INTO `settings` VALUES ('39', 'Tongan', 'pharetra magna ac consequat metus sapien ut nunc', '0', '2015-01-19 18:16:47', 'rgilbert11', '2015-01-23 01:58:19', 'pprice11');
INSERT INTO `settings` VALUES ('40', 'Chamorro', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi', '1', '2015-07-22 10:03:01', 'jbailey12', '2015-05-05 14:29:34', 'hlopez12');
INSERT INTO `settings` VALUES ('41', 'Dominican (Dominican Republic)', 'ultrices libero non mattis pulvinar', '1', '2014-09-08 04:52:50', 'mpayne13', '2014-10-17 10:47:27', 'bhowell13');
INSERT INTO `settings` VALUES ('42', 'Puerto Rican', 'donec semper sapien a libero nam dui proin', '1', '2015-05-03 20:28:47', 'mhayes14', '2014-08-29 09:22:31', 'sortiz14');
INSERT INTO `settings` VALUES ('43', 'Lumbee', 'risus auctor sed tristique in tempus sit amet sem fusce', '0', '2014-08-30 08:07:55', 'lhowell15', '2014-12-13 23:34:16', 'jbailey15');
INSERT INTO `settings` VALUES ('44', 'Aleut', 'fermentum justo nec condimentum neque sapien placerat ante nulla', '1', '2015-05-29 02:42:01', 'aray16', '2014-12-02 09:38:34', 'jford16');
INSERT INTO `settings` VALUES ('45', 'Cherokee', 'est congue elementum in hac habitasse platea dictumst', '0', '2014-12-12 13:49:31', 'greid17', '2014-12-02 12:11:09', 'cgarcia17');
INSERT INTO `settings` VALUES ('46', 'Asian Indian', 'lacus at velit vivamus vel nulla eget eros', '1', '2014-10-18 12:17:25', 'cburke18', '2014-12-26 06:57:41', 'plittle18');
INSERT INTO `settings` VALUES ('47', 'South American', 'quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', '0', '2015-03-10 22:27:55', 'wnichols19', '2015-08-03 16:07:30', 'bpierce19');
INSERT INTO `settings` VALUES ('48', 'Bolivian', 'tortor id nulla ultrices aliquet', '1', '2015-07-27 00:04:05', 'cgreene1a', '2015-01-23 01:01:58', 'awalker1a');
INSERT INTO `settings` VALUES ('49', 'Indonesian', 'nulla facilisi cras non velit nec', '0', '2015-05-14 05:46:43', 'ccook1b', '2014-11-27 18:30:06', 'vrussell1b');
INSERT INTO `settings` VALUES ('50', 'Native Hawaiian', 'interdum mauris ullamcorper purus sit amet nulla', '0', '2015-05-21 08:00:01', 'gmedina1c', '2015-07-21 01:59:57', 'fperkins1c');
INSERT INTO `settings` VALUES ('51', 'Samoan', 'sit amet diam in magna bibendum', '1', '2015-07-21 09:34:00', 'pwells1d', '2015-07-02 21:42:17', 'gjordan1d');
INSERT INTO `settings` VALUES ('52', 'Chickasaw', 'massa id lobortis convallis tortor', '0', '2014-09-01 08:22:28', 'shall1e', '2014-08-30 03:22:21', 'rbrown1e');
INSERT INTO `settings` VALUES ('53', 'Yaqui', 'quis lectus suspendisse potenti in', '1', '2014-10-20 08:33:30', 'awilliams1f', '2015-01-04 23:06:12', 'pwright1f');
INSERT INTO `settings` VALUES ('54', 'Chilean', 'duis mattis egestas metus aenean fermentum donec', '0', '2015-05-16 07:50:20', 'awarren1g', '2015-06-08 19:12:22', 'lfrazier1g');
INSERT INTO `settings` VALUES ('55', 'Samoan', 'platea dictumst aliquam augue quam sollicitudin vitae', '0', '2015-02-21 02:53:49', 'sclark1h', '2014-12-14 11:24:46', 'bfowler1h');
INSERT INTO `settings` VALUES ('56', 'Houma', 'amet nunc viverra dapibus nulla suscipit', '1', '2014-09-22 15:46:08', 'cking1i', '2015-07-26 18:35:06', 'wwallace1i');
INSERT INTO `settings` VALUES ('57', 'American Indian', 'cursus vestibulum proin eu mi nulla ac', '1', '2015-03-25 17:11:13', 'flee1j', '2014-09-14 09:18:23', 'lrussell1j');
INSERT INTO `settings` VALUES ('58', 'Thai', 'consequat ut nulla sed accumsan felis ut at', '0', '2014-10-30 03:06:16', 'jjames1k', '2015-02-06 09:14:07', 'chowell1k');
INSERT INTO `settings` VALUES ('59', 'Mexican', 'quam nec dui luctus rutrum nulla tellus in sagittis', '1', '2014-12-15 06:51:47', 'clane1l', '2015-01-19 03:53:52', 'crussell1l');
INSERT INTO `settings` VALUES ('60', 'Paiute', 'sapien sapien non mi integer ac neque duis bibendum morbi', '0', '2015-07-05 16:01:24', 'jlane1m', '2015-07-06 10:36:42', 'ghernandez1m');
INSERT INTO `settings` VALUES ('61', 'Colville', 'dui maecenas tristique est et tempus semper est quam', '1', '2015-04-17 16:36:36', 'jcole1n', '2015-01-03 15:37:31', 'mramos1n');
INSERT INTO `settings` VALUES ('62', 'Ottawa', 'mi in porttitor pede justo eu', '0', '2015-08-01 21:03:39', 'cpowell1o', '2014-10-03 15:04:44', 'kboyd1o');
INSERT INTO `settings` VALUES ('63', 'Ottawa', 'mauris lacinia sapien quis libero nullam', '0', '2014-10-11 09:42:20', 'padams1p', '2014-09-08 08:21:42', 'lchavez1p');
INSERT INTO `settings` VALUES ('64', 'Sri Lankan', 'nunc viverra dapibus nulla suscipit ligula in', '1', '2014-11-23 03:36:19', 'cdiaz1q', '2015-05-17 05:10:43', 'snguyen1q');
INSERT INTO `settings` VALUES ('65', 'Chippewa', 'leo odio condimentum id luctus nec molestie sed justo', '1', '2014-09-28 02:09:29', 'dcarr1r', '2015-03-03 20:02:01', 'ckelly1r');
INSERT INTO `settings` VALUES ('66', 'Chilean', 'pretium nisl ut volutpat sapien', '1', '2015-08-05 06:33:51', 'mhowell1s', '2015-01-05 23:29:26', 'jlopez1s');
INSERT INTO `settings` VALUES ('67', 'Blackfeet', 'sem duis aliquam convallis nunc', '0', '2015-01-21 09:08:57', 'dharper1t', '2014-08-26 14:42:27', 'mmedina1t');
INSERT INTO `settings` VALUES ('68', 'Korean', 'pretium iaculis diam erat fermentum justo nec condimentum neque', '0', '2015-06-05 05:12:34', 'dowens1u', '2015-05-25 10:17:29', 'jperry1u');
INSERT INTO `settings` VALUES ('69', 'Guamanian', 'purus eu magna vulputate luctus cum sociis natoque penatibus', '1', '2015-02-11 19:57:36', 'scrawford1v', '2015-05-18 06:30:20', 'rwalker1v');
INSERT INTO `settings` VALUES ('70', 'Argentinian', 'duis bibendum morbi non quam nec dui luctus rutrum nulla', '1', '2015-02-12 02:50:34', 'moliver1w', '2015-04-02 15:30:06', 'elee1w');
INSERT INTO `settings` VALUES ('71', 'Shoshone', 'lacinia aenean sit amet justo morbi ut odio cras', '1', '2015-04-02 01:59:50', 'vthompson1x', '2014-11-26 11:43:14', 'jgreen1x');
INSERT INTO `settings` VALUES ('72', 'Cuban', 'diam neque vestibulum eget vulputate ut', '0', '2014-08-20 13:46:51', 'harmstrong1y', '2015-02-10 09:48:17', 'kortiz1y');
INSERT INTO `settings` VALUES ('73', 'Comanche', 'ut dolor morbi vel lectus in quam', '1', '2015-05-03 16:56:16', 'pfranklin1z', '2015-03-18 11:36:29', 'rgray1z');
INSERT INTO `settings` VALUES ('74', 'Shoshone', 'mattis egestas metus aenean fermentum donec ut', '0', '2015-03-12 16:17:44', 'klane20', '2015-04-30 17:10:10', 'smurphy20');
INSERT INTO `settings` VALUES ('75', 'Indonesian', 'in congue etiam justo etiam', '1', '2015-07-07 16:45:32', 'roliver21', '2014-08-11 13:41:03', 'cwest21');
INSERT INTO `settings` VALUES ('76', 'Alaskan Athabascan', 'nulla ut erat id mauris vulputate', '1', '2015-05-13 10:09:58', 'awalker22', '2015-07-18 06:27:22', 'mmason22');
INSERT INTO `settings` VALUES ('77', 'Honduran', 'praesent blandit nam nulla integer pede justo lacinia eget tincidunt', '0', '2014-10-05 17:35:11', 'dlee23', '2014-08-25 20:31:41', 'eperkins23');
INSERT INTO `settings` VALUES ('78', 'Ute', 'posuere cubilia curae nulla dapibus', '1', '2015-07-19 23:02:20', 'jgonzalez24', '2014-09-26 12:22:06', 'acole24');
INSERT INTO `settings` VALUES ('79', 'Sioux', 'quis augue luctus tincidunt nulla mollis molestie lorem quisque', '1', '2015-06-16 13:54:47', 'bgomez25', '2015-05-16 09:32:52', 'rruiz25');
INSERT INTO `settings` VALUES ('80', 'Asian', 'eget congue eget semper rutrum nulla', '0', '2015-07-07 17:32:35', 'akim26', '2015-05-28 22:29:19', 'kharrison26');
INSERT INTO `settings` VALUES ('81', 'Cheyenne', 'volutpat sapien arcu sed augue aliquam', '0', '2015-01-17 08:39:50', 'lhall27', '2015-04-02 12:33:02', 'pwood27');
INSERT INTO `settings` VALUES ('82', 'Sioux', 'dictumst etiam faucibus cursus urna ut tellus nulla ut', '1', '2014-12-27 19:56:47', 'kgonzales28', '2014-09-21 06:39:56', 'athompson28');
INSERT INTO `settings` VALUES ('83', 'Colville', 'vel est donec odio justo sollicitudin', '0', '2014-10-15 18:26:37', 'wgardner29', '2015-04-15 16:56:20', 'jrose29');
INSERT INTO `settings` VALUES ('84', 'Sioux', 'vel ipsum praesent blandit lacinia erat', '1', '2015-04-24 15:14:06', 'vgarcia2a', '2015-05-29 17:12:06', 'rlawson2a');
INSERT INTO `settings` VALUES ('85', 'Laotian', 'tempus sit amet sem fusce consequat nulla nisl nunc', '1', '2014-12-09 22:18:34', 'hsimpson2b', '2015-05-03 12:47:24', 'cjenkins2b');
INSERT INTO `settings` VALUES ('86', 'Taiwanese', 'massa volutpat convallis morbi odio odio elementum eu', '0', '2014-12-01 15:06:25', 'jstewart2c', '2014-12-11 12:30:02', 'karmstrong2c');
INSERT INTO `settings` VALUES ('87', 'American Indian', 'nulla quisque arcu libero rutrum ac lobortis', '1', '2014-08-14 16:57:51', 'mhernandez2d', '2015-01-25 10:24:02', 'lfoster2d');
INSERT INTO `settings` VALUES ('88', 'Black or African American', 'felis ut at dolor quis odio consequat varius integer', '0', '2015-06-14 09:01:50', 'rsanchez2e', '2015-05-31 09:40:13', 'tlee2e');
INSERT INTO `settings` VALUES ('89', 'Bangladeshi', 'eu tincidunt in leo maecenas pulvinar lobortis est', '0', '2014-12-23 03:36:55', 'amiller2f', '2014-11-19 16:02:48', 'kgriffin2f');
INSERT INTO `settings` VALUES ('90', 'Kiowa', 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', '1', '2014-12-04 01:44:10', 'bpatterson2g', '2015-03-09 10:36:52', 'rgardner2g');
INSERT INTO `settings` VALUES ('91', 'Yaqui', 'mollis molestie lorem quisque ut erat curabitur gravida nisi at', '0', '2014-11-08 21:17:06', 'amorrison2h', '2014-10-13 06:26:05', 'gpierce2h');
INSERT INTO `settings` VALUES ('92', 'Apache', 'sapien quis libero nullam sit amet turpis', '1', '2015-01-04 18:34:11', 'jjordan2i', '2015-04-29 17:02:19', 'jmatthews2i');
INSERT INTO `settings` VALUES ('93', 'Samoan', 'felis ut at dolor quis odio consequat varius integer ac', '0', '2014-11-23 08:47:03', 'bfox2j', '2014-11-05 11:04:25', 'gwilliamson2j');
INSERT INTO `settings` VALUES ('94', 'Vietnamese', 'dui proin leo odio porttitor id consequat in', '1', '2015-07-28 07:24:39', 'nperez2k', '2015-06-28 23:06:42', 'kstone2k');
INSERT INTO `settings` VALUES ('95', 'Colville', 'tortor sollicitudin mi sit amet lobortis', '1', '2014-12-10 17:50:53', 'lhayes2l', '2015-02-14 06:21:20', 'emorris2l');
INSERT INTO `settings` VALUES ('96', 'Shoshone', 'eleifend pede libero quis orci nullam molestie nibh', '0', '2014-12-09 13:25:13', 'kturner2m', '2014-11-04 12:22:00', 'arivera2m');
INSERT INTO `settings` VALUES ('97', 'Ottawa', 'volutpat sapien arcu sed augue aliquam erat volutpat', '0', '2015-07-01 16:11:52', 'jhawkins2n', '2014-10-15 22:13:49', 'jwilliamson2n');
INSERT INTO `settings` VALUES ('98', 'Bangladeshi', 'luctus tincidunt nulla mollis molestie lorem', '1', '2014-09-20 22:17:39', 'rhudson2o', '2015-04-22 11:30:46', 'acarter2o');
INSERT INTO `settings` VALUES ('99', 'Latin American Indian', 'sit amet justo morbi ut odio cras', '0', '2014-08-14 17:42:22', 'aalexander2p', '2014-10-21 06:35:55', 'wthomas2p');
INSERT INTO `settings` VALUES ('100', 'Bolivian', 'mattis odio donec vitae nisi', '1', '2014-10-27 08:04:34', 'rperez2q', '2014-10-18 16:43:47', 'jolson2q');
INSERT INTO `settings` VALUES ('101', 'Colville', 'eleifend pede libero quis orci nullam molestie nibh in', '0', '2014-12-31 01:40:16', 'cstephens2r', '2014-12-07 21:51:41', 'awashington2r');
INSERT INTO `settings` VALUES ('102', 'Creek', 'consequat lectus in est risus', '0', '2014-12-31 23:09:17', 'pgarrett2s', '2014-08-25 21:42:20', 'hrose2s');
INSERT INTO `settings` VALUES ('103', 'Shoshone', 'lobortis ligula sit amet eleifend pede libero quis orci nullam', '0', '2014-10-11 10:26:10', 'smendoza2t', '2015-01-02 21:08:17', 'sperkins2t');
INSERT INTO `settings` VALUES ('104', 'Argentinian', 'luctus et ultrices posuere cubilia curae mauris viverra diam vitae', '1', '2015-06-27 22:16:17', 'dhenderson2u', '2014-11-13 04:22:37', 'kwatkins2u');
INSERT INTO `settings` VALUES ('105', 'American Indian and Alaska Native (AIAN)', 'morbi ut odio cras mi pede malesuada in', '1', '2014-09-28 16:21:25', 'jking2v', '2014-08-12 02:13:51', 'rsimpson2v');
INSERT INTO `settings` VALUES ('106', 'Potawatomi', 'erat tortor sollicitudin mi sit amet lobortis', '0', '2014-11-06 15:07:25', 'acunningham2w', '2015-01-23 08:38:06', 'egonzales2w');
INSERT INTO `settings` VALUES ('107', 'Seminole', 'interdum venenatis turpis enim blandit mi in porttitor', '1', '2015-02-23 06:01:55', 'hmatthews2x', '2015-01-31 04:40:42', 'mryan2x');
INSERT INTO `settings` VALUES ('108', 'Guatemalan', 'eros vestibulum ac est lacinia nisi venenatis tristique', '1', '2014-11-29 02:22:03', 'rmedina2y', '2014-10-20 06:20:22', 'acole2y');
INSERT INTO `settings` VALUES ('109', 'Guatemalan', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', '1', '2014-11-24 20:26:39', 'bbrooks2z', '2014-10-20 09:51:23', 'rcarroll2z');
INSERT INTO `settings` VALUES ('110', 'Salvadoran', 'enim in tempor turpis nec euismod scelerisque', '1', '2014-11-18 16:29:35', 'jspencer30', '2015-06-08 01:10:46', 'rsmith30');
INSERT INTO `settings` VALUES ('111', 'Latin American Indian', 'felis eu sapien cursus vestibulum proin', '1', '2015-07-26 12:40:59', 'mnelson31', '2015-02-01 12:24:27', 'jallen31');
INSERT INTO `settings` VALUES ('112', 'Filipino', 'ipsum dolor sit amet consectetuer adipiscing elit proin', '1', '2015-06-08 14:17:34', 'kgonzales32', '2014-10-06 09:36:14', 'jberry32');
INSERT INTO `settings` VALUES ('113', 'Cheyenne', 'phasellus sit amet erat nulla tempus vivamus', '1', '2015-04-25 17:29:42', 'jcampbell33', '2014-11-23 16:02:17', 'slewis33');
INSERT INTO `settings` VALUES ('114', 'Central American', 'donec dapibus duis at velit eu est congue elementum', '0', '2015-05-10 08:48:40', 'rfields34', '2014-11-24 08:18:49', 'gdiaz34');
INSERT INTO `settings` VALUES ('115', 'Cree', 'potenti cras in purus eu magna vulputate luctus', '1', '2015-01-01 15:37:48', 'rray35', '2015-06-28 23:36:19', 'dwatkins35');
INSERT INTO `settings` VALUES ('116', 'Aleut', 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', '0', '2015-02-08 19:22:20', 'dcastillo36', '2015-01-08 00:33:09', 'cryan36');
INSERT INTO `settings` VALUES ('117', 'South American', 'feugiat et eros vestibulum ac est lacinia nisi', '1', '2015-07-20 11:15:32', 'pyoung37', '2015-02-01 23:18:24', 'sdavis37');
INSERT INTO `settings` VALUES ('118', 'Guamanian', 'nisl duis bibendum felis sed interdum venenatis turpis', '1', '2015-02-19 11:59:17', 'bwillis38', '2015-05-21 02:53:55', 'rcrawford38');
INSERT INTO `settings` VALUES ('119', 'Kiowa', 'mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', '1', '2015-01-04 01:22:35', 'ksullivan39', '2015-01-08 17:34:19', 'asanders39');
INSERT INTO `settings` VALUES ('120', 'Yuman', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi', '0', '2015-08-05 03:25:01', 'jfernandez3a', '2014-11-08 19:24:41', 'wflores3a');
INSERT INTO `settings` VALUES ('121', 'Cuban', 'maecenas leo odio condimentum id luctus', '1', '2015-04-05 08:45:47', 'mbowman3b', '2015-06-02 23:09:04', 'jward3b');
INSERT INTO `settings` VALUES ('122', 'Uruguayan', 'mauris viverra diam vitae quam', '0', '2014-08-27 04:35:41', 'cadams3c', '2015-07-24 13:39:21', 'rsmith3c');
INSERT INTO `settings` VALUES ('123', 'Puerto Rican', 'suspendisse ornare consequat lectus in', '1', '2015-07-04 04:16:01', 'jwest3d', '2014-11-23 23:16:42', 'sortiz3d');
INSERT INTO `settings` VALUES ('124', 'Mexican', 'posuere nonummy integer non velit donec diam neque', '1', '2014-11-28 04:14:46', 'aparker3e', '2015-08-02 20:06:20', 'dgreen3e');
INSERT INTO `settings` VALUES ('125', 'Colombian', 'diam vitae quam suspendisse potenti nullam', '1', '2014-11-27 03:03:13', 'efernandez3f', '2015-03-04 15:06:23', 'cwilson3f');
INSERT INTO `settings` VALUES ('126', 'Chippewa', 'accumsan tellus nisi eu orci', '1', '2015-05-27 13:52:33', 'smurphy3g', '2014-11-03 00:35:48', 'sgomez3g');
INSERT INTO `settings` VALUES ('127', 'Filipino', 'pellentesque at nulla suspendisse potenti', '0', '2015-03-23 00:33:55', 'jdiaz3h', '2014-10-26 00:29:02', 'sbowman3h');
INSERT INTO `settings` VALUES ('128', 'Pueblo', 'id lobortis convallis tortor risus dapibus', '1', '2015-03-23 08:43:08', 'agreen3i', '2015-06-29 10:49:03', 'mcrawford3i');
INSERT INTO `settings` VALUES ('129', 'Yuman', 'nulla suscipit ligula in lacus', '0', '2015-08-06 07:07:08', 'nmyers3j', '2015-06-18 08:42:50', 'blewis3j');
INSERT INTO `settings` VALUES ('130', 'Alaskan Athabascan', 'sit amet eleifend pede libero quis orci nullam molestie', '1', '2014-11-16 02:02:15', 'kknight3k', '2014-12-15 02:23:06', 'bmedina3k');
INSERT INTO `settings` VALUES ('131', 'Ute', 'pellentesque at nulla suspendisse potenti cras in', '1', '2014-11-17 19:47:46', 'afrazier3l', '2015-06-06 21:59:06', 'cpeterson3l');
INSERT INTO `settings` VALUES ('132', 'Asian Indian', 'integer a nibh in quis justo maecenas rhoncus aliquam lacus', '1', '2014-08-12 07:30:33', 'sharvey3m', '2015-01-01 03:49:35', 'amedina3m');
INSERT INTO `settings` VALUES ('133', 'Sioux', 'quis orci eget orci vehicula condimentum curabitur in libero', '0', '2015-03-30 17:52:12', 'rmartin3n', '2015-05-04 06:16:53', 'efernandez3n');
INSERT INTO `settings` VALUES ('134', 'Potawatomi', 'mi sit amet lobortis sapien sapien non mi integer', '0', '2015-02-05 22:55:52', 'twatkins3o', '2015-03-06 22:49:39', 'awilliamson3o');
INSERT INTO `settings` VALUES ('135', 'Yuman', 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis', '0', '2015-07-06 20:09:35', 'twatkins3p', '2014-09-13 04:13:15', 'mbanks3p');
INSERT INTO `settings` VALUES ('136', 'Samoan', 'et ultrices posuere cubilia curae nulla', '1', '2014-11-05 15:34:20', 'amartin3q', '2015-06-19 21:09:55', 'twashington3q');
INSERT INTO `settings` VALUES ('137', 'Yaqui', 'eget semper rutrum nulla nunc purus phasellus in', '1', '2014-10-10 23:57:09', 'jweaver3r', '2015-04-16 20:10:59', 'wbryant3r');
INSERT INTO `settings` VALUES ('138', 'Chinese', 'sit amet sem fusce consequat', '0', '2015-04-18 17:49:50', 'jjames3s', '2015-08-03 21:43:57', 'lalvarez3s');
INSERT INTO `settings` VALUES ('139', 'Fijian', 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', '1', '2015-05-29 03:55:50', 'dperez3t', '2014-08-21 06:21:59', 'agardner3t');
INSERT INTO `settings` VALUES ('140', 'Spaniard', 'nisl venenatis lacinia aenean sit amet', '1', '2015-05-20 10:30:31', 'emitchell3u', '2014-10-28 16:14:10', 'cbennett3u');
INSERT INTO `settings` VALUES ('141', 'Chilean', 'dui proin leo odio porttitor id consequat in consequat ut', '1', '2015-03-04 01:50:45', 'bhamilton3v', '2015-03-19 03:53:10', 'ggarcia3v');
INSERT INTO `settings` VALUES ('142', 'Shoshone', 'ligula sit amet eleifend pede libero quis', '0', '2014-11-02 01:37:22', 'jgilbert3w', '2015-06-01 05:05:30', 'jblack3w');
INSERT INTO `settings` VALUES ('143', 'Crow', 'cras non velit nec nisi vulputate nonummy maecenas tincidunt', '0', '2014-08-28 17:34:09', 'ahunter3x', '2014-08-19 02:15:02', 'sjenkins3x');
INSERT INTO `settings` VALUES ('144', 'Central American', 'vitae mattis nibh ligula nec sem duis aliquam convallis', '0', '2015-02-12 05:50:40', 'sgrant3y', '2015-03-12 21:29:06', 'jellis3y');
INSERT INTO `settings` VALUES ('145', 'Cherokee', 'eget orci vehicula condimentum curabitur in libero', '0', '2015-05-11 22:29:05', 'krichards3z', '2015-06-07 11:22:37', 'hmitchell3z');
INSERT INTO `settings` VALUES ('146', 'Ute', 'ligula nec sem duis aliquam', '1', '2015-04-09 04:24:47', 'mlynch40', '2015-05-06 23:46:23', 'rsims40');
INSERT INTO `settings` VALUES ('147', 'Osage', 'nunc proin at turpis a pede posuere', '1', '2014-11-15 12:43:36', 'bvasquez41', '2015-02-28 17:47:59', 'wgeorge41');
INSERT INTO `settings` VALUES ('148', 'Chilean', 'donec posuere metus vitae ipsum aliquam', '1', '2015-02-14 21:30:55', 'agarcia42', '2014-11-10 20:02:08', 'tvasquez42');
INSERT INTO `settings` VALUES ('149', 'Guamanian', 'proin leo odio porttitor id consequat in consequat ut', '1', '2014-08-14 20:36:17', 'llewis43', '2015-08-04 21:24:45', 'jpalmer43');
INSERT INTO `settings` VALUES ('150', 'Honduran', 'luctus et ultrices posuere cubilia curae duis faucibus accumsan', '0', '2015-01-17 03:30:22', 'aduncan44', '2014-08-29 00:21:47', 'hwood44');
INSERT INTO `settings` VALUES ('151', 'Cambodian', 'sit amet diam in magna bibendum imperdiet nullam', '0', '2015-02-03 22:11:33', 'rjenkins45', '2015-07-07 09:10:27', 'awalker45');
INSERT INTO `settings` VALUES ('152', 'Taiwanese', 'proin leo odio porttitor id', '0', '2015-01-25 21:38:35', 'ndavis46', '2015-03-12 03:01:11', 'nkennedy46');
INSERT INTO `settings` VALUES ('153', 'Cambodian', 'libero quis orci nullam molestie nibh in lectus', '1', '2015-02-08 12:25:40', 'htucker47', '2014-10-11 10:05:30', 'jgray47');
INSERT INTO `settings` VALUES ('154', 'Yakama', 'dapibus duis at velit eu est', '1', '2015-03-01 04:59:46', 'rnichols48', '2015-06-05 06:28:34', 'sberry48');
INSERT INTO `settings` VALUES ('155', 'Asian', 'varius nulla facilisi cras non velit nec', '1', '2015-08-06 13:46:18', 'rbaker49', '2015-04-22 18:50:38', 'lruiz49');
INSERT INTO `settings` VALUES ('156', 'Shoshone', 'convallis morbi odio odio elementum eu interdum eu tincidunt in', '1', '2014-12-17 21:40:37', 'dparker4a', '2014-12-09 01:48:16', 'jfisher4a');
INSERT INTO `settings` VALUES ('157', 'American Indian', 'cubilia curae mauris viverra diam vitae quam suspendisse potenti', '0', '2015-01-19 12:13:29', 'sharris4b', '2015-02-13 23:19:04', 'eward4b');
INSERT INTO `settings` VALUES ('158', 'Potawatomi', 'tincidunt eu felis fusce posuere', '1', '2015-04-21 20:25:01', 'cwhite4c', '2014-09-06 10:12:22', 'lcole4c');
INSERT INTO `settings` VALUES ('159', 'Bangladeshi', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend', '1', '2014-11-15 20:35:12', 'rcooper4d', '2015-03-28 23:15:51', 'cmatthews4d');
INSERT INTO `settings` VALUES ('160', 'Navajo', 'a libero nam dui proin leo odio porttitor id consequat', '0', '2014-10-07 07:05:34', 'bmorrison4e', '2014-11-07 09:07:36', 'ajacobs4e');
INSERT INTO `settings` VALUES ('161', 'Pueblo', 'semper interdum mauris ullamcorper purus sit', '1', '2014-09-24 23:14:02', 'jmcdonald4f', '2015-01-29 23:18:55', 'mbowman4f');
INSERT INTO `settings` VALUES ('162', 'Nicaraguan', 'lacinia eget tincidunt eget tempus vel pede', '1', '2014-09-10 19:17:53', 'jlarson4g', '2015-04-27 23:05:21', 'khunter4g');
INSERT INTO `settings` VALUES ('163', 'South American', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque', '1', '2015-06-10 22:26:40', 'ssims4h', '2014-09-13 13:54:11', 'wcooper4h');
INSERT INTO `settings` VALUES ('164', 'Panamanian', 'neque sapien placerat ante nulla justo aliquam', '1', '2015-06-13 19:38:34', 'tperez4i', '2015-07-27 16:10:04', 'nwillis4i');
INSERT INTO `settings` VALUES ('165', 'Yaqui', 'bibendum felis sed interdum venenatis turpis enim blandit mi', '1', '2014-09-29 05:43:56', 'aparker4j', '2015-06-19 18:13:18', 'tgomez4j');
INSERT INTO `settings` VALUES ('166', 'Blackfeet', 'lacinia erat vestibulum sed magna at', '1', '2015-02-17 13:28:59', 'jprice4k', '2015-05-06 11:56:51', 'ccollins4k');
INSERT INTO `settings` VALUES ('167', 'American Indian and Alaska Native (AIAN)', 'vel accumsan tellus nisi eu orci mauris lacinia sapien', '0', '2014-09-20 16:49:14', 'nwallace4l', '2014-11-19 13:11:39', 'kscott4l');
INSERT INTO `settings` VALUES ('168', 'Ottawa', 'cursus id turpis integer aliquet massa', '1', '2015-03-21 08:21:38', 'dpierce4m', '2015-01-27 05:11:28', 'slittle4m');
INSERT INTO `settings` VALUES ('169', 'Crow', 'donec posuere metus vitae ipsum aliquam non mauris morbi non', '0', '2015-05-20 09:48:30', 'lvasquez4n', '2014-11-26 09:26:43', 'sanderson4n');
INSERT INTO `settings` VALUES ('170', 'Puget Sound Salish', 'nullam sit amet turpis elementum ligula vehicula consequat morbi', '1', '2014-11-26 20:55:01', 'ejordan4o', '2015-06-22 09:37:13', 'plawrence4o');
INSERT INTO `settings` VALUES ('171', 'Uruguayan', 'leo maecenas pulvinar lobortis est', '0', '2014-12-17 20:34:17', 'ctucker4p', '2015-04-22 20:49:04', 'ccarr4p');
INSERT INTO `settings` VALUES ('172', 'Chickasaw', 'pellentesque ultrices phasellus id sapien', '1', '2015-03-03 02:03:50', 'twilliams4q', '2015-05-24 20:26:08', 'phowell4q');
INSERT INTO `settings` VALUES ('173', 'Sioux', 'mollis molestie lorem quisque ut erat curabitur gravida', '0', '2015-08-02 12:48:00', 'telliott4r', '2015-01-19 20:12:13', 'tfoster4r');
INSERT INTO `settings` VALUES ('174', 'Japanese', 'ultrices posuere cubilia curae nulla dapibus dolor', '0', '2014-10-13 21:46:36', 'cbailey4s', '2015-03-13 07:43:32', 'bgonzalez4s');
INSERT INTO `settings` VALUES ('175', 'Samoan', 'justo nec condimentum neque sapien placerat ante nulla justo', '1', '2014-10-19 03:28:17', 'kmartinez4t', '2014-08-18 04:24:32', 'jlane4t');
INSERT INTO `settings` VALUES ('176', 'Guamanian', 'fusce congue diam id ornare imperdiet', '0', '2014-10-13 01:43:39', 'pallen4u', '2015-04-26 12:41:45', 'kporter4u');
INSERT INTO `settings` VALUES ('177', 'Guatemalan', 'suscipit a feugiat et eros vestibulum ac est', '1', '2014-12-29 01:42:39', 'mday4v', '2014-12-05 10:13:51', 'lburke4v');
INSERT INTO `settings` VALUES ('178', 'Asian', 'amet turpis elementum ligula vehicula', '1', '2014-09-08 05:07:57', 'priley4w', '2015-03-08 17:58:45', 'jwillis4w');
INSERT INTO `settings` VALUES ('179', 'Puget Sound Salish', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus', '1', '2015-03-15 08:39:30', 'edixon4x', '2015-01-27 21:23:07', 'rnguyen4x');
INSERT INTO `settings` VALUES ('180', 'Paraguayan', 'sollicitudin vitae consectetuer eget rutrum at', '0', '2015-06-06 21:08:08', 'adaniels4y', '2015-08-08 06:24:23', 'tmurphy4y');
INSERT INTO `settings` VALUES ('181', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'dis parturient montes nascetur ridiculus mus', '1', '2015-07-05 02:24:49', 'nnguyen4z', '2015-05-20 22:27:19', 'rryan4z');
INSERT INTO `settings` VALUES ('182', 'Colville', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum', '1', '2015-04-28 16:18:30', 'rspencer50', '2015-02-12 21:11:39', 'idunn50');
INSERT INTO `settings` VALUES ('183', 'Hmong', 'leo pellentesque ultrices mattis odio donec vitae nisi nam', '1', '2015-03-19 18:33:08', 'cwright51', '2014-10-13 17:07:38', 'vhall51');
INSERT INTO `settings` VALUES ('184', 'American Indian', 'sociis natoque penatibus et magnis', '1', '2014-11-29 20:19:51', 'nspencer52', '2015-02-19 10:52:08', 'flynch52');
INSERT INTO `settings` VALUES ('185', 'Malaysian', 'ac leo pellentesque ultrices mattis', '1', '2014-10-10 17:28:01', 'mwright53', '2015-06-20 13:32:19', 'hmendoza53');
INSERT INTO `settings` VALUES ('186', 'Comanche', 'maecenas ut massa quis augue luctus tincidunt nulla mollis molestie', '0', '2015-01-15 19:27:25', 'agardner54', '2015-05-08 11:03:34', 'jstewart54');
INSERT INTO `settings` VALUES ('187', 'American Indian and Alaska Native (AIAN)', 'mus vivamus vestibulum sagittis sapien cum sociis', '0', '2015-05-11 21:54:45', 'vmartinez55', '2015-01-07 11:34:28', 'acollins55');
INSERT INTO `settings` VALUES ('188', 'Asian', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar', '1', '2014-11-28 22:45:37', 'ccox56', '2014-12-28 20:07:59', 'alawson56');
INSERT INTO `settings` VALUES ('189', 'Crow', 'ipsum ac tellus semper interdum mauris ullamcorper purus', '0', '2015-08-06 09:50:49', 'mstanley57', '2014-12-30 13:22:41', 'pgardner57');
INSERT INTO `settings` VALUES ('190', 'Osage', 'justo maecenas rhoncus aliquam lacus morbi', '0', '2014-10-30 08:24:26', 'tramirez58', '2015-07-10 13:38:01', 'tstanley58');
INSERT INTO `settings` VALUES ('191', 'American Indian', 'pretium quis lectus suspendisse potenti in eleifend quam', '1', '2015-07-19 01:33:35', 'bwillis59', '2015-04-04 05:11:52', 'jspencer59');
INSERT INTO `settings` VALUES ('192', 'Micronesian', 'quis orci eget orci vehicula condimentum curabitur in libero ut', '0', '2014-11-28 07:25:02', 'cstewart5a', '2014-12-30 15:27:34', 'karnold5a');
INSERT INTO `settings` VALUES ('193', 'Lumbee', 'dui vel sem sed sagittis nam congue', '1', '2015-01-05 23:19:44', 'shart5b', '2014-09-01 05:34:55', 'bflores5b');
INSERT INTO `settings` VALUES ('194', 'Puerto Rican', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam', '0', '2014-09-28 01:26:20', 'tgrant5c', '2015-03-24 06:15:48', 'aroberts5c');
INSERT INTO `settings` VALUES ('195', 'Chilean', 'est donec odio justo sollicitudin ut suscipit a feugiat', '1', '2015-08-07 17:42:46', 'lwelch5d', '2014-12-17 05:10:32', 'smccoy5d');
INSERT INTO `settings` VALUES ('196', 'Melanesian', 'dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', '1', '2015-01-22 21:18:34', 'edean5e', '2014-10-12 01:00:28', 'dnguyen5e');
INSERT INTO `settings` VALUES ('197', 'Tongan', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia', '0', '2015-05-05 07:35:54', 'aelliott5f', '2015-03-17 10:15:25', 'jstone5f');
INSERT INTO `settings` VALUES ('198', 'Asian Indian', 'risus praesent lectus vestibulum quam sapien', '0', '2014-08-16 06:22:16', 'fwatkins5g', '2015-05-09 16:35:55', 'lwatkins5g');
INSERT INTO `settings` VALUES ('199', 'Paiute', 'integer aliquet massa id lobortis convallis tortor risus dapibus augue', '0', '2015-05-01 13:59:30', 'hcunningham5h', '2015-02-08 00:26:00', 'hgraham5h');
INSERT INTO `settings` VALUES ('200', 'Venezuelan', 'eget semper rutrum nulla nunc purus phasellus in felis', '0', '2015-06-08 04:25:59', 'sdavis5i', '2014-12-20 04:22:55', 'jlawrence5i');
INSERT INTO `settings` VALUES ('201', 'Polynesian', 'erat nulla tempus vivamus in felis', '0', '2015-05-06 22:10:07', 'sbanks5j', '2014-12-17 22:44:59', 'tmatthews5j');
INSERT INTO `settings` VALUES ('202', 'Thai', 'non mauris morbi non lectus aliquam sit amet diam', '1', '2015-05-18 05:15:49', 'jgibson5k', '2014-11-02 12:46:09', 'hbaker5k');
INSERT INTO `settings` VALUES ('203', 'Panamanian', 'blandit nam nulla integer pede justo lacinia', '1', '2015-07-05 19:57:04', 'kschmidt5l', '2015-03-16 10:33:45', 'rtaylor5l');
INSERT INTO `settings` VALUES ('204', 'Paiute', 'posuere cubilia curae nulla dapibus dolor vel est donec', '0', '2015-07-06 19:51:47', 'ekennedy5m', '2014-09-27 05:06:59', 'wsimpson5m');
INSERT INTO `settings` VALUES ('205', 'Samoan', 'neque sapien placerat ante nulla justo', '1', '2014-10-28 02:01:23', 'kalexander5n', '2015-02-23 04:02:55', 'jfox5n');
INSERT INTO `settings` VALUES ('206', 'Dominican (Dominican Republic)', 'enim lorem ipsum dolor sit', '0', '2014-11-30 09:54:31', 'kmarshall5o', '2014-10-17 15:47:12', 'kevans5o');
INSERT INTO `settings` VALUES ('207', 'Latin American Indian', 'posuere felis sed lacus morbi', '1', '2015-06-03 11:50:24', 'jwright5p', '2015-05-05 15:52:51', 'jsmith5p');
INSERT INTO `settings` VALUES ('208', 'Kiowa', 'sociis natoque penatibus et magnis dis', '1', '2015-07-24 08:18:00', 'jburns5q', '2015-06-10 20:56:01', 'rgreene5q');
INSERT INTO `settings` VALUES ('209', 'Crow', 'eget eleifend luctus ultricies eu nibh quisque', '0', '2014-12-13 17:13:34', 'hmorgan5r', '2015-06-15 06:56:57', 'sjenkins5r');
INSERT INTO `settings` VALUES ('210', 'Filipino', 'semper porta volutpat quam pede lobortis ligula', '0', '2015-06-19 09:55:56', 'pmorales5s', '2015-05-10 15:09:10', 'jchapman5s');
INSERT INTO `settings` VALUES ('211', 'Yakama', 'nam tristique tortor eu pede', '1', '2015-03-01 11:45:26', 'kwalker5t', '2015-06-19 17:12:08', 'jday5t');
INSERT INTO `settings` VALUES ('212', 'Creek', 'congue risus semper porta volutpat quam pede lobortis ligula', '1', '2015-05-31 16:51:21', 'bhowell5u', '2014-08-17 12:57:29', 'nrice5u');
INSERT INTO `settings` VALUES ('213', 'Peruvian', 'nisl nunc rhoncus dui vel sem sed sagittis', '0', '2014-09-05 20:31:42', 'cortiz5v', '2015-06-03 16:10:45', 'btucker5v');
INSERT INTO `settings` VALUES ('214', 'Tohono O\'Odham', 'congue diam id ornare imperdiet sapien', '1', '2015-03-31 02:30:28', 'bking5w', '2014-11-30 10:12:15', 'cowens5w');
INSERT INTO `settings` VALUES ('215', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'proin leo odio porttitor id', '0', '2014-10-17 22:52:17', 'rdaniels5x', '2015-04-07 05:37:11', 'mkim5x');
INSERT INTO `settings` VALUES ('216', 'American Indian', 'accumsan odio curabitur convallis duis consequat', '1', '2015-03-05 11:45:29', 'khall5y', '2015-01-10 16:45:35', 'cgraham5y');
INSERT INTO `settings` VALUES ('217', 'Hmong', 'ridiculus mus etiam vel augue vestibulum', '1', '2014-10-31 22:26:06', 'lcole5z', '2015-01-09 12:41:43', 'amarshall5z');
INSERT INTO `settings` VALUES ('218', 'Cheyenne', 'lacinia aenean sit amet justo', '1', '2015-05-21 04:15:56', 'btaylor60', '2015-03-01 08:17:09', 'jrogers60');
INSERT INTO `settings` VALUES ('219', 'Pakistani', 'vel enim sit amet nunc viverra dapibus nulla suscipit', '0', '2015-02-23 01:22:53', 'jriley61', '2015-03-10 19:24:11', 'ccampbell61');
INSERT INTO `settings` VALUES ('220', 'Chickasaw', 'blandit mi in porttitor pede justo eu massa donec dapibus', '0', '2014-09-01 01:22:59', 'jrodriguez62', '2015-06-21 04:45:02', 'mmeyer62');
INSERT INTO `settings` VALUES ('221', 'Sioux', 'orci eget orci vehicula condimentum curabitur in libero ut massa', '1', '2014-12-16 21:19:04', 'jfowler63', '2015-02-14 09:25:41', 'aallen63');
INSERT INTO `settings` VALUES ('222', 'Sioux', 'lobortis sapien sapien non mi integer ac neque duis bibendum', '0', '2015-06-22 05:01:50', 'wriley64', '2015-03-14 21:07:49', 'bsanders64');
INSERT INTO `settings` VALUES ('223', 'Kiowa', 'quam a odio in hac habitasse', '1', '2014-10-05 07:32:14', 'hbutler65', '2015-01-12 13:48:03', 'pcole65');
INSERT INTO `settings` VALUES ('224', 'Micronesian', 'nullam varius nulla facilisi cras', '1', '2014-11-30 18:43:03', 'lfowler66', '2014-08-13 12:38:36', 'nallen66');
INSERT INTO `settings` VALUES ('225', 'Yaqui', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', '0', '2014-11-08 04:31:35', 'amason67', '2015-05-29 20:16:03', 'cpeterson67');
INSERT INTO `settings` VALUES ('226', 'Cree', 'amet eros suspendisse accumsan tortor quis', '1', '2014-11-29 16:37:14', 'rpeters68', '2015-07-20 16:05:24', 'ppatterson68');
INSERT INTO `settings` VALUES ('227', 'Filipino', 'risus auctor sed tristique in tempus sit amet sem', '0', '2015-03-02 13:14:05', 'kholmes69', '2015-02-17 05:47:16', 'ahawkins69');
INSERT INTO `settings` VALUES ('228', 'Samoan', 'vestibulum sed magna at nunc commodo placerat praesent blandit', '1', '2015-03-24 00:55:39', 'smontgomery6a', '2015-02-10 22:06:20', 'rgomez6a');
INSERT INTO `settings` VALUES ('229', 'Iroquois', 'a suscipit nulla elit ac nulla sed vel', '0', '2015-06-09 13:27:08', 'jwatson6b', '2015-07-17 12:05:18', 'jpayne6b');
INSERT INTO `settings` VALUES ('230', 'Cambodian', 'mattis odio donec vitae nisi', '1', '2015-07-27 02:09:19', 'whowell6c', '2014-12-06 07:32:01', 'wdiaz6c');
INSERT INTO `settings` VALUES ('231', 'Kiowa', 'pede justo eu massa donec dapibus', '0', '2015-08-02 08:24:11', 'rbryant6d', '2014-12-09 02:48:02', 'jhudson6d');
INSERT INTO `settings` VALUES ('232', 'Blackfeet', 'faucibus orci luctus et ultrices posuere cubilia', '1', '2015-02-23 23:05:46', 'hmiller6e', '2015-06-16 05:20:22', 'npowell6e');
INSERT INTO `settings` VALUES ('233', 'Cheyenne', 'sed accumsan felis ut at dolor', '0', '2015-01-20 20:20:46', 'wturner6f', '2015-04-17 15:30:01', 'aandrews6f');
INSERT INTO `settings` VALUES ('234', 'Houma', 'amet nulla quisque arcu libero rutrum ac lobortis', '1', '2015-05-03 00:23:23', 'twilliamson6g', '2014-11-29 18:57:14', 'lkelly6g');
INSERT INTO `settings` VALUES ('235', 'Osage', 'tristique in tempus sit amet sem fusce consequat nulla nisl', '1', '2015-05-24 10:56:09', 'rray6h', '2015-05-03 12:18:38', 'mstephens6h');
INSERT INTO `settings` VALUES ('236', 'Mexican', 'maecenas leo odio condimentum id luctus nec molestie sed justo', '1', '2014-11-30 12:14:23', 'ralexander6i', '2014-09-20 17:29:36', 'sthomas6i');
INSERT INTO `settings` VALUES ('237', 'Pima', 'ut nunc vestibulum ante ipsum primis in', '1', '2015-04-03 14:21:14', 'cadams6j', '2014-09-15 10:53:47', 'rgomez6j');
INSERT INTO `settings` VALUES ('238', 'Apache', 'est et tempus semper est quam pharetra magna', '0', '2015-04-29 15:45:15', 'amorrison6k', '2014-10-22 19:51:09', 'kwilliamson6k');
INSERT INTO `settings` VALUES ('239', 'Houma', 'vulputate nonummy maecenas tincidunt lacus at velit', '0', '2015-02-26 16:19:09', 'lhenderson6l', '2015-06-22 00:30:01', 'jrice6l');
INSERT INTO `settings` VALUES ('240', 'Japanese', 'viverra pede ac diam cras', '0', '2014-11-26 03:05:15', 'elewis6m', '2015-02-22 22:28:47', 'emartinez6m');
INSERT INTO `settings` VALUES ('241', 'Thai', 'suspendisse potenti in eleifend quam', '1', '2014-11-03 16:50:56', 'jburton6n', '2015-04-25 21:29:50', 'adean6n');
INSERT INTO `settings` VALUES ('242', 'Fijian', 'duis bibendum felis sed interdum venenatis', '1', '2015-04-13 01:36:39', 'tturner6o', '2015-05-29 10:42:01', 'twilliams6o');
INSERT INTO `settings` VALUES ('243', 'Nicaraguan', 'eget eleifend luctus ultricies eu nibh quisque id', '0', '2014-12-22 00:03:30', 'aanderson6p', '2015-01-20 13:05:43', 'mferguson6p');
INSERT INTO `settings` VALUES ('244', 'Bolivian', 'est et tempus semper est quam pharetra magna', '0', '2015-03-21 01:35:57', 'lhoward6q', '2014-08-24 05:30:13', 'eoliver6q');
INSERT INTO `settings` VALUES ('245', 'Chickasaw', 'sit amet diam in magna bibendum imperdiet', '0', '2015-04-20 21:03:56', 'jfranklin6r', '2014-11-25 18:35:30', 'kross6r');
INSERT INTO `settings` VALUES ('246', 'Yakama', 'leo maecenas pulvinar lobortis est phasellus sit', '0', '2014-09-24 16:18:53', 'estanley6s', '2014-12-04 05:46:57', 'rromero6s');
INSERT INTO `settings` VALUES ('247', 'White', 'praesent id massa id nisl venenatis lacinia aenean sit amet', '1', '2014-12-09 00:44:21', 'sschmidt6t', '2015-05-11 17:40:36', 'fcoleman6t');
INSERT INTO `settings` VALUES ('248', 'Ute', 'accumsan felis ut at dolor quis odio', '1', '2014-12-24 14:44:00', 'asmith6u', '2015-08-03 22:31:50', 'phicks6u');
INSERT INTO `settings` VALUES ('249', 'Apache', 'lorem vitae mattis nibh ligula nec sem duis aliquam', '0', '2015-04-17 17:46:26', 'ablack6v', '2014-10-27 04:58:54', 'mjohnson6v');
INSERT INTO `settings` VALUES ('250', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede', '0', '2014-10-06 21:45:09', 'hdean6w', '2015-06-04 10:10:09', 'kjacobs6w');
INSERT INTO `settings` VALUES ('251', 'Venezuelan', 'congue diam id ornare imperdiet sapien urna pretium', '0', '2014-11-12 20:21:40', 'mperkins6x', '2014-11-04 22:09:19', 'hpeterson6x');
INSERT INTO `settings` VALUES ('252', 'Micronesian', 'in faucibus orci luctus et ultrices posuere', '1', '2015-03-29 18:45:20', 'phall6y', '2015-03-27 17:08:22', 'tbowman6y');
INSERT INTO `settings` VALUES ('253', 'Houma', 'eget massa tempor convallis nulla neque libero convallis eget eleifend', '0', '2015-06-23 12:07:38', 'bpowell6z', '2015-06-17 07:34:12', 'jyoung6z');
INSERT INTO `settings` VALUES ('254', 'Yakama', 'a odio in hac habitasse', '0', '2015-03-17 19:53:35', 'mmurphy70', '2015-04-29 17:07:25', 'rmontgomery70');
INSERT INTO `settings` VALUES ('255', 'Taiwanese', 'ligula pellentesque ultrices phasellus id sapien in sapien', '1', '2014-08-11 11:07:48', 'jallen71', '2015-05-04 09:11:26', 'pgordon71');
INSERT INTO `settings` VALUES ('256', 'Chilean', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet', '1', '2015-06-13 18:37:37', 'mmartin72', '2014-12-31 20:50:01', 'jmills72');
INSERT INTO `settings` VALUES ('257', 'Peruvian', 'sapien varius ut blandit non interdum in ante vestibulum', '1', '2015-08-04 05:47:57', 'nsanders73', '2015-07-06 04:16:32', 'nmarshall73');
INSERT INTO `settings` VALUES ('258', 'Puget Sound Salish', 'lacinia sapien quis libero nullam', '1', '2015-05-21 18:37:22', 'dwagner74', '2015-06-18 08:29:43', 'jkim74');
INSERT INTO `settings` VALUES ('259', 'Honduran', 'natoque penatibus et magnis dis parturient montes nascetur', '0', '2014-10-15 03:40:50', 'tsims75', '2015-05-19 01:11:13', 'nmitchell75');
INSERT INTO `settings` VALUES ('260', 'Laotian', 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', '0', '2014-09-13 07:44:06', 'jreed76', '2014-11-14 13:25:21', 'pwillis76');
INSERT INTO `settings` VALUES ('261', 'Salvadoran', 'integer ac leo pellentesque ultrices mattis odio donec', '0', '2015-07-15 23:49:47', 'jrichards77', '2014-12-26 22:13:33', 'anelson77');
INSERT INTO `settings` VALUES ('262', 'Samoan', 'venenatis lacinia aenean sit amet justo morbi ut odio', '0', '2014-12-13 21:59:28', 'kwalker78', '2015-03-14 19:37:48', 'jfields78');
INSERT INTO `settings` VALUES ('263', 'Chinese', 'dis parturient montes nascetur ridiculus mus vivamus', '1', '2015-07-01 16:39:26', 'mhayes79', '2015-01-11 15:31:03', 'aduncan79');
INSERT INTO `settings` VALUES ('264', 'Polynesian', 'et magnis dis parturient montes nascetur ridiculus mus', '0', '2015-03-11 01:09:42', 'hgarcia7a', '2014-10-11 12:41:42', 'nmorris7a');
INSERT INTO `settings` VALUES ('265', 'Nicaraguan', 'pede lobortis ligula sit amet eleifend pede libero quis', '1', '2015-02-17 02:50:37', 'along7b', '2015-03-09 17:47:20', 'jwatson7b');
INSERT INTO `settings` VALUES ('266', 'Spaniard', 'suspendisse potenti nullam porttitor lacus at', '1', '2015-02-25 03:11:42', 'jduncan7c', '2014-11-28 21:06:45', 'phanson7c');
INSERT INTO `settings` VALUES ('267', 'Houma', 'sed interdum venenatis turpis enim blandit', '0', '2014-08-21 11:02:00', 'drobinson7d', '2014-08-13 00:17:11', 'tgutierrez7d');
INSERT INTO `settings` VALUES ('268', 'Pueblo', 'consequat varius integer ac leo pellentesque', '1', '2014-09-25 04:32:22', 'abrooks7e', '2015-05-08 15:26:03', 'chawkins7e');
INSERT INTO `settings` VALUES ('269', 'Puerto Rican', 'purus sit amet nulla quisque arcu', '0', '2015-05-11 08:42:57', 'vmiller7f', '2014-10-24 19:37:36', 'asimmons7f');
INSERT INTO `settings` VALUES ('270', 'Delaware', 'ut nulla sed accumsan felis ut at dolor', '1', '2014-09-30 17:40:58', 'drobinson7g', '2015-02-23 20:51:50', 'jschmidt7g');
INSERT INTO `settings` VALUES ('271', 'Cheyenne', 'facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', '0', '2015-03-09 05:27:06', 'rross7h', '2014-10-01 21:48:22', 'jburns7h');
INSERT INTO `settings` VALUES ('272', 'Pakistani', 'congue vivamus metus arcu adipiscing molestie hendrerit', '0', '2014-11-02 23:00:59', 'jalvarez7i', '2015-04-09 20:29:57', 'hwatkins7i');
INSERT INTO `settings` VALUES ('273', 'Cambodian', 'sapien non mi integer ac neque duis bibendum', '1', '2014-11-25 14:36:55', 'rnelson7j', '2015-02-17 05:13:28', 'caustin7j');
INSERT INTO `settings` VALUES ('274', 'Argentinian', 'bibendum felis sed interdum venenatis turpis', '1', '2015-06-09 23:24:40', 'fcarr7k', '2015-08-08 00:42:53', 'crobinson7k');
INSERT INTO `settings` VALUES ('275', 'White', 'tortor quis turpis sed ante vivamus', '0', '2015-03-29 17:16:05', 'wmorrison7l', '2014-11-08 00:00:42', 'jmitchell7l');
INSERT INTO `settings` VALUES ('276', 'Osage', 'duis bibendum felis sed interdum', '0', '2015-02-24 19:41:28', 'kaustin7m', '2014-08-14 10:43:36', 'nweaver7m');
INSERT INTO `settings` VALUES ('277', 'Alaskan Athabascan', 'leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', '0', '2014-11-23 15:03:20', 'jmitchell7n', '2015-02-12 07:08:36', 'hrobertson7n');
INSERT INTO `settings` VALUES ('278', 'Melanesian', 'quam sapien varius ut blandit non interdum in ante vestibulum', '1', '2015-07-24 10:20:28', 'glittle7o', '2014-12-24 03:03:20', 'chall7o');
INSERT INTO `settings` VALUES ('279', 'Delaware', 'at turpis donec posuere metus vitae ipsum aliquam', '1', '2014-12-12 17:23:37', 'jrichardson7p', '2015-01-17 21:20:04', 'rgriffin7p');
INSERT INTO `settings` VALUES ('280', 'Alaskan Athabascan', 'ac enim in tempor turpis nec euismod', '1', '2014-11-30 22:16:29', 'ajames7q', '2015-01-03 17:38:30', 'sortiz7q');
INSERT INTO `settings` VALUES ('281', 'Latin American Indian', 'id consequat in consequat ut', '1', '2014-12-12 06:29:09', 'sperez7r', '2015-06-16 08:18:43', 'ldunn7r');
INSERT INTO `settings` VALUES ('282', 'Lumbee', 'mi integer ac neque duis', '0', '2014-10-15 14:20:03', 'lmurray7s', '2015-07-08 19:37:35', 'mday7s');
INSERT INTO `settings` VALUES ('283', 'Tohono O\'Odham', 'interdum in ante vestibulum ante ipsum primis in', '0', '2015-07-20 22:28:28', 'sgordon7t', '2015-07-17 11:55:58', 'hmills7t');
INSERT INTO `settings` VALUES ('284', 'Vietnamese', 'in hac habitasse platea dictumst morbi vestibulum velit', '1', '2015-06-08 02:17:55', 'agriffin7u', '2015-04-07 20:03:42', 'afox7u');
INSERT INTO `settings` VALUES ('285', 'Yuman', 'blandit non interdum in ante vestibulum ante ipsum', '1', '2015-01-14 01:26:34', 'tjohnston7v', '2015-03-04 15:25:14', 'pchapman7v');
INSERT INTO `settings` VALUES ('286', 'Menominee', 'sit amet cursus id turpis integer aliquet massa', '1', '2015-03-08 09:50:17', 'mgreen7w', '2015-07-29 11:07:33', 'acoleman7w');
INSERT INTO `settings` VALUES ('287', 'Yakama', 'praesent id massa id nisl venenatis', '1', '2014-08-20 14:04:35', 'fharper7x', '2015-01-13 09:45:46', 'acampbell7x');
INSERT INTO `settings` VALUES ('288', 'Aleut', 'felis eu sapien cursus vestibulum proin eu', '1', '2015-07-17 11:27:14', 'agibson7y', '2015-02-11 19:38:55', 'jbrown7y');
INSERT INTO `settings` VALUES ('289', 'Bangladeshi', 'ipsum aliquam non mauris morbi non lectus aliquam sit', '0', '2014-08-29 04:02:55', 'agreen7z', '2015-07-25 01:10:00', 'dmontgomery7z');
INSERT INTO `settings` VALUES ('290', 'Guamanian', 'suspendisse potenti cras in purus', '0', '2014-10-08 03:55:41', 'kford80', '2015-02-25 04:18:27', 'kgreene80');
INSERT INTO `settings` VALUES ('291', 'Creek', 'erat volutpat in congue etiam justo etiam pretium', '0', '2015-07-08 06:41:11', 'dparker81', '2015-06-04 00:33:44', 'dgeorge81');
INSERT INTO `settings` VALUES ('292', 'Puerto Rican', 'mattis odio donec vitae nisi nam ultrices libero non mattis', '0', '2015-07-14 02:27:39', 'rmartin82', '2014-10-28 05:15:59', 'jmyers82');
INSERT INTO `settings` VALUES ('293', 'Guatemalan', 'aenean fermentum donec ut mauris', '0', '2015-07-11 16:56:56', 'rross83', '2015-08-04 14:45:44', 'mrichards83');
INSERT INTO `settings` VALUES ('294', 'Apache', 'nam nulla integer pede justo', '1', '2015-07-10 08:10:36', 'ahunt84', '2015-04-13 04:35:10', 'mgreen84');
INSERT INTO `settings` VALUES ('295', 'Cree', 'varius ut blandit non interdum in ante vestibulum ante ipsum', '1', '2015-05-08 18:52:31', 'rcarroll85', '2015-06-11 13:11:22', 'calvarez85');
INSERT INTO `settings` VALUES ('296', 'Indonesian', 'primis in faucibus orci luctus et ultrices', '1', '2015-07-27 20:43:05', 'kanderson86', '2014-09-25 09:41:10', 'ewarren86');
INSERT INTO `settings` VALUES ('297', 'Uruguayan', 'sapien sapien non mi integer ac neque', '0', '2015-07-27 07:15:59', 'bwoods87', '2014-10-10 19:33:45', 'fburke87');
INSERT INTO `settings` VALUES ('298', 'Indonesian', 'ipsum dolor sit amet consectetuer adipiscing elit proin', '0', '2014-08-11 21:44:05', 'jmorrison88', '2015-01-08 19:54:14', 'jschmidt88');
INSERT INTO `settings` VALUES ('299', 'Tohono O\'Odham', 'nulla dapibus dolor vel est donec odio justo', '0', '2015-02-17 15:00:59', 'afisher89', '2014-12-30 07:18:57', 'wcampbell89');
INSERT INTO `settings` VALUES ('300', 'Creek', 'dictumst aliquam augue quam sollicitudin vitae', '1', '2014-11-22 14:29:51', 'lcarpenter8a', '2014-09-04 04:17:35', 'madams8a');
INSERT INTO `settings` VALUES ('301', 'Central American', 'nulla ac enim in tempor turpis nec euismod', '0', '2015-07-18 13:18:45', 'jhenderson8b', '2014-11-03 03:51:12', 'janderson8b');
INSERT INTO `settings` VALUES ('302', 'Chippewa', 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit', '1', '2015-03-18 17:03:54', 'mmyers8c', '2015-05-29 01:06:51', 'cbowman8c');
INSERT INTO `settings` VALUES ('303', 'Alaskan Athabascan', 'quis augue luctus tincidunt nulla', '0', '2015-03-28 13:12:01', 'dreed8d', '2015-07-21 09:02:03', 'pshaw8d');
INSERT INTO `settings` VALUES ('304', 'Alaska Native', 'accumsan tortor quis turpis sed ante', '0', '2015-01-01 13:09:29', 'pharrison8e', '2014-10-26 14:30:25', 'dramos8e');
INSERT INTO `settings` VALUES ('305', 'Cheyenne', 'quisque porta volutpat erat quisque erat eros viverra', '1', '2014-09-17 15:37:35', 'jjackson8f', '2015-07-28 02:16:49', 'egordon8f');
INSERT INTO `settings` VALUES ('306', 'Seminole', 'vel lectus in quam fringilla rhoncus mauris enim leo', '0', '2015-04-21 12:22:15', 'dwilliamson8g', '2014-12-08 13:53:01', 'arivera8g');
INSERT INTO `settings` VALUES ('307', 'American Indian and Alaska Native (AIAN)', 'nascetur ridiculus mus vivamus vestibulum sagittis', '1', '2014-10-06 04:26:50', 'lporter8h', '2015-03-15 14:47:53', 'vwood8h');
INSERT INTO `settings` VALUES ('308', 'Navajo', 'in congue etiam justo etiam pretium iaculis', '1', '2014-08-11 00:01:26', 'bwilliams8i', '2014-10-29 02:51:59', 'ckelley8i');
INSERT INTO `settings` VALUES ('309', 'Laotian', 'nec nisi volutpat eleifend donec ut dolor morbi vel', '0', '2015-03-17 22:24:13', 'hjenkins8j', '2015-01-30 10:19:33', 'bcruz8j');
INSERT INTO `settings` VALUES ('310', 'Filipino', 'orci luctus et ultrices posuere cubilia', '0', '2015-06-07 06:29:55', 'cmyers8k', '2014-10-12 08:53:28', 'hcarter8k');
INSERT INTO `settings` VALUES ('311', 'Samoan', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui', '1', '2014-12-23 21:12:39', 'hgreene8l', '2014-08-11 05:27:50', 'egraham8l');
INSERT INTO `settings` VALUES ('312', 'Pakistani', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', '1', '2015-02-04 21:00:01', 'jstanley8m', '2014-09-09 02:00:21', 'sanderson8m');
INSERT INTO `settings` VALUES ('313', 'Sri Lankan', 'at lorem integer tincidunt ante', '1', '2015-05-14 10:55:47', 'dhill8n', '2015-01-07 20:26:45', 'rhayes8n');
INSERT INTO `settings` VALUES ('314', 'Pakistani', 'at nibh in hac habitasse platea dictumst aliquam', '1', '2014-12-28 13:44:28', 'jperry8o', '2014-10-29 00:14:10', 'klawrence8o');
INSERT INTO `settings` VALUES ('315', 'Tlingit-Haida', 'et ultrices posuere cubilia curae nulla dapibus dolor vel est', '0', '2014-09-13 03:13:08', 'gwood8p', '2015-05-11 20:55:37', 'jreid8p');
INSERT INTO `settings` VALUES ('316', 'Comanche', 'mattis egestas metus aenean fermentum', '1', '2014-11-02 12:14:51', 'wrice8q', '2015-07-31 06:59:20', 'phernandez8q');
INSERT INTO `settings` VALUES ('317', 'Asian Indian', 'sed magna at nunc commodo placerat praesent blandit nam', '1', '2014-11-03 19:20:55', 'jreed8r', '2014-12-15 20:00:55', 'tsanders8r');
INSERT INTO `settings` VALUES ('318', 'Vietnamese', 'potenti nullam porttitor lacus at turpis', '1', '2014-12-10 20:03:02', 'aarnold8s', '2014-09-08 07:31:43', 'edavis8s');
INSERT INTO `settings` VALUES ('319', 'Houma', 'consectetuer eget rutrum at lorem integer tincidunt', '0', '2015-05-11 01:32:35', 'drice8t', '2015-05-24 07:31:27', 'jowens8t');
INSERT INTO `settings` VALUES ('320', 'Aleut', 'tellus semper interdum mauris ullamcorper purus sit amet nulla', '1', '2015-03-03 23:37:10', 'eoliver8u', '2014-10-28 05:54:08', 'pryan8u');
INSERT INTO `settings` VALUES ('321', 'Honduran', 'orci luctus et ultrices posuere cubilia curae donec pharetra magna', '1', '2015-01-28 06:56:26', 'wcox8v', '2015-05-05 17:43:57', 'bgordon8v');
INSERT INTO `settings` VALUES ('322', 'Choctaw', 'non mattis pulvinar nulla pede ullamcorper augue', '1', '2015-02-08 12:37:06', 'irivera8w', '2015-07-08 03:08:10', 'ereed8w');
INSERT INTO `settings` VALUES ('323', 'Laotian', 'non sodales sed tincidunt eu felis fusce', '1', '2015-05-21 11:50:17', 'agonzales8x', '2015-04-06 09:59:08', 'ghudson8x');
INSERT INTO `settings` VALUES ('324', 'Paraguayan', 'potenti nullam porttitor lacus at turpis donec', '0', '2015-04-06 05:25:21', 'tweaver8y', '2015-02-03 05:51:05', 'rfernandez8y');
INSERT INTO `settings` VALUES ('325', 'Dominican (Dominican Republic)', 'mattis nibh ligula nec sem', '0', '2015-01-03 01:26:53', 'jhudson8z', '2014-11-06 23:02:56', 'egeorge8z');
INSERT INTO `settings` VALUES ('326', 'Costa Rican', 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis', '1', '2015-05-03 02:56:54', 'gferguson90', '2015-03-03 18:07:46', 'jhanson90');
INSERT INTO `settings` VALUES ('327', 'Micronesian', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim', '1', '2015-07-19 23:17:47', 'chenderson91', '2015-03-01 04:35:24', 'nreynolds91');
INSERT INTO `settings` VALUES ('328', 'Asian', 'accumsan felis ut at dolor quis odio', '0', '2015-02-26 04:41:17', 'ebell92', '2014-12-14 14:58:41', 'apatterson92');
INSERT INTO `settings` VALUES ('329', 'American Indian and Alaska Native (AIAN)', 'eu orci mauris lacinia sapien quis libero nullam', '1', '2015-05-09 17:14:01', 'vmartinez93', '2015-05-09 13:54:37', 'kcoleman93');
INSERT INTO `settings` VALUES ('330', 'Cheyenne', 'potenti in eleifend quam a odio', '1', '2015-02-25 08:42:13', 'jferguson94', '2015-03-12 21:30:54', 'egraham94');
INSERT INTO `settings` VALUES ('331', 'Spaniard', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus', '1', '2015-04-18 04:04:31', 'wevans95', '2014-10-16 16:06:56', 'astanley95');
INSERT INTO `settings` VALUES ('332', 'Fijian', 'porttitor pede justo eu massa donec dapibus duis', '1', '2015-08-06 03:42:13', 'kmitchell96', '2015-03-14 20:23:34', 'ebutler96');
INSERT INTO `settings` VALUES ('333', 'Sri Lankan', 'donec posuere metus vitae ipsum', '0', '2015-04-01 17:45:33', 'ncarr97', '2015-05-25 04:23:59', 'adunn97');
INSERT INTO `settings` VALUES ('334', 'Paiute', 'luctus ultricies eu nibh quisque id justo sit amet sapien', '1', '2015-03-12 22:32:17', 'arichards98', '2015-05-10 13:37:08', 'lwhite98');
INSERT INTO `settings` VALUES ('335', 'Lumbee', 'ac diam cras pellentesque volutpat dui maecenas tristique est et', '1', '2015-01-06 12:33:25', 'rbishop99', '2014-12-19 13:19:14', 'ctorres99');
INSERT INTO `settings` VALUES ('336', 'Eskimo', 'nulla integer pede justo lacinia eget tincidunt eget tempus', '1', '2014-09-26 23:56:22', 'smoreno9a', '2015-02-19 05:27:39', 'pmeyer9a');
INSERT INTO `settings` VALUES ('337', 'Bolivian', 'sapien in sapien iaculis congue', '0', '2015-02-04 10:24:22', 'joliver9b', '2015-02-26 04:06:02', 'aharvey9b');
INSERT INTO `settings` VALUES ('338', 'Cheyenne', 'in consequat ut nulla sed accumsan', '1', '2015-06-06 07:46:56', 'amiller9c', '2014-08-30 19:58:00', 'dporter9c');
INSERT INTO `settings` VALUES ('339', 'Yuman', 'convallis nunc proin at turpis a pede posuere', '1', '2014-12-06 04:11:28', 'jweaver9d', '2014-09-08 15:28:39', 'jwillis9d');
INSERT INTO `settings` VALUES ('340', 'Shoshone', 'adipiscing elit proin interdum mauris non ligula pellentesque', '1', '2014-10-21 00:02:00', 'dgreen9e', '2014-11-25 19:39:36', 'tschmidt9e');
INSERT INTO `settings` VALUES ('341', 'Bangladeshi', 'non velit donec diam neque vestibulum eget vulputate ut ultrices', '0', '2015-01-29 02:35:29', 'sbarnes9f', '2014-11-26 03:28:49', 'jramos9f');
INSERT INTO `settings` VALUES ('342', 'Creek', 'consequat in consequat ut nulla sed accumsan', '0', '2014-10-11 06:11:36', 'lburke9g', '2015-05-24 06:06:24', 'cnichols9g');
INSERT INTO `settings` VALUES ('343', 'Chippewa', 'morbi vestibulum velit id pretium iaculis diam erat', '0', '2015-07-14 15:35:58', 'bmorgan9h', '2015-01-05 12:58:29', 'sgreen9h');
INSERT INTO `settings` VALUES ('344', 'Pima', 'est donec odio justo sollicitudin ut suscipit a feugiat et', '1', '2015-05-09 21:18:05', 'ghenry9i', '2015-04-17 06:00:57', 'gchavez9i');
INSERT INTO `settings` VALUES ('345', 'Cherokee', 'neque aenean auctor gravida sem praesent id massa id nisl', '1', '2015-03-07 04:55:36', 'whall9j', '2014-12-19 22:53:17', 'smendoza9j');
INSERT INTO `settings` VALUES ('346', 'Guatemalan', 'purus eu magna vulputate luctus', '0', '2014-09-21 15:27:02', 'mhunt9k', '2015-02-11 07:50:58', 'acrawford9k');
INSERT INTO `settings` VALUES ('347', 'Micronesian', 'metus vitae ipsum aliquam non', '0', '2015-01-25 20:31:42', 'bgonzalez9l', '2015-02-19 14:28:16', 'darmstrong9l');
INSERT INTO `settings` VALUES ('348', 'Shoshone', 'rhoncus dui vel sem sed sagittis nam congue', '1', '2015-07-24 04:21:18', 'sscott9m', '2015-06-21 20:51:29', 'pmurphy9m');
INSERT INTO `settings` VALUES ('349', 'Uruguayan', 'vestibulum rutrum rutrum neque aenean auctor gravida', '1', '2015-06-14 13:20:55', 'rwilliams9n', '2015-07-25 09:41:00', 'tcunningham9n');
INSERT INTO `settings` VALUES ('350', 'Cheyenne', 'nulla tempus vivamus in felis', '1', '2015-06-08 20:14:46', 'tgardner9o', '2015-01-07 07:44:19', 'wowens9o');
INSERT INTO `settings` VALUES ('351', 'Samoan', 'amet nunc viverra dapibus nulla suscipit ligula in', '0', '2014-08-18 02:27:12', 'mcrawford9p', '2015-08-09 18:04:44', 'gporter9p');
INSERT INTO `settings` VALUES ('352', 'Aleut', 'magna vulputate luctus cum sociis natoque penatibus et magnis dis', '0', '2015-08-06 08:08:20', 'aharper9q', '2014-10-11 06:07:22', 'mfox9q');
INSERT INTO `settings` VALUES ('353', 'Guatemalan', 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', '1', '2015-03-03 08:46:55', 'anichols9r', '2015-05-10 05:49:06', 'krussell9r');
INSERT INTO `settings` VALUES ('354', 'Pakistani', 'bibendum morbi non quam nec dui luctus rutrum', '0', '2015-04-29 22:01:59', 'bkelley9s', '2015-03-28 03:50:08', 'ctaylor9s');
INSERT INTO `settings` VALUES ('355', 'Pueblo', 'ligula pellentesque ultrices phasellus id sapien in sapien', '1', '2014-08-12 02:10:54', 'tmoreno9t', '2015-01-18 06:41:17', 'lhall9t');
INSERT INTO `settings` VALUES ('356', 'Ottawa', 'in felis eu sapien cursus vestibulum proin eu mi', '1', '2014-12-19 15:58:04', 'sholmes9u', '2015-03-07 11:37:03', 'kmorales9u');
INSERT INTO `settings` VALUES ('357', 'Bangladeshi', 'aliquam non mauris morbi non lectus aliquam sit amet', '0', '2015-04-21 07:23:45', 'pnguyen9v', '2015-04-28 04:24:49', 'mthomas9v');
INSERT INTO `settings` VALUES ('358', 'Korean', 'felis sed interdum venenatis turpis enim blandit mi', '1', '2014-11-20 18:53:43', 'brogers9w', '2014-08-31 17:56:10', 'twebb9w');
INSERT INTO `settings` VALUES ('359', 'Dominican (Dominican Republic)', 'nibh quisque id justo sit', '1', '2015-05-27 19:08:40', 'hstephens9x', '2015-04-16 19:28:17', 'pgordon9x');
INSERT INTO `settings` VALUES ('360', 'Colville', 'rutrum ac lobortis vel dapibus at diam', '0', '2015-01-01 08:07:49', 'clawson9y', '2015-03-03 20:56:43', 'mgreen9y');
INSERT INTO `settings` VALUES ('361', 'Lumbee', 'orci luctus et ultrices posuere', '0', '2015-07-31 16:03:48', 'jkim9z', '2015-01-20 17:31:07', 'ebarnes9z');
INSERT INTO `settings` VALUES ('362', 'Creek', 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', '0', '2014-10-28 22:42:33', 'jbutlera0', '2015-02-12 04:18:20', 'sfergusona0');
INSERT INTO `settings` VALUES ('363', 'Costa Rican', 'nulla elit ac nulla sed vel enim sit amet nunc', '1', '2014-11-01 09:58:03', 'hjohnstona1', '2014-08-31 03:50:55', 'bstephensa1');
INSERT INTO `settings` VALUES ('364', 'Aleut', 'molestie lorem quisque ut erat', '0', '2014-09-27 07:24:00', 'jmartineza2', '2015-07-04 00:27:45', 'ffoxa2');
INSERT INTO `settings` VALUES ('365', 'Delaware', 'pulvinar nulla pede ullamcorper augue a suscipit', '0', '2015-06-06 10:09:28', 'twashingtona3', '2014-11-13 05:37:40', 'sgonzaleza3');
INSERT INTO `settings` VALUES ('366', 'American Indian', 'in tempor turpis nec euismod scelerisque quam turpis', '0', '2015-01-13 07:00:56', 'abanksa4', '2015-03-25 14:40:39', 'pbennetta4');
INSERT INTO `settings` VALUES ('367', 'Native Hawaiian', 'augue a suscipit nulla elit ac nulla sed vel enim', '1', '2014-08-20 18:41:32', 'mnicholsa5', '2014-12-26 07:27:57', 'bnelsona5');
INSERT INTO `settings` VALUES ('368', 'Asian', 'augue vestibulum ante ipsum primis', '0', '2015-07-28 22:44:15', 'hbanksa6', '2015-03-27 04:54:30', 'jaustina6');
INSERT INTO `settings` VALUES ('369', 'White', 'felis ut at dolor quis odio', '1', '2015-06-19 15:33:43', 'rreyesa7', '2014-09-09 15:33:05', 'dhudsona7');
INSERT INTO `settings` VALUES ('370', 'Yuman', 'nec euismod scelerisque quam turpis', '1', '2015-06-17 07:06:05', 'jsimsa8', '2015-06-16 06:08:05', 'ccampbella8');
INSERT INTO `settings` VALUES ('371', 'Tlingit-Haida', 'nam dui proin leo odio porttitor id consequat', '0', '2014-11-18 11:56:32', 'ecampbella9', '2015-01-15 11:22:08', 'pfoxa9');
INSERT INTO `settings` VALUES ('372', 'Tongan', 'morbi a ipsum integer a', '1', '2015-04-07 15:51:45', 'bcarraa', '2015-05-24 08:05:59', 'kclarkaa');
INSERT INTO `settings` VALUES ('373', 'Venezuelan', 'turpis nec euismod scelerisque quam', '1', '2015-01-12 01:42:56', 'vbradleyab', '2014-12-14 00:24:51', 'wfoxab');
INSERT INTO `settings` VALUES ('374', 'Salvadoran', 'quam nec dui luctus rutrum nulla tellus in', '1', '2015-05-19 05:59:56', 'pfullerac', '2014-08-19 16:46:28', 'jlarsonac');
INSERT INTO `settings` VALUES ('375', 'Spaniard', 'vestibulum ante ipsum primis in faucibus', '0', '2014-10-23 15:04:27', 'kbennettad', '2014-11-20 06:05:13', 'rdanielsad');
INSERT INTO `settings` VALUES ('376', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'vel dapibus at diam nam tristique tortor eu pede', '0', '2014-11-02 20:02:37', 'jmyersae', '2015-05-31 18:20:20', 'gnicholsae');
INSERT INTO `settings` VALUES ('377', 'Samoan', 'mus etiam vel augue vestibulum rutrum', '0', '2014-12-15 08:59:15', 'jrobertsaf', '2015-05-01 05:20:32', 'kgarzaaf');
INSERT INTO `settings` VALUES ('378', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'feugiat non pretium quis lectus suspendisse potenti in', '1', '2015-03-12 00:54:50', 'lroseag', '2015-02-10 22:36:21', 'elynchag');
INSERT INTO `settings` VALUES ('379', 'Korean', 'vestibulum quam sapien varius ut blandit non', '0', '2014-10-04 23:58:40', 'csmithah', '2015-02-10 03:13:20', 'aandersonah');
INSERT INTO `settings` VALUES ('380', 'Chilean', 'blandit lacinia erat vestibulum sed magna at', '1', '2014-10-28 14:41:49', 'jhartai', '2015-07-13 19:36:33', 'khowardai');
INSERT INTO `settings` VALUES ('381', 'Honduran', 'lobortis vel dapibus at diam nam tristique tortor eu pede', '0', '2014-11-28 16:18:06', 'bhartaj', '2015-07-09 12:19:14', 'bgrayaj');
INSERT INTO `settings` VALUES ('382', 'Guamanian', 'turpis elementum ligula vehicula consequat', '0', '2015-07-10 03:08:20', 'blaneak', '2014-09-07 23:52:38', 'ecoleak');
INSERT INTO `settings` VALUES ('383', 'Paraguayan', 'ante ipsum primis in faucibus orci', '1', '2014-12-01 21:19:46', 'bpalmeral', '2014-09-20 12:27:28', 'ffreemanal');
INSERT INTO `settings` VALUES ('384', 'Chippewa', 'pellentesque at nulla suspendisse potenti cras in purus eu magna', '1', '2014-10-17 23:47:13', 'pcarram', '2015-02-01 20:25:25', 'charperam');
INSERT INTO `settings` VALUES ('385', 'Bolivian', 'blandit lacinia erat vestibulum sed magna at', '1', '2015-06-06 05:42:27', 'hmedinaan', '2015-08-03 19:00:41', 'pfernandezan');
INSERT INTO `settings` VALUES ('386', 'Black or African American', 'convallis duis consequat dui nec nisi volutpat eleifend', '0', '2014-12-04 16:05:23', 'rellisao', '2014-11-24 18:33:49', 'hbryantao');
INSERT INTO `settings` VALUES ('387', 'Aleut', 'libero rutrum ac lobortis vel', '1', '2015-04-22 21:27:45', 'eleeap', '2015-04-19 23:50:16', 'ldavisap');
INSERT INTO `settings` VALUES ('388', 'Costa Rican', 'donec odio justo sollicitudin ut suscipit a feugiat et eros', '1', '2015-07-16 10:03:23', 'shicksaq', '2014-08-11 13:33:36', 'triceaq');
INSERT INTO `settings` VALUES ('389', 'Asian', 'adipiscing elit proin risus praesent lectus vestibulum quam', '0', '2015-03-07 16:53:39', 'jcruzar', '2015-06-16 12:29:19', 'dandersonar');
INSERT INTO `settings` VALUES ('390', 'Chickasaw', 'justo etiam pretium iaculis justo in hac habitasse', '1', '2015-03-12 06:11:36', 'khughesas', '2014-12-23 09:15:32', 'hnguyenas');
INSERT INTO `settings` VALUES ('391', 'American Indian', 'tristique est et tempus semper est quam pharetra magna', '1', '2015-01-27 06:40:48', 'aaustinat', '2015-04-04 10:24:09', 'vjohnsonat');
INSERT INTO `settings` VALUES ('392', 'Alaskan Athabascan', 'id luctus nec molestie sed justo pellentesque viverra', '0', '2015-05-18 20:07:07', 'rchavezau', '2015-07-06 19:36:28', 'shartau');
INSERT INTO `settings` VALUES ('393', 'Venezuelan', 'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', '1', '2014-10-07 02:01:15', 'mdayav', '2015-04-29 21:12:31', 'nmurphyav');
INSERT INTO `settings` VALUES ('394', 'Apache', 'arcu sed augue aliquam erat volutpat in congue etiam', '0', '2015-07-20 10:10:54', 'bscottaw', '2015-04-06 20:23:30', 'rpetersonaw');
INSERT INTO `settings` VALUES ('395', 'Hmong', 'nibh in hac habitasse platea dictumst', '0', '2015-07-30 14:32:34', 'ckingax', '2014-08-24 14:04:10', 'dpriceax');
INSERT INTO `settings` VALUES ('396', 'Ute', 'phasellus in felis donec semper sapien a libero nam dui', '1', '2014-09-15 15:33:18', 'jsullivanay', '2015-07-03 14:35:15', 'hchapmanay');
INSERT INTO `settings` VALUES ('397', 'White', 'parturient montes nascetur ridiculus mus etiam vel augue', '0', '2015-01-03 14:31:11', 'sharperaz', '2015-05-12 17:29:56', 'dyoungaz');
INSERT INTO `settings` VALUES ('398', 'Pima', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', '0', '2015-05-18 15:37:31', 'mcarrollb0', '2014-10-16 20:29:18', 'sortizb0');
INSERT INTO `settings` VALUES ('399', 'Paraguayan', 'non mauris morbi non lectus aliquam sit amet diam in', '1', '2015-06-06 04:02:01', 'ejamesb1', '2015-04-22 22:44:53', 'hgeorgeb1');
INSERT INTO `settings` VALUES ('400', 'Cherokee', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium', '1', '2015-01-12 02:37:17', 'bnguyenb2', '2014-09-26 21:38:59', 'ngrantb2');
INSERT INTO `settings` VALUES ('401', 'Guatemalan', 'varius integer ac leo pellentesque ultrices', '1', '2015-06-04 02:22:11', 'rfullerb3', '2015-05-28 06:55:49', 'bdiazb3');
INSERT INTO `settings` VALUES ('402', 'Choctaw', 'a odio in hac habitasse platea dictumst maecenas', '1', '2015-04-04 08:42:02', 'pfisherb4', '2014-10-14 10:59:42', 'dpetersonb4');
INSERT INTO `settings` VALUES ('403', 'Pueblo', 'habitasse platea dictumst aliquam augue quam sollicitudin vitae', '0', '2015-01-17 14:55:52', 'gedwardsb5', '2015-06-07 19:48:46', 'fgibsonb5');
INSERT INTO `settings` VALUES ('404', 'Iroquois', 'interdum mauris ullamcorper purus sit', '0', '2015-02-24 09:07:01', 'pwoodsb6', '2014-08-17 12:11:32', 'acoleb6');
INSERT INTO `settings` VALUES ('405', 'Apache', 'id justo sit amet sapien dignissim vestibulum vestibulum ante', '1', '2014-12-10 17:32:19', 'cgarzab7', '2015-05-05 12:36:03', 'wwoodb7');
INSERT INTO `settings` VALUES ('406', 'Fijian', 'a nibh in quis justo maecenas rhoncus', '1', '2014-12-12 05:09:50', 'jhunterb8', '2014-12-04 15:11:11', 'lalvarezb8');
INSERT INTO `settings` VALUES ('407', 'Guamanian', 'curabitur gravida nisi at nibh', '1', '2015-05-19 10:04:15', 'pgeorgeb9', '2014-12-06 02:04:48', 'ahicksb9');
INSERT INTO `settings` VALUES ('408', 'Navajo', 'id nulla ultrices aliquet maecenas', '1', '2015-06-23 07:27:49', 'nstevensba', '2015-03-16 19:27:13', 'agilbertba');
INSERT INTO `settings` VALUES ('409', 'Mexican', 'in hac habitasse platea dictumst morbi vestibulum velit id pretium', '0', '2015-07-19 10:02:13', 'mwelchbb', '2015-02-01 12:26:14', 'fmartinbb');
INSERT INTO `settings` VALUES ('410', 'Latin American Indian', 'quis lectus suspendisse potenti in eleifend quam', '0', '2015-01-06 15:28:40', 'spetersonbc', '2014-11-12 08:01:01', 'agreenebc');
INSERT INTO `settings` VALUES ('411', 'Guamanian', 'in est risus auctor sed tristique in tempus sit amet', '0', '2015-07-23 10:23:45', 'shamiltonbd', '2014-12-25 00:18:08', 'gwardbd');
INSERT INTO `settings` VALUES ('412', 'Colombian', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque', '1', '2015-03-15 06:42:45', 'jmarshallbe', '2014-08-15 07:42:25', 'bdeanbe');
INSERT INTO `settings` VALUES ('413', 'Lumbee', 'pellentesque quisque porta volutpat erat quisque erat eros viverra', '0', '2014-08-11 02:13:34', 'lwebbbf', '2015-07-11 12:02:45', 'tchavezbf');
INSERT INTO `settings` VALUES ('414', 'Menominee', 'tellus nisi eu orci mauris lacinia sapien quis', '0', '2014-10-19 12:13:35', 'rhillbg', '2014-08-15 08:12:31', 'rmyersbg');
INSERT INTO `settings` VALUES ('415', 'Puget Sound Salish', 'suscipit nulla elit ac nulla sed vel enim', '0', '2015-03-04 15:46:11', 'tandrewsbh', '2015-03-22 17:22:04', 'tgordonbh');
INSERT INTO `settings` VALUES ('416', 'Paiute', 'vel enim sit amet nunc viverra dapibus', '0', '2014-11-25 16:18:11', 'cfowlerbi', '2015-07-13 04:39:14', 'thunterbi');
INSERT INTO `settings` VALUES ('417', 'Japanese', 'ac tellus semper interdum mauris ullamcorper', '0', '2014-08-11 01:01:10', 'lstonebj', '2014-09-26 05:45:43', 'plittlebj');
INSERT INTO `settings` VALUES ('418', 'Panamanian', 'nulla dapibus dolor vel est donec odio', '0', '2015-07-28 11:36:00', 'dwoodsbk', '2015-08-01 16:48:09', 'jjacksonbk');
INSERT INTO `settings` VALUES ('419', 'Cambodian', 'nisi nam ultrices libero non mattis pulvinar nulla pede', '1', '2015-04-22 09:28:20', 'bmitchellbl', '2014-10-24 04:18:03', 'csullivanbl');
INSERT INTO `settings` VALUES ('420', 'Cheyenne', 'ut erat id mauris vulputate', '1', '2014-10-13 02:07:24', 'ahansonbm', '2015-04-24 14:51:54', 'ebakerbm');
INSERT INTO `settings` VALUES ('421', 'South American', 'integer ac leo pellentesque ultrices mattis odio', '1', '2015-05-08 02:51:16', 'kburtonbn', '2014-12-03 00:22:58', 'afergusonbn');
INSERT INTO `settings` VALUES ('422', 'Seminole', 'sapien non mi integer ac neque duis bibendum morbi non', '1', '2014-11-12 00:04:01', 'hmccoybo', '2015-03-28 23:08:17', 'arodriguezbo');
INSERT INTO `settings` VALUES ('423', 'South American', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus', '1', '2014-10-10 09:11:07', 'dwardbp', '2015-07-07 17:19:44', 'bholmesbp');
INSERT INTO `settings` VALUES ('424', 'Mexican', 'quisque ut erat curabitur gravida', '0', '2015-01-06 07:29:48', 'jrichardsbq', '2014-09-28 04:05:31', 'lfordbq');
INSERT INTO `settings` VALUES ('425', 'Alaska Native', 'dictumst morbi vestibulum velit id pretium iaculis diam erat', '1', '2014-11-05 16:41:37', 'dwilliamsbr', '2014-12-29 20:42:36', 'fyoungbr');
INSERT INTO `settings` VALUES ('426', 'Fijian', 'quis odio consequat varius integer ac', '1', '2015-03-12 01:49:58', 'jwoodbs', '2015-03-01 17:20:16', 'jjonesbs');
INSERT INTO `settings` VALUES ('427', 'Samoan', 'amet nunc viverra dapibus nulla suscipit ligula in', '0', '2014-09-03 20:26:49', 'wkimbt', '2015-07-28 04:03:25', 'jcrawfordbt');
INSERT INTO `settings` VALUES ('428', 'Chamorro', 'luctus et ultrices posuere cubilia curae donec pharetra magna', '1', '2015-04-11 10:56:28', 'bdaybu', '2015-05-06 15:02:57', 'vgrantbu');
INSERT INTO `settings` VALUES ('429', 'Pima', 'lacus morbi quis tortor id', '1', '2014-10-19 08:27:08', 'rholmesbv', '2015-07-15 16:49:39', 'jarmstrongbv');
INSERT INTO `settings` VALUES ('430', 'Panamanian', 'enim leo rhoncus sed vestibulum sit amet', '1', '2014-10-15 02:03:58', 'gboydbw', '2015-07-12 14:11:14', 'wgreenbw');
INSERT INTO `settings` VALUES ('431', 'Peruvian', 'et magnis dis parturient montes nascetur ridiculus mus etiam', '0', '2015-06-19 07:45:03', 'jandersonbx', '2015-05-22 05:00:52', 'relliottbx');
INSERT INTO `settings` VALUES ('432', 'Bangladeshi', 'ut massa volutpat convallis morbi odio odio', '0', '2014-09-05 07:28:23', 'areedby', '2015-08-05 05:23:11', 'dcoxby');
INSERT INTO `settings` VALUES ('433', 'Colombian', 'et commodo vulputate justo in', '0', '2015-07-05 11:48:30', 'cmorenobz', '2015-05-02 08:45:37', 'mmillerbz');
INSERT INTO `settings` VALUES ('434', 'Thai', 'nam ultrices libero non mattis', '0', '2015-02-10 18:00:39', 'rjamesc0', '2015-07-27 16:05:26', 'jperryc0');
INSERT INTO `settings` VALUES ('435', 'Mexican', 'nibh in hac habitasse platea dictumst aliquam', '0', '2015-04-05 21:30:06', 'lhillc1', '2014-10-22 18:22:09', 'acarrollc1');
INSERT INTO `settings` VALUES ('436', 'Honduran', 'nec condimentum neque sapien placerat ante nulla justo', '0', '2015-05-13 11:53:50', 'tbryantc2', '2015-01-25 21:11:15', 'rfergusonc2');
INSERT INTO `settings` VALUES ('437', 'Chamorro', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in', '1', '2015-02-11 00:30:07', 'pwallacec3', '2015-04-14 01:42:52', 'fgreenec3');
INSERT INTO `settings` VALUES ('438', 'Ecuadorian', 'non pretium quis lectus suspendisse potenti', '0', '2015-02-08 09:12:44', 'lvasquezc4', '2014-12-24 07:03:19', 'aharrisc4');
INSERT INTO `settings` VALUES ('439', 'Latin American Indian', 'donec semper sapien a libero nam dui proin', '1', '2015-03-15 04:20:59', 'mnguyenc5', '2015-04-19 09:06:31', 'kmitchellc5');
INSERT INTO `settings` VALUES ('440', 'Mexican', 'vivamus vestibulum sagittis sapien cum', '1', '2015-05-18 07:17:22', 'hharrisc6', '2015-01-03 17:09:11', 'bdunnc6');
INSERT INTO `settings` VALUES ('441', 'Osage', 'lorem ipsum dolor sit amet', '0', '2014-11-20 21:31:22', 'imurphyc7', '2014-10-01 16:49:18', 'jjacksonc7');
INSERT INTO `settings` VALUES ('442', 'Guatemalan', 'justo pellentesque viverra pede ac diam cras pellentesque', '0', '2015-05-30 11:19:40', 'bgrahamc8', '2014-08-22 05:40:35', 'rholmesc8');
INSERT INTO `settings` VALUES ('443', 'Cree', 'diam erat fermentum justo nec condimentum neque sapien', '0', '2015-03-03 16:08:37', 'njohnstonc9', '2014-12-22 19:03:57', 'hdiazc9');
INSERT INTO `settings` VALUES ('444', 'Sioux', 'bibendum morbi non quam nec', '1', '2014-12-29 09:13:44', 'pgibsonca', '2014-11-20 16:37:01', 'agordonca');
INSERT INTO `settings` VALUES ('445', 'Menominee', 'libero non mattis pulvinar nulla pede ullamcorper augue', '0', '2015-07-16 00:34:46', 'lrosscb', '2014-10-26 08:46:57', 'tsimmonscb');
INSERT INTO `settings` VALUES ('446', 'Choctaw', 'ridiculus mus vivamus vestibulum sagittis', '0', '2015-06-29 11:11:43', 'pgrahamcc', '2015-05-07 02:17:24', 'dharpercc');
INSERT INTO `settings` VALUES ('447', 'Cherokee', 'mauris eget massa tempor convallis nulla neque', '0', '2015-03-06 00:27:44', 'jcoxcd', '2014-12-09 12:54:38', 'astewartcd');
INSERT INTO `settings` VALUES ('448', 'Costa Rican', 'odio donec vitae nisi nam', '0', '2014-11-10 10:57:30', 'mfranklince', '2014-10-11 12:13:51', 'wmoralesce');
INSERT INTO `settings` VALUES ('449', 'Seminole', 'sed vestibulum sit amet cursus id turpis integer aliquet massa', '1', '2015-02-16 03:23:20', 'lmontgomerycf', '2015-06-29 13:29:31', 'nmurphycf');
INSERT INTO `settings` VALUES ('450', 'Thai', 'nulla sed accumsan felis ut at dolor quis odio consequat', '0', '2015-05-02 13:10:03', 'lreyescg', '2015-06-17 21:54:27', 'pbryantcg');
INSERT INTO `settings` VALUES ('451', 'Chamorro', 'in est risus auctor sed tristique', '1', '2015-05-09 20:20:24', 'acruzch', '2015-01-28 05:19:22', 'agraych');
INSERT INTO `settings` VALUES ('452', 'Chilean', 'eget orci vehicula condimentum curabitur in libero ut massa volutpat', '0', '2015-04-22 21:07:46', 'bstephensci', '2015-03-07 21:04:32', 'swilliamsonci');
INSERT INTO `settings` VALUES ('453', 'Alaskan Athabascan', 'justo sit amet sapien dignissim', '1', '2014-12-29 17:01:18', 'asimscj', '2015-01-22 21:08:10', 'jkellycj');
INSERT INTO `settings` VALUES ('454', 'Thai', 'etiam faucibus cursus urna ut tellus nulla ut erat id', '1', '2014-09-26 11:06:19', 'bcookck', '2015-05-18 05:52:57', 'rhuntck');
INSERT INTO `settings` VALUES ('455', 'Vietnamese', 'eu orci mauris lacinia sapien quis libero nullam sit amet', '0', '2014-11-25 13:19:47', 'swestcl', '2014-10-13 12:44:38', 'cfordcl');
INSERT INTO `settings` VALUES ('456', 'Osage', 'leo rhoncus sed vestibulum sit amet', '0', '2015-03-17 15:31:43', 'greynoldscm', '2014-11-21 23:44:37', 'pwardcm');
INSERT INTO `settings` VALUES ('457', 'American Indian', 'in felis donec semper sapien a libero', '1', '2015-04-13 21:21:03', 'cwilliscn', '2015-05-11 09:10:46', 'rlongcn');
INSERT INTO `settings` VALUES ('458', 'White', 'eget tincidunt eget tempus vel pede', '0', '2015-04-19 04:28:46', 'rruizco', '2015-04-22 04:53:33', 'awheelerco');
INSERT INTO `settings` VALUES ('459', 'Asian Indian', 'ligula vehicula consequat morbi a ipsum', '1', '2015-02-13 14:26:03', 'nchavezcp', '2014-11-22 12:59:12', 'jmccoycp');
INSERT INTO `settings` VALUES ('460', 'Alaskan Athabascan', 'diam cras pellentesque volutpat dui maecenas tristique', '1', '2015-05-06 18:24:23', 'sgilbertcq', '2014-11-11 15:25:48', 'aruizcq');
INSERT INTO `settings` VALUES ('461', 'Pueblo', 'curae nulla dapibus dolor vel est donec odio justo', '1', '2014-10-23 13:20:32', 'dsullivancr', '2015-06-21 05:37:36', 'handersoncr');
INSERT INTO `settings` VALUES ('462', 'Latin American Indian', 'vulputate vitae nisl aenean lectus pellentesque', '0', '2014-11-25 17:41:22', 'cgibsoncs', '2015-07-23 13:25:45', 'dwilliscs');
INSERT INTO `settings` VALUES ('463', 'Pueblo', 'nulla suscipit ligula in lacus curabitur at ipsum ac', '0', '2015-06-17 06:25:15', 'fparkerct', '2015-07-30 05:08:22', 'rwardct');
INSERT INTO `settings` VALUES ('464', 'Cuban', 'risus semper porta volutpat quam pede', '0', '2015-05-04 12:58:24', 'kmyerscu', '2014-09-03 13:49:31', 'lburkecu');
INSERT INTO `settings` VALUES ('465', 'Asian Indian', 'velit id pretium iaculis diam erat', '1', '2014-09-30 12:02:22', 'fbryantcv', '2015-04-08 19:03:24', 'priveracv');
INSERT INTO `settings` VALUES ('466', 'Ottawa', 'duis bibendum felis sed interdum venenatis', '1', '2015-07-09 07:36:44', 'aandrewscw', '2014-12-07 21:03:37', 'egarzacw');
INSERT INTO `settings` VALUES ('467', 'Hmong', 'adipiscing elit proin interdum mauris non ligula', '1', '2015-03-26 12:19:04', 'chansoncx', '2014-11-07 14:56:24', 'gdeancx');
INSERT INTO `settings` VALUES ('468', 'Osage', 'mauris lacinia sapien quis libero nullam sit amet', '1', '2015-07-22 12:17:15', 'nmasoncy', '2014-10-18 02:21:11', 'rjohnsoncy');
INSERT INTO `settings` VALUES ('469', 'Korean', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in', '1', '2014-12-14 08:02:55', 'rmedinacz', '2014-09-30 00:35:02', 'aelliottcz');
INSERT INTO `settings` VALUES ('470', 'American Indian', 'consequat ut nulla sed accumsan felis ut', '0', '2015-05-27 10:37:40', 'jrayd0', '2015-02-10 19:07:12', 'hboydd0');
INSERT INTO `settings` VALUES ('471', 'Spaniard', 'nullam sit amet turpis elementum ligula vehicula consequat', '1', '2014-09-14 04:52:08', 'rgutierrezd1', '2015-05-22 01:54:51', 'agarrettd1');
INSERT INTO `settings` VALUES ('472', 'Cambodian', 'vitae consectetuer eget rutrum at lorem', '1', '2015-07-06 17:41:38', 'hramosd2', '2015-08-04 20:53:51', 'lclarkd2');
INSERT INTO `settings` VALUES ('473', 'Vietnamese', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', '1', '2014-12-20 03:29:34', 'hthompsond3', '2015-06-10 22:04:12', 'dspencerd3');
INSERT INTO `settings` VALUES ('474', 'Melanesian', 'neque libero convallis eget eleifend luctus ultricies eu', '1', '2014-12-14 01:23:05', 'ecoled4', '2015-03-30 07:11:10', 'dlewisd4');
INSERT INTO `settings` VALUES ('475', 'Black or African American', 'nunc rhoncus dui vel sem sed', '1', '2014-12-04 16:57:46', 'mcrawfordd5', '2014-11-10 08:28:51', 'cfreemand5');
INSERT INTO `settings` VALUES ('476', 'Tongan', 'gravida nisi at nibh in', '1', '2015-03-30 08:03:14', 'bstewartd6', '2014-08-18 21:50:09', 'rfisherd6');
INSERT INTO `settings` VALUES ('477', 'Thai', 'praesent id massa id nisl venenatis lacinia aenean sit amet', '0', '2014-10-21 16:04:06', 'mellisd7', '2014-12-14 05:22:36', 'mturnerd7');
INSERT INTO `settings` VALUES ('478', 'Pueblo', 'quis odio consequat varius integer ac leo pellentesque ultrices', '1', '2015-01-01 16:38:45', 'carnoldd8', '2015-06-11 08:32:07', 'kcarpenterd8');
INSERT INTO `settings` VALUES ('479', 'Fijian', 'interdum mauris ullamcorper purus sit amet nulla quisque', '0', '2014-09-21 14:09:21', 'dhendersond9', '2015-07-29 08:17:30', 'ccooperd9');
INSERT INTO `settings` VALUES ('480', 'Guamanian', 'eros viverra eget congue eget semper rutrum nulla nunc purus', '1', '2015-03-13 09:25:14', 'jrobertsda', '2015-05-27 09:29:23', 'bmedinada');
INSERT INTO `settings` VALUES ('481', 'Alaska Native', 'mauris sit amet eros suspendisse accumsan tortor quis', '1', '2014-11-07 21:49:34', 'mmccoydb', '2014-11-29 11:47:27', 'esimpsondb');
INSERT INTO `settings` VALUES ('482', 'Indonesian', 'maecenas rhoncus aliquam lacus morbi quis tortor', '0', '2015-02-20 12:05:51', 'tjohnsondc', '2014-11-04 14:06:01', 'rhowelldc');
INSERT INTO `settings` VALUES ('483', 'Pima', 'sagittis nam congue risus semper porta', '0', '2015-03-12 16:44:26', 'dbarnesdd', '2015-05-29 02:05:46', 'dwhitedd');
INSERT INTO `settings` VALUES ('484', 'Ecuadorian', 'duis mattis egestas metus aenean fermentum donec ut mauris eget', '0', '2014-09-08 04:44:29', 'pwoodsde', '2015-06-24 23:27:35', 'vperezde');
INSERT INTO `settings` VALUES ('485', 'Alaskan Athabascan', 'proin at turpis a pede', '0', '2014-09-16 06:17:56', 'cwagnerdf', '2015-07-13 02:07:08', 'dhamiltondf');
INSERT INTO `settings` VALUES ('486', 'Pueblo', 'sit amet lobortis sapien sapien non mi', '0', '2015-07-02 03:55:34', 'bwhitedg', '2014-12-15 01:13:18', 'ecastillodg');
INSERT INTO `settings` VALUES ('487', 'Central American', 'in lectus pellentesque at nulla suspendisse potenti cras in purus', '0', '2015-05-26 19:55:55', 'apetersondh', '2015-04-24 16:22:11', 'jstonedh');
INSERT INTO `settings` VALUES ('488', 'Spaniard', 'consequat metus sapien ut nunc', '0', '2014-09-06 23:18:51', 'sgrantdi', '2015-07-27 02:47:28', 'ahughesdi');
INSERT INTO `settings` VALUES ('489', 'Chinese', 'arcu sed augue aliquam erat volutpat in congue etiam justo', '0', '2015-03-30 05:59:16', 'kfrazierdj', '2015-04-04 21:19:59', 'bwoodsdj');
INSERT INTO `settings` VALUES ('490', 'Paiute', 'in congue etiam justo etiam', '0', '2015-07-24 22:19:26', 'npalmerdk', '2014-12-28 19:37:25', 'rgrantdk');
INSERT INTO `settings` VALUES ('491', 'Korean', 'dapibus augue vel accumsan tellus nisi', '0', '2015-01-12 13:47:26', 'tjamesdl', '2015-07-25 00:40:32', 'hweaverdl');
INSERT INTO `settings` VALUES ('492', 'Comanche', 'ante ipsum primis in faucibus orci', '1', '2015-01-02 00:03:38', 'jsimpsondm', '2015-02-03 14:53:06', 'jmasondm');
INSERT INTO `settings` VALUES ('493', 'Alaskan Athabascan', 'nulla dapibus dolor vel est donec odio justo sollicitudin', '1', '2015-07-04 03:20:37', 'wgarrettdn', '2014-12-20 15:17:28', 'charperdn');
INSERT INTO `settings` VALUES ('494', 'Uruguayan', 'nibh in quis justo maecenas rhoncus aliquam lacus', '0', '2014-08-14 17:11:06', 'mgonzalesdo', '2015-03-01 19:57:53', 'preynoldsdo');
INSERT INTO `settings` VALUES ('495', 'American Indian and Alaska Native (AIAN)', 'nibh fusce lacus purus aliquet at feugiat non pretium', '0', '2014-08-14 08:52:20', 'rwoodsdp', '2014-08-20 17:09:37', 'dbanksdp');
INSERT INTO `settings` VALUES ('496', 'Melanesian', 'pede malesuada in imperdiet et', '1', '2015-03-18 10:37:04', 'areyesdq', '2014-12-26 07:31:39', 'jgrantdq');
INSERT INTO `settings` VALUES ('497', 'Cree', 'nulla ut erat id mauris vulputate elementum nullam', '1', '2015-02-04 01:53:50', 'asnyderdr', '2014-09-21 20:09:20', 'ahilldr');
INSERT INTO `settings` VALUES ('498', 'Lumbee', 'donec dapibus duis at velit eu est congue elementum in', '0', '2015-07-03 14:27:05', 'amitchellds', '2015-04-26 13:05:12', 'wreynoldsds');
INSERT INTO `settings` VALUES ('499', 'American Indian', 'feugiat et eros vestibulum ac est lacinia', '0', '2015-05-07 04:31:47', 'jnicholsdt', '2015-07-06 09:08:20', 'bandersondt');
INSERT INTO `settings` VALUES ('500', 'Alaskan Athabascan', 'ipsum primis in faucibus orci luctus et ultrices posuere', '0', '2015-05-22 19:14:57', 'tortizdu', '2015-01-06 01:42:25', 'ljacobsdu');
INSERT INTO `settings` VALUES ('501', 'Latin American Indian', 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin', '0', '2014-10-05 13:15:23', 'hpetersdv', '2014-09-08 10:28:47', 'mcunninghamdv');
INSERT INTO `settings` VALUES ('502', 'American Indian', 'nibh fusce lacus purus aliquet at feugiat non', '1', '2014-11-27 07:01:44', 'ewrightdw', '2015-01-02 09:45:32', 'spowelldw');
INSERT INTO `settings` VALUES ('503', 'Dominican (Dominican Republic)', 'convallis duis consequat dui nec nisi volutpat eleifend donec', '1', '2015-08-05 07:57:00', 'pthomasdx', '2015-04-16 22:18:03', 'tpaynedx');
INSERT INTO `settings` VALUES ('504', 'Black or African American', 'feugiat non pretium quis lectus suspendisse potenti in eleifend', '1', '2014-08-22 20:23:43', 'alawsondy', '2015-03-09 20:11:21', 'fgraydy');
INSERT INTO `settings` VALUES ('505', 'Paiute', 'sed augue aliquam erat volutpat in congue etiam', '1', '2015-06-14 02:46:00', 'rpaynedz', '2015-04-25 19:33:05', 'vgarciadz');
INSERT INTO `settings` VALUES ('506', 'Native Hawaiian', 'quis orci eget orci vehicula condimentum curabitur in libero', '1', '2015-03-31 19:26:28', 'mflorese0', '2014-09-10 10:52:53', 'vrobinsone0');
INSERT INTO `settings` VALUES ('507', 'Uruguayan', 'interdum mauris ullamcorper purus sit amet', '1', '2015-06-06 16:24:32', 'gbrowne1', '2014-09-29 18:56:25', 'hgutierreze1');
INSERT INTO `settings` VALUES ('508', 'Paraguayan', 'tortor quis turpis sed ante vivamus tortor duis', '1', '2015-08-05 09:31:29', 'smillere2', '2014-11-14 11:42:43', 'jburnse2');
INSERT INTO `settings` VALUES ('509', 'Latin American Indian', 'platea dictumst etiam faucibus cursus urna ut tellus nulla', '1', '2015-04-25 12:16:20', 'plopeze3', '2015-02-21 16:08:31', 'iforde3');
INSERT INTO `settings` VALUES ('510', 'Korean', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', '0', '2015-02-08 15:15:58', 'psanderse4', '2014-11-24 12:44:07', 'ctaylore4');
INSERT INTO `settings` VALUES ('511', 'Chilean', 'libero quis orci nullam molestie nibh in lectus', '1', '2014-11-23 02:23:13', 'bburnse5', '2015-06-27 23:15:33', 'ssnydere5');
INSERT INTO `settings` VALUES ('512', 'Alaskan Athabascan', 'posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', '1', '2014-09-11 06:15:29', 'jchapmane6', '2014-08-21 20:48:09', 'dreede6');
INSERT INTO `settings` VALUES ('513', 'Korean', 'aenean fermentum donec ut mauris eget massa tempor', '1', '2015-01-27 07:17:07', 'hallene7', '2014-09-07 23:17:47', 'vmeyere7');
INSERT INTO `settings` VALUES ('514', 'Delaware', 'interdum mauris non ligula pellentesque ultrices phasellus', '0', '2015-02-23 10:32:23', 'emurraye8', '2014-11-01 10:49:25', 'ahuntere8');
INSERT INTO `settings` VALUES ('515', 'Cheyenne', 'nulla mollis molestie lorem quisque ut', '0', '2015-02-01 09:12:44', 'kkellye9', '2015-05-21 09:04:00', 'ahowarde9');
INSERT INTO `settings` VALUES ('516', 'Thai', 'in faucibus orci luctus et ultrices posuere cubilia curae', '0', '2015-07-07 05:50:25', 'elongea', '2015-07-26 11:12:27', 'whicksea');
INSERT INTO `settings` VALUES ('517', 'Thai', 'maecenas ut massa quis augue luctus', '0', '2015-02-12 22:06:54', 'jgarciaeb', '2015-07-03 22:40:44', 'ppetersoneb');
INSERT INTO `settings` VALUES ('518', 'Kiowa', 'quisque arcu libero rutrum ac lobortis', '0', '2014-09-30 11:12:38', 'hhawkinsec', '2015-07-29 05:22:20', 'rbakerec');
INSERT INTO `settings` VALUES ('519', 'Puerto Rican', 'eu magna vulputate luctus cum sociis natoque penatibus et magnis', '1', '2015-01-05 08:56:09', 'sgrayed', '2014-10-11 09:28:36', 'lrayed');
INSERT INTO `settings` VALUES ('520', 'Korean', 'pede ullamcorper augue a suscipit', '0', '2014-10-27 20:35:48', 'thawkinsee', '2014-09-11 08:04:54', 'bpetersee');
INSERT INTO `settings` VALUES ('521', 'Pakistani', 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', '1', '2015-04-12 02:23:29', 'ahillef', '2015-02-15 15:25:15', 'dberryef');
INSERT INTO `settings` VALUES ('522', 'Black or African American', 'proin risus praesent lectus vestibulum quam sapien varius ut', '1', '2015-05-02 08:54:53', 'rkingeg', '2015-07-08 11:05:01', 'spierceeg');
INSERT INTO `settings` VALUES ('523', 'Chilean', 'turpis sed ante vivamus tortor duis mattis egestas metus aenean', '1', '2015-04-23 11:41:21', 'mharveyeh', '2014-08-15 04:58:49', 'jkimeh');
INSERT INTO `settings` VALUES ('524', 'Delaware', 'montes nascetur ridiculus mus etiam vel augue', '1', '2015-04-05 08:16:17', 'jgarrettei', '2015-01-31 21:57:48', 'ewalkerei');
INSERT INTO `settings` VALUES ('525', 'Guatemalan', 'velit id pretium iaculis diam erat fermentum justo nec condimentum', '1', '2014-09-22 10:51:40', 'afosterej', '2014-10-30 05:40:59', 'gwheelerej');
INSERT INTO `settings` VALUES ('526', 'Sioux', 'donec semper sapien a libero nam dui proin leo', '0', '2015-01-09 03:22:37', 'jjohnsonek', '2014-09-16 11:26:56', 'bjonesek');
INSERT INTO `settings` VALUES ('527', 'Sri Lankan', 'pretium nisl ut volutpat sapien arcu', '1', '2014-10-29 13:18:24', 'emartinezel', '2014-09-27 16:58:10', 'arichardsonel');
INSERT INTO `settings` VALUES ('528', 'Japanese', 'lacinia aenean sit amet justo morbi ut odio', '0', '2015-02-21 16:23:41', 'pmeyerem', '2014-10-07 11:36:47', 'kgordonem');
INSERT INTO `settings` VALUES ('529', 'Mexican', 'potenti in eleifend quam a', '1', '2015-04-23 04:21:15', 'dcunninghamen', '2015-07-19 07:31:47', 'pmendozaen');
INSERT INTO `settings` VALUES ('530', 'Chinese', 'rutrum neque aenean auctor gravida sem praesent id', '1', '2015-01-05 08:55:29', 'aevanseo', '2014-09-26 12:57:55', 'wcoxeo');
INSERT INTO `settings` VALUES ('531', 'American Indian and Alaska Native (AIAN)', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', '0', '2015-07-04 00:24:45', 'jsimpsonep', '2014-09-12 00:40:12', 'hdavisep');
INSERT INTO `settings` VALUES ('532', 'Eskimo', 'amet consectetuer adipiscing elit proin', '0', '2015-04-27 14:28:04', 'jryaneq', '2014-12-07 14:13:05', 'rtorreseq');
INSERT INTO `settings` VALUES ('533', 'Potawatomi', 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', '1', '2015-01-10 19:27:34', 'etuckerer', '2015-05-31 17:32:33', 'hwoodser');
INSERT INTO `settings` VALUES ('534', 'Cherokee', 'maecenas tristique est et tempus semper', '0', '2015-06-03 21:37:53', 'dharperes', '2015-02-21 17:23:32', 'ijacobses');
INSERT INTO `settings` VALUES ('535', 'Cree', 'rutrum nulla tellus in sagittis dui vel', '1', '2014-09-06 12:56:29', 'aelliottet', '2014-11-22 16:46:18', 'bhayeset');
INSERT INTO `settings` VALUES ('536', 'Puget Sound Salish', 'purus phasellus in felis donec semper sapien', '1', '2015-01-16 23:14:33', 'dfernandezeu', '2015-03-10 02:14:03', 'prichardseu');
INSERT INTO `settings` VALUES ('537', 'Cherokee', 'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', '1', '2014-10-20 12:00:20', 'kkennedyev', '2015-03-30 04:58:46', 'tlarsonev');
INSERT INTO `settings` VALUES ('538', 'Blackfeet', 'justo in hac habitasse platea dictumst etiam', '0', '2015-02-13 00:43:57', 'jwilsonew', '2015-01-16 21:51:37', 'rmyersew');
INSERT INTO `settings` VALUES ('539', 'Micronesian', 'at ipsum ac tellus semper interdum', '1', '2014-10-04 03:10:39', 'stuckerex', '2015-06-22 19:47:16', 'bmartinezex');
INSERT INTO `settings` VALUES ('540', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'cubilia curae mauris viverra diam vitae', '0', '2015-05-04 23:32:11', 'cwebbey', '2014-12-26 14:39:05', 'bsullivaney');
INSERT INTO `settings` VALUES ('541', 'Indonesian', 'primis in faucibus orci luctus', '0', '2015-03-20 01:06:55', 'jpattersonez', '2015-01-26 16:53:41', 'drussellez');
INSERT INTO `settings` VALUES ('542', 'Shoshone', 'nec euismod scelerisque quam turpis adipiscing lorem', '0', '2015-01-31 06:08:18', 'jmasonf0', '2014-12-07 02:47:36', 'bshawf0');
INSERT INTO `settings` VALUES ('543', 'Iroquois', 'vulputate justo in blandit ultrices enim', '0', '2015-02-23 04:25:28', 'asimmonsf1', '2015-04-30 06:44:53', 'cstanleyf1');
INSERT INTO `settings` VALUES ('544', 'Nicaraguan', 'nonummy integer non velit donec diam neque vestibulum eget vulputate', '1', '2015-06-17 09:43:15', 'mmurphyf2', '2015-01-06 02:23:25', 'pgardnerf2');
INSERT INTO `settings` VALUES ('545', 'Vietnamese', 'eget eros elementum pellentesque quisque', '0', '2014-11-06 00:02:47', 'fgrayf3', '2014-09-27 12:16:55', 'cmorrisonf3');
INSERT INTO `settings` VALUES ('546', 'Japanese', 'mauris vulputate elementum nullam varius nulla', '0', '2015-04-27 00:48:24', 'pgrayf4', '2015-06-08 01:48:52', 'tparkerf4');
INSERT INTO `settings` VALUES ('547', 'Tongan', 'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus', '1', '2014-12-12 21:58:37', 'rhernandezf5', '2014-09-07 13:08:41', 'jgarrettf5');
INSERT INTO `settings` VALUES ('548', 'Nicaraguan', 'eros suspendisse accumsan tortor quis turpis sed', '1', '2015-06-02 05:30:38', 'jkingf6', '2014-10-23 10:25:05', 'jfergusonf6');
INSERT INTO `settings` VALUES ('549', 'Yakama', 'vel pede morbi porttitor lorem id ligula suspendisse', '1', '2015-02-27 18:47:03', 'rwoodsf7', '2015-03-26 19:22:51', 'jstonef7');
INSERT INTO `settings` VALUES ('550', 'Dominican (Dominican Republic)', 'aliquam erat volutpat in congue etiam justo etiam pretium', '1', '2015-03-14 15:19:20', 'jsimsf8', '2015-06-26 09:49:39', 'cnicholsf8');
INSERT INTO `settings` VALUES ('551', 'Ecuadorian', 'risus dapibus augue vel accumsan tellus nisi', '1', '2014-12-31 17:24:09', 'jhamiltonf9', '2015-06-26 23:32:03', 'jmorenof9');
INSERT INTO `settings` VALUES ('552', 'Alaska Native', 'a ipsum integer a nibh in quis justo', '0', '2014-08-18 07:53:13', 'lcastillofa', '2015-07-13 11:44:13', 'gwestfa');
INSERT INTO `settings` VALUES ('553', 'Filipino', 'a suscipit nulla elit ac nulla', '1', '2015-06-11 17:44:44', 'dhendersonfb', '2014-11-08 13:48:34', 'cwelchfb');
INSERT INTO `settings` VALUES ('554', 'Seminole', 'etiam justo etiam pretium iaculis justo in hac habitasse', '0', '2015-08-01 14:34:47', 'jlawrencefc', '2015-06-03 16:02:24', 'wrobinsonfc');
INSERT INTO `settings` VALUES ('555', 'Eskimo', 'sagittis dui vel nisl duis', '1', '2015-02-15 05:08:43', 'mbrownfd', '2015-01-28 17:46:42', 'ahudsonfd');
INSERT INTO `settings` VALUES ('556', 'Micronesian', 'volutpat sapien arcu sed augue aliquam', '0', '2015-07-21 23:01:32', 'dalvarezfe', '2015-05-27 14:10:54', 'jhendersonfe');
INSERT INTO `settings` VALUES ('557', 'South American', 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet', '1', '2014-10-11 15:20:53', 'jcookff', '2015-01-19 09:10:02', 'nreyesff');
INSERT INTO `settings` VALUES ('558', 'Japanese', 'ultrices libero non mattis pulvinar', '1', '2015-05-17 19:34:08', 'jlewisfg', '2015-07-21 13:15:55', 'ccolefg');
INSERT INTO `settings` VALUES ('559', 'Aleut', 'quisque porta volutpat erat quisque erat eros viverra eget', '1', '2015-01-15 09:01:14', 'pmendozafh', '2015-02-21 04:23:46', 'gbryantfh');
INSERT INTO `settings` VALUES ('560', 'Spaniard', 'scelerisque mauris sit amet eros suspendisse accumsan tortor', '1', '2015-02-13 16:35:40', 'lrobertsonfi', '2015-04-02 12:52:15', 'fspencerfi');
INSERT INTO `settings` VALUES ('561', 'Chippewa', 'ac nulla sed vel enim sit amet nunc viverra dapibus', '0', '2014-09-06 04:06:04', 'rmitchellfj', '2014-10-23 23:18:48', 'lwallacefj');
INSERT INTO `settings` VALUES ('562', 'Mexican', 'sapien cursus vestibulum proin eu mi nulla ac', '0', '2015-04-22 17:54:22', 'bcooperfk', '2015-03-10 09:46:32', 'sharveyfk');
INSERT INTO `settings` VALUES ('563', 'Panamanian', 'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', '0', '2014-09-20 13:43:08', 'rmasonfl', '2014-11-15 08:41:04', 'jcunninghamfl');
INSERT INTO `settings` VALUES ('564', 'Tlingit-Haida', 'viverra pede ac diam cras', '1', '2014-09-20 20:57:06', 'rsimmonsfm', '2014-12-09 16:31:07', 'clanefm');
INSERT INTO `settings` VALUES ('565', 'Cheyenne', 'ut erat curabitur gravida nisi at', '1', '2014-10-13 06:17:06', 'jarmstrongfn', '2015-02-08 05:28:08', 'srobertsonfn');
INSERT INTO `settings` VALUES ('566', 'Yuman', 'orci eget orci vehicula condimentum curabitur in libero ut massa', '1', '2015-01-13 19:45:50', 'vjordanfo', '2015-05-15 21:27:38', 'jbutlerfo');
INSERT INTO `settings` VALUES ('567', 'Potawatomi', 'vitae consectetuer eget rutrum at', '1', '2015-07-19 01:01:21', 'tpattersonfp', '2015-08-07 09:45:00', 'wtuckerfp');
INSERT INTO `settings` VALUES ('568', 'Potawatomi', 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', '0', '2015-03-17 20:59:36', 'wbrownfq', '2014-10-07 02:08:35', 'bhenryfq');
INSERT INTO `settings` VALUES ('569', 'Cheyenne', 'pede libero quis orci nullam molestie nibh', '0', '2014-12-30 15:14:39', 'preidfr', '2014-11-22 04:43:07', 'dharveyfr');
INSERT INTO `settings` VALUES ('570', 'Cheyenne', 'elementum in hac habitasse platea', '0', '2015-03-19 13:34:02', 'drosefs', '2014-12-09 00:39:32', 'jdeanfs');
INSERT INTO `settings` VALUES ('571', 'Colombian', 'praesent blandit lacinia erat vestibulum sed magna at', '1', '2015-02-20 19:19:22', 'sbrooksft', '2015-02-25 01:09:32', 'rphillipsft');
INSERT INTO `settings` VALUES ('572', 'Puerto Rican', 'eleifend pede libero quis orci', '1', '2014-12-25 05:47:55', 'emccoyfu', '2015-04-20 21:48:30', 'rvasquezfu');
INSERT INTO `settings` VALUES ('573', 'Latin American Indian', 'sem duis aliquam convallis nunc proin', '0', '2015-02-08 05:37:55', 'dlanefv', '2015-03-30 16:17:22', 'awatkinsfv');
INSERT INTO `settings` VALUES ('574', 'Osage', 'ut suscipit a feugiat et eros vestibulum ac est lacinia', '1', '2015-01-07 09:04:26', 'drobertsonfw', '2015-02-25 21:40:26', 'criverafw');
INSERT INTO `settings` VALUES ('575', 'Indonesian', 'sit amet diam in magna bibendum imperdiet nullam', '1', '2014-09-24 07:49:44', 'bfergusonfx', '2014-11-03 19:46:12', 'iweaverfx');
INSERT INTO `settings` VALUES ('576', 'Alaskan Athabascan', 'magna vulputate luctus cum sociis natoque penatibus', '1', '2014-12-17 07:22:00', 'vcrawfordfy', '2014-08-14 10:51:49', 'candrewsfy');
INSERT INTO `settings` VALUES ('577', 'Pakistani', 'faucibus orci luctus et ultrices posuere', '1', '2014-09-28 13:30:34', 'kreyesfz', '2015-06-19 07:01:40', 'amorganfz');
INSERT INTO `settings` VALUES ('578', 'Tongan', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue', '1', '2014-11-08 19:52:33', 'kbennettg0', '2015-07-18 02:11:11', 'awhiteg0');
INSERT INTO `settings` VALUES ('579', 'Lumbee', 'vestibulum proin eu mi nulla ac enim in', '0', '2015-03-15 14:31:00', 'vfrazierg1', '2015-08-07 21:48:15', 'pkelleyg1');
INSERT INTO `settings` VALUES ('580', 'Chamorro', 'convallis eget eleifend luctus ultricies eu nibh quisque', '0', '2014-11-15 06:49:41', 'jriverag2', '2015-04-12 16:33:58', 'cleeg2');
INSERT INTO `settings` VALUES ('581', 'Panamanian', 'nibh in hac habitasse platea dictumst aliquam augue quam', '0', '2014-08-27 07:04:20', 'aelliottg3', '2015-02-18 19:03:14', 'sedwardsg3');
INSERT INTO `settings` VALUES ('582', 'Native Hawaiian', 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', '1', '2015-01-24 02:35:13', 'cowensg4', '2015-01-03 00:38:37', 'astevensg4');
INSERT INTO `settings` VALUES ('583', 'Cuban', 'imperdiet et commodo vulputate justo in blandit ultrices enim', '1', '2015-01-09 12:39:25', 'tstewartg5', '2015-05-25 01:32:35', 'jchapmang5');
INSERT INTO `settings` VALUES ('584', 'Tongan', 'dis parturient montes nascetur ridiculus mus vivamus', '1', '2014-12-08 17:22:28', 'cfergusong6', '2015-06-14 20:45:41', 'kcastillog6');
INSERT INTO `settings` VALUES ('585', 'Samoan', 'ac nulla sed vel enim', '1', '2015-06-26 07:53:40', 'mkingg7', '2015-08-06 00:52:19', 'srileyg7');
INSERT INTO `settings` VALUES ('586', 'Ottawa', 'amet eleifend pede libero quis orci nullam molestie', '1', '2014-11-06 11:29:29', 'dbutlerg8', '2014-10-18 22:20:27', 'tjamesg8');
INSERT INTO `settings` VALUES ('587', 'Chippewa', 'sem praesent id massa id nisl venenatis lacinia aenean', '1', '2015-07-05 19:58:07', 'hcollinsg9', '2015-04-16 19:29:31', 'ahendersong9');
INSERT INTO `settings` VALUES ('588', 'Navajo', 'nullam sit amet turpis elementum ligula', '0', '2014-10-21 10:01:41', 'hgrahamga', '2014-08-21 13:01:47', 'rhallga');
INSERT INTO `settings` VALUES ('589', 'Spaniard', 'in sagittis dui vel nisl', '0', '2014-11-20 05:53:10', 'eaustingb', '2015-05-08 06:24:20', 'jrobertsongb');
INSERT INTO `settings` VALUES ('590', 'Pakistani', 'pretium quis lectus suspendisse potenti in eleifend quam', '0', '2015-03-29 05:31:23', 'rdunngc', '2015-08-06 18:06:57', 'jrogersgc');
INSERT INTO `settings` VALUES ('591', 'Yuman', 'habitasse platea dictumst morbi vestibulum velit', '0', '2015-05-22 05:53:32', 'rportergd', '2015-03-14 17:13:09', 'ftaylorgd');
INSERT INTO `settings` VALUES ('592', 'Cree', 'vel sem sed sagittis nam congue risus semper', '0', '2014-12-04 13:32:49', 'sgrantge', '2014-12-05 20:11:55', 'amasonge');
INSERT INTO `settings` VALUES ('593', 'Japanese', 'diam id ornare imperdiet sapien urna', '0', '2015-08-09 22:24:04', 'rjacksongf', '2015-07-02 20:04:40', 'treynoldsgf');
INSERT INTO `settings` VALUES ('594', 'Sioux', 'nulla tellus in sagittis dui vel', '1', '2015-02-09 21:05:52', 'sthompsongg', '2014-10-23 03:45:56', 'jmorgangg');
INSERT INTO `settings` VALUES ('595', 'Bolivian', 'platea dictumst maecenas ut massa quis', '1', '2014-12-17 19:57:37', 'mwardgh', '2014-11-25 20:44:41', 'earmstronggh');
INSERT INTO `settings` VALUES ('596', 'Tohono O\'Odham', 'natoque penatibus et magnis dis parturient', '1', '2015-03-18 14:32:31', 'jwrightgi', '2015-03-21 05:49:48', 'jnelsongi');
INSERT INTO `settings` VALUES ('597', 'Ute', 'morbi quis tortor id nulla ultrices aliquet', '0', '2015-07-26 23:04:04', 'abanksgj', '2015-05-04 12:00:13', 'apaynegj');
INSERT INTO `settings` VALUES ('598', 'Aleut', 'ultrices mattis odio donec vitae nisi', '0', '2014-12-07 19:05:31', 'tberrygk', '2014-09-29 20:53:08', 'jgrantgk');
INSERT INTO `settings` VALUES ('599', 'Chilean', 'potenti cras in purus eu magna vulputate luctus', '1', '2015-02-08 22:06:17', 'dgreengl', '2015-02-22 22:42:46', 'trodriguezgl');
INSERT INTO `settings` VALUES ('600', 'Pakistani', 'mi nulla ac enim in tempor turpis nec euismod', '1', '2015-04-07 18:00:26', 'bnelsongm', '2014-10-23 21:16:23', 'ewelchgm');
INSERT INTO `settings` VALUES ('601', 'Colombian', 'sapien cum sociis natoque penatibus et magnis dis', '0', '2014-12-01 18:41:15', 'athomasgn', '2015-01-09 05:55:05', 'ldeangn');
INSERT INTO `settings` VALUES ('602', 'Uruguayan', 'velit donec diam neque vestibulum eget vulputate ut ultrices', '0', '2015-08-08 06:30:01', 'sburkego', '2015-01-15 22:12:11', 'lolivergo');
INSERT INTO `settings` VALUES ('603', 'Panamanian', 'in est risus auctor sed tristique in', '1', '2015-03-23 21:06:33', 'rfullergp', '2014-10-05 16:11:16', 'jthompsongp');
INSERT INTO `settings` VALUES ('604', 'Venezuelan', 'id nulla ultrices aliquet maecenas leo odio condimentum', '1', '2015-07-20 03:34:51', 'mcampbellgq', '2014-10-03 16:45:36', 'ahenrygq');
INSERT INTO `settings` VALUES ('605', 'Bangladeshi', 'nulla tellus in sagittis dui vel nisl duis ac', '1', '2015-03-08 06:43:51', 'djamesgr', '2015-02-22 03:49:33', 'dstevensgr');
INSERT INTO `settings` VALUES ('606', 'Mexican', 'sed justo pellentesque viverra pede ac diam', '1', '2015-04-24 05:40:10', 'aberrygs', '2015-03-13 08:06:54', 'hjacobsgs');
INSERT INTO `settings` VALUES ('607', 'Peruvian', 'quis orci eget orci vehicula', '1', '2015-01-24 04:48:21', 'jboydgt', '2015-05-03 18:20:49', 'sadamsgt');
INSERT INTO `settings` VALUES ('608', 'Chickasaw', 'pellentesque at nulla suspendisse potenti cras in purus eu magna', '0', '2015-01-16 01:32:14', 'sspencergu', '2015-05-28 19:01:33', 'dbrowngu');
INSERT INTO `settings` VALUES ('609', 'Thai', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque', '0', '2015-02-05 12:52:39', 'eboydgv', '2015-03-10 18:20:32', 'mleegv');
INSERT INTO `settings` VALUES ('610', 'Honduran', 'massa id lobortis convallis tortor risus', '0', '2014-09-21 12:20:57', 'dgraygw', '2014-12-07 11:14:43', 'egriffingw');
INSERT INTO `settings` VALUES ('611', 'Cambodian', 'orci luctus et ultrices posuere cubilia curae nulla', '0', '2015-08-09 17:04:54', 'ghillgx', '2015-04-27 21:48:58', 'kwellsgx');
INSERT INTO `settings` VALUES ('612', 'Central American', 'eget tempus vel pede morbi', '1', '2014-10-31 00:11:37', 'cgonzalesgy', '2015-07-07 00:36:11', 'emeyergy');
INSERT INTO `settings` VALUES ('613', 'Dominican (Dominican Republic)', 'orci nullam molestie nibh in lectus pellentesque at', '1', '2014-09-14 03:42:11', 'dperezgz', '2015-01-06 08:31:44', 'agarrettgz');
INSERT INTO `settings` VALUES ('614', 'Hmong', 'pellentesque viverra pede ac diam cras pellentesque', '1', '2014-08-23 02:12:11', 'agrahamh0', '2015-07-19 08:41:14', 'kolsonh0');
INSERT INTO `settings` VALUES ('615', 'Hmong', 'pede malesuada in imperdiet et commodo', '1', '2014-08-25 06:30:20', 'wfullerh1', '2014-12-08 11:15:14', 'croseh1');
INSERT INTO `settings` VALUES ('616', 'Houma', 'lacinia erat vestibulum sed magna at', '1', '2014-09-02 16:45:10', 'jgutierrezh2', '2014-10-27 17:13:00', 'twheelerh2');
INSERT INTO `settings` VALUES ('617', 'Kiowa', 'ornare imperdiet sapien urna pretium nisl', '1', '2015-03-17 03:26:00', 'lkimh3', '2015-06-16 14:18:30', 'sfergusonh3');
INSERT INTO `settings` VALUES ('618', 'Aleut', 'donec dapibus duis at velit eu est congue', '0', '2015-01-20 00:45:25', 'karnoldh4', '2014-11-15 11:29:46', 'jkellyh4');
INSERT INTO `settings` VALUES ('619', 'Melanesian', 'odio curabitur convallis duis consequat', '0', '2015-04-05 18:32:25', 'crileyh5', '2015-01-30 11:57:27', 'jsmithh5');
INSERT INTO `settings` VALUES ('620', 'Dominican (Dominican Republic)', 'luctus et ultrices posuere cubilia curae mauris viverra', '1', '2014-10-10 22:29:18', 'jshawh6', '2015-01-21 21:40:24', 'jlaneh6');
INSERT INTO `settings` VALUES ('621', 'Dominican (Dominican Republic)', 'nisl nunc nisl duis bibendum felis sed interdum venenatis', '0', '2015-06-15 10:57:52', 'rhendersonh7', '2015-07-28 17:21:32', 'jbutlerh7');
INSERT INTO `settings` VALUES ('622', 'Colombian', 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam', '1', '2014-09-11 14:36:29', 'kryanh8', '2015-07-12 21:41:40', 'lclarkh8');
INSERT INTO `settings` VALUES ('623', 'Sri Lankan', 'diam cras pellentesque volutpat dui', '1', '2014-09-14 12:14:40', 'jwellsh9', '2014-09-02 20:30:13', 'pyoungh9');
INSERT INTO `settings` VALUES ('624', 'Kiowa', 'dapibus dolor vel est donec odio', '1', '2015-01-29 02:35:01', 'lduncanha', '2014-10-13 13:47:05', 'jcarpenterha');
INSERT INTO `settings` VALUES ('625', 'Seminole', 'duis consequat dui nec nisi volutpat', '1', '2014-12-20 09:54:23', 'bmorrisonhb', '2015-01-01 14:34:27', 'gharthb');
INSERT INTO `settings` VALUES ('626', 'Yaqui', 'eu orci mauris lacinia sapien quis libero', '0', '2015-03-28 23:25:21', 'gpricehc', '2015-06-20 23:56:17', 'pfieldshc');
INSERT INTO `settings` VALUES ('627', 'Yakama', 'quam sapien varius ut blandit non interdum in ante', '0', '2015-06-11 14:02:36', 'hcarrhd', '2014-12-28 23:16:51', 'mgonzaleshd');
INSERT INTO `settings` VALUES ('628', 'Micronesian', 'quis odio consequat varius integer', '1', '2014-11-28 20:14:59', 'mevanshe', '2015-04-06 20:58:24', 'dcampbellhe');
INSERT INTO `settings` VALUES ('629', 'Melanesian', 'iaculis diam erat fermentum justo nec condimentum neque', '1', '2015-05-11 03:30:15', 'kmurrayhf', '2015-04-22 18:51:26', 'acampbellhf');
INSERT INTO `settings` VALUES ('630', 'Guamanian', 'sit amet turpis elementum ligula vehicula consequat morbi', '1', '2015-04-11 02:07:53', 'pgeorgehg', '2015-06-13 21:05:14', 'abowmanhg');
INSERT INTO `settings` VALUES ('631', 'Ecuadorian', 'sollicitudin mi sit amet lobortis sapien sapien', '0', '2015-03-16 10:32:06', 'rknighthh', '2015-07-19 18:07:46', 'jhallhh');
INSERT INTO `settings` VALUES ('632', 'Ute', 'dictumst etiam faucibus cursus urna ut', '1', '2015-06-22 01:09:27', 'jsnyderhi', '2014-08-19 08:06:46', 'dmccoyhi');
INSERT INTO `settings` VALUES ('633', 'Costa Rican', 'nulla ut erat id mauris vulputate elementum nullam', '0', '2015-07-08 08:50:54', 'cgeorgehj', '2015-05-01 00:32:36', 'dhudsonhj');
INSERT INTO `settings` VALUES ('634', 'Venezuelan', 'magnis dis parturient montes nascetur', '1', '2015-01-08 00:06:05', 'lalexanderhk', '2015-05-08 20:48:35', 'glawrencehk');
INSERT INTO `settings` VALUES ('635', 'Melanesian', 'morbi non quam nec dui luctus rutrum nulla', '0', '2015-04-10 09:04:46', 'cgonzalezhl', '2014-09-22 06:30:08', 'cbankshl');
INSERT INTO `settings` VALUES ('636', 'Comanche', 'in felis eu sapien cursus vestibulum proin eu mi nulla', '1', '2015-03-21 10:49:39', 'dmillshm', '2014-12-31 05:01:16', 'aharthm');
INSERT INTO `settings` VALUES ('637', 'Osage', 'neque duis bibendum morbi non quam nec dui luctus rutrum', '1', '2015-03-13 00:43:20', 'rdanielshn', '2014-10-30 15:05:34', 'rperezhn');
INSERT INTO `settings` VALUES ('638', 'Cambodian', 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at', '0', '2015-06-18 01:50:28', 'rwhiteho', '2015-05-03 02:40:21', 'agibsonho');
INSERT INTO `settings` VALUES ('639', 'Bolivian', 'purus aliquet at feugiat non pretium quis lectus', '0', '2014-08-18 21:18:00', 'badamshp', '2015-04-10 23:38:15', 'rwoodshp');
INSERT INTO `settings` VALUES ('640', 'Pueblo', 'porttitor lorem id ligula suspendisse ornare consequat lectus in', '0', '2015-07-17 14:57:05', 'pgomezhq', '2015-04-11 12:12:39', 'djohnstonhq');
INSERT INTO `settings` VALUES ('641', 'Malaysian', 'non velit donec diam neque vestibulum eget vulputate ut', '1', '2014-11-08 21:35:47', 'dbrownhr', '2015-04-07 17:02:31', 'esimmonshr');
INSERT INTO `settings` VALUES ('642', 'Samoan', 'odio consequat varius integer ac leo pellentesque ultrices', '1', '2014-09-17 07:54:17', 'jellishs', '2015-01-05 20:25:15', 'pmatthewshs');
INSERT INTO `settings` VALUES ('643', 'Black or African American', 'hac habitasse platea dictumst morbi vestibulum velit id', '0', '2015-04-24 07:33:02', 'kfosterht', '2015-02-21 08:12:01', 'smoralesht');
INSERT INTO `settings` VALUES ('644', 'Pueblo', 'sagittis sapien cum sociis natoque penatibus et magnis dis', '1', '2015-04-03 21:15:24', 'dpattersonhu', '2015-06-15 04:25:38', 'plarsonhu');
INSERT INTO `settings` VALUES ('645', 'Tongan', 'turpis enim blandit mi in porttitor', '1', '2015-02-26 15:46:27', 'aandersonhv', '2015-01-11 11:10:09', 'aharveyhv');
INSERT INTO `settings` VALUES ('646', 'Latin American Indian', 'tellus nulla ut erat id mauris vulputate elementum nullam', '1', '2015-04-04 15:05:52', 'jwarrenhw', '2014-09-18 23:19:56', 'mmasonhw');
INSERT INTO `settings` VALUES ('647', 'Menominee', 'ut erat curabitur gravida nisi', '0', '2014-11-28 21:57:15', 'jowenshx', '2015-04-17 13:48:52', 'mwhitehx');
INSERT INTO `settings` VALUES ('648', 'Sioux', 'augue vestibulum rutrum rutrum neque aenean auctor gravida', '0', '2015-04-07 15:03:17', 'pharperhy', '2014-09-26 13:07:37', 'dreedhy');
INSERT INTO `settings` VALUES ('649', 'Lumbee', 'ultrices posuere cubilia curae mauris viverra diam vitae', '1', '2015-02-03 10:03:17', 'kedwardshz', '2014-12-05 19:40:44', 'cwebbhz');
INSERT INTO `settings` VALUES ('650', 'Chamorro', 'aliquam sit amet diam in magna', '1', '2014-10-17 05:37:46', 'jnguyeni0', '2015-03-04 21:15:36', 'chunti0');
INSERT INTO `settings` VALUES ('651', 'Pueblo', 'nec molestie sed justo pellentesque viverra pede ac', '0', '2014-08-14 08:13:28', 'amitchelli1', '2014-12-01 18:26:52', 'amcdonaldi1');
INSERT INTO `settings` VALUES ('652', 'South American', 'mauris morbi non lectus aliquam sit amet diam in', '0', '2015-04-16 23:11:11', 'sgrahami2', '2014-12-18 01:53:54', 'bmedinai2');
INSERT INTO `settings` VALUES ('653', 'Houma', 'tempus semper est quam pharetra magna', '1', '2015-02-17 21:36:18', 'sparkeri3', '2015-06-14 06:06:21', 'jalvarezi3');
INSERT INTO `settings` VALUES ('654', 'Sri Lankan', 'pede posuere nonummy integer non velit donec diam neque vestibulum', '0', '2015-05-01 11:58:26', 'cwallacei4', '2015-02-07 03:57:09', 'jcruzi4');
INSERT INTO `settings` VALUES ('655', 'Chamorro', 'venenatis turpis enim blandit mi in porttitor', '1', '2015-03-17 02:59:33', 'jgarretti5', '2015-06-14 16:33:53', 'rbutleri5');
INSERT INTO `settings` VALUES ('656', 'Blackfeet', 'nulla integer pede justo lacinia eget tincidunt eget', '0', '2014-09-13 19:19:33', 'jdixoni6', '2015-05-24 02:46:46', 'nwarreni6');
INSERT INTO `settings` VALUES ('657', 'Kiowa', 'sit amet cursus id turpis integer', '0', '2015-03-20 20:52:54', 'hbowmani7', '2015-03-20 16:45:52', 'rdanielsi7');
INSERT INTO `settings` VALUES ('658', 'Polynesian', 'curae duis faucibus accumsan odio curabitur convallis duis', '0', '2014-12-19 07:35:23', 'lsimpsoni8', '2015-01-15 05:21:01', 'lmoralesi8');
INSERT INTO `settings` VALUES ('659', 'Korean', 'eu tincidunt in leo maecenas', '0', '2015-07-11 09:28:11', 'cclarki9', '2015-02-15 13:49:17', 'jbarnesi9');
INSERT INTO `settings` VALUES ('660', 'Menominee', 'convallis nunc proin at turpis a pede posuere nonummy', '0', '2015-08-05 04:52:46', 'mhunteria', '2015-02-02 00:19:28', 'awallaceia');
INSERT INTO `settings` VALUES ('661', 'Iroquois', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', '0', '2014-11-29 01:41:41', 'apattersonib', '2015-08-04 23:47:20', 'awestib');
INSERT INTO `settings` VALUES ('662', 'Navajo', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', '0', '2015-04-15 01:51:26', 'aharperic', '2015-04-14 16:01:22', 'tstoneic');
INSERT INTO `settings` VALUES ('663', 'Black or African American', 'augue vestibulum ante ipsum primis in faucibus', '0', '2014-10-18 18:02:40', 'pcookid', '2015-01-18 14:19:30', 'ppowellid');
INSERT INTO `settings` VALUES ('664', 'Chilean', 'ultrices posuere cubilia curae donec pharetra magna', '1', '2015-06-17 01:34:58', 'jmatthewsie', '2014-08-18 21:07:48', 'rcarterie');
INSERT INTO `settings` VALUES ('665', 'Asian Indian', 'congue risus semper porta volutpat quam pede lobortis ligula sit', '1', '2015-05-29 22:00:04', 'dharveyif', '2015-06-24 08:04:10', 'efergusonif');
INSERT INTO `settings` VALUES ('666', 'South American', 'neque duis bibendum morbi non', '0', '2015-06-09 01:56:42', 'kjamesig', '2015-04-14 00:58:45', 'cporterig');
INSERT INTO `settings` VALUES ('667', 'Paraguayan', 'eu interdum eu tincidunt in leo maecenas pulvinar', '1', '2014-09-14 01:40:06', 'aarnoldih', '2015-05-20 14:26:58', 'rwashingtonih');
INSERT INTO `settings` VALUES ('668', 'Guatemalan', 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus', '0', '2015-07-28 10:21:43', 'dharrisii', '2015-06-15 15:18:07', 'ccarrollii');
INSERT INTO `settings` VALUES ('669', 'Cree', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', '0', '2014-11-01 17:39:41', 'nrodriguezij', '2015-07-31 12:59:02', 'areyesij');
INSERT INTO `settings` VALUES ('670', 'Ecuadorian', 'erat tortor sollicitudin mi sit amet', '0', '2015-07-08 18:51:11', 'bgrayik', '2015-04-06 03:17:30', 'aknightik');
INSERT INTO `settings` VALUES ('671', 'Japanese', 'aliquam lacus morbi quis tortor', '0', '2015-07-25 21:04:11', 'dgomezil', '2015-05-20 18:09:19', 'jmartinezil');
INSERT INTO `settings` VALUES ('672', 'Bolivian', 'proin at turpis a pede posuere nonummy integer', '0', '2015-06-27 15:00:50', 'awagnerim', '2015-05-14 11:39:56', 'lmeyerim');
INSERT INTO `settings` VALUES ('673', 'Blackfeet', 'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', '1', '2015-04-10 21:24:37', 'awoodsin', '2014-09-27 07:42:49', 'ashawin');
INSERT INTO `settings` VALUES ('674', 'Colville', 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', '1', '2015-03-23 19:21:40', 'jroseio', '2014-11-13 06:44:03', 'amooreio');
INSERT INTO `settings` VALUES ('675', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'phasellus id sapien in sapien iaculis congue vivamus metus', '1', '2014-10-19 01:54:04', 'jjohnstonip', '2015-03-12 09:42:52', 'awellsip');
INSERT INTO `settings` VALUES ('676', 'Mexican', 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem', '0', '2015-02-23 21:34:47', 'cfrazieriq', '2014-12-24 18:53:40', 'jmendozaiq');
INSERT INTO `settings` VALUES ('677', 'South American', 'suspendisse accumsan tortor quis turpis sed ante vivamus', '1', '2015-02-05 22:16:54', 'rjonesir', '2015-06-24 10:05:46', 'jalexanderir');
INSERT INTO `settings` VALUES ('678', 'Mexican', 'luctus tincidunt nulla mollis molestie lorem quisque ut erat', '1', '2015-02-24 15:33:32', 'ntorresis', '2014-10-19 05:34:45', 'rwellsis');
INSERT INTO `settings` VALUES ('679', 'Puerto Rican', 'pede posuere nonummy integer non velit donec', '1', '2015-01-25 01:04:20', 'blittleit', '2014-10-28 09:56:32', 'ladamsit');
INSERT INTO `settings` VALUES ('680', 'American Indian', 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi', '0', '2015-02-09 12:44:20', 'ngarzaiu', '2014-08-14 04:16:49', 'cmarshalliu');
INSERT INTO `settings` VALUES ('681', 'Hmong', 'turpis a pede posuere nonummy integer non velit donec diam', '0', '2015-05-02 10:52:19', 'msancheziv', '2015-02-11 05:55:51', 'mpayneiv');
INSERT INTO `settings` VALUES ('682', 'Guamanian', 'metus vitae ipsum aliquam non', '0', '2015-05-12 15:54:56', 'dgeorgeiw', '2015-07-30 23:47:58', 'jgarciaiw');
INSERT INTO `settings` VALUES ('683', 'Houma', 'nisi eu orci mauris lacinia sapien quis libero', '0', '2015-02-08 21:53:01', 'jhamiltonix', '2015-06-27 00:43:59', 'jthomasix');
INSERT INTO `settings` VALUES ('684', 'Seminole', 'non mauris morbi non lectus aliquam sit amet', '0', '2014-10-11 14:44:00', 'kstanleyiy', '2015-04-07 22:58:25', 'ayoungiy');
INSERT INTO `settings` VALUES ('685', 'Uruguayan', 'diam in magna bibendum imperdiet', '1', '2014-09-16 05:15:15', 'jgrantiz', '2015-04-15 10:04:34', 'rcampbelliz');
INSERT INTO `settings` VALUES ('686', 'Crow', 'nisl duis bibendum felis sed interdum venenatis turpis', '0', '2015-05-14 17:47:28', 'tgreenej0', '2015-03-09 21:12:32', 'cfrazierj0');
INSERT INTO `settings` VALUES ('687', 'Lumbee', 'ipsum praesent blandit lacinia erat', '0', '2015-03-02 03:34:38', 'jsimpsonj1', '2015-01-16 22:24:40', 'earnoldj1');
INSERT INTO `settings` VALUES ('688', 'Thai', 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc', '0', '2015-02-11 07:39:53', 'jolsonj2', '2014-10-09 18:06:36', 'ghicksj2');
INSERT INTO `settings` VALUES ('689', 'Guamanian', 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh', '0', '2015-03-06 06:53:45', 'nfoxj3', '2015-03-20 13:21:49', 'jmartinj3');
INSERT INTO `settings` VALUES ('690', 'Guamanian', 'elementum pellentesque quisque porta volutpat erat quisque erat eros', '0', '2014-09-29 06:16:53', 'pdeanj4', '2014-11-16 13:52:26', 'mhendersonj4');
INSERT INTO `settings` VALUES ('691', 'Chinese', 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient', '0', '2015-02-04 21:37:14', 'hrogersj5', '2014-10-13 14:47:31', 'lgriffinj5');
INSERT INTO `settings` VALUES ('692', 'Paraguayan', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan', '1', '2015-06-21 08:50:37', 'jarnoldj6', '2015-04-01 05:16:20', 'cwarrenj6');
INSERT INTO `settings` VALUES ('693', 'Honduran', 'donec semper sapien a libero nam dui proin leo odio', '1', '2014-12-06 17:22:20', 'msanchezj7', '2014-08-14 00:52:47', 'mkelleyj7');
INSERT INTO `settings` VALUES ('694', 'Japanese', 'tincidunt in leo maecenas pulvinar lobortis est phasellus', '0', '2014-09-19 17:39:06', 'mwallacej8', '2015-06-15 16:45:18', 'mgonzalesj8');
INSERT INTO `settings` VALUES ('695', 'Ecuadorian', 'quam a odio in hac', '0', '2015-02-18 11:38:52', 'awallacej9', '2015-01-17 11:58:44', 'kkimj9');
INSERT INTO `settings` VALUES ('696', 'Pueblo', 'sed augue aliquam erat volutpat in congue etiam', '0', '2015-04-02 18:14:20', 'mmeyerja', '2015-07-06 05:13:20', 'mallenja');
INSERT INTO `settings` VALUES ('697', 'Pima', 'aenean auctor gravida sem praesent id massa id nisl venenatis', '0', '2014-10-25 08:49:00', 'elarsonjb', '2015-02-15 04:06:57', 'rlittlejb');
INSERT INTO `settings` VALUES ('698', 'Colville', 'sit amet eleifend pede libero quis orci nullam molestie nibh', '0', '2014-09-28 22:59:14', 'wwoodjc', '2015-03-22 06:11:05', 'jchapmanjc');
INSERT INTO `settings` VALUES ('699', 'Cambodian', 'quis libero nullam sit amet turpis elementum', '0', '2015-05-04 04:00:26', 'ffrazierjd', '2015-05-20 17:21:17', 'kphillipsjd');
INSERT INTO `settings` VALUES ('700', 'Lumbee', 'gravida nisi at nibh in hac habitasse', '0', '2014-12-02 09:14:32', 'wmorenoje', '2014-09-23 10:51:06', 'rharperje');
INSERT INTO `settings` VALUES ('701', 'Creek', 'id justo sit amet sapien', '1', '2014-09-05 13:39:54', 'jmccoyjf', '2014-09-01 20:30:59', 'bramirezjf');
INSERT INTO `settings` VALUES ('702', 'South American', 'massa tempor convallis nulla neque libero convallis eget', '1', '2015-05-14 11:28:39', 'cfullerjg', '2015-05-07 02:17:14', 'jbaileyjg');
INSERT INTO `settings` VALUES ('703', 'Indonesian', 'montes nascetur ridiculus mus etiam vel augue', '0', '2014-09-12 13:47:29', 'afreemanjh', '2015-01-31 11:05:30', 'isimpsonjh');
INSERT INTO `settings` VALUES ('704', 'Asian Indian', 'ultrices posuere cubilia curae nulla dapibus', '0', '2015-08-07 22:18:09', 'tcoxji', '2014-09-24 13:02:30', 'rhicksji');
INSERT INTO `settings` VALUES ('705', 'Hmong', 'nibh fusce lacus purus aliquet at feugiat non', '1', '2015-08-06 09:23:53', 'jandrewsjj', '2015-02-12 07:23:49', 'jknightjj');
INSERT INTO `settings` VALUES ('706', 'Colville', 'in imperdiet et commodo vulputate justo in', '0', '2015-08-09 12:01:34', 'ghendersonjk', '2015-05-27 21:53:45', 'jkennedyjk');
INSERT INTO `settings` VALUES ('707', 'Cambodian', 'vestibulum velit id pretium iaculis', '0', '2015-07-07 15:14:29', 'kmeyerjl', '2014-10-10 21:22:51', 'ajamesjl');
INSERT INTO `settings` VALUES ('708', 'Uruguayan', 'curabitur convallis duis consequat dui', '0', '2014-11-01 04:05:12', 'gshawjm', '2015-01-28 06:44:02', 'tmyersjm');
INSERT INTO `settings` VALUES ('709', 'Costa Rican', 'consectetuer eget rutrum at lorem integer tincidunt ante vel', '0', '2015-03-25 10:22:56', 'ecarterjn', '2015-06-02 20:28:34', 'smendozajn');
INSERT INTO `settings` VALUES ('710', 'Honduran', 'tempor convallis nulla neque libero convallis', '1', '2014-09-07 03:44:29', 'ahendersonjo', '2014-08-12 21:28:25', 'lmitchelljo');
INSERT INTO `settings` VALUES ('711', 'Thai', 'sed justo pellentesque viverra pede ac diam cras pellentesque', '0', '2015-07-05 12:41:23', 'rweaverjp', '2015-04-10 15:47:37', 'afloresjp');
INSERT INTO `settings` VALUES ('712', 'South American', 'ac tellus semper interdum mauris ullamcorper purus sit amet', '1', '2015-07-13 12:37:03', 'hhudsonjq', '2015-07-08 05:29:51', 'rpetersonjq');
INSERT INTO `settings` VALUES ('713', 'Yaqui', 'ligula nec sem duis aliquam convallis', '0', '2014-11-15 00:03:06', 'lcolejr', '2015-03-31 08:06:27', 'jfisherjr');
INSERT INTO `settings` VALUES ('714', 'Chilean', 'in faucibus orci luctus et ultrices', '1', '2015-02-02 06:41:57', 'jkellyjs', '2014-10-22 01:25:49', 'agibsonjs');
INSERT INTO `settings` VALUES ('715', 'Bolivian', 'semper sapien a libero nam dui proin leo', '0', '2015-02-06 11:16:18', 'wjamesjt', '2015-01-11 12:36:59', 'ppiercejt');
INSERT INTO `settings` VALUES ('716', 'Puget Sound Salish', 'ipsum primis in faucibus orci luctus et ultrices', '0', '2015-07-02 01:44:27', 'kbennettju', '2015-07-24 20:07:06', 'rjordanju');
INSERT INTO `settings` VALUES ('717', 'Spaniard', 'faucibus cursus urna ut tellus', '0', '2015-07-05 18:00:13', 'ajordanjv', '2014-10-03 08:21:48', 'paustinjv');
INSERT INTO `settings` VALUES ('718', 'American Indian', 'diam erat fermentum justo nec condimentum', '0', '2014-10-28 00:15:28', 'rgomezjw', '2015-06-25 03:54:40', 'mgrantjw');
INSERT INTO `settings` VALUES ('719', 'Cambodian', 'habitasse platea dictumst aliquam augue quam sollicitudin vitae', '1', '2015-02-17 18:07:15', 'akennedyjx', '2014-09-20 00:18:46', 'sbrooksjx');
INSERT INTO `settings` VALUES ('720', 'Alaska Native', 'odio donec vitae nisi nam ultrices libero', '0', '2014-11-14 15:22:11', 'jbowmanjy', '2015-07-27 23:56:48', 'cfisherjy');
INSERT INTO `settings` VALUES ('721', 'Central American', 'ut at dolor quis odio', '0', '2014-10-03 15:55:53', 'wgonzalezjz', '2014-12-23 01:54:23', 'rbarnesjz');
INSERT INTO `settings` VALUES ('722', 'Polynesian', 'augue vestibulum rutrum rutrum neque aenean', '1', '2015-07-08 02:05:38', 'dturnerk0', '2014-12-25 07:44:39', 'estevensk0');
INSERT INTO `settings` VALUES ('723', 'White', 'libero nam dui proin leo odio porttitor id consequat', '0', '2014-11-18 10:44:27', 'mrodriguezk1', '2015-07-08 11:30:39', 'jbanksk1');
INSERT INTO `settings` VALUES ('724', 'Delaware', 'sapien urna pretium nisl ut volutpat sapien', '0', '2014-11-08 21:31:34', 'jreyesk2', '2014-11-10 17:57:44', 'ahendersonk2');
INSERT INTO `settings` VALUES ('725', 'Costa Rican', 'non mauris morbi non lectus aliquam sit amet diam', '0', '2015-04-19 07:29:10', 'amendozak3', '2015-03-11 14:07:53', 'jbanksk3');
INSERT INTO `settings` VALUES ('726', 'Ottawa', 'pellentesque ultrices phasellus id sapien in', '1', '2015-05-15 07:19:05', 'fedwardsk4', '2015-08-09 04:38:39', 'cramosk4');
INSERT INTO `settings` VALUES ('727', 'Osage', 'eros suspendisse accumsan tortor quis turpis sed ante vivamus', '0', '2015-04-27 13:47:02', 'smasonk5', '2014-12-29 01:53:14', 'psimsk5');
INSERT INTO `settings` VALUES ('728', 'Colville', 'lorem quisque ut erat curabitur gravida nisi', '0', '2014-09-28 16:13:58', 'pellisk6', '2014-11-22 21:47:03', 'dbryantk6');
INSERT INTO `settings` VALUES ('729', 'White', 'vel dapibus at diam nam tristique', '1', '2014-11-03 18:30:04', 'abanksk7', '2015-03-12 22:55:47', 'trogersk7');
INSERT INTO `settings` VALUES ('730', 'Melanesian', 'augue vestibulum ante ipsum primis in', '1', '2015-03-11 13:12:42', 'egomezk8', '2015-03-15 11:43:52', 'wreynoldsk8');
INSERT INTO `settings` VALUES ('731', 'Sri Lankan', 'natoque penatibus et magnis dis parturient montes', '1', '2015-03-23 21:57:27', 'charveyk9', '2015-07-09 06:41:36', 'rcampbellk9');
INSERT INTO `settings` VALUES ('732', 'Puerto Rican', 'odio odio elementum eu interdum eu tincidunt in', '0', '2014-10-08 12:08:56', 'jroseka', '2015-03-19 20:12:29', 'djohnsonka');
INSERT INTO `settings` VALUES ('733', 'Fijian', 'donec vitae nisi nam ultrices libero non mattis pulvinar', '0', '2014-09-11 17:35:08', 'jromerokb', '2014-10-21 14:07:00', 'kyoungkb');
INSERT INTO `settings` VALUES ('734', 'Salvadoran', 'sit amet cursus id turpis integer aliquet', '0', '2015-04-14 18:08:03', 'plynchkc', '2015-07-21 07:44:44', 'gstephenskc');
INSERT INTO `settings` VALUES ('735', 'Taiwanese', 'nulla sed vel enim sit amet', '1', '2014-10-14 17:43:02', 'psanchezkd', '2015-05-25 01:38:01', 'jhudsonkd');
INSERT INTO `settings` VALUES ('736', 'Pakistani', 'amet cursus id turpis integer aliquet', '1', '2015-05-01 15:48:07', 'astoneke', '2015-02-11 06:08:26', 'jwilliske');
INSERT INTO `settings` VALUES ('737', 'Salvadoran', 'in magna bibendum imperdiet nullam orci', '0', '2015-04-21 06:28:33', 'aburkekf', '2015-05-05 13:54:33', 'wgraykf');
INSERT INTO `settings` VALUES ('738', 'Comanche', 'rhoncus sed vestibulum sit amet cursus', '1', '2015-03-15 15:44:26', 'abryantkg', '2015-04-25 00:49:20', 'jhansenkg');
INSERT INTO `settings` VALUES ('739', 'Yakama', 'luctus nec molestie sed justo pellentesque viverra pede', '1', '2014-10-20 09:16:38', 'lraykh', '2015-04-16 18:01:15', 'rpiercekh');
INSERT INTO `settings` VALUES ('740', 'South American', 'turpis sed ante vivamus tortor duis mattis', '1', '2015-02-19 12:12:18', 'msimmonski', '2014-09-29 03:36:12', 'wpierceki');
INSERT INTO `settings` VALUES ('741', 'Micronesian', 'amet justo morbi ut odio cras mi pede malesuada', '0', '2015-08-04 09:57:27', 'erodriguezkj', '2014-12-19 01:04:47', 'afergusonkj');
INSERT INTO `settings` VALUES ('742', 'Salvadoran', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium', '1', '2015-01-08 13:03:36', 'jfowlerkk', '2015-01-03 17:02:27', 'adaviskk');
INSERT INTO `settings` VALUES ('743', 'Argentinian', 'nonummy integer non velit donec diam', '0', '2015-08-05 21:04:39', 'lyoungkl', '2014-08-24 13:35:24', 'awardkl');
INSERT INTO `settings` VALUES ('744', 'Cheyenne', 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem', '0', '2015-01-10 12:39:14', 'charveykm', '2015-07-26 16:28:29', 'agreenekm');
INSERT INTO `settings` VALUES ('745', 'Iroquois', 'ante vivamus tortor duis mattis egestas metus', '0', '2014-09-09 00:33:35', 'jblackkn', '2014-10-12 19:40:54', 'lalvarezkn');
INSERT INTO `settings` VALUES ('746', 'Alaskan Athabascan', 'semper porta volutpat quam pede lobortis', '1', '2014-08-29 00:25:09', 'aarmstrongko', '2014-11-22 02:27:52', 'emurrayko');
INSERT INTO `settings` VALUES ('747', 'Cambodian', 'sodales sed tincidunt eu felis fusce posuere felis sed lacus', '1', '2015-04-18 09:27:49', 'kporterkp', '2015-06-07 10:29:13', 'rberrykp');
INSERT INTO `settings` VALUES ('748', 'Pima', 'in libero ut massa volutpat', '1', '2014-09-18 10:00:27', 'tkellykq', '2015-07-01 14:53:01', 'jdunnkq');
INSERT INTO `settings` VALUES ('749', 'Cheyenne', 'risus praesent lectus vestibulum quam sapien varius', '0', '2015-07-25 01:56:42', 'swhitekr', '2015-06-18 00:26:40', 'kwilsonkr');
INSERT INTO `settings` VALUES ('750', 'Menominee', 'nulla ac enim in tempor turpis nec euismod scelerisque', '1', '2014-09-22 07:29:31', 'mcolemanks', '2015-06-30 02:31:40', 'caustinks');
INSERT INTO `settings` VALUES ('751', 'Kiowa', 'sed vestibulum sit amet cursus', '0', '2015-03-02 17:50:13', 'kfieldskt', '2015-05-27 23:36:56', 'tgordonkt');
INSERT INTO `settings` VALUES ('752', 'Colville', 'interdum mauris ullamcorper purus sit amet nulla quisque', '0', '2014-10-23 04:27:17', 'shenryku', '2014-11-24 08:09:42', 'cmartinezku');
INSERT INTO `settings` VALUES ('753', 'Lumbee', 'risus praesent lectus vestibulum quam sapien varius ut', '1', '2015-03-24 00:05:27', 'mdaykv', '2015-03-17 16:03:12', 'amendozakv');
INSERT INTO `settings` VALUES ('754', 'Argentinian', 'augue vel accumsan tellus nisi eu orci', '0', '2015-05-12 04:54:52', 'bjordankw', '2015-01-02 01:20:40', 'esullivankw');
INSERT INTO `settings` VALUES ('755', 'Spaniard', 'primis in faucibus orci luctus', '1', '2014-09-22 16:26:05', 'mjohnsonkx', '2014-11-13 18:55:05', 'dedwardskx');
INSERT INTO `settings` VALUES ('756', 'Guamanian', 'quisque arcu libero rutrum ac lobortis vel dapibus', '1', '2015-07-11 07:05:28', 'chicksky', '2014-10-05 18:41:42', 'agrahamky');
INSERT INTO `settings` VALUES ('757', 'Yakama', 'enim blandit mi in porttitor pede justo eu', '1', '2014-10-28 00:41:30', 'hstanleykz', '2014-11-25 07:44:26', 'blynchkz');
INSERT INTO `settings` VALUES ('758', 'Chippewa', 'donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', '0', '2014-08-20 19:01:30', 'afullerl0', '2015-03-27 09:01:56', 'lmccoyl0');
INSERT INTO `settings` VALUES ('759', 'Malaysian', 'lobortis convallis tortor risus dapibus augue vel accumsan', '1', '2015-08-06 02:15:05', 'slewisl1', '2015-07-03 00:38:30', 'nwellsl1');
INSERT INTO `settings` VALUES ('760', 'Tohono O\'Odham', 'id lobortis convallis tortor risus dapibus augue vel accumsan', '0', '2015-03-18 15:22:45', 'tdixonl2', '2014-12-22 12:13:30', 'nwoodl2');
INSERT INTO `settings` VALUES ('761', 'Chilean', 'neque aenean auctor gravida sem praesent id massa id nisl', '0', '2015-06-21 21:10:09', 'rowensl3', '2014-08-25 13:59:41', 'sberryl3');
INSERT INTO `settings` VALUES ('762', 'Micronesian', 'purus aliquet at feugiat non pretium quis lectus', '1', '2014-09-18 12:26:06', 'epiercel4', '2014-09-19 13:58:21', 'mmatthewsl4');
INSERT INTO `settings` VALUES ('763', 'Chippewa', 'sapien in sapien iaculis congue vivamus metus', '1', '2015-05-29 18:09:28', 'crogersl5', '2014-09-30 03:30:21', 'acampbelll5');
INSERT INTO `settings` VALUES ('764', 'Central American', 'amet consectetuer adipiscing elit proin risus praesent lectus', '1', '2015-06-27 02:23:47', 'elongl6', '2014-11-05 13:01:26', 'eruizl6');
INSERT INTO `settings` VALUES ('765', 'Yuman', 'felis sed interdum venenatis turpis enim blandit mi in porttitor', '1', '2014-12-09 14:58:15', 'nmitchelll7', '2015-03-14 14:31:47', 'slongl7');
INSERT INTO `settings` VALUES ('766', 'Ute', 'id consequat in consequat ut nulla', '1', '2015-03-24 06:03:28', 'fmendozal8', '2015-01-27 10:23:30', 'jfreemanl8');
INSERT INTO `settings` VALUES ('767', 'Honduran', 'magna vulputate luctus cum sociis natoque penatibus et magnis', '1', '2014-09-13 06:14:03', 'scolemanl9', '2014-10-25 22:48:52', 'jscottl9');
INSERT INTO `settings` VALUES ('768', 'Ottawa', 'vel ipsum praesent blandit lacinia', '1', '2015-01-18 14:04:44', 'tfreemanla', '2015-06-26 18:18:04', 'wortizla');
INSERT INTO `settings` VALUES ('769', 'White', 'in lacus curabitur at ipsum ac tellus semper interdum', '0', '2014-11-08 02:24:37', 'vwoodlb', '2014-08-15 19:39:51', 'sruizlb');
INSERT INTO `settings` VALUES ('770', 'Honduran', 'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', '0', '2015-03-10 12:09:45', 'tblacklc', '2015-01-22 15:14:27', 'bhowardlc');
INSERT INTO `settings` VALUES ('771', 'Asian', 'fusce lacus purus aliquet at feugiat', '0', '2014-12-04 09:05:05', 'swoodsld', '2014-11-19 09:00:25', 'mcunninghamld');
INSERT INTO `settings` VALUES ('772', 'Vietnamese', 'a feugiat et eros vestibulum ac est lacinia nisi', '1', '2014-09-05 04:06:20', 'adayle', '2014-12-18 18:39:07', 'jnguyenle');
INSERT INTO `settings` VALUES ('773', 'Bangladeshi', 'arcu adipiscing molestie hendrerit at vulputate vitae', '0', '2015-03-05 08:37:32', 'eshawlf', '2015-03-15 22:25:01', 'treedlf');
INSERT INTO `settings` VALUES ('774', 'Korean', 'sed ante vivamus tortor duis', '0', '2014-12-08 16:23:39', 'marnoldlg', '2014-11-10 09:45:35', 'jgibsonlg');
INSERT INTO `settings` VALUES ('775', 'Alaska Native', 'sed sagittis nam congue risus semper', '1', '2014-10-29 08:20:18', 'ahawkinslh', '2015-01-18 04:54:42', 'alarsonlh');
INSERT INTO `settings` VALUES ('776', 'Sioux', 'lorem ipsum dolor sit amet consectetuer', '0', '2014-10-27 14:37:51', 'jsanchezli', '2015-01-23 14:22:26', 'rlewisli');
INSERT INTO `settings` VALUES ('777', 'Chickasaw', 'magna at nunc commodo placerat praesent', '0', '2015-02-14 21:42:54', 'rcolemanlj', '2014-12-05 14:10:47', 'bwalkerlj');
INSERT INTO `settings` VALUES ('778', 'Ecuadorian', 'aliquet at feugiat non pretium', '0', '2014-10-28 20:17:00', 'jharrisonlk', '2015-04-09 22:57:44', 'bburtonlk');
INSERT INTO `settings` VALUES ('779', 'Kiowa', 'vel ipsum praesent blandit lacinia erat vestibulum sed', '0', '2015-04-11 20:15:40', 'jrichardsonll', '2015-05-29 20:22:18', 'fbakerll');
INSERT INTO `settings` VALUES ('780', 'Colombian', 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis', '1', '2014-12-15 02:55:08', 'afosterlm', '2015-07-19 17:31:19', 'amorrislm');
INSERT INTO `settings` VALUES ('781', 'Alaska Native', 'luctus tincidunt nulla mollis molestie', '1', '2015-04-26 14:38:04', 'jsnyderln', '2014-09-14 08:31:35', 'cmurrayln');
INSERT INTO `settings` VALUES ('782', 'Puget Sound Salish', 'sit amet consectetuer adipiscing elit proin', '1', '2014-08-12 05:10:34', 'wramoslo', '2015-01-06 19:50:12', 'hmedinalo');
INSERT INTO `settings` VALUES ('783', 'Blackfeet', 'imperdiet et commodo vulputate justo in blandit ultrices', '0', '2015-06-25 06:38:22', 'rsnyderlp', '2015-07-27 02:34:48', 'jreidlp');
INSERT INTO `settings` VALUES ('784', 'Potawatomi', 'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', '1', '2014-10-06 16:16:30', 'ccarrlq', '2015-03-21 15:06:53', 'walexanderlq');
INSERT INTO `settings` VALUES ('785', 'Navajo', 'nulla nunc purus phasellus in felis donec semper sapien', '0', '2014-09-21 09:29:28', 'elittlelr', '2015-05-19 15:08:44', 'rbarneslr');
INSERT INTO `settings` VALUES ('786', 'Asian Indian', 'est lacinia nisi venenatis tristique', '0', '2014-11-13 06:19:44', 'kellisls', '2015-05-30 00:18:35', 'cwashingtonls');
INSERT INTO `settings` VALUES ('787', 'Potawatomi', 'turpis sed ante vivamus tortor duis mattis egestas', '0', '2015-06-28 08:09:00', 'ngonzaleslt', '2015-03-16 22:27:25', 'aroselt');
INSERT INTO `settings` VALUES ('788', 'Cherokee', 'in porttitor pede justo eu massa donec dapibus duis at', '1', '2015-06-14 12:01:12', 'sharrislu', '2015-02-18 21:26:44', 'pharrislu');
INSERT INTO `settings` VALUES ('789', 'Native Hawaiian', 'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum', '0', '2015-03-05 02:53:01', 'rhunterlv', '2015-04-20 00:07:03', 'bhugheslv');
INSERT INTO `settings` VALUES ('790', 'Alaskan Athabascan', 'vestibulum ante ipsum primis in', '1', '2015-07-06 00:08:51', 'kgarzalw', '2015-02-07 23:26:08', 'kperrylw');
INSERT INTO `settings` VALUES ('791', 'Melanesian', 'felis fusce posuere felis sed lacus morbi sem', '0', '2015-03-29 04:59:53', 'abradleylx', '2015-06-25 01:39:56', 'aberrylx');
INSERT INTO `settings` VALUES ('792', 'Kiowa', 'magna bibendum imperdiet nullam orci pede venenatis non', '0', '2014-09-03 14:21:24', 'tcruzly', '2015-05-19 15:39:38', 'etuckerly');
INSERT INTO `settings` VALUES ('793', 'Chilean', 'at feugiat non pretium quis lectus suspendisse potenti', '0', '2014-11-10 02:13:47', 'jschmidtlz', '2015-03-16 11:49:00', 'kbishoplz');
INSERT INTO `settings` VALUES ('794', 'Ottawa', 'nulla pede ullamcorper augue a suscipit nulla elit ac nulla', '1', '2015-08-06 15:24:29', 'jedwardsm0', '2015-04-23 09:32:25', 'dcolem0');
INSERT INTO `settings` VALUES ('795', 'Ottawa', 'nullam porttitor lacus at turpis donec', '1', '2015-07-29 13:39:34', 'dandrewsm1', '2015-02-19 00:48:43', 'hlanem1');
INSERT INTO `settings` VALUES ('796', 'Tongan', 'convallis tortor risus dapibus augue vel', '0', '2015-04-16 10:31:58', 'rnguyenm2', '2015-04-10 14:31:58', 'wporterm2');
INSERT INTO `settings` VALUES ('797', 'Cuban', 'libero quis orci nullam molestie nibh in', '0', '2015-03-21 14:43:24', 'wmorganm3', '2015-03-11 06:34:42', 'rsnyderm3');
INSERT INTO `settings` VALUES ('798', 'Yuman', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida', '0', '2015-07-31 19:22:53', 'rryanm4', '2014-10-03 22:56:02', 'tmasonm4');
INSERT INTO `settings` VALUES ('799', 'Bangladeshi', 'justo lacinia eget tincidunt eget tempus vel pede morbi porttitor', '1', '2015-07-28 14:57:50', 'lpattersonm5', '2014-10-19 06:47:42', 'lbrooksm5');
INSERT INTO `settings` VALUES ('800', 'Delaware', 'amet eros suspendisse accumsan tortor quis turpis sed', '0', '2015-05-18 18:13:33', 'rlewism6', '2014-12-27 13:09:29', 'jtaylorm6');
INSERT INTO `settings` VALUES ('801', 'Nicaraguan', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', '1', '2014-10-04 22:20:51', 'lmorrism7', '2014-11-30 12:45:17', 'jperrym7');
INSERT INTO `settings` VALUES ('802', 'Apache', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui', '0', '2015-01-10 00:14:26', 'mjordanm8', '2015-05-04 22:24:29', 'ljenkinsm8');
INSERT INTO `settings` VALUES ('803', 'American Indian and Alaska Native (AIAN)', 'molestie nibh in lectus pellentesque at nulla suspendisse', '0', '2015-05-22 23:56:39', 'sadamsm9', '2015-02-28 21:43:59', 'hjacksonm9');
INSERT INTO `settings` VALUES ('804', 'Cambodian', 'erat id mauris vulputate elementum nullam varius', '0', '2014-09-22 20:34:09', 'dgardnerma', '2014-10-26 08:10:47', 'alopezma');
INSERT INTO `settings` VALUES ('805', 'Choctaw', 'eros viverra eget congue eget semper rutrum nulla', '1', '2014-11-03 10:31:51', 'rgilbertmb', '2014-08-11 09:10:49', 'cstanleymb');
INSERT INTO `settings` VALUES ('806', 'Chickasaw', 'nisi volutpat eleifend donec ut dolor morbi vel', '0', '2014-09-30 23:30:54', 'jkellymc', '2015-03-03 23:05:27', 'jriveramc');
INSERT INTO `settings` VALUES ('807', 'Pueblo', 'vehicula consequat morbi a ipsum integer a nibh', '1', '2015-01-19 13:25:53', 'amurphymd', '2014-09-06 05:11:50', 'dolivermd');
INSERT INTO `settings` VALUES ('808', 'Yaqui', 'at turpis donec posuere metus vitae ipsum aliquam non', '0', '2015-01-25 01:07:59', 'pclarkme', '2015-03-24 16:45:24', 'pmarshallme');
INSERT INTO `settings` VALUES ('809', 'Indonesian', 'nec dui luctus rutrum nulla tellus in', '0', '2015-06-24 06:05:54', 'clanemf', '2015-03-25 01:12:27', 'jcollinsmf');
INSERT INTO `settings` VALUES ('810', 'Iroquois', 'luctus et ultrices posuere cubilia curae nulla', '0', '2015-05-09 19:37:24', 'hwalkermg', '2015-04-28 21:30:42', 'jknightmg');
INSERT INTO `settings` VALUES ('811', 'Vietnamese', 'ipsum primis in faucibus orci luctus et ultrices posuere', '0', '2014-12-11 16:17:12', 'dspencermh', '2015-05-04 13:19:22', 'jchapmanmh');
INSERT INTO `settings` VALUES ('812', 'Delaware', 'amet eleifend pede libero quis', '0', '2015-04-21 00:20:29', 'rjamesmi', '2015-03-21 09:12:43', 'dfranklinmi');
INSERT INTO `settings` VALUES ('813', 'Spaniard', 'luctus et ultrices posuere cubilia curae donec', '0', '2015-03-20 04:47:54', 'pwallacemj', '2014-12-02 17:35:12', 'pjonesmj');
INSERT INTO `settings` VALUES ('814', 'Thai', 'faucibus orci luctus et ultrices posuere cubilia', '1', '2014-08-24 08:27:01', 'rcarrollmk', '2015-01-06 10:55:16', 'mgonzalezmk');
INSERT INTO `settings` VALUES ('815', 'Costa Rican', 'nibh in hac habitasse platea dictumst', '0', '2015-01-13 23:54:28', 'randersonml', '2014-12-31 14:20:57', 'rriveraml');
INSERT INTO `settings` VALUES ('816', 'Ottawa', 'in quam fringilla rhoncus mauris enim', '0', '2015-01-14 21:32:46', 'jgonzalesmm', '2015-04-27 18:17:59', 'pfranklinmm');
INSERT INTO `settings` VALUES ('817', 'Peruvian', 'tristique in tempus sit amet sem fusce', '0', '2015-08-01 09:37:41', 'lpattersonmn', '2014-11-25 07:09:26', 'jtorresmn');
INSERT INTO `settings` VALUES ('818', 'Sioux', 'ut volutpat sapien arcu sed augue aliquam erat volutpat in', '0', '2014-12-17 10:10:39', 'rwatkinsmo', '2015-06-23 10:37:57', 'lportermo');
INSERT INTO `settings` VALUES ('819', 'Bangladeshi', 'mi in porttitor pede justo eu massa donec', '1', '2014-12-12 21:12:42', 'rgardnermp', '2015-03-11 10:24:12', 'abradleymp');
INSERT INTO `settings` VALUES ('820', 'Argentinian', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', '0', '2015-05-02 11:29:48', 'jhicksmq', '2014-10-23 13:55:25', 'hhernandezmq');
INSERT INTO `settings` VALUES ('821', 'Laotian', 'iaculis justo in hac habitasse platea dictumst', '0', '2015-01-21 00:47:31', 'mmitchellmr', '2015-07-26 18:04:59', 'fjohnstonmr');
INSERT INTO `settings` VALUES ('822', 'Puget Sound Salish', 'in porttitor pede justo eu', '1', '2015-01-12 12:36:21', 'rharrisonms', '2014-09-17 20:41:49', 'ethomasms');
INSERT INTO `settings` VALUES ('823', 'Sioux', 'sed tristique in tempus sit amet', '0', '2014-09-02 13:38:32', 'cbakermt', '2014-11-16 21:23:16', 'swoodsmt');
INSERT INTO `settings` VALUES ('824', 'Eskimo', 'duis bibendum morbi non quam nec dui luctus rutrum nulla', '1', '2015-02-23 05:27:44', 'mhowellmu', '2014-08-29 13:13:27', 'nwoodsmu');
INSERT INTO `settings` VALUES ('825', 'Blackfeet', 'porta volutpat quam pede lobortis ligula sit amet eleifend', '0', '2014-09-04 11:34:53', 'kbrownmv', '2015-07-09 12:21:13', 'rwhitemv');
INSERT INTO `settings` VALUES ('826', 'Menominee', 'pretium iaculis diam erat fermentum justo nec condimentum', '1', '2015-02-22 05:40:02', 'jfordmw', '2015-02-18 00:14:01', 'swheelermw');
INSERT INTO `settings` VALUES ('827', 'Yakama', 'aenean auctor gravida sem praesent id massa id nisl venenatis', '1', '2015-01-09 23:38:57', 'jrobinsonmx', '2014-09-25 22:21:06', 'bcoopermx');
INSERT INTO `settings` VALUES ('828', 'Dominican (Dominican Republic)', 'eget eros elementum pellentesque quisque porta', '0', '2015-02-09 13:07:59', 'nparkermy', '2014-10-06 13:17:52', 'kfergusonmy');
INSERT INTO `settings` VALUES ('829', 'Cherokee', 'massa volutpat convallis morbi odio odio elementum', '1', '2015-01-24 11:09:46', 'pmarshallmz', '2014-09-21 15:53:23', 'pwilliamsonmz');
INSERT INTO `settings` VALUES ('830', 'Kiowa', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit', '0', '2015-02-22 04:27:37', 'cramirezn0', '2014-08-15 05:55:09', 'jpetersonn0');
INSERT INTO `settings` VALUES ('831', 'Alaskan Athabascan', 'vivamus tortor duis mattis egestas metus aenean fermentum donec', '1', '2014-11-02 01:06:03', 'amoralesn1', '2015-05-10 21:08:25', 'ahansonn1');
INSERT INTO `settings` VALUES ('832', 'Colombian', 'sit amet turpis elementum ligula vehicula consequat', '0', '2014-10-22 03:30:00', 'smooren2', '2015-01-04 11:08:27', 'wparkern2');
INSERT INTO `settings` VALUES ('833', 'Salvadoran', 'nec condimentum neque sapien placerat ante', '0', '2015-01-11 23:14:50', 'wsimsn3', '2015-08-05 13:23:14', 'dallenn3');
INSERT INTO `settings` VALUES ('834', 'Native Hawaiian', 'eros suspendisse accumsan tortor quis turpis sed ante', '0', '2015-03-29 13:44:02', 'jlarsonn4', '2015-01-26 03:15:17', 'scarpentern4');
INSERT INTO `settings` VALUES ('835', 'Crow', 'amet cursus id turpis integer aliquet massa', '1', '2014-12-05 09:58:09', 'tryann5', '2015-07-24 11:25:34', 'ahowardn5');
INSERT INTO `settings` VALUES ('836', 'Korean', 'dis parturient montes nascetur ridiculus mus etiam vel', '0', '2015-02-08 21:56:38', 'wallenn6', '2014-12-14 15:19:05', 'rwatkinsn6');
INSERT INTO `settings` VALUES ('837', 'Cherokee', 'eu mi nulla ac enim in tempor turpis nec', '1', '2015-06-08 23:12:01', 'cmoralesn7', '2015-07-20 14:45:13', 'rowensn7');
INSERT INTO `settings` VALUES ('838', 'Alaskan Athabascan', 'ante ipsum primis in faucibus orci luctus et', '0', '2015-01-22 22:27:42', 'lhowelln8', '2015-02-04 05:10:52', 'msandersn8');
INSERT INTO `settings` VALUES ('839', 'Cuban', 'nibh quisque id justo sit amet sapien', '0', '2014-11-18 20:44:19', 'alynchn9', '2015-04-06 22:40:07', 'kwilliamsn9');
INSERT INTO `settings` VALUES ('840', 'Melanesian', 'penatibus et magnis dis parturient', '0', '2015-06-21 15:57:37', 'ecolemanna', '2014-09-09 00:26:45', 'eyoungna');
INSERT INTO `settings` VALUES ('841', 'Peruvian', 'vel accumsan tellus nisi eu orci mauris lacinia sapien', '0', '2014-10-27 23:24:49', 'twoodnb', '2015-02-18 02:25:07', 'mkelleynb');
INSERT INTO `settings` VALUES ('842', 'Creek', 'elit proin risus praesent lectus vestibulum quam', '0', '2015-01-05 06:42:14', 'rwebbnc', '2015-02-10 14:51:52', 'sgarcianc');
INSERT INTO `settings` VALUES ('843', 'Nicaraguan', 'pede justo lacinia eget tincidunt eget tempus vel pede morbi', '0', '2015-02-28 13:15:38', 'etuckernd', '2014-12-07 15:59:59', 'arobinsonnd');
INSERT INTO `settings` VALUES ('844', 'American Indian', 'non velit donec diam neque vestibulum', '0', '2015-04-18 15:54:10', 'bbellne', '2015-06-19 03:38:32', 'bcastillone');
INSERT INTO `settings` VALUES ('845', 'Sri Lankan', 'et magnis dis parturient montes nascetur ridiculus mus', '0', '2015-05-09 23:06:08', 'bsimpsonnf', '2015-06-17 21:02:33', 'jhenrynf');
INSERT INTO `settings` VALUES ('846', 'Lumbee', 'felis fusce posuere felis sed lacus morbi', '0', '2014-12-01 09:41:50', 'gnicholsng', '2015-06-25 10:12:14', 'spetersonng');
INSERT INTO `settings` VALUES ('847', 'Cree', 'aliquam lacus morbi quis tortor id nulla', '0', '2015-02-09 03:23:54', 'khallnh', '2015-03-12 06:20:18', 'mcolemannh');
INSERT INTO `settings` VALUES ('848', 'South American', 'vitae ipsum aliquam non mauris morbi non lectus aliquam', '0', '2015-04-11 10:27:49', 'msanchezni', '2014-12-05 11:34:42', 'kwestni');
INSERT INTO `settings` VALUES ('849', 'Tongan', 'lacus at velit vivamus vel nulla eget', '0', '2015-02-16 05:56:51', 'bgardnernj', '2015-01-10 19:36:50', 'ptaylornj');
INSERT INTO `settings` VALUES ('850', 'Houma', 'aenean lectus pellentesque eget nunc donec quis orci', '0', '2015-01-19 03:33:46', 'ppetersonnk', '2015-08-07 01:29:39', 'hpaynenk');
INSERT INTO `settings` VALUES ('851', 'Puerto Rican', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', '0', '2014-12-22 18:49:07', 'lhallnl', '2014-12-14 19:59:50', 'hharrisonnl');
INSERT INTO `settings` VALUES ('852', 'Native Hawaiian', 'duis aliquam convallis nunc proin at turpis', '1', '2015-05-11 08:02:36', 'rbradleynm', '2015-05-28 07:35:27', 'mscottnm');
INSERT INTO `settings` VALUES ('853', 'Apache', 'faucibus orci luctus et ultrices posuere cubilia curae mauris', '1', '2015-03-01 05:24:42', 'mcarternn', '2014-09-21 20:16:12', 'jfishernn');
INSERT INTO `settings` VALUES ('854', 'Malaysian', 'blandit nam nulla integer pede justo', '0', '2014-12-17 06:26:40', 'cfisherno', '2014-10-01 00:40:49', 'ehernandezno');
INSERT INTO `settings` VALUES ('855', 'Japanese', 'eu tincidunt in leo maecenas pulvinar lobortis est', '0', '2014-09-15 06:27:12', 'gdeannp', '2015-01-17 20:07:17', 'walvareznp');
INSERT INTO `settings` VALUES ('856', 'Nicaraguan', 'a nibh in quis justo maecenas', '0', '2014-09-03 06:45:25', 'nparkernq', '2015-08-06 05:02:46', 'crodrigueznq');
INSERT INTO `settings` VALUES ('857', 'Laotian', 'sit amet nunc viverra dapibus', '1', '2015-06-05 02:34:08', 'rlynchnr', '2014-09-17 19:56:06', 'csandersnr');
INSERT INTO `settings` VALUES ('858', 'Micronesian', 'tortor risus dapibus augue vel accumsan tellus', '1', '2014-11-12 20:04:00', 'mtorresns', '2015-04-22 01:08:34', 'achapmanns');
INSERT INTO `settings` VALUES ('859', 'Peruvian', 'tristique fusce congue diam id ornare imperdiet sapien urna pretium', '0', '2014-10-06 08:29:45', 'dmendozant', '2014-11-05 10:39:07', 'gbrooksnt');
INSERT INTO `settings` VALUES ('860', 'American Indian', 'in leo maecenas pulvinar lobortis', '0', '2015-01-30 10:35:31', 'rduncannu', '2015-06-28 03:48:56', 'scoxnu');
INSERT INTO `settings` VALUES ('861', 'Eskimo', 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget', '0', '2014-10-01 18:28:33', 'bdanielsnv', '2014-10-05 21:19:42', 'alongnv');
INSERT INTO `settings` VALUES ('862', 'Peruvian', 'pede lobortis ligula sit amet eleifend pede libero', '1', '2015-02-08 08:11:32', 'myoungnw', '2015-05-19 01:05:02', 'cmillsnw');
INSERT INTO `settings` VALUES ('863', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'condimentum id luctus nec molestie sed justo', '1', '2015-07-27 01:34:42', 'jolsonnx', '2015-03-07 02:13:12', 'idunnnx');
INSERT INTO `settings` VALUES ('864', 'Melanesian', 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus', '0', '2014-10-01 15:43:39', 'amedinany', '2015-07-31 01:01:59', 'jbutlerny');
INSERT INTO `settings` VALUES ('865', 'Choctaw', 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio', '1', '2014-09-20 02:41:55', 'ptorresnz', '2014-09-10 19:49:51', 'wshawnz');
INSERT INTO `settings` VALUES ('866', 'Eskimo', 'elit sodales scelerisque mauris sit amet eros suspendisse', '0', '2014-11-27 10:41:38', 'gandrewso0', '2015-02-23 04:26:59', 'asanderso0');
INSERT INTO `settings` VALUES ('867', 'Thai', 'duis at velit eu est congue elementum in hac', '0', '2014-09-21 17:30:44', 'adiazo1', '2014-10-16 08:03:46', 'jyoungo1');
INSERT INTO `settings` VALUES ('868', 'Ecuadorian', 'phasellus in felis donec semper sapien a libero nam dui', '1', '2014-11-13 12:23:06', 'ssimmonso2', '2014-11-05 13:51:47', 'dolivero2');
INSERT INTO `settings` VALUES ('869', 'Ecuadorian', 'ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', '0', '2014-12-23 04:20:24', 'akelleyo3', '2015-03-14 21:11:45', 'rnelsono3');
INSERT INTO `settings` VALUES ('870', 'Delaware', 'lobortis vel dapibus at diam nam tristique', '0', '2014-12-12 05:05:21', 'dramirezo4', '2014-09-04 04:06:14', 'aportero4');
INSERT INTO `settings` VALUES ('871', 'Puget Sound Salish', 'maecenas tincidunt lacus at velit vivamus', '0', '2014-09-17 04:26:48', 'crileyo5', '2014-12-31 08:33:30', 'dramirezo5');
INSERT INTO `settings` VALUES ('872', 'Pakistani', 'feugiat et eros vestibulum ac', '1', '2015-08-05 02:59:42', 'wlawsono6', '2014-11-01 00:03:44', 'ahuntero6');
INSERT INTO `settings` VALUES ('873', 'Cuban', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat', '1', '2014-12-13 12:53:25', 'chendersono7', '2014-11-05 11:10:46', 'rspencero7');
INSERT INTO `settings` VALUES ('874', 'Guatemalan', 'consequat metus sapien ut nunc', '1', '2015-04-30 14:03:08', 'lschmidto8', '2015-06-26 11:29:09', 'jmontgomeryo8');
INSERT INTO `settings` VALUES ('875', 'Seminole', 'consequat nulla nisl nunc nisl duis bibendum', '0', '2015-02-02 18:57:14', 'smyerso9', '2015-01-06 07:22:24', 'lwhiteo9');
INSERT INTO `settings` VALUES ('876', 'Central American', 'ultrices libero non mattis pulvinar nulla pede', '0', '2015-06-24 10:26:53', 'jvasquezoa', '2014-11-03 02:41:53', 'hwrightoa');
INSERT INTO `settings` VALUES ('877', 'Yaqui', 'erat vestibulum sed magna at nunc commodo placerat praesent', '1', '2015-02-27 03:55:08', 'dhowardob', '2015-04-03 21:14:12', 'jjacobsob');
INSERT INTO `settings` VALUES ('878', 'Osage', 'turpis integer aliquet massa id', '0', '2015-06-23 23:39:18', 'jstoneoc', '2014-09-26 10:19:11', 'ahenryoc');
INSERT INTO `settings` VALUES ('879', 'Nicaraguan', 'consequat varius integer ac leo pellentesque ultrices mattis odio donec', '1', '2015-07-13 02:11:23', 'dstanleyod', '2015-01-16 16:47:35', 'cleeod');
INSERT INTO `settings` VALUES ('880', 'Ute', 'convallis tortor risus dapibus augue vel accumsan tellus', '1', '2015-01-29 15:00:28', 'dlynchoe', '2015-02-01 02:04:03', 'fhowelloe');
INSERT INTO `settings` VALUES ('881', 'South American', 'nisi at nibh in hac', '0', '2014-12-20 10:45:20', 'dlittleof', '2015-07-26 00:36:12', 'kwheelerof');
INSERT INTO `settings` VALUES ('882', 'Colville', 'tempus semper est quam pharetra magna ac consequat metus sapien', '1', '2015-03-11 18:07:35', 'jlawrenceog', '2014-12-13 22:24:33', 'sadamsog');
INSERT INTO `settings` VALUES ('883', 'Crow', 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula', '1', '2014-09-16 18:49:42', 'nstewartoh', '2015-03-22 09:18:11', 'tstoneoh');
INSERT INTO `settings` VALUES ('884', 'Shoshone', 'praesent lectus vestibulum quam sapien varius ut blandit', '1', '2015-04-25 21:05:01', 'hwebboi', '2014-11-17 22:54:57', 'rbelloi');
INSERT INTO `settings` VALUES ('885', 'Polynesian', 'tellus nisi eu orci mauris lacinia sapien', '0', '2015-01-08 05:10:14', 'dharrisoj', '2015-03-03 09:25:14', 'rmarshalloj');
INSERT INTO `settings` VALUES ('886', 'Puerto Rican', 'augue vestibulum ante ipsum primis', '0', '2015-03-01 20:20:47', 'kbarnesok', '2014-11-16 12:42:57', 'cgilbertok');
INSERT INTO `settings` VALUES ('887', 'Puerto Rican', 'ut volutpat sapien arcu sed', '0', '2015-01-18 05:28:09', 'jkellyol', '2014-09-25 00:29:08', 'jkelleyol');
INSERT INTO `settings` VALUES ('888', 'Polynesian', 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id', '0', '2014-12-06 17:49:43', 'bmcdonaldom', '2015-03-08 22:14:52', 'pstoneom');
INSERT INTO `settings` VALUES ('889', 'Ecuadorian', 'ut mauris eget massa tempor convallis nulla neque', '0', '2015-04-27 22:35:29', 'aoliveron', '2015-03-02 00:05:00', 'drichardsonon');
INSERT INTO `settings` VALUES ('890', 'Ecuadorian', 'quisque porta volutpat erat quisque erat', '1', '2014-11-17 06:00:20', 'tcooperoo', '2015-08-09 14:03:27', 'hlopezoo');
INSERT INTO `settings` VALUES ('891', 'Venezuelan', 'velit vivamus vel nulla eget eros elementum pellentesque quisque', '0', '2014-09-04 02:01:00', 'tevansop', '2014-12-17 06:42:08', 'alewisop');
INSERT INTO `settings` VALUES ('892', 'Asian Indian', 'vestibulum aliquet ultrices erat tortor sollicitudin mi', '0', '2015-04-01 14:23:01', 'mcookoq', '2015-08-03 15:56:46', 'jrobertsonoq');
INSERT INTO `settings` VALUES ('893', 'Fijian', 'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan', '1', '2015-03-26 01:11:04', 'rbakeror', '2014-10-05 13:51:00', 'jpalmeror');
INSERT INTO `settings` VALUES ('894', 'Alaskan Athabascan', 'in felis donec semper sapien a', '0', '2015-03-29 06:01:16', 'coliveros', '2015-05-19 03:57:52', 'sandersonos');
INSERT INTO `settings` VALUES ('895', 'Indonesian', 'mauris enim leo rhoncus sed vestibulum sit amet cursus', '0', '2015-04-04 16:41:58', 'lolsonot', '2014-11-21 00:05:28', 'abarnesot');
INSERT INTO `settings` VALUES ('896', 'Navajo', 'tristique est et tempus semper est quam', '0', '2015-06-27 02:14:10', 'mjohnstonou', '2014-11-24 21:54:54', 'gsmithou');
INSERT INTO `settings` VALUES ('897', 'Colombian', 'libero nullam sit amet turpis', '1', '2015-03-31 09:40:48', 'arossov', '2014-10-22 03:19:39', 'jwashingtonov');
INSERT INTO `settings` VALUES ('898', 'Paiute', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', '1', '2015-07-02 22:30:23', 'brichardsonow', '2014-08-29 06:49:54', 'mperkinsow');
INSERT INTO `settings` VALUES ('899', 'Pima', 'nulla tellus in sagittis dui vel', '0', '2015-06-09 01:03:35', 'lhallox', '2015-01-15 21:53:19', 'preynoldsox');
INSERT INTO `settings` VALUES ('900', 'Bolivian', 'sit amet cursus id turpis integer aliquet massa id lobortis', '0', '2015-04-02 12:58:21', 'hfergusonoy', '2014-11-05 14:14:03', 'mhowelloy');
INSERT INTO `settings` VALUES ('901', 'Dominican (Dominican Republic)', 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis', '0', '2015-02-21 04:24:22', 'lgriffinoz', '2015-02-22 07:29:43', 'mmeyeroz');
INSERT INTO `settings` VALUES ('902', 'Shoshone', 'in faucibus orci luctus et ultrices posuere', '0', '2014-12-22 03:38:40', 'dperryp0', '2015-02-27 22:42:06', 'cblackp0');
INSERT INTO `settings` VALUES ('903', 'Thai', 'turpis enim blandit mi in', '0', '2014-10-28 17:10:24', 'rthompsonp1', '2014-09-28 12:39:34', 'khayesp1');
INSERT INTO `settings` VALUES ('904', 'Alaskan Athabascan', 'adipiscing elit proin interdum mauris', '1', '2015-07-12 16:14:37', 'anelsonp2', '2015-04-24 15:51:59', 'apetersonp2');
INSERT INTO `settings` VALUES ('905', 'Black or African American', 'integer pede justo lacinia eget tincidunt eget tempus vel', '0', '2015-01-21 22:04:17', 'caustinp3', '2014-08-23 10:41:03', 'lhillp3');
INSERT INTO `settings` VALUES ('906', 'Comanche', 'nulla facilisi cras non velit nec nisi', '0', '2015-01-19 08:15:53', 'chudsonp4', '2015-04-01 21:45:39', 'jnicholsp4');
INSERT INTO `settings` VALUES ('907', 'Puget Sound Salish', 'lacus at turpis donec posuere', '0', '2015-02-07 09:07:26', 'jnguyenp5', '2014-12-24 00:48:27', 'jclarkp5');
INSERT INTO `settings` VALUES ('908', 'Hmong', 'maecenas leo odio condimentum id', '1', '2014-11-14 16:46:51', 'rduncanp6', '2014-10-09 12:06:59', 'ariverap6');
INSERT INTO `settings` VALUES ('909', 'Potawatomi', 'felis fusce posuere felis sed', '0', '2014-08-19 12:49:48', 'randrewsp7', '2015-02-14 08:31:19', 'mchavezp7');
INSERT INTO `settings` VALUES ('910', 'Costa Rican', 'interdum eu tincidunt in leo maecenas pulvinar', '0', '2014-09-21 00:57:04', 'sharrisonp8', '2015-05-22 09:07:57', 'rsnyderp8');
INSERT INTO `settings` VALUES ('911', 'Comanche', 'lacus at turpis donec posuere metus vitae', '1', '2014-11-29 16:46:59', 'jgibsonp9', '2015-08-05 01:09:18', 'bcookp9');
INSERT INTO `settings` VALUES ('912', 'Seminole', 'sed interdum venenatis turpis enim blandit', '1', '2014-11-27 21:43:10', 'esimmonspa', '2014-09-02 16:22:48', 'lburkepa');
INSERT INTO `settings` VALUES ('913', 'Yaqui', 'metus sapien ut nunc vestibulum ante ipsum primis in', '1', '2014-11-20 08:54:32', 'cbaileypb', '2015-04-29 03:33:57', 'cstanleypb');
INSERT INTO `settings` VALUES ('914', 'Native Hawaiian and Other Pacific Islander (NHPI)', 'donec quis orci eget orci', '0', '2014-12-17 03:36:34', 'rjacobspc', '2014-09-19 21:48:56', 'lrosepc');
INSERT INTO `settings` VALUES ('915', 'Navajo', 'dolor sit amet consectetuer adipiscing elit proin risus praesent', '1', '2015-06-23 18:39:30', 'jaustinpd', '2014-12-28 19:31:28', 'gnguyenpd');
INSERT INTO `settings` VALUES ('916', 'Alaskan Athabascan', 'dapibus at diam nam tristique tortor', '1', '2015-06-21 13:26:11', 'bnguyenpe', '2015-03-17 13:57:47', 'bgonzalezpe');
INSERT INTO `settings` VALUES ('917', 'Alaska Native', 'augue a suscipit nulla elit ac nulla sed', '0', '2015-07-17 12:38:11', 'myoungpf', '2014-08-13 16:01:48', 'rcampbellpf');
INSERT INTO `settings` VALUES ('918', 'Chamorro', 'eros elementum pellentesque quisque porta volutpat erat quisque erat eros', '1', '2015-04-24 03:16:38', 'awilsonpg', '2015-01-19 06:18:06', 'lharveypg');
INSERT INTO `settings` VALUES ('919', 'Tohono O\'Odham', 'dictumst etiam faucibus cursus urna ut tellus', '0', '2015-03-06 01:44:27', 'swilliamsph', '2014-11-16 03:55:36', 'shughesph');
INSERT INTO `settings` VALUES ('920', 'Mexican', 'ac enim in tempor turpis nec euismod scelerisque quam turpis', '0', '2015-03-13 21:18:52', 'rarnoldpi', '2014-10-05 14:48:08', 'jbakerpi');
INSERT INTO `settings` VALUES ('921', 'Ute', 'sem duis aliquam convallis nunc proin at turpis a', '0', '2015-07-21 07:13:56', 'cwoodpj', '2014-11-28 16:09:24', 'jaustinpj');
INSERT INTO `settings` VALUES ('922', 'Tlingit-Haida', 'nunc commodo placerat praesent blandit nam nulla', '0', '2014-11-26 04:53:45', 'bmorenopk', '2015-01-09 16:36:36', 'dmontgomerypk');
INSERT INTO `settings` VALUES ('923', 'Bolivian', 'lorem quisque ut erat curabitur gravida nisi at', '0', '2014-11-23 11:51:22', 'fricepl', '2014-10-22 08:55:24', 'agonzalespl');
INSERT INTO `settings` VALUES ('924', 'Chamorro', 'justo etiam pretium iaculis justo in hac habitasse', '0', '2014-12-06 10:02:13', 'mgeorgepm', '2015-08-04 17:57:58', 'eschmidtpm');
INSERT INTO `settings` VALUES ('925', 'Houma', 'mi integer ac neque duis', '1', '2014-11-09 02:50:38', 'ffosterpn', '2015-03-27 09:59:05', 'awashingtonpn');
INSERT INTO `settings` VALUES ('926', 'South American', 'ultrices posuere cubilia curae nulla dapibus dolor vel est', '0', '2014-12-16 05:56:27', 'nhendersonpo', '2014-08-12 19:06:36', 'pharrisonpo');
INSERT INTO `settings` VALUES ('927', 'American Indian and Alaska Native (AIAN)', 'libero ut massa volutpat convallis', '1', '2015-03-29 13:49:51', 'bmeyerpp', '2015-04-06 14:56:01', 'kraypp');
INSERT INTO `settings` VALUES ('928', 'Shoshone', 'nulla tempus vivamus in felis eu sapien cursus vestibulum', '0', '2015-02-27 02:03:10', 'jpattersonpq', '2014-11-16 06:58:00', 'bpeterspq');
INSERT INTO `settings` VALUES ('929', 'Korean', 'metus vitae ipsum aliquam non mauris morbi non lectus', '1', '2015-07-07 16:12:31', 'jnelsonpr', '2014-11-23 06:55:36', 'llongpr');
INSERT INTO `settings` VALUES ('930', 'Latin American Indian', 'nunc rhoncus dui vel sem sed sagittis nam congue', '1', '2015-05-19 20:22:39', 'mbarnesps', '2015-07-24 08:48:50', 'dblackps');
INSERT INTO `settings` VALUES ('931', 'Polynesian', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend', '1', '2015-07-22 01:01:14', 'hhartpt', '2015-05-10 04:24:45', 'rmontgomerypt');
INSERT INTO `settings` VALUES ('932', 'Comanche', 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec', '0', '2014-08-19 00:34:43', 'lwrightpu', '2015-01-02 23:16:31', 'gcarpenterpu');
INSERT INTO `settings` VALUES ('933', 'Cuban', 'vel augue vestibulum ante ipsum primis', '0', '2015-04-28 05:09:46', 'amoralespv', '2015-04-17 19:26:33', 'rbrownpv');
INSERT INTO `settings` VALUES ('934', 'Latin American Indian', 'nulla dapibus dolor vel est donec odio justo sollicitudin ut', '1', '2014-08-27 23:08:00', 'jcollinspw', '2015-05-20 09:20:00', 'jhenrypw');
INSERT INTO `settings` VALUES ('935', 'Iroquois', 'sapien dignissim vestibulum vestibulum ante ipsum primis', '1', '2014-08-21 10:16:30', 'lmartinezpx', '2014-08-15 06:15:57', 'lpattersonpx');
INSERT INTO `settings` VALUES ('936', 'Peruvian', 'pellentesque ultrices mattis odio donec', '0', '2014-10-07 23:03:55', 'dcampbellpy', '2015-07-16 23:35:44', 'smurraypy');
INSERT INTO `settings` VALUES ('937', 'Cheyenne', 'porttitor lacus at turpis donec posuere', '0', '2015-03-11 17:01:23', 'pfoxpz', '2014-10-20 03:29:47', 'jmorrispz');
INSERT INTO `settings` VALUES ('938', 'Polynesian', 'diam id ornare imperdiet sapien urna pretium nisl ut', '1', '2014-11-28 10:21:25', 'wberryq0', '2015-01-02 02:22:42', 'lwillisq0');
INSERT INTO `settings` VALUES ('939', 'Chamorro', 'ultrices erat tortor sollicitudin mi sit amet', '0', '2015-04-09 00:25:38', 'tmoralesq1', '2014-10-09 22:34:47', 'tgonzalesq1');
INSERT INTO `settings` VALUES ('940', 'Colville', 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat', '1', '2015-06-01 06:39:59', 'jmartinq2', '2015-05-09 13:19:22', 'hmorganq2');
INSERT INTO `settings` VALUES ('941', 'Uruguayan', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet', '1', '2015-05-31 02:20:55', 'whowellq3', '2015-02-11 23:37:34', 'jjamesq3');
INSERT INTO `settings` VALUES ('942', 'Sri Lankan', 'est quam pharetra magna ac consequat metus', '1', '2015-05-28 04:00:07', 'nkellyq4', '2015-07-14 20:47:30', 'bwebbq4');
INSERT INTO `settings` VALUES ('943', 'Panamanian', 'lectus suspendisse potenti in eleifend quam a', '1', '2015-05-06 00:13:05', 'jhartq5', '2015-01-08 15:13:25', 'gbradleyq5');
INSERT INTO `settings` VALUES ('944', 'Paraguayan', 'sapien a libero nam dui proin', '0', '2014-11-12 19:59:15', 'dbanksq6', '2015-08-04 15:21:29', 'jmurrayq6');
INSERT INTO `settings` VALUES ('945', 'Guamanian', 'maecenas pulvinar lobortis est phasellus sit', '0', '2015-02-24 09:00:55', 'kgomezq7', '2015-07-05 18:41:36', 'sdiazq7');
INSERT INTO `settings` VALUES ('946', 'Kiowa', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', '0', '2014-12-19 11:27:44', 'carnoldq8', '2015-04-11 07:50:12', 'gallenq8');
INSERT INTO `settings` VALUES ('947', 'Tongan', 'bibendum imperdiet nullam orci pede venenatis', '1', '2015-04-11 08:29:05', 'jcruzq9', '2014-10-14 08:53:14', 'jreynoldsq9');
INSERT INTO `settings` VALUES ('948', 'Menominee', 'aliquet at feugiat non pretium quis lectus suspendisse potenti in', '0', '2015-03-18 04:59:37', 'hfernandezqa', '2015-08-05 13:14:49', 'tmccoyqa');
INSERT INTO `settings` VALUES ('949', 'Central American', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper', '1', '2014-12-15 01:02:27', 'rbishopqb', '2014-10-20 15:39:20', 'kspencerqb');
INSERT INTO `settings` VALUES ('950', 'Venezuelan', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu', '1', '2015-01-16 22:47:27', 'csnyderqc', '2015-07-01 19:20:41', 'halexanderqc');
INSERT INTO `settings` VALUES ('951', 'Cherokee', 'faucibus orci luctus et ultrices', '0', '2014-09-05 09:24:03', 'vfisherqd', '2015-07-19 02:08:18', 'vmorganqd');
INSERT INTO `settings` VALUES ('952', 'Venezuelan', 'nulla pede ullamcorper augue a suscipit nulla elit', '0', '2015-05-07 18:09:00', 'tpriceqe', '2014-09-10 14:16:46', 'jarmstrongqe');
INSERT INTO `settings` VALUES ('953', 'Chippewa', 'nulla elit ac nulla sed vel enim sit amet', '0', '2015-05-14 01:45:04', 'vburtonqf', '2014-09-12 10:58:48', 'rclarkqf');
INSERT INTO `settings` VALUES ('954', 'Nicaraguan', 'felis donec semper sapien a libero nam dui proin leo', '1', '2014-09-19 08:32:23', 'pfosterqg', '2014-12-24 22:12:17', 'afullerqg');
INSERT INTO `settings` VALUES ('955', 'Paraguayan', 'augue luctus tincidunt nulla mollis molestie lorem', '0', '2014-10-03 22:39:40', 'cduncanqh', '2015-02-16 01:26:14', 'jrussellqh');
INSERT INTO `settings` VALUES ('956', 'Vietnamese', 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien', '0', '2014-12-30 06:24:16', 'krichardsqi', '2015-04-14 15:23:01', 'msmithqi');
INSERT INTO `settings` VALUES ('957', 'Chilean', 'amet justo morbi ut odio', '1', '2015-08-07 15:04:57', 'pkelleyqj', '2015-02-10 00:57:06', 'wsullivanqj');
INSERT INTO `settings` VALUES ('958', 'Ute', 'lacus purus aliquet at feugiat non pretium quis lectus suspendisse', '0', '2015-06-16 17:06:10', 'rkelleyqk', '2015-06-09 09:34:47', 'lhendersonqk');
INSERT INTO `settings` VALUES ('959', 'Ecuadorian', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu', '1', '2015-08-02 07:35:55', 'sreyesql', '2015-03-30 11:41:07', 'bstephensql');
INSERT INTO `settings` VALUES ('960', 'Alaska Native', 'ut massa quis augue luctus tincidunt nulla mollis molestie lorem', '0', '2015-02-03 11:33:12', 'rromeroqm', '2014-10-09 04:23:02', 'khudsonqm');
INSERT INTO `settings` VALUES ('961', 'Ottawa', 'donec quis orci eget orci vehicula condimentum', '1', '2015-07-03 02:10:27', 'kmooreqn', '2015-01-28 21:23:52', 'rhernandezqn');
INSERT INTO `settings` VALUES ('962', 'Asian', 'varius ut blandit non interdum in ante', '0', '2014-11-28 21:12:46', 'mevansqo', '2014-09-21 08:22:44', 'kgarrettqo');
INSERT INTO `settings` VALUES ('963', 'Aleut', 'eu interdum eu tincidunt in leo', '0', '2015-06-24 09:58:04', 'iwoodqp', '2014-11-29 13:20:45', 'bhunterqp');
INSERT INTO `settings` VALUES ('964', 'Yuman', 'justo aliquam quis turpis eget elit sodales scelerisque', '1', '2014-11-28 06:15:38', 'ewrightqq', '2014-09-18 11:06:51', 'rrussellqq');
INSERT INTO `settings` VALUES ('965', 'Spaniard', 'felis sed lacus morbi sem mauris laoreet ut rhoncus', '1', '2014-09-24 04:40:15', 'cmurphyqr', '2015-05-12 12:37:31', 'kfordqr');
INSERT INTO `settings` VALUES ('966', 'Micronesian', 'nam congue risus semper porta volutpat quam pede', '1', '2015-06-02 09:53:52', 'eweaverqs', '2015-01-31 07:36:23', 'jcarpenterqs');
INSERT INTO `settings` VALUES ('967', 'Asian Indian', 'congue risus semper porta volutpat', '0', '2014-10-23 03:40:18', 'jhughesqt', '2015-04-28 21:35:56', 'whansonqt');
INSERT INTO `settings` VALUES ('968', 'Samoan', 'faucibus orci luctus et ultrices posuere cubilia', '0', '2015-05-29 06:35:27', 'khughesqu', '2014-10-24 19:56:23', 'bedwardsqu');
INSERT INTO `settings` VALUES ('969', 'Tongan', 'ipsum praesent blandit lacinia erat vestibulum', '1', '2014-11-04 03:00:33', 'rcarrqv', '2015-07-13 18:23:22', 'aelliottqv');
INSERT INTO `settings` VALUES ('970', 'Delaware', 'venenatis lacinia aenean sit amet justo morbi ut', '1', '2014-10-31 00:33:14', 'cjamesqw', '2015-06-03 19:49:18', 'sblackqw');
INSERT INTO `settings` VALUES ('971', 'Pima', 'integer tincidunt ante vel ipsum praesent blandit', '0', '2014-12-01 07:04:43', 'kwebbqx', '2015-01-07 06:55:45', 'dbryantqx');
INSERT INTO `settings` VALUES ('972', 'Chickasaw', 'eu interdum eu tincidunt in', '0', '2014-12-21 06:33:33', 'hwrightqy', '2015-03-15 19:48:04', 'eruizqy');
INSERT INTO `settings` VALUES ('973', 'Malaysian', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum', '1', '2014-10-30 20:52:35', 'dweaverqz', '2014-10-10 20:54:46', 'rgutierrezqz');
INSERT INTO `settings` VALUES ('974', 'Native Hawaiian', 'lectus vestibulum quam sapien varius', '0', '2014-08-11 08:47:41', 'ajamesr0', '2015-07-23 17:19:09', 'lbutlerr0');
INSERT INTO `settings` VALUES ('975', 'Malaysian', 'in leo maecenas pulvinar lobortis est phasellus sit amet erat', '1', '2015-01-03 02:02:39', 'crodriguezr1', '2014-09-11 19:17:05', 'dmccoyr1');
INSERT INTO `settings` VALUES ('976', 'Delaware', 'in eleifend quam a odio in hac habitasse platea', '1', '2015-06-07 16:25:50', 'dlongr2', '2015-02-06 21:09:25', 'mreyesr2');
INSERT INTO `settings` VALUES ('977', 'Uruguayan', 'praesent lectus vestibulum quam sapien varius ut', '1', '2014-11-22 17:07:42', 'rbrooksr3', '2015-05-21 17:59:20', 'hmoralesr3');
INSERT INTO `settings` VALUES ('978', 'Ottawa', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', '1', '2015-03-05 21:09:19', 'dlawsonr4', '2014-12-17 14:38:01', 'jrileyr4');
INSERT INTO `settings` VALUES ('979', 'Ottawa', 'quam a odio in hac habitasse platea dictumst maecenas ut', '0', '2015-08-01 20:15:15', 'jsandersr5', '2015-01-29 16:37:31', 'kbrownr5');
INSERT INTO `settings` VALUES ('980', 'Latin American Indian', 'enim leo rhoncus sed vestibulum sit amet cursus id turpis', '0', '2014-11-12 20:34:04', 'bbryantr6', '2014-11-01 11:34:18', 'hchapmanr6');
INSERT INTO `settings` VALUES ('981', 'Menominee', 'volutpat quam pede lobortis ligula', '1', '2014-12-12 15:59:29', 'aandrewsr7', '2014-09-09 07:44:53', 'pscottr7');
INSERT INTO `settings` VALUES ('982', 'Micronesian', 'eget massa tempor convallis nulla neque libero', '1', '2015-05-21 07:20:30', 'jmitchellr8', '2014-11-16 14:13:08', 'jcastillor8');
INSERT INTO `settings` VALUES ('983', 'Black or African American', 'iaculis justo in hac habitasse platea', '1', '2015-04-24 18:00:39', 'jwoodsr9', '2014-12-27 09:10:56', 'jholmesr9');
INSERT INTO `settings` VALUES ('984', 'Ecuadorian', 'quam sapien varius ut blandit non interdum in ante vestibulum', '1', '2015-03-14 12:10:14', 'mwallacera', '2014-10-09 19:59:40', 'rgibsonra');
INSERT INTO `settings` VALUES ('985', 'Pueblo', 'congue elementum in hac habitasse platea dictumst morbi vestibulum', '1', '2014-09-07 14:10:07', 'emorrisonrb', '2015-02-24 13:42:47', 'pcampbellrb');
INSERT INTO `settings` VALUES ('986', 'South American', 'quisque arcu libero rutrum ac lobortis vel dapibus at diam', '1', '2015-03-09 04:31:27', 'aowensrc', '2014-11-11 07:16:17', 'sbradleyrc');
INSERT INTO `settings` VALUES ('987', 'Ottawa', 'at ipsum ac tellus semper interdum', '0', '2015-06-13 03:34:20', 'lmorrisrd', '2015-04-29 12:45:57', 'agrantrd');
INSERT INTO `settings` VALUES ('988', 'Panamanian', 'libero ut massa volutpat convallis morbi odio odio', '0', '2015-06-21 23:35:08', 'rbellre', '2014-10-26 16:30:07', 'pbrooksre');
INSERT INTO `settings` VALUES ('989', 'Crow', 'donec vitae nisi nam ultrices libero non', '0', '2015-05-15 10:39:05', 'vcollinsrf', '2015-05-14 04:01:43', 'tburkerf');
INSERT INTO `settings` VALUES ('990', 'Menominee', 'odio cras mi pede malesuada in imperdiet', '1', '2015-07-30 09:54:01', 'jstevensrg', '2014-11-28 12:44:50', 'lfloresrg');
INSERT INTO `settings` VALUES ('991', 'Chickasaw', 'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis', '1', '2015-04-29 00:45:16', 'akellyrh', '2015-05-09 14:29:17', 'svasquezrh');
INSERT INTO `settings` VALUES ('992', 'American Indian', 'ultrices mattis odio donec vitae', '1', '2014-12-27 04:35:47', 'sadamsri', '2015-04-04 09:39:51', 'kevansri');
INSERT INTO `settings` VALUES ('993', 'Colville', 'condimentum curabitur in libero ut massa volutpat', '0', '2015-02-08 23:53:29', 'jhughesrj', '2015-04-15 02:33:52', 'shunterrj');
INSERT INTO `settings` VALUES ('994', 'Kiowa', 'augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', '0', '2014-10-13 22:38:51', 'jsimpsonrk', '2015-07-15 11:17:40', 'egriffinrk');
INSERT INTO `settings` VALUES ('995', 'Pueblo', 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus', '1', '2014-12-28 11:18:09', 'wgibsonrl', '2015-07-04 08:18:01', 'rturnerrl');
INSERT INTO `settings` VALUES ('996', 'Pima', 'vitae consectetuer eget rutrum at lorem', '1', '2015-03-21 02:09:33', 'dhicksrm', '2014-10-13 17:23:46', 'ccookrm');
INSERT INTO `settings` VALUES ('997', 'Micronesian', 'tortor risus dapibus augue vel', '1', '2015-07-22 13:14:57', 'bthomasrn', '2014-09-11 21:32:22', 'wthompsonrn');
INSERT INTO `settings` VALUES ('998', 'Japanese', 'vestibulum sit amet cursus id turpis integer', '0', '2015-05-09 20:26:20', 'dthomasro', '2015-02-01 10:45:51', 'lriveraro');
INSERT INTO `settings` VALUES ('999', 'Kiowa', 'purus eu magna vulputate luctus cum sociis natoque penatibus et', '0', '2015-03-01 07:30:11', 'jpetersrp', '2015-01-21 12:49:59', 'krossrp');
INSERT INTO `settings` VALUES ('1000', 'Asian Indian', 'orci luctus et ultrices posuere cubilia', '0', '2014-08-19 06:25:23', 'drussellrq', '2014-09-03 04:53:34', 'jharrisrq');
INSERT INTO `settings` VALUES ('1001', 'White', 'condimentum id luctus nec molestie sed', '0', '2014-12-24 12:03:31', 'pcarpenterrr', '2014-12-21 21:28:40', 'chudsonrr');
INSERT INTO `settings` VALUES ('1002', 'dsadas', 'dasdsa', '1', null, '', null, '');
INSERT INTO `settings` VALUES ('1003', 'fasfdsf', 'fdsfdsfdsf', '1', null, '', null, '');
INSERT INTO `settings` VALUES ('1004', 'fasfdsf', 'fdsfdsfdsf', '1', null, '', null, '');
INSERT INTO `settings` VALUES ('1005', 'fdsfds', 'fdsf', '2', null, '', null, '');
INSERT INTO `settings` VALUES ('1006', 'fasfdsfdsfsdf', 'fdsfsdfdsf', '3', null, '', null, '');
INSERT INTO `settings` VALUES ('1007', 'fasfdsfdsfsdf', 'fdsfsdfdsf', '3', null, '', null, '');
INSERT INTO `settings` VALUES ('1008', 'fasfdsfdsfsdf', 'fdsfsdfdsf', '3', null, '', null, '');
INSERT INTO `settings` VALUES ('1009', 'hgf', 'hgfhfg', '1', null, 'fghgfh', null, '');

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
