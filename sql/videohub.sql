/*
Navicat MySQL Data Transfer

Source Server         : EXAM
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : videohub

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-19 17:03:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for videohub_resource
-- ----------------------------
DROP TABLE IF EXISTS `videohub_resource`;
CREATE TABLE `videohub_resource` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `video_title` varchar(255) DEFAULT NULL COMMENT '视频名字',
  `video_file_name` varchar(255) DEFAULT NULL COMMENT '存放到服务器的视频文件的名字',
  `require_point` int(11) DEFAULT NULL COMMENT '播放该视频需要的积分',
  `category` varchar(255) DEFAULT NULL COMMENT '视频类别',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频存放地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of videohub_resource
-- ----------------------------
INSERT INTO `videohub_resource`
VALUES ('1', 'AGE OF HEROES', '1.jpg', '50', '动作片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('2', 'X战警', '2.jpg', '50', '科幻片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('3', '逆战', '3.jpg', '50', '动作片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('4', '魔兽', '4.jpg', '50', '科幻片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('5', 'OCTPOB', '5.jpg', '50', '科幻片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('6', '蓝风筝', '6.jpg', '50', '纪实片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('7', '无人区', '7.jpg', '50', '动作片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('8', 'PRINCE OF PERSIA', '8.jpg', '50', '动作片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('9', 'AVA', '9.jpg', '50', '科幻片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('10', '巨齿鲨', '10.jpg', '50', '纪实片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('11', 'AVENGERS2', '11.jpg', '50', '纪实片', '/video/1');
INSERT INTO `videohub_resource`
VALUES ('12', '小萝莉的猴神大叔', '12.jpg', '50', '纪实片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('13', '阿凡达', '13.jpg', '50', '科幻片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('14', '双城计中计', '14.jpg', '50', '动作片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('15', '骑士', '15.jpg', '50', '纪实片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('16', '逆战2', '16.jpg', '50', '科幻片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('17', 'Fate', '17.jpg', '50', '动漫片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('18', '白胖次', '18.jpg', '50', '动漫片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('19', '拳皇', '19.jpg', '50', '动漫片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('20', 'RE0', '20.jpg', '50', '动漫片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('21', '二代目', '21.jpg', '50', '纪实片', '/video/2');
INSERT INTO `videohub_resource`
VALUES ('22', '神奇宝贝', '22.jpg', '50', '动漫片', '/video/2');

-- ----------------------------
-- Table structure for videohub_user
-- ----------------------------
DROP TABLE IF EXISTS `videohub_user`;
CREATE TABLE `videohub_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `avatar_url` varchar(255) DEFAULT NULL COMMENT '头像文件名字，可选',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱，可选',
  `point` int(255) NOT NULL COMMENT '当前积分',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of videohub_user
-- ----------------------------
