/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : admin

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 17/05/2020 18:15:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned DEFAULT '0' COMMENT '标签ID',
  `title` varchar(100) DEFAULT '' COMMENT '文章标题',
  `desc` varchar(255) DEFAULT '' COMMENT '简述',
  `content` text COMMENT '内容',
  `cover_image_url` varchar(255) DEFAULT '' COMMENT '封面图片地址',
  `created_on` int unsigned DEFAULT '0' COMMENT '新建时间',
  `created_by` varchar(100) DEFAULT '' COMMENT '创建人',
  `modified_on` int unsigned DEFAULT '0' COMMENT '修改时间',
  `modified_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `deleted_on` int unsigned DEFAULT '0',
  `state` tinyint unsigned DEFAULT '1' COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章管理';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_auth
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth`;
CREATE TABLE `blog_auth` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '账号',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_auth
-- ----------------------------
BEGIN;
INSERT INTO `blog_auth` VALUES (1, 'test', 'test123');
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '标签名称',
  `created_on` int unsigned DEFAULT '0' COMMENT '创建时间',
  `created_by` varchar(100) DEFAULT '' COMMENT '创建人',
  `modified_on` int unsigned DEFAULT '0' COMMENT '修改时间',
  `modified_by` varchar(100) DEFAULT '' COMMENT '修改人',
  `deleted_on` int unsigned DEFAULT '0' COMMENT '删除时间',
  `state` tinyint unsigned DEFAULT '1' COMMENT '状态 0为禁用、1为启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章标签管理';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for goadmin_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_menu`;
CREATE TABLE `goadmin_menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_menu
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_menu` VALUES (1, 0, 1, 2, 'Admin', 'fa-tasks', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (2, 1, 1, 2, 'Users', 'fa-users', '/info/manager', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (3, 1, 1, 3, 'Roles', 'fa-user', '/info/roles', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (4, 1, 1, 4, 'Permission', 'fa-ban', '/info/permission', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (5, 1, 1, 5, 'Menu', 'fa-bars', '/menu', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (6, 1, 1, 6, 'Operation log', 'fa-history', '/info/op', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (7, 0, 1, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_menu` VALUES (8, 0, 0, 2, '内容', 'fa-bars', '', '', '2020-05-13 18:14:36', '2020-05-13 18:14:36');
INSERT INTO `goadmin_menu` VALUES (9, 8, 0, 2, '文章', 'fa-bars', '/info/blog_article', '', '2020-05-13 18:15:36', '2020-05-13 18:15:36');
INSERT INTO `goadmin_menu` VALUES (10, 8, 0, 2, '作者', 'fa-bars', '/info/blog_auth', '', '2020-05-13 18:16:03', '2020-05-13 18:16:03');
INSERT INTO `goadmin_menu` VALUES (11, 8, 0, 2, '标签', 'fa-bars', '/info/blog_tag', '', '2020-05-13 18:16:27', '2020-05-13 18:16:27');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_operation_log`;
CREATE TABLE `goadmin_operation_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_operation_log` VALUES (1, 1, '/admin', 'GET', '::1', '', '2020-05-13 18:10:13', '2020-05-13 18:10:13');
INSERT INTO `goadmin_operation_log` VALUES (2, 1, '/admin/info/op', 'GET', '::1', '', '2020-05-13 18:10:17', '2020-05-13 18:10:17');
INSERT INTO `goadmin_operation_log` VALUES (3, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:10:19', '2020-05-13 18:10:19');
INSERT INTO `goadmin_operation_log` VALUES (4, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-13 18:10:20', '2020-05-13 18:10:20');
INSERT INTO `goadmin_operation_log` VALUES (5, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-13 18:10:24', '2020-05-13 18:10:24');
INSERT INTO `goadmin_operation_log` VALUES (6, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-13 18:10:25', '2020-05-13 18:10:25');
INSERT INTO `goadmin_operation_log` VALUES (7, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:10:26', '2020-05-13 18:10:26');
INSERT INTO `goadmin_operation_log` VALUES (8, 1, '/admin', 'GET', '::1', '', '2020-05-13 18:10:27', '2020-05-13 18:10:27');
INSERT INTO `goadmin_operation_log` VALUES (9, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:12:17', '2020-05-13 18:12:17');
INSERT INTO `goadmin_operation_log` VALUES (10, 1, '/admin', 'GET', '::1', '', '2020-05-13 18:12:48', '2020-05-13 18:12:48');
INSERT INTO `goadmin_operation_log` VALUES (11, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-13 18:12:49', '2020-05-13 18:12:49');
INSERT INTO `goadmin_operation_log` VALUES (12, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:12:51', '2020-05-13 18:12:51');
INSERT INTO `goadmin_operation_log` VALUES (13, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:13:55', '2020-05-13 18:13:55');
INSERT INTO `goadmin_operation_log` VALUES (14, 1, '/admin/menu/new', 'POST', '::1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"8e52ad45-3351-49b8-8704-a970e17cdcaa\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"\"],\"roles[]\":[\"1\"],\"title\":[\"内容\"],\"uri\":[\"\"]}', '2020-05-13 18:14:36', '2020-05-13 18:14:36');
INSERT INTO `goadmin_operation_log` VALUES (15, 1, '/admin/menu/new', 'POST', '::1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"8128ccc7-fd55-439d-86e2-3620b3a48e1d\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"8\"],\"roles[]\":[\"1\"],\"title\":[\"文章\"],\"uri\":[\"/info/blog_article\"]}', '2020-05-13 18:15:36', '2020-05-13 18:15:36');
INSERT INTO `goadmin_operation_log` VALUES (16, 1, '/admin/menu/new', 'POST', '::1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"5aaeccaf-354e-43e0-b38d-aea40f9e9601\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"8\"],\"roles[]\":[\"1\"],\"title\":[\"作者\"],\"uri\":[\"/info/blog_auth\"]}', '2020-05-13 18:16:04', '2020-05-13 18:16:04');
INSERT INTO `goadmin_operation_log` VALUES (17, 1, '/admin/menu/new', 'POST', '::1', '{\"__go_admin_previous_\":[\"/admin/menu\"],\"__go_admin_t_\":[\"b8bf1d72-cf41-4eba-a62c-5ed9d4771e0a\"],\"header\":[\"\"],\"icon\":[\"fa-bars\"],\"parent_id\":[\"8\"],\"roles[]\":[\"1\"],\"title\":[\"标签\"],\"uri\":[\"/info/blog_tag\"]}', '2020-05-13 18:16:27', '2020-05-13 18:16:27');
INSERT INTO `goadmin_operation_log` VALUES (18, 1, '/admin/menu', 'GET', '::1', '', '2020-05-13 18:16:31', '2020-05-13 18:16:31');
INSERT INTO `goadmin_operation_log` VALUES (19, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-13 18:16:34', '2020-05-13 18:16:34');
INSERT INTO `goadmin_operation_log` VALUES (20, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:16:35', '2020-05-13 18:16:35');
INSERT INTO `goadmin_operation_log` VALUES (21, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-13 18:16:37', '2020-05-13 18:16:37');
INSERT INTO `goadmin_operation_log` VALUES (22, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-13 18:24:25', '2020-05-13 18:24:25');
INSERT INTO `goadmin_operation_log` VALUES (23, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:26', '2020-05-13 18:24:26');
INSERT INTO `goadmin_operation_log` VALUES (24, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:27', '2020-05-13 18:24:27');
INSERT INTO `goadmin_operation_log` VALUES (25, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:27', '2020-05-13 18:24:27');
INSERT INTO `goadmin_operation_log` VALUES (26, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:28', '2020-05-13 18:24:28');
INSERT INTO `goadmin_operation_log` VALUES (27, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:28', '2020-05-13 18:24:28');
INSERT INTO `goadmin_operation_log` VALUES (28, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:28', '2020-05-13 18:24:28');
INSERT INTO `goadmin_operation_log` VALUES (29, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:28', '2020-05-13 18:24:28');
INSERT INTO `goadmin_operation_log` VALUES (30, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:29', '2020-05-13 18:24:29');
INSERT INTO `goadmin_operation_log` VALUES (31, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:29', '2020-05-13 18:24:29');
INSERT INTO `goadmin_operation_log` VALUES (32, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:29', '2020-05-13 18:24:29');
INSERT INTO `goadmin_operation_log` VALUES (33, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:29', '2020-05-13 18:24:29');
INSERT INTO `goadmin_operation_log` VALUES (34, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:29', '2020-05-13 18:24:29');
INSERT INTO `goadmin_operation_log` VALUES (35, 1, '/admin/info/blog_auth/new', 'GET', '::1', '', '2020-05-13 18:24:32', '2020-05-13 18:24:32');
INSERT INTO `goadmin_operation_log` VALUES (36, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:24:34', '2020-05-13 18:24:34');
INSERT INTO `goadmin_operation_log` VALUES (37, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:25:08', '2020-05-13 18:25:08');
INSERT INTO `goadmin_operation_log` VALUES (38, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-13 18:27:52', '2020-05-13 18:27:52');
INSERT INTO `goadmin_operation_log` VALUES (39, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-13 18:27:54', '2020-05-13 18:27:54');
INSERT INTO `goadmin_operation_log` VALUES (40, 1, '/admin/menu/new', 'GET', '::1', '', '2020-05-14 14:45:12', '2020-05-14 14:45:12');
INSERT INTO `goadmin_operation_log` VALUES (41, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-14 14:46:39', '2020-05-14 14:46:39');
INSERT INTO `goadmin_operation_log` VALUES (42, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-14 16:58:31', '2020-05-14 16:58:31');
INSERT INTO `goadmin_operation_log` VALUES (43, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-14 18:28:39', '2020-05-14 18:28:39');
INSERT INTO `goadmin_operation_log` VALUES (44, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:28:42', '2020-05-14 18:28:42');
INSERT INTO `goadmin_operation_log` VALUES (45, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:28:43', '2020-05-14 18:28:43');
INSERT INTO `goadmin_operation_log` VALUES (46, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:28:43', '2020-05-14 18:28:43');
INSERT INTO `goadmin_operation_log` VALUES (47, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:29:34', '2020-05-14 18:29:34');
INSERT INTO `goadmin_operation_log` VALUES (48, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:29:36', '2020-05-14 18:29:36');
INSERT INTO `goadmin_operation_log` VALUES (49, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:29:36', '2020-05-14 18:29:36');
INSERT INTO `goadmin_operation_log` VALUES (50, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:29:37', '2020-05-14 18:29:37');
INSERT INTO `goadmin_operation_log` VALUES (51, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-14 18:29:39', '2020-05-14 18:29:39');
INSERT INTO `goadmin_operation_log` VALUES (52, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-14 18:29:40', '2020-05-14 18:29:40');
INSERT INTO `goadmin_operation_log` VALUES (53, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-14 18:29:40', '2020-05-14 18:29:40');
INSERT INTO `goadmin_operation_log` VALUES (54, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:29:42', '2020-05-14 18:29:42');
INSERT INTO `goadmin_operation_log` VALUES (55, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:29:44', '2020-05-14 18:29:44');
INSERT INTO `goadmin_operation_log` VALUES (56, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:31:13', '2020-05-14 18:31:13');
INSERT INTO `goadmin_operation_log` VALUES (57, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:31:14', '2020-05-14 18:31:14');
INSERT INTO `goadmin_operation_log` VALUES (58, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:31:14', '2020-05-14 18:31:14');
INSERT INTO `goadmin_operation_log` VALUES (59, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:31:15', '2020-05-14 18:31:15');
INSERT INTO `goadmin_operation_log` VALUES (60, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:31:16', '2020-05-14 18:31:16');
INSERT INTO `goadmin_operation_log` VALUES (61, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:31:17', '2020-05-14 18:31:17');
INSERT INTO `goadmin_operation_log` VALUES (62, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:31:17', '2020-05-14 18:31:17');
INSERT INTO `goadmin_operation_log` VALUES (63, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-14 18:31:19', '2020-05-14 18:31:19');
INSERT INTO `goadmin_operation_log` VALUES (64, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-14 18:31:21', '2020-05-14 18:31:21');
INSERT INTO `goadmin_operation_log` VALUES (65, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-14 18:31:21', '2020-05-14 18:31:21');
INSERT INTO `goadmin_operation_log` VALUES (66, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:31:43', '2020-05-14 18:31:43');
INSERT INTO `goadmin_operation_log` VALUES (67, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-14 18:31:56', '2020-05-14 18:31:56');
INSERT INTO `goadmin_operation_log` VALUES (68, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:31:58', '2020-05-14 18:31:58');
INSERT INTO `goadmin_operation_log` VALUES (69, 1, '/admin', 'GET', '::1', '', '2020-05-14 18:34:59', '2020-05-14 18:34:59');
INSERT INTO `goadmin_operation_log` VALUES (70, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-14 18:35:01', '2020-05-14 18:35:01');
INSERT INTO `goadmin_operation_log` VALUES (71, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-14 18:35:02', '2020-05-14 18:35:02');
INSERT INTO `goadmin_operation_log` VALUES (72, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-14 18:35:03', '2020-05-14 18:35:03');
INSERT INTO `goadmin_operation_log` VALUES (73, 1, '/admin', 'GET', '::1', '', '2020-05-15 10:51:38', '2020-05-15 10:51:38');
INSERT INTO `goadmin_operation_log` VALUES (74, 1, '/admin', 'GET', '::1', '', '2020-05-17 14:56:25', '2020-05-17 14:56:25');
INSERT INTO `goadmin_operation_log` VALUES (75, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 14:57:02', '2020-05-17 14:57:02');
INSERT INTO `goadmin_operation_log` VALUES (76, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 14:57:03', '2020-05-17 14:57:03');
INSERT INTO `goadmin_operation_log` VALUES (77, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 14:57:04', '2020-05-17 14:57:04');
INSERT INTO `goadmin_operation_log` VALUES (78, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 14:57:05', '2020-05-17 14:57:05');
INSERT INTO `goadmin_operation_log` VALUES (79, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 15:25:23', '2020-05-17 15:25:23');
INSERT INTO `goadmin_operation_log` VALUES (80, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 15:34:09', '2020-05-17 15:34:09');
INSERT INTO `goadmin_operation_log` VALUES (81, 1, '/admin', 'GET', '::1', '', '2020-05-17 15:34:10', '2020-05-17 15:34:10');
INSERT INTO `goadmin_operation_log` VALUES (82, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-17 15:34:12', '2020-05-17 15:34:12');
INSERT INTO `goadmin_operation_log` VALUES (83, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-17 15:34:13', '2020-05-17 15:34:13');
INSERT INTO `goadmin_operation_log` VALUES (84, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-17 15:34:13', '2020-05-17 15:34:13');
INSERT INTO `goadmin_operation_log` VALUES (85, 1, '/admin/menu', 'GET', '::1', '', '2020-05-17 15:34:14', '2020-05-17 15:34:14');
INSERT INTO `goadmin_operation_log` VALUES (86, 1, '/admin/info/op', 'GET', '::1', '', '2020-05-17 15:34:14', '2020-05-17 15:34:14');
INSERT INTO `goadmin_operation_log` VALUES (87, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 15:34:16', '2020-05-17 15:34:16');
INSERT INTO `goadmin_operation_log` VALUES (88, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 15:34:17', '2020-05-17 15:34:17');
INSERT INTO `goadmin_operation_log` VALUES (89, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 15:34:18', '2020-05-17 15:34:18');
INSERT INTO `goadmin_operation_log` VALUES (90, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 15:47:40', '2020-05-17 15:47:40');
INSERT INTO `goadmin_operation_log` VALUES (91, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 16:12:09', '2020-05-17 16:12:09');
INSERT INTO `goadmin_operation_log` VALUES (92, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 16:12:10', '2020-05-17 16:12:10');
INSERT INTO `goadmin_operation_log` VALUES (93, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:18:17', '2020-05-17 17:18:17');
INSERT INTO `goadmin_operation_log` VALUES (94, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:18:20', '2020-05-17 17:18:20');
INSERT INTO `goadmin_operation_log` VALUES (95, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 17:18:20', '2020-05-17 17:18:20');
INSERT INTO `goadmin_operation_log` VALUES (96, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 17:18:21', '2020-05-17 17:18:21');
INSERT INTO `goadmin_operation_log` VALUES (97, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-17 17:18:23', '2020-05-17 17:18:23');
INSERT INTO `goadmin_operation_log` VALUES (98, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-17 17:18:23', '2020-05-17 17:18:23');
INSERT INTO `goadmin_operation_log` VALUES (99, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-17 17:18:24', '2020-05-17 17:18:24');
INSERT INTO `goadmin_operation_log` VALUES (100, 1, '/admin/menu', 'GET', '::1', '', '2020-05-17 17:18:25', '2020-05-17 17:18:25');
INSERT INTO `goadmin_operation_log` VALUES (101, 1, '/admin/menu', 'GET', '::1', '', '2020-05-17 17:20:03', '2020-05-17 17:20:03');
INSERT INTO `goadmin_operation_log` VALUES (102, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:20:05', '2020-05-17 17:20:05');
INSERT INTO `goadmin_operation_log` VALUES (103, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:20:06', '2020-05-17 17:20:06');
INSERT INTO `goadmin_operation_log` VALUES (104, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:20:07', '2020-05-17 17:20:07');
INSERT INTO `goadmin_operation_log` VALUES (105, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:20:23', '2020-05-17 17:20:23');
INSERT INTO `goadmin_operation_log` VALUES (106, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:21:12', '2020-05-17 17:21:12');
INSERT INTO `goadmin_operation_log` VALUES (107, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 17:21:13', '2020-05-17 17:21:13');
INSERT INTO `goadmin_operation_log` VALUES (108, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 17:21:14', '2020-05-17 17:21:14');
INSERT INTO `goadmin_operation_log` VALUES (109, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:23:00', '2020-05-17 17:23:00');
INSERT INTO `goadmin_operation_log` VALUES (110, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 17:23:01', '2020-05-17 17:23:01');
INSERT INTO `goadmin_operation_log` VALUES (111, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 17:23:01', '2020-05-17 17:23:01');
INSERT INTO `goadmin_operation_log` VALUES (112, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 17:29:22', '2020-05-17 17:29:22');
INSERT INTO `goadmin_operation_log` VALUES (113, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:29:25', '2020-05-17 17:29:25');
INSERT INTO `goadmin_operation_log` VALUES (114, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:29:29', '2020-05-17 17:29:29');
INSERT INTO `goadmin_operation_log` VALUES (115, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:29:32', '2020-05-17 17:29:32');
INSERT INTO `goadmin_operation_log` VALUES (116, 1, '/admin/hello', 'GET', '::1', '', '2020-05-17 17:29:40', '2020-05-17 17:29:40');
INSERT INTO `goadmin_operation_log` VALUES (117, 1, '/admin/form', 'GET', '::1', '', '2020-05-17 17:29:47', '2020-05-17 17:29:47');
INSERT INTO `goadmin_operation_log` VALUES (118, 1, '/admin/table', 'GET', '::1', '', '2020-05-17 17:29:56', '2020-05-17 17:29:56');
INSERT INTO `goadmin_operation_log` VALUES (119, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:29:58', '2020-05-17 17:29:58');
INSERT INTO `goadmin_operation_log` VALUES (120, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:32:47', '2020-05-17 17:32:47');
INSERT INTO `goadmin_operation_log` VALUES (121, 1, '/admin', 'GET', '::1', '', '2020-05-17 17:32:49', '2020-05-17 17:32:49');
INSERT INTO `goadmin_operation_log` VALUES (122, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-17 17:33:35', '2020-05-17 17:33:35');
INSERT INTO `goadmin_operation_log` VALUES (123, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-17 17:33:36', '2020-05-17 17:33:36');
INSERT INTO `goadmin_operation_log` VALUES (124, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-17 17:33:36', '2020-05-17 17:33:36');
INSERT INTO `goadmin_operation_log` VALUES (125, 1, '/admin/info/blog_article', 'GET', '::1', '', '2020-05-17 17:33:38', '2020-05-17 17:33:38');
INSERT INTO `goadmin_operation_log` VALUES (126, 1, '/admin/info/blog_auth', 'GET', '::1', '', '2020-05-17 17:33:38', '2020-05-17 17:33:38');
INSERT INTO `goadmin_operation_log` VALUES (127, 1, '/admin/info/blog_tag', 'GET', '::1', '', '2020-05-17 17:33:39', '2020-05-17 17:33:39');
INSERT INTO `goadmin_operation_log` VALUES (128, 1, '/admin/info/op', 'GET', '::1', '', '2020-05-17 17:37:49', '2020-05-17 17:37:49');
INSERT INTO `goadmin_operation_log` VALUES (129, 1, '/admin/info/site/edit', 'GET', '::1', '', '2020-05-17 17:38:40', '2020-05-17 17:38:40');
INSERT INTO `goadmin_operation_log` VALUES (130, 1, '/admin/edit/site', 'POST', '::1', '{\"__checkbox__debug\":[\"on\"],\"__checkbox__no_limit_login_ip\":[\"on\"],\"access_assets_log_off\":[\"false\"],\"access_log_off\":[\"false\"],\"access_log_path\":[\"\"],\"animation_delay\":[\"0.00\"],\"animation_duration\":[\"0.00\"],\"animation_type\":[\"\"],\"asset_url\":[\"\"],\"color_scheme\":[\"skin-black\"],\"custom_foot_html\":[\"\"],\"custom_head_html\":[\"\"],\"debug\":[\"true\"],\"env\":[\"local\"],\"error_log_off\":[\"false\"],\"error_log_path\":[\"\"],\"extra\":[\"\"],\"file_upload_engine\":[\"{\\\"name\\\":\\\"local\\\",\\\"config\\\":null}\"],\"footer_info\":[\"\"],\"id\":[\"1\"],\"info_log_off\":[\"false\"],\"info_log_path\":[\"\"],\"language\":[\"zh\"],\"logger_encoder_caller\":[\"full\"],\"logger_encoder_caller_key\":[\"caller\"],\"logger_encoder_duration\":[\"string\"],\"logger_encoder_encoding\":[\"console\"],\"logger_encoder_level\":[\"capitalColor\"],\"logger_encoder_level_key\":[\"level\"],\"logger_encoder_message_key\":[\"msg\"],\"logger_encoder_name_key\":[\"logger\"],\"logger_encoder_stacktrace_key\":[\"stacktrace\"],\"logger_encoder_time\":[\"iso8601\"],\"logger_encoder_time_key\":[\"ts\"],\"logger_level\":[\"0\"],\"logger_rotate_compress\":[\"false\"],\"logger_rotate_max_age\":[\"30\"],\"logger_rotate_max_backups\":[\"5\"],\"logger_rotate_max_size\":[\"10\"],\"login_logo\":[\"\"],\"login_title\":[\"GoAdmin\"],\"logo\":[\"\\u003cb\\u003eGo\\u003c/b\\u003eAdmin\"],\"mini_logo\":[\"\\u003cb\\u003eG\\u003c/b\\u003eA\"],\"no_limit_login_ip\":[\"true\"],\"session_life_time\":[\"7200\"],\"sql_log\":[\"false\"],\"theme\":[\"adminlte\"],\"title\":[\"GoAdmin\"]}', '2020-05-17 17:39:26', '2020-05-17 17:39:26');
INSERT INTO `goadmin_operation_log` VALUES (131, 1, '/admin/info/site/edit', 'GET', '::1', '', '2020-05-17 17:39:27', '2020-05-17 17:39:27');
INSERT INTO `goadmin_operation_log` VALUES (132, 1, '/admin/application/info', 'GET', '::1', '', '2020-05-17 17:39:32', '2020-05-17 17:39:32');
INSERT INTO `goadmin_operation_log` VALUES (133, 1, '/admin/info/normal_manager/edit', 'GET', '::1', '', '2020-05-17 17:40:48', '2020-05-17 17:40:48');
INSERT INTO `goadmin_operation_log` VALUES (134, 1, '/admin/application/info', 'GET', '::1', '', '2020-05-17 17:41:22', '2020-05-17 17:41:22');
INSERT INTO `goadmin_operation_log` VALUES (135, 1, '/admin/info/manager', 'GET', '::1', '', '2020-05-17 17:41:24', '2020-05-17 17:41:24');
INSERT INTO `goadmin_operation_log` VALUES (136, 1, '/admin/info/roles', 'GET', '::1', '', '2020-05-17 17:41:26', '2020-05-17 17:41:26');
INSERT INTO `goadmin_operation_log` VALUES (137, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-17 17:41:27', '2020-05-17 17:41:27');
INSERT INTO `goadmin_operation_log` VALUES (138, 1, '/admin/info/permission', 'GET', '::1', '', '2020-05-17 17:41:31', '2020-05-17 17:41:31');
INSERT INTO `goadmin_operation_log` VALUES (139, 1, '/admin/menu', 'GET', '::1', '', '2020-05-17 17:41:47', '2020-05-17 17:41:47');
INSERT INTO `goadmin_operation_log` VALUES (140, 1, '/admin/info/op', 'GET', '::1', '', '2020-05-17 17:41:50', '2020-05-17 17:41:50');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_permissions`;
CREATE TABLE `goadmin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_permissions` VALUES (1, 'All permission', '*', '', '*', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET,PUT,POST,DELETE', '/', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_permissions` VALUES (3, 'blog_article Query', 'blog_article_query', 'GET', '/info/blog_article', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (4, 'blog_article Show Edit Form Page', 'blog_article_show_edit', 'GET', '/info/blog_article/edit', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (5, 'blog_article Show Create Form Page', 'blog_article_show_create', 'GET', '/info/blog_article/new', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (6, 'blog_article Edit', 'blog_article_edit', 'POST', '/edit/blog_article', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (7, 'blog_article Create', 'blog_article_create', 'POST', '/new/blog_article', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (8, 'blog_article Delete', 'blog_article_delete', 'POST', '/delete/blog_article', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (9, 'blog_article Export', 'blog_article_export', 'POST', '/export/blog_article', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (10, 'blog_auth Query', 'blog_auth_query', 'GET', '/info/blog_auth', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (11, 'blog_auth Show Edit Form Page', 'blog_auth_show_edit', 'GET', '/info/blog_auth/edit', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (12, 'blog_auth Show Create Form Page', 'blog_auth_show_create', 'GET', '/info/blog_auth/new', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (13, 'blog_auth Edit', 'blog_auth_edit', 'POST', '/edit/blog_auth', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (14, 'blog_auth Create', 'blog_auth_create', 'POST', '/new/blog_auth', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (15, 'blog_auth Delete', 'blog_auth_delete', 'POST', '/delete/blog_auth', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (16, 'blog_auth Export', 'blog_auth_export', 'POST', '/export/blog_auth', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (17, 'blog_tag Query', 'blog_tag_query', 'GET', '/info/blog_tag', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (18, 'blog_tag Show Edit Form Page', 'blog_tag_show_edit', 'GET', '/info/blog_tag/edit', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (19, 'blog_tag Show Create Form Page', 'blog_tag_show_create', 'GET', '/info/blog_tag/new', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (20, 'blog_tag Edit', 'blog_tag_edit', 'POST', '/edit/blog_tag', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (21, 'blog_tag Create', 'blog_tag_create', 'POST', '/new/blog_tag', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (22, 'blog_tag Delete', 'blog_tag_delete', 'POST', '/delete/blog_tag', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
INSERT INTO `goadmin_permissions` VALUES (23, 'blog_tag Export', 'blog_tag_export', 'POST', '/export/blog_tag', '2020-05-13 17:35:42', '2020-05-13 17:35:42');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_menu`;
CREATE TABLE `goadmin_role_menu` (
  `role_id` int unsigned NOT NULL,
  `menu_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_role_menu` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (1, 7, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (2, 7, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_menu` VALUES (1, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (2, 8, '2019-09-11 10:20:55', '2019-09-11 10:20:55');
INSERT INTO `goadmin_role_menu` VALUES (1, 9, '2020-05-13 18:15:36', '2020-05-13 18:15:36');
INSERT INTO `goadmin_role_menu` VALUES (1, 10, '2020-05-13 18:16:03', '2020-05-13 18:16:03');
INSERT INTO `goadmin_role_menu` VALUES (1, 11, '2020-05-13 18:16:27', '2020-05-13 18:16:27');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_permissions`;
CREATE TABLE `goadmin_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_role_permissions` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_role_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (1, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_role_users`;
CREATE TABLE `goadmin_role_users` (
  `role_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_user_roles` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_role_users` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_role_users` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_roles
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_roles`;
CREATE TABLE `goadmin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_roles
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_roles` VALUES (1, 'Administrator', 'administrator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_roles` VALUES (2, 'Operator', 'operator', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_session
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_session`;
CREATE TABLE `goadmin_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `values` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of goadmin_session
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_session` VALUES (6, 'c3e34309-e8d7-4e84-b274-a45815e96240', '{\"user_id\":1}', '2020-05-17 17:18:17', '2020-05-17 17:18:17');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_site
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_site`;
CREATE TABLE `goadmin_site` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_site
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_site` VALUES (1, 'logger_encoder_name_key', 'logger', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (2, 'asset_url', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (3, 'site_off', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (4, 'login_url', '/login', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (5, 'logger_encoder_caller_key', 'caller', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (6, 'animation_delay', '0.00', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (7, 'logger_rotate_max_size', '10', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (8, 'logo', '<b>Go</b>Admin', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (9, 'index_url', '/', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (10, 'logger_encoder_caller', 'full', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (11, 'logger_level', '0', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (12, 'session_life_time', '7200', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (13, 'store', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (14, 'access_assets_log_off', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (15, 'env', 'local', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (16, 'logger_encoder_level_key', 'level', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (17, 'logger_encoder_stacktrace_key', 'stacktrace', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (18, 'footer_info', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (19, 'animation_duration', '0.00', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (20, 'no_limit_login_ip', 'true', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (21, 'domain', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (22, 'debug', 'true', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (23, 'theme', 'adminlte', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (24, 'logger_encoder_level', 'capitalColor', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (25, 'info_log_off', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (26, 'access_log_path', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (27, 'language', 'zh', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (28, 'error_log_path', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (29, 'sql_log', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (30, 'logger_rotate_max_age', '30', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (31, 'logger_encoder_time', 'iso8601', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (32, 'url_prefix', 'admin', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (33, 'mini_logo', '<b>G</b>A', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (34, 'extra', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (35, 'logger_encoder_encoding', 'console', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (36, 'error_log_off', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (37, 'color_scheme', 'skin-black', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (38, 'custom_head_html', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (39, 'custom_foot_html', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (40, 'login_logo', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (41, 'info_log_path', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (42, 'file_upload_engine', '{\"name\":\"local\",\"config\":null}', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (43, 'logger_encoder_time_key', 'ts', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (44, 'auth_user_table', 'goadmin_users', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (45, 'access_log_off', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (46, 'logger_rotate_max_backups', '5', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (47, 'logger_rotate_compress', 'false', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (48, 'logger_encoder_duration', 'string', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (49, 'login_title', 'GoAdmin', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (50, 'animation_type', '', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (51, 'databases', '{\"default\":{\"host\":\"127.0.0.1\",\"port\":\"3306\",\"user\":\"root\",\"pwd\":\"Magento@123\",\"name\":\"admin\",\"max_idle_con\":50,\"max_open_con\":150,\"driver\":\"mysql\",\"file\":\"\",\"dsn\":\"\"}}', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (52, 'logger_encoder_message_key', 'msg', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
INSERT INTO `goadmin_site` VALUES (53, 'title', 'GoAdmin', NULL, 1, '2020-05-13 18:09:16', '2020-05-13 18:09:16');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_user_permissions`;
CREATE TABLE `goadmin_user_permissions` (
  `user_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_user_permissions` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_user_permissions` VALUES (1, 1, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_user_permissions` VALUES (2, 2, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for goadmin_users
-- ----------------------------
DROP TABLE IF EXISTS `goadmin_users`;
CREATE TABLE `goadmin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of goadmin_users
-- ----------------------------
BEGIN;
INSERT INTO `goadmin_users` VALUES (1, 'admin', '$2a$10$sAW9BDmB4GON.iY0xKEAl.JlOp7qz3zlYnGb9kEbr1xI03hMpcf56', 'admin', '', 'tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh', '2019-09-10 00:00:00', '2019-09-10 00:00:00');
INSERT INTO `goadmin_users` VALUES (2, 'operator', '$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.', 'Operator', '', NULL, '2019-09-10 00:00:00', '2019-09-10 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
