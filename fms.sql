/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : rm-bp168uotg0aupq876yo.mysql.rds.aliyuncs.com:3306
 Source Schema         : fms

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 17/04/2018 17:12:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document`  (
  `serial` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '文件类别',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '文件描述',
  `remark` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件备注（执行上报和下发时候填写）',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '发布/上传时间',
  `signatory` int(12) NULL DEFAULT NULL COMMENT '签发人',
  `from` int(50) NULL DEFAULT NULL COMMENT '从',
  `to` int(50) NULL DEFAULT 0 COMMENT '到',
  `cryptic_class` int(4) NULL DEFAULT NULL COMMENT '文件级别（绝密，机密，公开）',
  `apply_scope` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件使用范围',
  `image_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片文件存储地址',
  `attachment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件文件存储地址',
  `file_no` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件号',
  `file_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件口令(解压口令？)',
  `image_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图像文件名称',
  `attachment_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件文件名称',
  `input_type` int(4) NULL DEFAULT NULL COMMENT '新增文件形式（导入、录入）',
  PRIMARY KEY (`serial`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES (1, 0, '测试1', '测试121', '', '2018-03-28 14:26:20', 1, 1, 0, 3, '2121', NULL, '/webapp/file/2018/03/28/145317/STO1RJ.docx', 'ND10000', '', NULL, 'ruff评测.pdf', 1);
INSERT INTO `document` VALUES (2, 0, '测试22', '测试22', '', '2018-03-28 14:30:10', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/28/145317/STORJ.docx', 'ND100001', '', NULL, '微信图片_20180316102644.jpg', 1);
INSERT INTO `document` VALUES (3, 0, 'ceshi', '', '\r\n从学院党总支到研究生支部的备注：\r\n测试转发\r\n从学院党总支到教工一支部的备注：\r\n222\r\n从学院党总支到本科生支部的备注：\r\n222\r\n从本科生支部到研究生支部的备注：\r\n33', '2018-03-27 14:53:18', 1, 1, 4, 3, NULL, NULL, '/webapp/file/2018/03/28/145317/STORJ.docx', 'ND10002', '', NULL, '测试文件名称.docx', 1);
INSERT INTO `document` VALUES (4, 0, 'ceshi2121', 'dad', '', '2018-03-29 14:59:33', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/29/145932/微信图片_220180316102915.jpg', 'dada', 'dada', NULL, 'dada.jpg', 1);
INSERT INTO `document` VALUES (5, 0, 'cehis', 'eq', '', '2018-03-29 14:59:46', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/29/145945/微信图片_20180316180455.png', 'eq', 'eq', NULL, 'eq.png', 1);
INSERT INTO `document` VALUES (6, 0, '12', '21', '', '2018-03-29 14:59:56', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/29/145956/微信图片_20180316192119.jpg', '21', '21', NULL, '21.jpg', 1);
INSERT INTO `document` VALUES (7, 0, '测试7', '打的', '', '2018-03-29 15:10:50', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/29/151049/微信图片_20180316180503.png', '221', '21', NULL, '21.png', 1);
INSERT INTO `document` VALUES (8, 0, '测试8', '', '', '2018-03-29 15:11:06', 1, 1, 0, 2, '21221', NULL, '/webapp/file/2018/03/29/151106/微信图片_20180319144317.jpg', 'dad', '', NULL, '微信图片_20180319144317.jpg', 1);
INSERT INTO `document` VALUES (9, 0, '测试9', 'd', '\r\n从学院党总支到教工二支部的备注：\r\nHH。', '2018-03-29 15:11:27', 1, 1, 3, 1, NULL, NULL, '/webapp/file/2018/03/29/151126/微信图片_20180316102638.jpg', 'da', 'da', NULL, 'da.jpg', 1);
INSERT INTO `document` VALUES (10, 0, '测试10', 'da', '', '2018-03-29 15:11:41', 1, 1, 0, 1, NULL, NULL, '/webapp/file/2018/03/29/151140/微信图片_20180316180503.png', '3133', '', NULL, '微信图片_20180316180503.png', 1);
INSERT INTO `document` VALUES (11, 0, '测试11', '大', '', '2018-03-29 15:11:59', 1, 1, 0, 3, NULL, NULL, '/webapp/file/2018/03/29/151158/微信图片_20180316192119.jpg', 'ss', 'ss', NULL, 'ss.jpg', 1);
INSERT INTO `document` VALUES (12, 0, '本科生测试文件', '大', '\r\n从本科生支部到教工二支部的备注：\r\n3333\r\n从本科生支部到学院党总支的备注：\r\n测试。', '2018-03-29 16:04:10', 4, 5, 1, 3, '成都', NULL, '/webapp/file/2018/03/29/160410/微信图片_20180316102644.jpg', 'NDCE100', 'CD', NULL, '微信图片_20180316102644.jpg', 1);
INSERT INTO `document` VALUES (18, 0, '嗯hi是212', '2121', NULL, '2018-03-29 18:15:07', 1, 1, 0, 2, '打', NULL, '/webapp/file/2018/03/29/181507/微信图片_20180316102644.jpg', 'da', '', NULL, '微信图片_20180316102644.jpg', 1);
INSERT INTO `document` VALUES (24, 0, '测试', '', '', '2018-04-16 11:12:16', 1, 1, 4, 3, '22', NULL, '/webapp/file/2018/04/16/111216/project_business.sql', 'sd1211', '', NULL, 'project_business.sql', 1);
INSERT INTO `document` VALUES (25, 0, '新版测试', '12', NULL, '2018-04-16 11:35:28', 1, 1, 0, 3, '21', NULL, '/webapp/file/2018/04/16/113528/project.sql', '2bdada21', '', NULL, 'project.sql', 1);
INSERT INTO `document` VALUES (26, 0, 'ceshieqweqw', 'eq', NULL, '2018-04-17 13:44:10', 6, 6, 0, 3, 'eq', NULL, '/webapp/file/2018/04/17/134410/222.png', 'eqweq', '', NULL, '222.png', 1);
INSERT INTO `document` VALUES (27, 0, '单点登陆-SSO', 'das', NULL, '2018-04-17 13:54:38', 6, 6, 0, 2, 'da', NULL, '/webapp/file/2018/04/17/135438/222.png', 'ND01212121', 'da', NULL, 'da.png', 1);
INSERT INTO `document` VALUES (28, 0, '21', '21', NULL, '2018-04-17 13:57:11', 6, 6, 0, 3, '', NULL, '/webapp/file/2018/04/17/135711/222.png', '2121', '2121', NULL, '222.png', 1);
INSERT INTO `document` VALUES (29, 0, 'ABCD', '', NULL, '2018-04-17 13:57:43', 1, 1, 0, 3, '', NULL, '/webapp/file/2018/04/17/135743/project_business.sql', 'WQWQ', '', NULL, 'project_business.sql', 1);
INSERT INTO `document` VALUES (30, 0, '21', '121', NULL, '2018-04-17 14:21:00', 6, 6, 0, 3, '2121', NULL, '/webapp/file/2018/04/17/142100/222.png', '212121', '', NULL, '222.png', 1);
INSERT INTO `document` VALUES (31, 0, '2', '2', NULL, '2018-04-17 15:23:35', 5, 2, 0, 2, '22', NULL, '/webapp/file/2018/04/17/152334/222.png', '2222', '', NULL, '222.png', 1);
INSERT INTO `document` VALUES (32, 0, '2121', '21', NULL, '2018-04-17 15:27:33', 6, 6, 0, 3, '', NULL, '/webapp/file/2018/04/17/152732/222.png', '21', '', NULL, '222.png', 1);
INSERT INTO `document` VALUES (33, 0, '2222SS', '', NULL, '2018-04-17 15:41:30', 5, 2, 0, 3, '', NULL, '/webapp/file/2018/04/17/154129/222.png', '222', '', NULL, '222.png', 1);
INSERT INTO `document` VALUES (34, 0, '2dsds', '', NULL, '2018-04-17 15:44:11', 5, 2, 0, 3, '21', NULL, '/webapp/file/2018/04/17/154410/222.png', 'ND011101', '', NULL, '222.png', 1);

-- ----------------------------
-- Table structure for file_map
-- ----------------------------
DROP TABLE IF EXISTS `file_map`;
CREATE TABLE `file_map`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(11) NULL DEFAULT NULL,
  `level1` int(11) NULL DEFAULT 0,
  `level2` int(11) NULL DEFAULT 0,
  `level3` int(11) NULL DEFAULT 0,
  `level4` int(11) NULL DEFAULT 0,
  `level5` int(11) NULL DEFAULT 0,
  `level6` int(11) NULL DEFAULT 0 COMMENT '学校党总支',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_map
-- ----------------------------
INSERT INTO `file_map` VALUES (1, 1, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (2, 2, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (3, 3, 1, 1, 1, 1, 1, 0);
INSERT INTO `file_map` VALUES (4, 4, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (5, 5, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (6, 6, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (7, 7, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (8, 8, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (9, 9, 1, 0, 1, 0, 0, 0);
INSERT INTO `file_map` VALUES (10, 10, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (11, 11, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (12, 12, 1, 0, 1, 0, 1, 0);
INSERT INTO `file_map` VALUES (13, 18, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (15, 24, 1, 0, 0, 1, 0, 0);
INSERT INTO `file_map` VALUES (16, 25, 0, 1, 0, 1, 0, 0);
INSERT INTO `file_map` VALUES (17, 26, 1, 0, 0, 0, 0, 1);
INSERT INTO `file_map` VALUES (18, 27, 1, 0, 0, 0, 0, 1);
INSERT INTO `file_map` VALUES (19, 28, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (20, 29, 1, 1, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (21, 30, 1, 0, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (22, 31, 0, 0, 0, 0, 1, 0);
INSERT INTO `file_map` VALUES (23, 32, 1, 0, 0, 0, 0, 1);
INSERT INTO `file_map` VALUES (24, 33, 1, 1, 0, 0, 0, 0);
INSERT INTO `file_map` VALUES (25, 34, 1, 1, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `serial` bigint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`serial`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '学院党总支');
INSERT INTO `type` VALUES (2, '教工一支部');
INSERT INTO `type` VALUES (3, '教工二支部');
INSERT INTO `type` VALUES (4, '研究生支部');
INSERT INTO `type` VALUES (5, '本科生支部');
INSERT INTO `type` VALUES (6, '学校党总部');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `serial` bigint(4) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type_id` int(2) NULL DEFAULT NULL,
  `power` int(4) NULL DEFAULT 0 COMMENT '权限，是否可以管理用户',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `politics_character` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`serial`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', 1, 1, '男士', '1', '1', '李四');
INSERT INTO `user` VALUES (2, '100', '100', 5, 1, '男士', '共青团员', 'yaxu.song@mljr.com', '白雪良');
INSERT INTO `user` VALUES (3, '101', '101', 4, 0, '女士', '共青团员', 'zhangsna@123.com', '张三');
INSERT INTO `user` VALUES (4, '5', '5', 5, 1, '女士', '5', '15', '5');
INSERT INTO `user` VALUES (5, '2', '2', 2, 0, '女士', '22', '2', '2');
INSERT INTO `user` VALUES (6, '6', '6', 6, 1, '男士', '22', '12', '6');

SET FOREIGN_KEY_CHECKS = 1;
