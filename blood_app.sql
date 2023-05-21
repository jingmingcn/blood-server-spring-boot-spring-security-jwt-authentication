/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : blood_app

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 22/05/2023 00:51:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
BEGIN;
INSERT INTO `hibernate_sequence` VALUES (7);
COMMIT;

-- ----------------------------
-- Table structure for refreshtoken
-- ----------------------------
DROP TABLE IF EXISTS `refreshtoken`;
CREATE TABLE `refreshtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa652xrdji49m4isx38pp4p80p` (`user_id`),
  CONSTRAINT `FKa652xrdji49m4isx38pp4p80p` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of refreshtoken
-- ----------------------------
BEGIN;
INSERT INTO `refreshtoken` VALUES (2, 13, 'd9bc4175-978a-48d4-8603-197cb9c950a5', '2023-05-22 23:16:28');
INSERT INTO `refreshtoken` VALUES (3, 14, 'aca07e90-dc17-40dc-8bab-1723637d660d', '2023-05-22 23:28:16');
INSERT INTO `refreshtoken` VALUES (4, 15, '8a527c53-333e-489f-871d-013e3564982d', '2023-05-23 00:05:16');
INSERT INTO `refreshtoken` VALUES (5, 16, '918454b9-2d95-4b75-892b-6c8dd42d5e42', '2023-05-23 00:29:41');
INSERT INTO `refreshtoken` VALUES (6, 16, 'e288ff3c-b602-4364-bb88-f1464d0790d9', '2023-05-23 00:30:31');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'ROLE_USER');
INSERT INTO `roles` VALUES (2, 'ROLE_MODERATOR');
INSERT INTO `roles` VALUES (3, 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  KEY `FKhfh9dx7w3ubf1co1vdev94g3f` (`user_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
BEGIN;
INSERT INTO `user_roles` VALUES (13, 1);
INSERT INTO `user_roles` VALUES (14, 1);
INSERT INTO `user_roles` VALUES (15, 1);
INSERT INTO `user_roles` VALUES (16, 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `cellphone` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (13, 'abc', 'aj@k.cok', '$2a$10$au/jwRT0T/pPdhxRMy2mlOXQJk/rr.BB9YXM0DZhUdTahFJgExiSC', '111-1111-1111');
INSERT INTO `users` VALUES (14, 'abcc', 'ab@kk.com', '$2a$10$vhC7IcuXPbOPQFWUy7uU8uHiE/noxw0fSya3uCvRu8S60Rt5xPA7e', '123-3333-3333');
INSERT INTO `users` VALUES (15, 'jjjjjj', 'ad@kk.com', '$2a$10$N2lCsi9DJIFLJUC4rrrTT.ZEtmhziBoK3hd30p0pXCNX6xQ3RpnMa', '111-1111-1111');
INSERT INTO `users` VALUES (16, 'jingming', 'jingming@sdu.edu.cn', '$2a$10$E/ZTpbIeuc4A8DJw.1ovJ.bJSr4frklPvbfZ5J1s/Qv3olQTAJGkO', '131-0531-0135');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
