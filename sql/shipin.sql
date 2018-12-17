/*
Navicat MySQL Data Transfer

Source Server         : gengxiangyi
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : students

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-12-08 22:29:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for poster
-- ----------------------------
DROP TABLE IF EXISTS `shipin`;
CREATE TABLE `shipin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `video_title` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `video_point` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `img_title` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poster
-- ----------------------------
INSERT INTO `shipin`
VALUES ('1', '朝花夕誓', 'poster\\1朝花夕誓.mp4', '50', 'dongman', '1.jpg', 'poster\\1.jpg');
INSERT INTO `shipin`
VALUES ('2', '风语咒', 'poster\\2风语咒.mkv', '50', 'dongman', '2.jpg', 'poster\\2.jpg');
INSERT INTO `shipin`
VALUES ('3', '超人总动员', 'poster\\3超人总动员.mp4', '50', 'dongman', '3超人总动员.jpg', 'poster\\3超人总动员.jpg');
INSERT INTO `shipin`
VALUES ('4', '圣诞星', 'poster\\4圣诞星.mp4', '50', 'dongman', '4圣诞星.jpg', 'poster\\4圣诞星.jpg');
INSERT INTO `shipin`
VALUES ('5', '绿箭', 'poster\\5绿箭.mp4', '50', 'dianying', '5绿箭.jpg', 'poster\\5绿箭.jpg');
INSERT INTO `shipin`
VALUES ('6', '天赋异禀', 'poster\\6天赋异禀.mp4.xltd', '50', 'dianying', '6天赋异禀.jpg', 'poster\\6天赋异禀.jpg');
INSERT INTO `shipin`
VALUES ('7', '影', 'poster\\7影.mkv', '50', 'dianying', '7影.jpg', 'poster\\7影.jpg');
INSERT INTO `shipin`
VALUES ('8', '蜀山降魔传', 'poster\\8蜀山降魔传.mp4', '50', 'dianying', '8蜀山降魔传', 'poster\\8蜀山降魔传.jpg');
