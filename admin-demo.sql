/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100148
 Source Host           : localhost:3306
 Source Schema         : admin-demo

 Target Server Type    : MariaDB
 Target Server Version : 100148
 File Encoding         : 65001

 Date: 19/10/2022 13:44:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 0, '文章管理', 'fa-book', NULL, NULL, '2022-10-18 13:04:36', '2022-10-18 13:04:56');
INSERT INTO `admin_menu` VALUES (9, 8, 0, '所有文章', 'fa-files-o', '/news', NULL, '2022-10-18 13:05:18', '2022-10-18 13:05:18');
INSERT INTO `admin_menu` VALUES (10, 8, 0, '文章分類', 'fa-bookmark', '/category', NULL, '2022-10-18 13:05:51', '2022-10-18 13:05:51');
INSERT INTO `admin_menu` VALUES (11, 0, 8, 'Media manager', 'fa-file', 'media', NULL, '2022-10-18 13:06:09', '2022-10-18 13:06:09');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 13:04:16', '2022-10-18 13:04:16');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:04:25', '2022-10-18 13:04:25');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:04:36', '2022-10-18 13:04:36');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-10-18 13:04:36', '2022-10-18 13:04:36');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:04:42', '2022-10-18 13:04:42');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa-book\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}', '2022-10-18 13:04:55', '2022-10-18 13:04:55');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-10-18 13:04:56', '2022-10-18 13:04:56');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u6240\\u6709\\u6587\\u7ae0\",\"icon\":\"fa-files-o\",\"uri\":\"\\/news\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:05:18', '2022-10-18 13:05:18');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-10-18 13:05:19', '2022-10-18 13:05:19');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u6587\\u7ae0\\u5206\\u985e\",\"icon\":\"fa-bookmark\",\"uri\":\"\\/category\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:05:51', '2022-10-18 13:05:51');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-10-18 13:05:52', '2022-10-18 13:05:52');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-10-18 13:06:21', '2022-10-18 13:06:21');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:07:46', '2022-10-18 13:07:46');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:13:29', '2022-10-18 13:13:29');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/media/download', 'GET', '127.0.0.1', '{\"file\":\"work.png\"}', '2022-10-18 13:13:34', '2022-10-18 13:13:34');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/addToCarousel', 'POST', '127.0.0.1', '{\"path\":\"work.png\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:13:44', '2022-10-18 13:13:44');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/addToCarousel', 'POST', '127.0.0.1', '{\"path\":\"work.png\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:13:58', '2022-10-18 13:13:58');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/\",\"view\":\"list\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:14:09', '2022-10-18 13:14:09');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:14:21', '2022-10-18 13:14:21');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:22:13', '2022-10-18 13:22:13');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:22:15', '2022-10-18 13:22:15');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:22:28', '2022-10-18 13:22:28');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:22:38', '2022-10-18 13:22:38');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u6e2c\\u8a66\\u5206\\u985e1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/category\"}', '2022-10-18 13:22:51', '2022-10-18 13:22:51');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2022-10-18 13:22:52', '2022-10-18 13:22:52');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:22:56', '2022-10-18 13:22:56');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:22:59', '2022-10-18 13:22:59');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:23:00', '2022-10-18 13:23:00');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:23:33', '2022-10-18 13:23:33');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:23:39', '2022-10-18 13:23:39');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6e2c\\u8a66\\u6587\\u7ae01\",\"year\":\"2022\",\"category_id\":\"1\",\"content\":\"\\u6e2c\\u8a66\\u6e2c\\u8a66\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:23:53', '2022-10-18 13:23:53');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:23:54', '2022-10-18 13:23:54');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:23:56', '2022-10-18 13:23:56');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:33:08', '2022-10-18 13:33:08');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:33:14', '2022-10-18 13:33:14');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:35:28', '2022-10-18 13:35:28');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:35:34', '2022-10-18 13:35:34');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:35:47', '2022-10-18 13:35:47');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:35:53', '2022-10-18 13:35:53');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:37:23', '2022-10-18 13:37:23');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:37:29', '2022-10-18 13:37:29');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6e2c\\u8a66\\u6587\\u7ae01\",\"year\":\"2022\",\"category_id\":\"1\",\"content\":\"\\u6e2c\\u8a66\\u6e2c\\u8a66\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:40:22', '2022-10-18 13:40:22');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:40:25', '2022-10-18 13:40:25');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:40:26', '2022-10-18 13:40:26');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:43:22', '2022-10-18 13:43:22');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:43:28', '2022-10-18 13:43:28');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6e2c\\u8a66\\u6587\\u7ae01\",\"year\":\"2022\",\"category_id\":\"1\",\"content\":\"\\u6e2c\\u8a66\\u6587\\u7ae0\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:43:41', '2022-10-18 13:43:41');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:43:42', '2022-10-18 13:43:42');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:43:44', '2022-10-18 13:43:44');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 13:45:14', '2022-10-18 13:45:14');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:45:20', '2022-10-18 13:45:20');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6e2c\\u8a66\\u6587\\u7ae01\",\"year\":\"2022\",\"category_id\":\"1\",\"content\":\"123\",\"is_show\":\"0\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 13:45:32', '2022-10-18 13:45:32');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 13:45:33', '2022-10-18 13:45:33');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/news/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:45:40', '2022-10-18 13:45:40');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/news/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:45:49', '2022-10-18 13:45:49');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 13:45:50', '2022-10-18 13:45:50');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:48:30', '2022-10-18 13:48:30');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:48:35', '2022-10-18 13:48:35');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:48:43', '2022-10-18 13:48:43');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:49:12', '2022-10-18 13:49:12');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/category/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:49:18', '2022-10-18 13:49:18');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 13:49:23', '2022-10-18 13:49:23');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:37:28', '2022-10-18 14:37:28');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:37:33', '2022-10-18 14:37:33');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"view\":\"list\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:37:44', '2022-10-18 14:37:44');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/media/upload', 'POST', '127.0.0.1', '{\"dir\":\"\\/images\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 14:41:47', '2022-10-18 14:41:47');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"view\":\"list\"}', '2022-10-18 14:41:48', '2022-10-18 14:41:48');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:43:35', '2022-10-18 14:43:35');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:43:40', '2022-10-18 14:43:40');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u54c1\\u724c\\u5f62\\u8c61\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/category\"}', '2022-10-18 14:44:00', '2022-10-18 14:44:00');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2022-10-18 14:44:01', '2022-10-18 14:44:01');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:44:06', '2022-10-18 14:44:06');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u96fb\\u5546\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/category\"}', '2022-10-18 14:44:23', '2022-10-18 14:44:23');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:44:24', '2022-10-18 14:44:24');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u9810\\u7d04\\u6d3b\\u52d5\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 14:44:38', '2022-10-18 14:44:38');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2022-10-18 14:44:38', '2022-10-18 14:44:38');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/category/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:44:57', '2022-10-18 14:44:57');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u7522\\u54c1\\u578b\\u9304\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/category\"}', '2022-10-18 14:45:05', '2022-10-18 14:45:05');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/category/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:45:06', '2022-10-18 14:45:06');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/category', 'POST', '127.0.0.1', '{\"name\":\"\\u4e00\\u9801\\u5f0f\\u7db2\\u7ad9\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 14:45:18', '2022-10-18 14:45:18');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/category', 'GET', '127.0.0.1', '[]', '2022-10-18 14:45:18', '2022-10-18 14:45:18');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Category\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-10-18 14:45:27', '2022-10-18 14:45:27');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:45:36', '2022-10-18 14:45:36');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_News\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-10-18 14:46:48', '2022-10-18 14:46:48');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:46:48', '2022-10-18 14:46:48');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:46:52', '2022-10-18 14:46:52');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Category\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-10-18 14:46:59', '2022-10-18 14:46:59');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:47:00', '2022-10-18 14:47:00');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:47:04', '2022-10-18 14:47:04');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:47:08', '2022-10-18 14:47:08');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:47:09', '2022-10-18 14:47:09');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u5f62\\u8c61\\u7db2\\u7ad9\",\"year\":\"2022\",\"category_id\":\"2\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:48:13', '2022-10-18 14:48:13');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:48:13', '2022-10-18 14:48:13');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:48:18', '2022-10-18 14:48:18');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:48:21', '2022-10-18 14:48:21');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/media/delete', 'DELETE', '127.0.0.1', '{\"files\":[\"images\\/portfolio-1.jpg\",\"images\\/portfolio-2.jpg\",\"images\\/portfolio-3.jpg\",\"images\\/portfolio-4.jpg\",\"images\\/portfolio-5.jpg\",\"images\\/portfolio-6.jpg\",\"images\\/portfolio-7.jpg\",\"images\\/portfolio-8.jpg\",\"images\\/portfolio-9.jpg\",\"images\\/portfolio-details-1.jpg\",\"images\\/portfolio-details-2.jpg\",\"images\\/portfolio-details-3.jpg\",\"images\\/system.png\",\"images\\/web.png\",\"images\\/work.png\"],\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 14:48:50', '2022-10-18 14:48:50');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:48:51', '2022-10-18 14:48:51');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:48:57', '2022-10-18 14:48:57');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:49:08', '2022-10-18 14:49:08');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:49:14', '2022-10-18 14:49:14');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:49:15', '2022-10-18 14:49:15');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u5f62\\u8c61\\u7db2\\u7ad92\",\"year\":\"2021\",\"category_id\":\"2\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:49:29', '2022-10-18 14:49:29');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:49:29', '2022-10-18 14:49:29');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:49:32', '2022-10-18 14:49:32');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:49:33', '2022-10-18 14:49:33');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u96fb\\u5546\\u7db2\\u7ad9\",\"year\":\"2022\",\"category_id\":\"3\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:50:00', '2022-10-18 14:50:00');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:01', '2022-10-18 14:50:01');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:03', '2022-10-18 14:50:03');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u96fb\\u5546\\u7db2\\u7ad92\",\"year\":\"2021\",\"category_id\":\"3\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\"}', '2022-10-18 14:50:19', '2022-10-18 14:50:19');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:19', '2022-10-18 14:50:19');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:20', '2022-10-18 14:50:20');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6f14\\u5531\\u6703\\u8cfc\\u7968\",\"year\":\"2022\",\"category_id\":\"4\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\"}', '2022-10-18 14:50:36', '2022-10-18 14:50:36');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:37', '2022-10-18 14:50:37');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:38', '2022-10-18 14:50:38');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6f14\\u5531\\u6703\\u8cfc\\u79682\",\"year\":\"2021\",\"category_id\":\"4\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"after-save\":\"2\"}', '2022-10-18 14:50:53', '2022-10-18 14:50:53');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/news/create', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:54', '2022-10-18 14:50:54');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:50:58', '2022-10-18 14:50:58');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"MAMA\\u8cfc\\u7269\",\"year\":\"2022\",\"category_id\":\"5\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\"}', '2022-10-18 14:51:14', '2022-10-18 14:51:14');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:51:15', '2022-10-18 14:51:15');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:51:18', '2022-10-18 14:51:18');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:51:19', '2022-10-18 14:51:19');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u6771\\u6797\\u8cfc\\u7269\",\"year\":\"2021\",\"category_id\":\"5\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:51:47', '2022-10-18 14:51:47');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:51:47', '2022-10-18 14:51:47');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:51:53', '2022-10-18 14:51:53');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:51:54', '2022-10-18 14:51:54');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u4e00\\u9801\\u5f0f\\u7db2\\u7ad9A\",\"year\":\"2022\",\"category_id\":\"6\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:52:18', '2022-10-18 14:52:18');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:52:19', '2022-10-18 14:52:19');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/news/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:52:22', '2022-10-18 14:52:22');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:52:23', '2022-10-18 14:52:23');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/news', 'POST', '127.0.0.1', '{\"news_title\":\"\\u4e00\\u9801\\u5f0f\\u7db2\\u7ad9B\",\"year\":\"2022\",\"category_id\":\"6\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\"}', '2022-10-18 14:52:40', '2022-10-18 14:52:40');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 14:52:40', '2022-10-18 14:52:40');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/news/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:53:44', '2022-10-18 14:53:44');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:53:47', '2022-10-18 14:53:47');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:53:53', '2022-10-18 14:53:53');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/news/10', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:54:02', '2022-10-18 14:54:02');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/news/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:54:06', '2022-10-18 14:54:06');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:54:07', '2022-10-18 14:54:07');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/news/10', 'PUT', '127.0.0.1', '{\"news_title\":\"\\u4e00\\u9801\\u5f0f\\u7db2\\u7ad9A\",\"year\":\"2022\",\"category_id\":\"6\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\\/10\"}', '2022-10-18 14:54:15', '2022-10-18 14:54:15');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/news/10', 'GET', '127.0.0.1', '[]', '2022-10-18 14:54:16', '2022-10-18 14:54:16');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/news/9', 'GET', '127.0.0.1', '[]', '2022-10-18 14:54:23', '2022-10-18 14:54:23');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/news/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:54:29', '2022-10-18 14:54:29');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:54:32', '2022-10-18 14:54:32');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/news/9', 'PUT', '127.0.0.1', '{\"news_title\":\"\\u6771\\u6797\\u8cfc\\u7269\",\"year\":\"2021\",\"category_id\":\"5\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\\/9\"}', '2022-10-18 14:54:38', '2022-10-18 14:54:38');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/news/9', 'GET', '127.0.0.1', '[]', '2022-10-18 14:54:38', '2022-10-18 14:54:38');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/news/4', 'GET', '127.0.0.1', '[]', '2022-10-18 14:55:00', '2022-10-18 14:55:00');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/news/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:55:06', '2022-10-18 14:55:06');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:55:08', '2022-10-18 14:55:08');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/news/5/edit', 'GET', '127.0.0.1', '[]', '2022-10-18 14:55:27', '2022-10-18 14:55:27');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 14:55:33', '2022-10-18 14:55:33');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/news/5', 'PUT', '127.0.0.1', '{\"news_title\":\"\\u96fb\\u5546\\u7db2\\u7ad92\",\"year\":\"2021\",\"category_id\":\"3\",\"content\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"is_show\":\"1\",\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/news\\/4\"}', '2022-10-18 14:55:38', '2022-10-18 14:55:38');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/news/4', 'GET', '127.0.0.1', '[]', '2022-10-18 14:55:39', '2022-10-18 14:55:39');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 14:57:24', '2022-10-18 14:57:24');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 15:00:56', '2022-10-18 15:00:56');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/news', 'GET', '127.0.0.1', '[]', '2022-10-18 15:01:51', '2022-10-18 15:01:51');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/news/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 15:01:57', '2022-10-18 15:01:57');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/locale', 'POST', '127.0.0.1', '{\"_token\":\"2fXbV8afiZI0QBceu5aG0wVTRA02nI67ALouCcr9\",\"locale\":\"zh-CN\"}', '2022-10-18 15:02:05', '2022-10-18 15:02:05');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/news/2', 'GET', '127.0.0.1', '[]', '2022-10-18 15:02:06', '2022-10-18 15:02:06');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/news/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 15:02:12', '2022-10-18 15:02:12');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 15:02:14', '2022-10-18 15:02:14');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-18 20:33:07', '2022-10-18 20:33:07');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 20:33:17', '2022-10-18 20:33:17');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/news/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 20:33:24', '2022-10-18 20:33:24');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/getAllName', 'GET', '127.0.0.1', '[]', '2022-10-18 20:33:27', '2022-10-18 20:33:27');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 21:03:19', '2022-10-18 21:03:19');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/category', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 21:03:27', '2022-10-18 21:03:27');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-18 21:03:34', '2022-10-18 21:03:34');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-19 09:21:42', '2022-10-19 09:21:42');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/news', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-19 09:21:53', '2022-10-19 09:21:53');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/media', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-10-19 09:22:16', '2022-10-19 09:22:16');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/media', 'GET', '127.0.0.1', '[]', '2022-10-19 09:26:10', '2022-10-19 09:26:10');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-19 09:26:21', '2022-10-19 09:26:21');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/media', 'GET', '127.0.0.1', '{\"path\":\"\\/images\",\"_pjax\":\"#pjax-container\"}', '2022-10-19 09:26:24', '2022-10-19 09:26:24');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-10-19 09:33:13', '2022-10-19 09:33:13');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, 'Media manager', 'ext.media-manager', '', '/media*', '2022-10-18 13:06:09', '2022-10-18 13:06:09');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 10, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2022-10-18 13:03:58', '2022-10-18 13:03:58');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$eNuqW/X0ouIqsjPwWkeo/uiSkcKDb/iBXCy2mu5WP/xvM2Ua9tHR.', 'Administrator', NULL, 'Kist2eoXhmyIkvoHIRmv4jxVVrNImrT07f1KE9SrTJfaAwX1iLHk12rIw9vf', '2022-10-18 13:03:58', '2022-10-18 13:03:58');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '品牌形象', '2022-10-18 14:44:01', '2022-10-18 14:44:01');
INSERT INTO `category` VALUES (3, '電商', '2022-10-18 14:44:23', '2022-10-18 14:44:23');
INSERT INTO `category` VALUES (4, '預約活動', '2022-10-18 14:44:38', '2022-10-18 14:44:38');
INSERT INTO `category` VALUES (5, '產品型錄', '2022-10-18 14:45:05', '2022-10-18 14:45:05');
INSERT INTO `category` VALUES (6, '一頁式網站', '2022-10-18 14:45:18', '2022-10-18 14:45:18');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_10_17_030854_category', 1);
INSERT INTO `migrations` VALUES (7, '2022_10_17_041521_news', 1);
INSERT INTO `migrations` VALUES (8, '2022_10_17_192645_carousel', 1);

-- ----------------------------
-- Table structure for news_table
-- ----------------------------
DROP TABLE IF EXISTS `news_table`;
CREATE TABLE `news_table`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `news_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_show` tinyint(4) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `news_table_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `news_table_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news_table
-- ----------------------------
INSERT INTO `news_table` VALUES (2, '形象網站', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/b79650c85271c29399add40d46006c79.jpg', 1, '2022-10-18 14:48:13', '2022-10-18 14:48:13');
INSERT INTO `news_table` VALUES (3, '形象網站2', 2, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021', 'images/portfolio-2.jpg', 1, '2022-10-18 14:49:29', '2022-10-18 14:49:29');
INSERT INTO `news_table` VALUES (4, '電商網站', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/portfolio-3.jpg', 1, '2022-10-18 14:50:01', '2022-10-18 14:50:01');
INSERT INTO `news_table` VALUES (5, '電商網站2', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021', 'images/de9772155ac6c3a99403827167ad6df7.jpg', 1, '2022-10-18 14:50:19', '2022-10-18 14:55:39');
INSERT INTO `news_table` VALUES (6, '演唱會購票', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/portfolio-7.jpg', 1, '2022-10-18 14:50:37', '2022-10-18 14:50:37');
INSERT INTO `news_table` VALUES (7, '演唱會購票2', 4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021', 'images/portfolio-9.jpg', 1, '2022-10-18 14:50:54', '2022-10-18 14:50:54');
INSERT INTO `news_table` VALUES (8, 'MAMA購物', 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/portfolio-5.jpg', 1, '2022-10-18 14:51:14', '2022-10-18 14:51:14');
INSERT INTO `news_table` VALUES (9, '東林購物', 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021', 'images/portfolio-6.jpg', 1, '2022-10-18 14:51:47', '2022-10-18 14:54:38');
INSERT INTO `news_table` VALUES (10, '一頁式網站A', 6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/portfolio-4.jpg', 1, '2022-10-18 14:52:19', '2022-10-18 14:54:16');
INSERT INTO `news_table` VALUES (11, '一頁式網站B', 6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022', 'images/bea1faa71fa5f2fe86c8835e2c9f6ce2.jpg', 1, '2022-10-18 14:52:40', '2022-10-18 14:52:40');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
