/*
drop database shop;
create database shop character set utf8;
use shop;
create table classify(	
    id bigint(11) primary key,    
    `name` varchar(200)    
);
-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '兰蔻');
INSERT INTO `classify` VALUES ('2', '娇兰');
INSERT INTO `classify` VALUES ('3', '雅诗兰黛');
-- ----------------------------
-- Table structure for cosmeticform
-- ----------------------------
create table cosmeticForm(	
	cosmetic_number varchar(255),    
	cosmetic_name varchar(255),    
	cosmetic_made varchar(255),    
	cosmetic_price float,    
	cosmetic_mess varchar(255),    
	cosmetic_pic varchar(255),
    `id` bigint(11) DEFAULT NULL,
    PRIMARY KEY (`cosmetic_number`,`cosmetic_pic`),
    KEY `id` (`id`),
    CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `classify` (`id`)
);    
-- ----------------------------
-- Records of cosmeticform
-- ----------------------------
INSERT INTO `cosmeticform` VALUES ('EsteeLauder1001', '雅诗兰黛眼霜', 'EsteeLauder', '389', '功效：去黑眼圈', 'est1.jpg', '3');
INSERT INTO `cosmeticform` VALUES ('lan_a10002', '兰蔻乳液', '法国Lancome', '588', '乳液功效：补水 保湿', 'lan2.jpg', '1');
INSERT INTO `cosmeticform` VALUES ('lan_a1001', '兰蔻清莹柔肤水', '法国Lancome', '229', '化妆品净含量：400g', 'lan1.jpg', '1');
-- ----------------------------
-- Table structure for orderform
-- ----------------------------
create table orderForm(	
	id bigint(11) primary key,    
	logname varchar(255),    
	mess varchar(255),    
	sum float    
);
-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('1', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)2:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '1176');
INSERT INTO `orderform` VALUES ('2', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '588');
INSERT INTO `orderform` VALUES ('3', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '588');
INSERT INTO `orderform` VALUES ('4', 'dpl', '1:(EsteeLauder1001,雅诗兰黛眼霜,EsteeLauder,389)', '389');
INSERT INTO `orderform` VALUES ('5', 'dpl', '1:(EsteeLauder1001,雅诗兰黛眼霜,EsteeLauder,389.0)', '389');
INSERT INTO `orderform` VALUES ('6', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588)', '588');

-- ----------------------------
-- Table structure for user
-- ----------------------------
create table user(	
    logname varchar(255) primary key,    
    `password` varchar(255),    
    phone varchar(255),    
    address varchar(255),    
    realname varchar(255)    
); 

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('ddddd', '123456789', '17895264876', '山东滨州', '颠沛流离');
INSERT INTO `user` VALUES ('dpl', '123456', '17862078760', '山东滨州', '小丁');
INSERT INTO `user` VALUES ('dpl12', '123456', '17862028760', '山东滨州', '打破了');
INSERT INTO `user` VALUES ('dpl123', '123456', '17862078760', '山东滨州', '丁丁');
INSERT INTO `user` VALUES ('dpll19', '12345', '17862078759', '山东济南', '小布丁');
INSERT INTO `user` VALUES ('dpppp', '123456', '17862028760', '山东滨州', '打破了');
*/
/*
Navicat MySQL Data Transfer

Source Server         : 201810620306丁培良
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-01-19 16:06:14
*/

create database shop character set utf8;
use shop;
-- ----------------------------
-- Table structure for classify
-- ----------------------------
CREATE TABLE `classify` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '兰蔻');
INSERT INTO `classify` VALUES ('2', '娇兰');
INSERT INTO `classify` VALUES ('3', '雅诗兰黛');

-- ----------------------------
-- Table structure for cosmeticform
-- ----------------------------
CREATE TABLE `cosmeticform` (
  `cosmetic_number` varchar(255) NOT NULL,
  `cosmetic_name` varchar(255) DEFAULT NULL,
  `cosmetic_made` varchar(255) DEFAULT NULL,
  `cosmetic_price` float DEFAULT NULL,
  `cosmetic_mess` varchar(255) DEFAULT NULL,
  `cosmetic_pic` varchar(255) NOT NULL,
  `id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`cosmetic_number`,`cosmetic_pic`),
  KEY `id` (`id`),
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `classify` (`id`)
);

-- ----------------------------
-- Records of cosmeticform
-- ----------------------------
INSERT INTO `cosmeticform` VALUES ('EsteeLauder1001', '雅诗兰黛眼霜', 'EsteeLauder', '389', '功效：去黑眼圈', 'est1.jpg', '3');
INSERT INTO `cosmeticform` VALUES ('lan_a10002', '兰蔻乳液', '法国Lancome', '588', '乳液功效：补水 保湿', 'lan2.jpg', '1');
INSERT INTO `cosmeticform` VALUES ('lan_a1001', '兰蔻清莹柔肤水', '法国Lancome', '229', '化妆品净含量：400g', 'lan1.jpg', '1');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `logname` varchar(255) DEFAULT NULL,
  `mess` varchar(255) DEFAULT NULL,
  `sum` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('1', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)2:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '1176');
INSERT INTO `orderform` VALUES ('2', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '588');
INSERT INTO `orderform` VALUES ('3', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588.0)', '588');
INSERT INTO `orderform` VALUES ('4', 'dpl', '1:(EsteeLauder1001,雅诗兰黛眼霜,EsteeLauder,389)', '389');
INSERT INTO `orderform` VALUES ('5', 'dpl', '1:(EsteeLauder1001,雅诗兰黛眼霜,EsteeLauder,389.0)', '389');
INSERT INTO `orderform` VALUES ('6', 'dpl', '1:(lan_a10002,兰蔻乳液,法国Lancome,588)', '588');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `logname` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL COMMENT '存储姓名',
  PRIMARY KEY (`logname`)
) ;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('ddddd', '123456789', '17895264876', '山东滨州', '颠沛流离');
INSERT INTO `user` VALUES ('dpl', '123456', '17862078760', '山东滨州', '小丁');
INSERT INTO `user` VALUES ('dpl12', '123456', '17862028760', '山东滨州', '打破了');
INSERT INTO `user` VALUES ('dpl123', '123456', '17862078760', '山东滨州', '丁丁');
INSERT INTO `user` VALUES ('dpll19', '12345', '17862078759', '山东济南', '小布丁');
INSERT INTO `user` VALUES ('dpppp', '123456', '17862028760', '山东滨州', '打破了');

