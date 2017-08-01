/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : wsgw

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-08-01 23:30:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '66666', '2017-08-01 23:27:16', '2', 'jerry');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('0e8387a5c1444fe1ab3e6a068e983141', 'tom', 'jerry', '123456', '18', '四川成都', '11@163.com', '111');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(20) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `orderId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '2', 'Java', '60', '1', '201708012313380310766');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` varchar(30) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `paymentWay` varchar(15) DEFAULT NULL,
  `orderState` varchar(10) DEFAULT NULL,
  `customerId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('201708012247500763523', 'jerry', '四川成都', '111', '60', '2017-08-01 22:47:50', '邮局汇款', '未发货', '0e8387a5c1444fe1ab3e6a068e983141');
INSERT INTO `orders` VALUES ('201708012313380310766', 'jerry', '四川成都', '111', '60', '2017-08-01 23:13:38', '邮局汇款', '交易完成', '0e8387a5c1444fe1ab3e6a068e983141');

-- ----------------------------
-- Table structure for `productcategory`
-- ----------------------------
DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE `productcategory` (
  `id` int(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productcategory
-- ----------------------------
INSERT INTO `productcategory` VALUES ('1', '服装', '0', null);
INSERT INTO `productcategory` VALUES ('2', '书籍', '1', null);
INSERT INTO `productcategory` VALUES ('3', '软件', '2', '2');

-- ----------------------------
-- Table structure for `productinfo`
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `productinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `createTime` varchar(50) DEFAULT NULL,
  `baseprice` float DEFAULT NULL,
  `marketprice` float DEFAULT NULL,
  `sellprice` varchar(255) DEFAULT NULL,
  `sexrequest` varchar(5) DEFAULT NULL,
  `commend` bit(1) DEFAULT NULL,
  `clickcount` int(11) DEFAULT NULL,
  `sellCount` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `uploadFile` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productinfo
-- ----------------------------
INSERT INTO `productinfo` VALUES ('2', 'Java', 'Java领域*有影响力和价值的著作之一，由拥有20多年教学与研究经验的资深Java技术专家撰写（获Jolt大奖），与《Java编程思想》齐名，10余年全球畅销不衰，广受好评。**0版根据JavaSE8全方面更新，同时修正了第9版中的不足，系统全面地讲解了Java语言的核心概念、语法、重要特性和开发方法，包含大量案例，实践性强。', '2017-08-01 22:15:56', '50', '70', '60.0', 'ALL', '', '4', '6', '3', '1');

-- ----------------------------
-- Table structure for `publicinfo`
-- ----------------------------
DROP TABLE IF EXISTS `publicinfo`;
CREATE TABLE `publicinfo` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `text` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicinfo
-- ----------------------------
INSERT INTO `publicinfo` VALUES ('1', '阿里巴巴集团CEO张勇：零售和科技结合才能催生新零售', '7月27日，阿里巴巴集团CEO张勇在上海出席银泰三位一体大会时表示，零售和科技之间的化学反应才能催生新零售，这意味所有零售商要跟科技公司结合才能拥抱这个快速变化的数字创新时代。零售企业和零售企业的同纬度合作，很难叠加出适应数字时代的新的商业形态。\n \n张勇指出，新零售的本质是用大数据重构“人货场”等商业要素。“人货场”的数字化只是第一步，第二步将全面重构品牌、消费者乃至企业内部的生产关系。\n\n在张勇看来，线上零售企业如果只把货放到线上去卖，那还是传统零售商，品牌和消费者之间仍然存在一堵高墙。只有通过与掌握互联网、大数据等技术的科技公司结合，零售业才能拥抱这个快速变化的数字创新时代。\n \n当天，阿里巴巴集团市值首次突破4000亿美元，越来越多的国际投资机构意识到“科技与零售”结合之后，天猫新零售战略所蕴含的巨大价值和潜力。', '2017-08-01 22:19:14');

-- ----------------------------
-- Table structure for `uploadfile`
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile` (
  `id` int(20) NOT NULL,
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploadfile
-- ----------------------------
INSERT INTO `uploadfile` VALUES ('1', '201708012213570119.jpg');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
