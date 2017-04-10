/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : sssp

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-04-10 22:24:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sssp_account`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_account`;
CREATE TABLE `sssp_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nums` int(11) NOT NULL,
  `amount` double NOT NULL,
  `ispayed` tinyint(1) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jj3n4j233hwttepyfca19p6sw` (`supplier_id`),
  CONSTRAINT `FK_jj3n4j233hwttepyfca19p6sw` FOREIGN KEY (`supplier_id`) REFERENCES `sssp_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_account
-- ----------------------------
INSERT INTO `sssp_account` VALUES ('1', '小米2', '4', '1999', '0', '1', 'we', '2016-04-29');
INSERT INTO `sssp_account` VALUES ('2', '华为p8', '23', '2000', '0', '1', 'rter', '2016-05-02');
INSERT INTO `sssp_account` VALUES ('3', '华为mate7', '237', '2500', '0', '1', 'erttre', '2016-03-07');
INSERT INTO `sssp_account` VALUES ('4', '中兴2', '230', '1500', '0', '1', '', '2016-05-01');
INSERT INTO `sssp_account` VALUES ('5', '中兴4', '12', '2000', '0', '4', null, '2016-04-01');
INSERT INTO `sssp_account` VALUES ('6', '索尼x5', '98', '5000', '0', '5', null, '2016-04-18');
INSERT INTO `sssp_account` VALUES ('7', 'htcc', '21', '2300', '0', '2', 'sd', '2016-05-04');
INSERT INTO `sssp_account` VALUES ('8', 'oppo r7', '4', '2000', '0', '6', '34', '2016-05-05');

-- ----------------------------
-- Table structure for `sssp_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_accounts`;
CREATE TABLE `sssp_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nums` int(11) NOT NULL,
  `amount` double NOT NULL,
  `ispayed` tinyint(1) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kkdc09xpl1lac7kiu1fxshgul` (`supplier_id`),
  CONSTRAINT `FK_kkdc09xpl1lac7kiu1fxshgul` FOREIGN KEY (`supplier_id`) REFERENCES `sssp_suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_accounts
-- ----------------------------
INSERT INTO `sssp_accounts` VALUES ('1', '小米2', '4', '1999', '0', '1', null, '2016-04-29');
INSERT INTO `sssp_accounts` VALUES ('2', '华为p8', '23', '2000', '0', '3', null, '2016-04-18');
INSERT INTO `sssp_accounts` VALUES ('3', '华为mate7', '237', '2500', '0', '3', null, '2016-04-13');
INSERT INTO `sssp_accounts` VALUES ('4', '中兴2', '23', '1500', '0', '4', null, '2016-04-05');
INSERT INTO `sssp_accounts` VALUES ('5', '中兴4', '12', '2000', '0', '4', null, '2016-04-01');
INSERT INTO `sssp_accounts` VALUES ('6', '索尼x5', '98', '5000', '0', '5', null, '2016-04-18');

-- ----------------------------
-- Table structure for `sssp_departments`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_departments`;
CREATE TABLE `sssp_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_departments
-- ----------------------------
INSERT INTO `sssp_departments` VALUES ('1', '后勤部');
INSERT INTO `sssp_departments` VALUES ('2', '行政部');
INSERT INTO `sssp_departments` VALUES ('3', '开发部');
INSERT INTO `sssp_departments` VALUES ('4', '销售部');
INSERT INTO `sssp_departments` VALUES ('5', '财务部');

-- ----------------------------
-- Table structure for `sssp_employees`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_employees`;
CREATE TABLE `sssp_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birth` date DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1by80iowxwcoway8hwu8aytt8` (`department_id`),
  CONSTRAINT `FK_1by80iowxwcoway8hwu8aytt8` FOREIGN KEY (`department_id`) REFERENCES `sssp_departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_employees
-- ----------------------------
INSERT INTO `sssp_employees` VALUES ('1', '2015-12-16', '2015-12-24 13:46:40', 'aa@chen.com', 'AA', '3');
INSERT INTO `sssp_employees` VALUES ('2', '2015-12-24', '2015-12-24 13:46:57', 'bb@chen.com', 'BB', '2');
INSERT INTO `sssp_employees` VALUES ('3', '2015-12-20', '2015-12-24 13:47:05', 'cc@chen.com', 'CC', '4');
INSERT INTO `sssp_employees` VALUES ('4', '2015-12-24', '2015-12-24 13:47:19', 'dd@chen.com', 'DD', '1');
INSERT INTO `sssp_employees` VALUES ('6', '2015-12-24', '2015-12-24 13:47:42', 'ff@chen.com', 'FF', '3');
INSERT INTO `sssp_employees` VALUES ('7', '2015-12-24', '2015-12-24 13:47:52', 'gg@chen.com', 'GG', '3');
INSERT INTO `sssp_employees` VALUES ('8', '1995-01-01', '2015-12-24 19:43:15', 'ii@chen.com', 'II', '3');
INSERT INTO `sssp_employees` VALUES ('9', '2015-12-24', '2015-12-24 19:53:23', 'ee@chen.com', 'EE', '4');
INSERT INTO `sssp_employees` VALUES ('10', '2015-12-24', '2015-12-24 19:53:35', 'ee@chen.com', 'EE', '1');
INSERT INTO `sssp_employees` VALUES ('11', '2015-12-24', '2015-12-24 19:53:43', 'ee@chen.com', 'EE', '1');
INSERT INTO `sssp_employees` VALUES ('12', '2015-12-25', '2015-12-26 13:11:57', 'ee@chen.com', 'EE', '3');
INSERT INTO `sssp_employees` VALUES ('13', '1995-10-12', '2015-12-26 14:18:25', 'qian@chen.com', 'chenqian', '3');
INSERT INTO `sssp_employees` VALUES ('14', '2011-10-01', '2016-04-29 15:34:51', '23', 'sdf', '1');

-- ----------------------------
-- Table structure for `sssp_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_supplier`;
CREATE TABLE `sssp_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `link_phone` varchar(255) DEFAULT NULL,
  `link_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_supplier
-- ----------------------------
INSERT INTO `sssp_supplier` VALUES ('1', '小米', '我是小米', '哈哈', '1243736', '南京');
INSERT INTO `sssp_supplier` VALUES ('2', 'HTC', '我是HTC', '拉拉', '1232454', '南京');
INSERT INTO `sssp_supplier` VALUES ('3', '华为', '我是华为', '妮妮', '1232454', '南京');
INSERT INTO `sssp_supplier` VALUES ('4', '中兴', '我是中兴', '大大', '123455', '南京');
INSERT INTO `sssp_supplier` VALUES ('5', '索尼', '我是索尼', '步步', '32099304', '南京');
INSERT INTO `sssp_supplier` VALUES ('6', 'oppo', 'opop', '婆婆', '23435', '深圳');

-- ----------------------------
-- Table structure for `sssp_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_suppliers`;
CREATE TABLE `sssp_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suppliername` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `linkman` varchar(255) DEFAULT NULL,
  `link_phone` varchar(255) DEFAULT NULL,
  `link_address` varchar(255) DEFAULT NULL,
  `supplier_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_suppliers
-- ----------------------------
INSERT INTO `sssp_suppliers` VALUES ('1', '小米', '我是小米', '哈哈', '1243736', '南京', null);
INSERT INTO `sssp_suppliers` VALUES ('2', 'HTC', '我是HTC', '拉拉', '1232', '南京', null);
INSERT INTO `sssp_suppliers` VALUES ('3', '华为', '我是华为', '嘎嘎', '1232454', '南京', null);
INSERT INTO `sssp_suppliers` VALUES ('4', '中兴', '我是中兴', '大大', '123455', '南京', null);
INSERT INTO `sssp_suppliers` VALUES ('5', '索尼', '我是索尼', '妮妮', '843954', '南京', null);
INSERT INTO `sssp_suppliers` VALUES ('6', 'bbk', '我是步步高', '步步', '32099304', '深圳', null);
INSERT INTO `sssp_suppliers` VALUES ('7', 'oppo', '我是oppo', 'oppo', '9348953', '深圳', null);

-- ----------------------------
-- Table structure for `sssp_user`
-- ----------------------------
DROP TABLE IF EXISTS `sssp_user`;
CREATE TABLE `sssp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `has_jurisdiction` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sssp_user
-- ----------------------------
INSERT INTO `sssp_user` VALUES ('1', 'root', 'root', '18', '男', '', '12345', '1');
INSERT INTO `sssp_user` VALUES ('2', 'user', 'user', '20', '女', null, '124', '0');
INSERT INTO `sssp_user` VALUES ('3', '34', '23', '23', null, null, null, '1');
INSERT INTO `sssp_user` VALUES ('4', '23', '23', '23', null, null, null, '1');
INSERT INTO `sssp_user` VALUES ('6', 'fsd', '45', '21', 'nv', '34556', 'we', '0');
