/*
 Navicat Premium Dump SQL

 Source Server         : portal
 Source Server Type    : MySQL
 Source Server Version : 80408 (8.4.8)
 Source Host           : localhost:3306
 Source Schema         : nest_admin

 Target Server Type    : MySQL
 Target Server Version : 80408 (8.4.8)
 File Encoding         : 65001

 Date: 08/02/2026 16:40:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_about_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_about_article`;
CREATE TABLE `cms_about_article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `section_key` varchar(50) NOT NULL COMMENT '栏目标识',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `content` longtext COMMENT '文章内容',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_by` varchar(64) NOT NULL DEFAULT '',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_about_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (1, 'council', '中国文艺志愿者协会第二届理事会第一次会议在京召开', '<p>中国文艺志愿者协会第二届理事会第一次会议在北京召开，会议审议通过了第一届理事会工作报告，选举产生了新一届领导机构。</p><p>会议号召广大文艺志愿者深入学习贯彻习近平新时代中国特色社会主义思想，坚持以人民为中心的工作导向，积极投身文艺志愿服务事业。</p>', 1, 'admin', '2026-02-08 11:51:24.419132', '', '2026-02-08 11:51:24.419132', '1', '0');
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (2, 'council', '中国文艺志愿者协会理事会审议通过2024年度工作计划', '<p>理事会审议通过了2024年度工作计划，明确了全年工作重点和目标任务。</p><p>会议强调，要紧紧围绕学习宣传贯彻党的二十大精神这条主线，组织开展形式多样的文艺志愿服务活动，为推动文艺事业高质量发展贡献力量。</p>', 2, 'admin', '2026-02-08 11:51:24.419132', '', '2026-02-08 11:51:24.419132', '1', '0');
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (3, 'council', '理事会关于增补理事的决定', '<p>根据工作需要，经理事会审议通过，决定增补以下同志为理事会理事。</p><p>增补理事名单：（按姓氏笔画排序）</p><p>王某、李某、张某、刘某、陈某</p>', 3, 'admin', '2026-02-08 11:51:24.419132', '', '2026-02-08 11:51:24.419132', '1', '0');
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (4, 'council', '理事会 111', '111', 0, 'admin', '2026-02-08 15:03:27.668855', '', '2026-02-08 15:03:27.668855', '1', '0');
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (5, 'council', '理事会 222', '<p>理事会 222理事会 222理事会 222理事会 222</p>', 0, 'admin', '2026-02-08 15:06:37.967129', 'admin', '2026-02-08 15:08:23.000000', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_about_section
-- ----------------------------
DROP TABLE IF EXISTS `cms_about_section`;
CREATE TABLE `cms_about_section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `section_key` varchar(50) NOT NULL COMMENT '栏目标识',
  `section_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `section_type` varchar(20) NOT NULL DEFAULT 'richText' COMMENT '栏目类型：richText富文本 list列表',
  `content` longtext COMMENT '富文本内容',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `update_by` varchar(64) NOT NULL DEFAULT '',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_about_section
-- ----------------------------
BEGIN;
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (11, 'overview', '协会概况', 'richText', '<p>协会概况内容...222<img src=\"/public/1225_20240105161435A007.jpg_1770535343269.jpeg\" alt=\"/public/1225_20240105161435A007.jpg_1770535343269.jpeg\" data-href=\"/public/1225_20240105161435A007.jpg_1770535343269.jpeg\" style=\"\"/></p>', 1, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 15:22:42.000000', '1', '0');
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (12, 'charter', '协会章程', 'richText', '<p>协会章程内容...333<img src=\"/public/1225-_20240105162138A010.jpg_1770537412404.jpeg\" alt=\"/public/1225-_20240105162138A010.jpg_1770537412404.jpeg\" data-href=\"/public/1225-_20240105162138A010.jpg_1770537412404.jpeg\" style=\"\"/></p>', 2, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 15:56:52.000000', '1', '0');
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (13, 'leadership', '协会领导', 'richText', '<p>协会领导内容...111<img src=\"/public/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20250127152704_20250127152712A189.png_1770537435161.png\" alt=\"/public/微信截图_20250127152704_20250127152712A189.png_1770537435161.png\" data-href=\"/public/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20250127152704_20250127152712A189.png_1770537435161.png\" style=\"\"/></p>', 3, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 15:57:15.000000', '1', '0');
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (14, 'council', '理事会', 'list', NULL, 4, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (15, 'regulations', '会员工作条例', 'richText', '<p>会员工作条例内容...</p>', 5, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `category_id` int NOT NULL COMMENT '分类ID',
  `summary` varchar(500) DEFAULT NULL COMMENT '文章摘要',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '封面图',
  `cover_image_source_type` varchar(20) NOT NULL DEFAULT 'upload' COMMENT '封面图片来源类型：upload上传 link链接',
  `content` longtext COMMENT '文章内容',
  `source` varchar(100) DEFAULT NULL COMMENT '文章来源',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `open_type` varchar(10) NOT NULL DEFAULT 'current' COMMENT '打开方式：current当前页 new新标签页',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '浏览量',
  `seo_title` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(500) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(500) DEFAULT NULL COMMENT 'SEO描述',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '状态：0草稿 1已发布 2待审核 3审核通过 4审核不通过',
  `is_top` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `sub_category_id` int DEFAULT NULL COMMENT '子分类ID',
  `content_type` varchar(20) NOT NULL DEFAULT 'editor' COMMENT '内容类型：editor编辑器 link外部链接',
  `external_link` varchar(500) DEFAULT NULL COMMENT '外部链接',
  `audit_status` varchar(1) DEFAULT NULL COMMENT '审核状态：0待审核 1审核通过 2审核不通过',
  `audit_reason` varchar(500) DEFAULT NULL COMMENT '审核原因',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `audit_by` varchar(64) DEFAULT NULL COMMENT '审核人',
  PRIMARY KEY (`article_id`),
  KEY `FK_1e229d9d745c8b3dc3d0cf21a3b` (`category_id`),
  CONSTRAINT `FK_1e229d9d745c8b3dc3d0cf21a3b` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (1, '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神', 1, '中国文联、中国文艺志愿者协会召开专题会议，深入学习宣传贯彻党的二十届三中全会精神，研究部署贯彻落实举措。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'upload', '<p>7月22日，中国文联、中国文艺志愿者协会召开专题会议，深入学习宣传贯彻党的二十届三中全会精神。</p><p>会议指出，党的二十届三中全会是在以中国式现代化全面推进强国建设、民族复兴伟业的关键时期召开的一次十分重要的会议。全会通过的《决定》，是新时代新征程上推动全面深化改革向广度和深度进军的总动员、总部署。</p><p>会议强调，要把学习宣传贯彻全会精神作为当前和今后一个时期的重大政治任务，切实把思想和行动统一到党中央决策部署上来。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (2, '中国文艺志愿者协会工作年中推进会强调：在新征程上推动文艺志愿服务高质量发展', 1, '中国文艺志愿者协会工作年中推进会在京召开，总结上半年工作，部署下半年重点任务。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'upload', '<p>7月15日，中国文艺志愿者协会工作年中推进会在京召开。会议深入学习贯彻习近平新时代中国特色社会主义思想，总结上半年工作，部署下半年重点任务。</p><p>会议指出，上半年，协会紧紧围绕党和国家工作大局，组织开展了一系列主题鲜明、形式多样的文艺志愿服务活动，取得了显著成效。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (3, '与人民同行——新时代文明实践文艺志愿服务走进四川广安', 1, '文艺志愿服务小分队走进四川广安，为当地群众送去精彩的文化盛宴。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png', 'upload', '<p>7月10日，\"与人民同行——新时代文明实践文艺志愿服务\"活动走进四川广安。来自全国各地的文艺志愿者为当地群众带来了精彩的文艺演出。</p><p>活动现场，文艺志愿者们表演了歌曲、舞蹈、相声、魔术等节目，赢得了现场观众的阵阵掌声。</p><p>此次惠民演出活动是中国文艺志愿者协会\"强基工程\"的重要组成部分，旨在通过文艺志愿服务，丰富基层群众精神文化生活。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (4, '纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开', 1, '纪念《讲话》发表82周年，重温《讲话》精神，推动新时代文艺事业繁荣发展。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'upload', '<p>5月23日，纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开。</p><p>与会代表重温了《讲话》精神，一致认为，《讲话》所阐明的文艺为人民服务的根本方向，至今仍然具有重要的现实指导意义。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (5, '2024年全国文艺志愿服务工作会在云南昆明召开', 1, '全国文艺志愿服务工作会在昆明召开，交流经验，部署工作。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145859A047.png', 'upload', '<p>5月20日，2024年全国文艺志愿服务工作会在云南昆明召开。来自全国各地的文艺志愿服务工作者齐聚一堂，交流经验，部署工作。</p><p>会议强调，要进一步加强全国联动，形成工作合力，推动文艺志愿服务事业再上新台阶。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (6, '时代风尚——中国文艺志愿者致敬大国重器特别节目在中央广播电视总台播出', 1, '特别节目展现文艺志愿者走进大国重器，致敬建设者的感人故事。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', 'upload', '<p>5月18日，\"时代风尚——中国文艺志愿者致敬大国重器\"特别节目在中央广播电视总台播出。</p><p>节目记录了文艺志愿者走进C919大飞机、港珠澳大桥、中国天眼等大国重器，慰问建设者的感人故事。</p>', '中国文艺网', '管理员', '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.420986', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (7, '中国文艺志愿者协会党支部开展主题党日活动', 2, '中国文艺志愿者协会党支部开展主题党日活动，学习贯彻党的二十大精神。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210255A439.png', 'upload', '<p>协会党支部组织专题学习，深入学习贯彻习近平新时代中国特色社会主义思想。</p><p>会议要求，全体党员要深刻领会这一思想的核心要义、精神实质、丰富内涵和实践要求，切实做到学思用贯通、知信行统一。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421609', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (8, '协会组织党员参观红色教育基地', 2, '协会组织党员参观红色教育基地，传承红色基因，坚定理想信念。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210446A440.png', 'upload', '<p>协会组织党员参观红色教育基地，传承红色基因，坚定理想信念。党员们先后参观了革命纪念馆、烈士陵园等红色教育基地，重温了革命历史。</p><p>通过参观学习，全体党员进一步坚定了理想信念，增强了党性修养，为做好文艺志愿服务工作奠定了坚实的思想基础。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421609', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (9, '中国文艺志愿者协会召开党风廉政建设专题会议', 2, '中国文艺志愿者协会召开党风廉政建设专题会议，部署党风廉政建设工作。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>会议传达了上级关于党风廉政建设工作的要求，总结了协会党风廉政建设工作情况。</p><p>会议强调，要进一步加强党风廉政建设，营造风清气正的政治生态，为文艺志愿服务事业发展提供坚强保障。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421609', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (10, '协会党支部开展\"我为群众办实事\"实践活动', 2, '协会党支部开展\"我为群众办实事\"实践活动，深入基层为群众排忧解难。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', 'upload', '<p>协会党支部开展\"我为群众办实事\"实践活动，深入基层为群众排忧解难。党员志愿者们走进社区、乡村，为群众提供文艺演出、艺术培训等服务。</p><p>通过实践活动，党员志愿者们切实解决了群众的一些实际困难，增强了服务群众的意识和能力。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421609', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (11, '学习贯彻习近平新时代中国特色社会主义思想专题党课', 2, '学习贯彻习近平新时代中国特色社会主义思想专题党课，深刻领会习近平新时代中国特色社会主义思想的核心要义。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png', 'upload', '<p>学习贯彻习近平新时代中国特色社会主义思想专题党课，深刻领会习近平新时代中国特色社会主义思想的核心要义。党课从理论渊源、实践基础、时代意义等方面进行了系统讲解。</p><p>通过学习，全体党员进一步加深了对习近平新时代中国特色社会主义思想的理解和把握，增强了贯彻落实的自觉性和坚定性。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421609', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (12, '百花迎春——中国文学艺术界2026春节大联欢', 3, '\"我们的中国梦\"文化进万家活动深入基层，为群众送去文化大餐。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', 'upload', '<p>春节期间，\"我们的中国梦\"文化进万家活动走进全国各地，为广大基层群众送去了丰富多彩的文化活动。</p><p>文艺志愿者们深入农村、社区、企业、军营，通过文艺演出、书画赠送、培训辅导等形式，将欢乐和文明送到千家万户。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421924', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (13, '与人民同行——新时代文明实践文艺志愿服务活动', 3, '与人民同行——新时代文明实践文艺志愿服务活动，文艺志愿者深入基层，服务群众。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png', 'upload', '<p>活动在全国各地同步开展，文艺志愿者们走进社区、乡村、学校、企业等，为群众送去文艺演出和文化服务。</p><p>活动得到了基层群众的热烈欢迎和广泛好评，取得了良好的社会效果。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421924', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (14, '时代风尚——学雷锋文艺志愿服务先进典型宣传活动', 3, '时代风尚——学雷锋文艺志愿服务先进典型宣传活动，宣传优秀文艺志愿者的先进事迹。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', 'upload', '<p>活动通过媒体宣传、事迹报告会等形式，展现了优秀文艺志愿者的良好形象。</p><p>这些先进典型用实际行动践行了雷锋精神，为全社会树立了学习的榜样。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421924', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (15, '强基工程——文艺志愿服务基层行活动', 3, '强基工程——文艺志愿服务基层行活动，加强基层文艺志愿服务队伍建设。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'upload', '<p>活动组织文艺志愿者深入基层，开展文艺培训、指导服务，提升基层文艺志愿者的专业水平。</p><p>通过基层行活动，进一步夯实了文艺志愿服务的基层基础，推动了文艺志愿服务向纵深发展。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421924', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (16, '文艺志愿者服务日系列活动', 3, '文艺志愿者服务日系列活动，全国文艺志愿者集中开展志愿服务活动。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png', 'upload', '<p>活动期间，各地文艺志愿者开展了形式多样的志愿服务，包括文艺演出、艺术培训、文化讲座等。</p><p>系列活动进一步弘扬了志愿服务精神，营造了全社会关心支持文艺志愿服务的良好氛围。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.421924', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (17, '关于表彰第三届\"时代风尚\"学雷锋文艺志愿服务先进典型的决定', 4, '关于表彰第三届\"时代风尚\"学雷锋文艺志愿服务先进典型的决定，表彰优秀文艺志愿者。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'upload', '<p>为表彰先进、树立典型，中国文艺志愿者协会决定授予一批优秀文艺志愿者和组织\"时代风尚\"荣誉称号。</p><p>这些先进典型在文艺志愿服务工作中表现突出，为推动文艺志愿服务事业发展作出了重要贡献。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.423989', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (18, '优秀文艺志愿者风采展示（一）', 4, '优秀文艺志愿者风采展示（一），展示优秀文艺志愿者的先进事迹。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png', 'upload', '<p>优秀文艺志愿者风采展示（一），展示优秀文艺志愿者的先进事迹。这些优秀文艺志愿者长期扎根基层，无私奉献，用文艺服务群众，用实际行动诠释了志愿服务精神。</p><p>他们的先进事迹感人至深，值得我们学习和弘扬。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.423989', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (19, '优秀文艺志愿者风采展示（二）', 4, '优秀文艺志愿者风采展示（二），展示优秀文艺志愿者的先进事迹。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095142_20250527095153A373.png', 'upload', '<p>优秀文艺志愿者风采展示（二），展示优秀文艺志愿者的先进事迹。这些优秀文艺志愿者来自全国各地，他们用自己的专业特长，为基层群众送去丰富的文化食粮。</p><p>他们的无私奉献精神，激励着更多的人加入到文艺志愿服务的行列中来。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.423989', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (20, '优秀文艺志愿服务组织风采展示', 4, '优秀文艺志愿服务组织风采展示，展示优秀文艺志愿服务组织的先进事迹。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>优秀文艺志愿服务组织风采展示，展示优秀文艺志愿服务组织的先进事迹。这些优秀组织在组织文艺志愿服务活动、培养文艺志愿者队伍等方面发挥了重要作用。</p><p>他们的成功经验，为各地开展文艺志愿服务工作提供了有益借鉴。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.423989', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (21, '中国文艺志愿者协会年度表彰大会', 4, '中国文艺志愿者协会年度表彰大会，表彰年度优秀文艺志愿者和组织。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', 'upload', '<p>表彰大会对在文艺志愿服务工作中表现突出的个人和组织进行了表彰，颁发了荣誉证书和奖牌。</p><p>表彰大会进一步激发了广大文艺志愿者的工作热情，为推动文艺志愿服务事业发展注入了新的动力。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.423989', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (22, '中国文联文艺志愿服务中心2026年度部门预算公示', 5, '中国文联文艺志愿服务中心2026年度部门预算公示，公开部门预算信息。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210255A439.png', 'upload', '<p>根据《中华人民共和国预算法》等有关规定，现将中国文联文艺志愿服务中心2026年度部门预算予以公示。</p><p>公示时间为2026年2月7日至2月13日，如有异议，请在公示期内向中国文联文艺志愿服务中心反映。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424296', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (23, '关于举办2026年文艺志愿者培训班的通知', 5, '关于举办2026年文艺志愿者培训班的通知，培训文艺志愿者专业技能。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210446A440.png', 'upload', '<p>为提高文艺志愿者的专业水平和服务能力，中国文艺志愿者协会决定举办2026年文艺志愿者培训班。</p><p>培训时间为2026年3月15日至3月20日，培训地点为北京，欢迎广大文艺志愿者报名参加。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424296', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (24, '关于开展2026年度文艺志愿服务先进典型推荐工作的通知', 5, '关于开展2026年度文艺志愿服务先进典型推荐工作的通知，推荐优秀文艺志愿者。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>为表彰先进、树立典型，中国文艺志愿者协会决定开展2026年度文艺志愿服务先进典型推荐工作。</p><p>推荐截止时间为2026年4月30日，请各单位认真组织推荐工作。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424296', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (25, '中国文联文艺志愿服务中心2025年度部门决算公示', 5, '中国文联文艺志愿服务中心2025年度部门决算公示，公开部门决算信息。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', 'upload', '<p>根据《中华人民共和国预算法》等有关规定，现将中国文联文艺志愿服务中心2025年度部门决算予以公示。</p><p>公示时间为2026年2月1日至2月7日，如有异议，请在公示期内向中国文联文艺志愿服务中心反映。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424296', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (26, '关于征集文艺志愿服务优秀案例的通知', 5, '关于征集文艺志愿服务优秀案例的通知，征集文艺志愿服务优秀案例。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png', 'upload', '<p>为总结推广文艺志愿服务的成功经验，中国文艺志愿者协会决定开展文艺志愿服务优秀案例征集活动。</p><p>征集截止时间为2026年3月31日，欢迎各单位和个人积极投稿。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424296', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (27, '全国文艺志愿服务联动活动启动仪式在京举行', 7, '全国文艺志愿服务联动活动启动仪式在京举行，推动全国文艺志愿服务协同发展。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', 'upload', '<p>全国文艺志愿服务联动活动启动仪式在京举行，推动全国文艺志愿服务协同发展。启动仪式上，中国文艺志愿者协会与各省市文艺志愿者协会签订了合作协议，建立了全国文艺志愿服务联动机制。</p><p>通过联动机制，各地文艺志愿服务资源将得到有效整合，形成工作合力，推动文艺志愿服务事业高质量发展。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424709', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (28, '京津冀文艺志愿服务联盟成立', 7, '京津冀文艺志愿服务联盟成立，推动京津冀地区文艺志愿服务协同发展。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png', 'upload', '<p>京津冀文艺志愿服务联盟成立，推动京津冀地区文艺志愿服务协同发展。联盟由北京、天津、河北三地的文艺志愿者协会共同发起成立，旨在加强区域合作，实现资源共享。</p><p>联盟将定期开展联合活动，共同打造文艺志愿服务品牌，为京津冀协同发展贡献力量。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424709', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (29, '长三角文艺志愿服务交流会在上海举行', 7, '长三角文艺志愿服务交流会在上海举行，交流文艺志愿服务工作经验。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', 'upload', '<p>长三角文艺志愿服务交流会在上海举行，交流文艺志愿服务工作经验。来自上海、江苏、浙江、安徽四地的文艺志愿者代表参加了交流会，分享了各自的工作经验和成功做法。</p><p>通过交流，各地文艺志愿者互相学习、取长补短，为推动长三角地区文艺志愿服务协同发展奠定了基础。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424709', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (30, '粤港澳大湾区文艺志愿服务合作框架协议签署', 7, '粤港澳大湾区文艺志愿服务合作框架协议签署，推动大湾区文艺志愿服务合作。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'upload', '<p>粤港澳大湾区文艺志愿服务合作框架协议签署，推动大湾区文艺志愿服务合作。中国文艺志愿者协会与粤港澳大湾区各城市文艺志愿者协会签署了合作框架协议，建立了长期合作机制。</p><p>根据协议，各方将在文艺志愿服务活动、人才培养、品牌建设等方面开展深度合作，共同推动大湾区文艺志愿服务事业发展。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424709', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (31, '全国文艺志愿服务工作推进会召开', 7, '全国文艺志愿服务工作推进会召开，部署全国文艺志愿服务工作。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png', 'upload', '<p>全国文艺志愿服务工作推进会召开，部署全国文艺志愿服务工作。会议总结了过去一年全国文艺志愿服务工作取得的成绩，分析了当前面临的形势和任务，部署了新一年的重点工作。</p><p>会议强调，要进一步加强全国联动，形成工作合力，推动文艺志愿服务事业再上新台阶。</p>', NULL, NULL, '2026-02-08 14:55:20', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.424709', 'admin', '2026-02-08 14:55:20.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:16', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (32, '学习贯彻党的二十届三中全会精神专题报道（一）', 6, '学习贯彻党的二十届三中全会精神专题报道（一），深入解读全会精神。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'upload', '<p>学习贯彻党的二十届三中全会精神专题报道（一），深入解读全会精神。党的二十届三中全会是在全面建设社会主义现代化国家新征程关键时刻召开的一次重要会议。</p><p>全会审议通过的《中共中央关于深化文化体制改革推动社会主义文化繁荣发展的决定》，为新时代文艺志愿服务工作指明了方向。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425050', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (33, '与人民同行——文艺志愿服务在行动', 6, '与人民同行——文艺志愿服务在行动，展现文艺志愿者深入基层服务群众的生动实践。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png', 'upload', '<p>与人民同行——文艺志愿服务在行动，展现文艺志愿者深入基层服务群众的生动实践。文艺志愿者们走进社区、乡村、学校、企业，为群众送去文艺演出和文化服务。</p><p>他们用实际行动践行了\"以人民为中心\"的工作导向，展现了新时代文艺工作者的良好风貌。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425050', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (34, '时代风尚——学雷锋文艺志愿服务先进典型事迹展播', 6, '时代风尚——学雷锋文艺志愿服务先进典型事迹展播，宣传优秀文艺志愿者的先进事迹。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', 'upload', '<p>时代风尚——学雷锋文艺志愿服务先进典型事迹展播，宣传优秀文艺志愿者的先进事迹。这些先进典型来自全国各地，他们用自己的专业特长，为基层群众送去丰富的文化食粮。</p><p>他们的无私奉献精神，激励着更多的人加入到文艺志愿服务的行列中来。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425050', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (35, '百花迎春——中国文学艺术界春节大联欢精彩回顾', 6, '百花迎春——中国文学艺术界春节大联欢精彩回顾，回顾历年春节大联欢的精彩瞬间。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>百花迎春——中国文学艺术界春节大联欢精彩回顾，回顾历年春节大联欢的精彩瞬间。\"百花迎春\"是中国文学艺术界的品牌活动，每年春节期间举办。</p><p>大联欢汇集了全国各地的文艺工作者，为观众呈现了一场场精彩的文化盛宴，成为了春节期间的文化盛宴。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425050', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (36, '文艺志愿服务助力新时代文明实践中心建设', 6, '文艺志愿服务助力新时代文明实践中心建设，推动新时代文明实践中心建设。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', 'upload', '<p>文艺志愿服务助力新时代文明实践中心建设，推动新时代文明实践中心建设。中国文艺志愿者协会组织文艺志愿者深入新时代文明实践中心，开展文艺演出、艺术培训等活动。</p><p>通过文艺志愿服务，进一步丰富了新时代文明实践中心的活动内容，提升了服务群众的能力和水平。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425050', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (37, '深入学习贯彻党的二十届三中全会精神 推动文艺志愿服务高质量发展', 8, '深入学习贯彻党的二十届三中全会精神，推动文艺志愿服务高质量发展。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'upload', '<p>深入学习贯彻党的二十届三中全会精神，推动文艺志愿服务高质量发展。党的二十届三中全会是在全面建设社会主义现代化国家新征程关键时刻召开的一次重要会议。</p><p>全会审议通过的《中共中央关于深化文化体制改革推动社会主义文化繁荣发展的决定》，为新时代文艺志愿服务工作指明了方向。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425361', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (38, '党的二十届三中全会精神学习心得（一）', 8, '党的二十届三中全会精神学习心得（一），分享学习体会。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png', 'upload', '<p>党的二十届三中全会精神学习心得（一），分享学习体会。通过学习党的二十届三中全会精神，我深刻认识到文艺志愿服务工作的重要意义。</p><p>作为文艺志愿者，我们要坚持以人民为中心的工作导向，深入基层、服务群众，为建设社会主义文化强国贡献力量。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425361', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (39, '党的二十届三中全会精神学习心得（二）', 8, '党的二十届三中全会精神学习心得（二），分享学习体会。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095142_20250527095153A373.png', 'upload', '<p>党的二十届三中全会精神学习心得（二），分享学习体会。全会提出要深化文化体制改革，推动社会主义文化繁荣发展。</p><p>我们要积极响应全会号召，创新文艺志愿服务方式，丰富服务内容，提升服务质量，让更多群众享受到优质的文艺服务。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425361', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (40, '与人民同行——新时代文明实践文艺志愿服务活动走进社区', 9, '与人民同行——新时代文明实践文艺志愿服务活动走进社区，为社区居民送去文艺演出。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>与人民同行——新时代文明实践文艺志愿服务活动走进社区，为社区居民送去文艺演出。文艺志愿者们带来了歌曲、舞蹈、戏曲等精彩节目。</p><p>活动得到了社区居民的热烈欢迎和广泛好评，进一步丰富了社区居民的精神文化生活。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425589', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (41, '与人民同行——文艺志愿者深入乡村开展惠民演出', 9, '与人民同行——文艺志愿者深入乡村开展惠民演出，为农村群众送去文化盛宴。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', 'upload', '<p>与人民同行——文艺志愿者深入乡村开展惠民演出，为农村群众送去文化盛宴。演出内容丰富多彩，包括歌曲、舞蹈、相声、小品等。</p><p>此次惠民演出活动，让农村群众在家门口就能欣赏到高质量的文艺演出，受到了群众的热烈欢迎。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425589', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (42, '与人民同行——文艺志愿服务进校园活动', 9, '与人民同行——文艺志愿服务进校园活动，为师生们带来精彩的文艺演出。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png', 'upload', '<p>与人民同行——文艺志愿服务进校园活动，为师生们带来精彩的文艺演出。文艺志愿者们为师生们表演了歌曲、舞蹈、器乐等节目。</p><p>活动不仅丰富了校园文化生活，也为学生们提供了接触艺术、了解艺术的机会，受到了师生们的热烈欢迎。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425589', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (43, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（一）', 10, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（一），宣传优秀文艺志愿者。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', 'upload', '<p>第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（一），宣传优秀文艺志愿者。这些先进典型来自全国各地，他们用自己的专业特长，为基层群众送去丰富的文化食粮。</p><p>他们的无私奉献精神，激励着更多的人加入到文艺志愿服务的行列中来。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425810', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (44, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（二）', 10, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（二），宣传优秀文艺志愿者。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png', 'upload', '<p>第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（二），宣传优秀文艺志愿者。这些优秀文艺志愿者长期扎根基层，无私奉献，用文艺服务群众。</p><p>他们的先进事迹感人至深，值得我们学习和弘扬。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425810', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (45, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（三）', 10, '第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（三），宣传优秀文艺志愿者。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', 'upload', '<p>第三届\"时代风尚\"学雷锋文艺志愿服务先进典型事迹展播（三），宣传优秀文艺志愿者。他们用实际行动践行了雷锋精神，为全社会树立了学习的榜样。</p><p>我们要向这些先进典型学习，积极投身文艺志愿服务事业，为建设社会主义文化强国贡献力量。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.425810', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (46, '百花迎春——中国文学艺术界2026春节大联欢精彩回顾', 11, '百花迎春——中国文学艺术界2026春节大联欢精彩回顾，回顾精彩瞬间。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'upload', '<p>百花迎春——中国文学艺术界2026春节大联欢精彩回顾，回顾精彩瞬间。\"百花迎春\"是中国文学艺术界的品牌活动，每年春节期间举办。</p><p>大联欢汇集了全国各地的文艺工作者，为观众呈现了一场场精彩的文化盛宴，成为了春节期间的文化盛宴。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.426080', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (47, '百花迎春——中国文学艺术界2025春节大联欢精彩回顾', 11, '百花迎春——中国文学艺术界2025春节大联欢精彩回顾，回顾精彩瞬间。', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', 'upload', '<p>百花迎春——中国文学艺术界2025年\"百花迎春\"大联欢在北京举行，全国文艺工作者齐聚一堂。</p><p>大联欢汇集了歌曲、舞蹈、戏曲、相声等多种艺术形式，为观众呈现了一场精彩的文化盛宴。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.426080', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (48, '百花迎春——中国文学艺术界2024春节大联欢精彩回顾', 11, '百花迎春——中国文学艺术界2024春节大联欢精彩回顾，回顾精彩瞬间。', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'upload', '<p>百花迎春——中国文学艺术界2024年\"百花迎春\"大联欢以\"共唱团圆家 百花再出发\"为主题。</p><p>大联欢展现了新时代文艺工作者的良好精神风貌，为全国人民送上了新春的祝福。</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 11:51:24.426080', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (49, '公告公示 1', 22, '公告公示 1公告公示 1公告公示 1', '/public/1225_20240105161435A007.jpg_1770525962704.jpeg', 'upload', '<p>公告公示 1公告公示 1公告公示 1公告公示 1公告公示 1公告公示 1公告公示 1公告公示 1</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 12:46:14.044216', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (50, '要闻动态 1', 18, '要闻动态 1要闻动态 1要闻动态 1', '/public/660_20250407164737A195.jpg_1770527390616.jpeg', 'upload', '<p>要闻动态 1要闻动态 1要闻动态 1要闻动态 1要闻动态 1要闻动态 1<img src=\"/public/%E8%A6%81%E9%97%BB_20251129210255A439.png_1770535507661.png\" alt=\"/public/要闻_20251129210255A439.png_1770535507661.png\" data-href=\"/public/%E8%A6%81%E9%97%BB_20251129210255A439.png_1770535507661.png\" style=\"\"/></p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:09:59.160254', 'admin', '2026-02-08 15:25:09.000000', '1', '0', '0', 26, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (51, '党建工作 1', 19, '要闻动态 1要闻动态 1要闻动态 1要闻动态 1要闻动态 1', NULL, 'upload', '<p>要闻动态 1要闻动态 1要闻动态 1要闻动态 1要闻动态 1要闻动态 1</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:10:11.509820', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'link', 'https://www.wyzyz.org/home', '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (52, '品牌活动 111', 20, NULL, '/public/650_20250407164124A194.jpg_1770527431327.jpeg', 'upload', '<p>品牌活动 111品牌活动 111品牌活动 111品牌活动 111品牌活动 111品牌活动 111</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:10:37.063125', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (53, '表彰激励 111', 21, '表彰激励 111表彰激励 111', '/public/640 (1)_20240326195455A031.jpg_1770527447048.jpeg', 'upload', '<p>表彰激励 111表彰激励 111表彰激励 111表彰激励 111表彰激励 111</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:10:51.327101', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (54, '全国联动 111', 23, '全国联动 111全国联动 111全国联动 111', '/public/1225-_20240105162138A010.jpg_1770527473068.jpeg', 'upload', '<p>全国联动 111全国联动 111全国联动 111全国联动 111全国联动 111</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:11:15.134935', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (55, '资讯 111', 18, '资讯 111', '/public/1225-_20240105162138A010.jpg_1770528107773.jpeg', 'upload', '<p>资讯 111资讯 111资讯 111资讯 111资讯 111资讯 111资讯 111</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:21:52.421317', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', 27, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (56, '资讯 222', 18, '资讯 222资讯 222', '/public/640 (1)_20240326195455A031.jpg_1770528201136.jpeg', 'upload', '<p>资讯 222资讯 222资讯 222资讯 222资讯 222资讯 222资讯 222资讯 222资讯 222资讯 222</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 13:23:30.393611', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', 27, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (57, '这些 333', 18, NULL, '', 'upload', NULL, NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 14:12:08.240713', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', 27, 'link', 'https://www.baidu.com/', '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (60, '111', 6, '222', '/public/20231017112056A013_20240103101656A013_20240103145652A042.png_1770532929027.png', 'upload', '<p>333</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 14:42:11.064372', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
INSERT INTO `cms_article` (`article_id`, `title`, `category_id`, `summary`, `cover_image`, `cover_image_source_type`, `content`, `source`, `author`, `publish_time`, `open_type`, `view_count`, `seo_title`, `seo_keywords`, `seo_description`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`, `sub_category_id`, `content_type`, `external_link`, `audit_status`, `audit_reason`, `audit_time`, `audit_by`) VALUES (61, '测试123', 6, '123123', '/public/微信截图_20250527094917_20250527094929A372.png_1770532948886.png', 'upload', '<p>123123123</p>', NULL, NULL, '2026-02-08 14:55:10', 'current', 0, NULL, NULL, NULL, 'admin', '2026-02-08 14:42:32.095293', 'admin', '2026-02-08 14:55:09.000000', '1', '0', '0', NULL, 'editor', NULL, '1', NULL, '2026-02-08 14:55:07', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for cms_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `position` varchar(50) NOT NULL DEFAULT 'home' COMMENT '位置：home首页 focus首页焦点 right_top右侧顶部 right_platform右侧平台',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `image` varchar(500) NOT NULL COMMENT '图片',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_banner
-- ----------------------------
BEGIN;
INSERT INTO `cms_banner` (`banner_id`, `title`, `position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `image`, `link_url`, `status`, `del_flag`) VALUES (1, '焦点横幅', 'focus', 1, 'admin', '2026-02-07 18:07:57.000000', 'admin', '2026-02-07 18:07:57.000000', '', NULL, '1', '0');
INSERT INTO `cms_banner` (`banner_id`, `title`, `position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `image`, `link_url`, `status`, `del_flag`) VALUES (2, '右侧顶部轮播图', 'right_top', 1, 'admin', '2026-02-07 18:07:57.000000', 'admin', '2026-02-07 18:07:57.000000', '', NULL, '1', '0');
INSERT INTO `cms_banner` (`banner_id`, `title`, `position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `image`, `link_url`, `status`, `del_flag`) VALUES (3, '右侧平台轮播图', 'right_platform', 1, 'admin', '2026-02-07 18:07:57.000000', 'admin', '2026-02-07 18:07:57.000000', '', NULL, '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_code` varchar(50) NOT NULL COMMENT '分类编码',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `IDX_e1d6b65f558cf996c05d98b356` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
BEGIN;
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (3, '品牌活动', 'activity', 0, 3, NULL, 'admin', '2026-02-08 11:51:24.416711', '', '2026-02-08 11:51:24.416711', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (4, '表彰激励', 'honor', 0, 4, NULL, 'admin', '2026-02-08 11:51:24.416711', '', '2026-02-08 11:51:24.416711', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (6, '专题', 'special', 0, 6, NULL, 'admin', '2026-02-08 11:51:24.416711', '', '2026-02-08 11:51:24.416711', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (8, '学习贯彻党的二十届三中全会精神', 'special_1', 6, 1, NULL, 'admin', '2026-02-08 11:51:24.417199', '', '2026-02-08 11:51:24.417199', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (9, '与人民同行', 'special_2', 6, 2, NULL, 'admin', '2026-02-08 11:51:24.417199', '', '2026-02-08 11:51:24.417199', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (10, '时代风尚', 'special_3', 6, 3, NULL, 'admin', '2026-02-08 11:51:24.417199', '', '2026-02-08 11:51:24.417199', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (11, '百花迎春', 'special_4', 6, 4, NULL, 'admin', '2026-02-08 11:51:24.417199', '', '2026-02-08 11:51:24.417199', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (18, '要闻动态', 'news', 0, 1, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (19, '党建工作', 'party', 0, 2, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (20, '品牌活动', 'activities', 0, 3, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (21, '表彰激励', 'awards', 0, 4, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (22, '公告公示', 'notice', 0, 5, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (23, '全国联动', 'cooperation', 0, 6, NULL, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (26, '要闻', 'news_important', 18, 1, NULL, 'admin', '2026-02-08 13:21:11.000000', 'admin', '2026-02-08 13:21:11.000000', '1', '0');
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (27, '资讯', 'news_info', 18, 2, NULL, 'admin', '2026-02-08 13:21:11.000000', 'admin', '2026-02-08 13:21:11.000000', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_focus
-- ----------------------------
DROP TABLE IF EXISTS `cms_focus`;
CREATE TABLE `cms_focus` (
  `focus_id` int NOT NULL AUTO_INCREMENT,
  `focus_key` varchar(50) NOT NULL COMMENT '焦点图标识',
  `focus_name` varchar(100) NOT NULL COMMENT '焦点图名称',
  `image_url` varchar(500) NOT NULL COMMENT '图片URL',
  `image_source_type` varchar(20) NOT NULL DEFAULT 'upload' COMMENT '图片来源类型：upload上传 link链接',
  `link_type` varchar(20) NOT NULL DEFAULT 'external' COMMENT '链接类型：internal内部文章 external外部地址',
  `link_value` varchar(500) DEFAULT NULL COMMENT '链接值（文章ID或外部URL）',
  `open_type` varchar(20) NOT NULL DEFAULT 'new' COMMENT '打开方式：current当前页 new新标签页',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `is_fixed` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否固定：0否 1是（固定数据不可删除）',
  PRIMARY KEY (`focus_id`),
  UNIQUE KEY `IDX_c99b4facf1b215b049511fa1f3` (`focus_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_focus
-- ----------------------------
BEGIN;
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (1, 'focus_big', '焦点大图', '/public/640_20250127152953A190.jpg_1770525831667.jpeg', 'upload', 'external', '#', 'new', 1, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 12:43:52.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (2, 'focus_small_1', '焦点小图1', '/public/1225_20240105161435A007.jpg_1770525837910.jpeg', 'upload', 'external', '#', 'new', 2, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 12:43:58.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (3, 'focus_small_2', '焦点小图2', '/public/35_20240326192614A018.png_1770536340470.png', 'upload', 'external', 'https://www.baidu.com', 'new', 3, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 15:39:13.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (4, 'focus_small_3', '焦点小图3', '/public/微信截图_20250127152457_20250127152507A188.png_1770536361972.png', 'upload', 'external', 'https://www.wyzyz.org/home', 'new', 4, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 15:39:40.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (5, 'focus_banner', '焦点下Banner图', '/public/微信图片_20240105160055_20240105160104A005.png_1770536390459.png', 'upload', 'external', 'https://www.wyzyz.org/home', 'new', 5, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 15:39:53.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (6, 'notice_banner', '公告上方焦点图', '/public/微信截图_20250128134002_20250128134020A192.png_1770536406956.png', 'upload', 'external', 'https://www.wyzyz.org/home', 'new', 6, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 15:40:08.000000', '1');
INSERT INTO `cms_focus` (`focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`) VALUES (7, 'overview_banner', '协会概况下方焦点图', '/public/微信截图_20250127152704_20250127152712A189.png_1770536416785.png', 'upload', 'external', 'https://www.wyzyz.org/home', 'new', 7, 'admin', '2026-02-08 11:51:24.417869', '1', '2026-02-08 15:40:18.000000', '1');
COMMIT;

-- ----------------------------
-- Table structure for cms_focus_history
-- ----------------------------
DROP TABLE IF EXISTS `cms_focus_history`;
CREATE TABLE `cms_focus_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `focus_id` int NOT NULL COMMENT '关联的焦点图ID',
  `focus_key` varchar(50) NOT NULL COMMENT '焦点图标识',
  `focus_name` varchar(100) NOT NULL COMMENT '焦点图名称',
  `image_url` varchar(500) NOT NULL COMMENT '图片URL',
  `image_source_type` varchar(20) NOT NULL DEFAULT 'upload' COMMENT '图片来源类型',
  `link_type` varchar(20) NOT NULL DEFAULT 'external' COMMENT '链接类型',
  `link_value` varchar(500) DEFAULT NULL COMMENT '链接值',
  `open_type` varchar(20) NOT NULL DEFAULT 'new' COMMENT '打开方式',
  `remark` varchar(200) DEFAULT NULL COMMENT '修改备注',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '修改人',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_focus_history
-- ----------------------------
BEGIN;
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (1, 1, 'focus_big', '焦点大图', '/origin-html/中国文艺志愿者-首页_files/640_20250407163757A193.jpg', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 12:43:52.544145');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (2, 2, 'focus_small_1', '焦点小图1', '/origin-html/中国文艺志愿者-首页_files/660_20250407164737A195.jpg', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 12:43:58.758084');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (3, 3, 'focus_small_2', '焦点小图2', '/origin-html/中国文艺志愿者-首页_files/650_20250407164124A194.jpg', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 15:39:13.971030');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (4, 4, 'focus_small_3', '焦点小图3', '/origin-html/中国文艺志愿者-首页_files/640_20250127152953A190.jpg', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 15:39:40.382896');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (5, 5, 'focus_banner', '焦点下Banner图', '/origin-html/中国文艺志愿者-首页_files/微信截图_20250527095422_20250527095430A374.png', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 15:39:53.547830');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (6, 6, 'notice_banner', '公告上方焦点图', '/origin-html/中国文艺志愿者-首页_files/1012海报_20240326194759A029.png', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 15:40:08.916303');
INSERT INTO `cms_focus_history` (`history_id`, `focus_id`, `focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `remark`, `create_by`, `create_time`) VALUES (7, 7, 'overview_banner', '协会概况下方焦点图', '/origin-html/中国文艺志愿者-首页_files/微信截图_20250128134002_20250128134020A192.png', 'upload', 'external', '#', 'new', '自动保存', '1', '2026-02-08 15:40:18.736680');
COMMIT;

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `link_logo` varchar(255) DEFAULT NULL COMMENT '链接Logo',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `link_type` varchar(1) NOT NULL DEFAULT '0' COMMENT '链接类型：0普通链接 1全国分会',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_link
-- ----------------------------
BEGIN;
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (1, '中国文联 111', 'https://www.cflac.org.cn/', NULL, 1, 'admin', '2026-02-08 11:51:24.419871', 'admin', '2026-02-08 15:50:00.000000', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (2, '中国作协', 'https://www.chinawriter.com.cn/', NULL, 2, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (3, '中国剧协', 'https://www.chinatheatre.org.cn/', NULL, 3, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (4, '中国影协', 'http://www.cfa1949.com/', NULL, 4, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (5, '中国音协', 'https://www.chnmusic.org/', NULL, 5, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (6, '中国美协', 'https://www.caanet.org.cn/', NULL, 6, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (7, '中国曲协', 'http://www.zhongguoyi.cn/', NULL, 7, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (8, '中国舞协', 'https://www.chinadance.org/', NULL, 8, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (9, '中国民协', 'http://www.cflas.com.cn/', NULL, 9, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (10, '中国摄协 111', 'https://www.chpanet.org.cn/', NULL, 10, 'admin', '2026-02-08 11:51:24.419871', 'admin', '2026-02-08 12:44:05.000000', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (11, '中国书协', 'http://www.chca1981.org.cn/', NULL, 11, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (12, '中国杂协', 'http://www.zgmx.org/', NULL, 12, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (13, '中国视协', 'http://www.ctaa.org.cn/', NULL, 13, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
INSERT INTO `cms_link` (`link_id`, `link_name`, `link_url`, `link_logo`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `link_type`, `status`, `del_flag`) VALUES (14, '中国评协', 'http://www.zgpjxh.org/', NULL, 14, 'admin', '2026-02-08 11:51:24.419871', '', '2026-02-08 11:51:24.419871', '0', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_navigation
-- ----------------------------
DROP TABLE IF EXISTS `cms_navigation`;
CREATE TABLE `cms_navigation` (
  `nav_id` int NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  `nav_path` varchar(200) NOT NULL COMMENT '导航路径/路由',
  `nav_type` varchar(20) NOT NULL DEFAULT 'internal' COMMENT '导航类型：internal内部 external外部',
  `nav_target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '打开方式：_self当前页 _blank新标签页',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `is_fixed` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否固定：0否 1是（不可编辑删除）',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_navigation
-- ----------------------------
BEGIN;
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (1, '首页', '/', 'internal', '_self', 1, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (2, '协会概况', '/about', 'internal', '_self', 2, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (3, '要闻动态', '/news', 'internal', '_self', 3, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (4, '党建工作', '/party', 'internal', '_self', 4, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (5, '品牌活动', '/activities', 'internal', '_self', 5, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (6, '表彰激励', '/awards', 'internal', '_self', 6, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (7, '公告公示', '/announcements', 'internal', '_self', 7, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (8, '专题', '/topics', 'internal', '_self', 8, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (9, '全国联动', '/cooperation', 'internal', '_self', 9, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
INSERT INTO `cms_navigation` (`nav_id`, `nav_name`, `nav_path`, `nav_type`, `nav_target`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `is_fixed`, `status`, `del_flag`) VALUES (10, '智慧平台', 'https://zg.wyzyz.org', 'external', '_blank', 10, 'admin', '2026-02-08 12:21:05.000000', 'admin', '2026-02-08 12:21:05.000000', '0', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_notice
-- ----------------------------
DROP TABLE IF EXISTS `cms_notice`;
CREATE TABLE `cms_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `notice_type` varchar(20) NOT NULL DEFAULT 'notice' COMMENT '公告类型：notice公告 announcement公示',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常 1关闭',
  `is_top` varchar(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_notice
-- ----------------------------
BEGIN;
INSERT INTO `cms_notice` (`notice_id`, `title`, `content`, `notice_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`) VALUES (1, '关于2024年度中国文艺志愿者协会会员发展公告', '根据《中国文艺志愿者协会章程》规定，现开展2024年度会员发展工作。请符合条件的申请人按要求提交申请材料。', 'notice', 1, 'admin', '2026-02-08 11:51:24.420307', '', '2026-02-08 11:51:24.420307', '0', '0', '0');
INSERT INTO `cms_notice` (`notice_id`, `title`, `content`, `notice_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`) VALUES (2, '中国文艺志愿者协会2023年度财务公开报告', '根据相关规定，现将中国文艺志愿者协会2023年度财务收支情况进行公开，接受社会监督。', 'announcement', 2, 'admin', '2026-02-08 11:51:24.420307', '', '2026-02-08 11:51:24.420307', '0', '0', '0');
INSERT INTO `cms_notice` (`notice_id`, `title`, `content`, `notice_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`) VALUES (3, '关于规范文艺志愿服务行为的通知', '为进一步规范文艺志愿服务活动，提升服务质量，现就有关事项通知如下...', 'notice', 3, 'admin', '2026-02-08 11:51:24.420307', '', '2026-02-08 11:51:24.420307', '0', '0', '0');
INSERT INTO `cms_notice` (`notice_id`, `title`, `content`, `notice_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`) VALUES (4, '中国文艺志愿者协会办公地址变更公告', '因工作需要，中国文艺志愿者协会办公地址已变更，新地址为：北京市朝阳区...', 'announcement', 4, 'admin', '2026-02-08 11:51:24.420307', '', '2026-02-08 11:51:24.420307', '0', '0', '0');
INSERT INTO `cms_notice` (`notice_id`, `title`, `content`, `notice_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `is_top`, `del_flag`) VALUES (5, '关于征集文艺志愿服务典型案例的通知', '为总结推广文艺志愿服务经验，现面向各单位征集文艺志愿服务典型案例。', 'notice', 5, 'admin', '2026-02-08 11:51:24.420307', '', '2026-02-08 11:51:24.420307', '0', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_page
-- ----------------------------
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `page_key` varchar(50) NOT NULL COMMENT '页面标识',
  `page_name` varchar(100) NOT NULL COMMENT '页面名称',
  `content` longtext COMMENT '内容',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `IDX_9f801666121a08845c966dc97a` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_page
-- ----------------------------
BEGIN;
INSERT INTO `cms_page` (`page_id`, `page_key`, `page_name`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1, 'association_overview', '协会概况', '', 'admin', '2026-02-08 11:51:24.418320', '', '2026-02-08 11:51:24.418320');
INSERT INTO `cms_page` (`page_id`, `page_key`, `page_name`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2, 'organization', '组织架构', '', 'admin', '2026-02-08 11:51:24.418320', '', '2026-02-08 11:51:24.418320');
INSERT INTO `cms_page` (`page_id`, `page_key`, `page_name`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, 'leadership', '领导介绍', '', 'admin', '2026-02-08 11:51:24.418320', '', '2026-02-08 11:51:24.418320');
INSERT INTO `cms_page` (`page_id`, `page_key`, `page_name`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, 'constitution', '协会章程', '', 'admin', '2026-02-08 11:51:24.418320', '', '2026-02-08 11:51:24.418320');
INSERT INTO `cms_page` (`page_id`, `page_key`, `page_name`, `content`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, 'contact', '联系方式', '', 'admin', '2026-02-08 11:51:24.418320', '', '2026-02-08 11:51:24.418320');
COMMIT;

-- ----------------------------
-- Table structure for cms_quick_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_quick_link`;
CREATE TABLE `cms_quick_link` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `link_position` varchar(50) NOT NULL COMMENT '链接位置：top顶部 sidebar侧边栏',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_quick_link
-- ----------------------------
BEGIN;
INSERT INTO `cms_quick_link` (`link_id`, `link_name`, `link_url`, `link_position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (1, '中国文艺网', 'http://www.cflac.org.cn/', 'top', 1, 'admin', '2026-02-08 11:51:24.419532', '', '2026-02-08 11:51:24.419532', '1', '0');
INSERT INTO `cms_quick_link` (`link_id`, `link_name`, `link_url`, `link_position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (2, '中国文联', 'http://www.cflac.org.cn/', 'top', 2, 'admin', '2026-02-08 11:51:24.419532', '', '2026-02-08 11:51:24.419532', '1', '0');
INSERT INTO `cms_quick_link` (`link_id`, `link_name`, `link_url`, `link_position`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (3, '中国文艺志愿服务智慧平台', 'https://zyfw.wenlian.com/', 'sidebar', 1, 'admin', '2026-02-08 11:51:24.419532', '', '2026-02-08 11:51:24.419532', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_site_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_config`;
CREATE TABLE `cms_site_config` (
  `config_id` int NOT NULL AUTO_INCREMENT,
  `config_key` varchar(100) NOT NULL COMMENT '配置键',
  `config_value` text COMMENT '配置值',
  `config_name` varchar(200) NOT NULL COMMENT '配置名称',
  `config_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '配置类型：text文本 textarea多行文本 rich富文本 image图片',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `IDX_b1595a181be79088959e47d889` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_site_config
-- ----------------------------
BEGIN;
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1, 'site_icp', '京ICP备14001194号-1', 'ICP备案号', 'text', 1, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2, 'site_police', '京公网安备11010502025171', '公安备案号', 'text', 2, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, 'site_copyright', '中国文艺志愿者协会 版权所有', '版权信息', 'text', 3, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, 'site_contact', '联系咨询', '联系咨询', 'text', 4, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, 'site_complaint', '投诉建议', '投诉建议', 'text', 5, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (6, 'site_forum', '文艺论坛', '文艺论坛', 'text', 6, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (7, 'site_department', '职能部门', '职能部门', 'text', 7, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (8, 'site_member', '团体会员', '团体会员', 'text', 8, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (9, 'site_organization', '组织机构', '组织机构', 'text', 9, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
INSERT INTO `cms_site_config` (`config_id`, `config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10, 'site_qrcode', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20231017112056A013_20240103101656A013_20240103145652A042.png', '公众号二维码', 'image', 10, 'admin', '2026-02-08 11:51:24.417423', '', '2026-02-08 11:51:24.417423');
COMMIT;

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special` (
  `special_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '专题标题',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` varchar(500) DEFAULT NULL COMMENT '专题描述',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_special
-- ----------------------------
BEGIN;
INSERT INTO `cms_special` (`special_id`, `title`, `cover_image`, `description`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (1, '学习贯彻党的二十届三中全会精神', NULL, '深入学习宣传贯彻党的二十届三中全会精神，推动文艺志愿服务高质量发展', 1, 'admin', '2026-02-08 11:51:24.420661', '', '2026-02-08 11:51:24.420661', '1', '0');
INSERT INTO `cms_special` (`special_id`, `title`, `cover_image`, `description`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (2, '新时代文明实践文艺志愿服务', NULL, '记录新时代文明实践文艺志愿服务的生动实践', 2, 'admin', '2026-02-08 11:51:24.420661', 'admin', '2026-02-08 14:43:14.000000', '1', '0');
INSERT INTO `cms_special` (`special_id`, `title`, `cover_image`, `description`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (3, '致敬大国重器', NULL, '文艺志愿者走进大国重器，致敬建设者', 3, 'admin', '2026-02-08 11:51:24.420661', '', '2026-02-08 11:51:24.420661', '1', '0');
INSERT INTO `cms_special` (`special_id`, `title`, `cover_image`, `description`, `sort_order`, `create_by`, `create_time`, `update_by`, `update_time`, `status`, `del_flag`) VALUES (4, '我们的中国梦', NULL, '文化进万家，共筑中国梦', 4, 'admin', '2026-02-08 11:51:24.420661', '', '2026-02-08 11:51:24.420661', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for cms_special_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_article`;
CREATE TABLE `cms_special_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `special_id` int NOT NULL COMMENT '专题ID',
  `article_id` int NOT NULL COMMENT '文章ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `category_id` int DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_special_article
-- ----------------------------
BEGIN;
INSERT INTO `cms_special_article` (`id`, `special_id`, `article_id`, `sort_order`, `category_id`) VALUES (1, 1, 50, 0, NULL);
INSERT INTO `cms_special_article` (`id`, `special_id`, `article_id`, `sort_order`, `category_id`) VALUES (2, 1, 60, 0, NULL);
INSERT INTO `cms_special_article` (`id`, `special_id`, `article_id`, `sort_order`, `category_id`) VALUES (3, 2, 61, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for cms_special_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_category`;
CREATE TABLE `cms_special_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `special_id` int NOT NULL COMMENT '专题ID',
  `category_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `category_code` varchar(50) NOT NULL COMMENT '栏目编码',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `status` varchar(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_special_category
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cms_statistics
-- ----------------------------
DROP TABLE IF EXISTS `cms_statistics`;
CREATE TABLE `cms_statistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `stat_date` date NOT NULL,
  `total_pv` int NOT NULL DEFAULT '0',
  `total_uv` int NOT NULL DEFAULT '0',
  `article_pv` int NOT NULL DEFAULT '0',
  `article_uv` int NOT NULL DEFAULT '0',
  `home_pv` int NOT NULL DEFAULT '0',
  `home_uv` int NOT NULL DEFAULT '0',
  `special_pv` int NOT NULL DEFAULT '0',
  `special_uv` int NOT NULL DEFAULT '0',
  `other_pv` int NOT NULL DEFAULT '0',
  `other_uv` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `IDX_646abe13de494fbfa2a1d870dd` (`stat_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_statistics
-- ----------------------------
BEGIN;
INSERT INTO `cms_statistics` (`stat_id`, `stat_date`, `total_pv`, `total_uv`, `article_pv`, `article_uv`, `home_pv`, `home_uv`, `special_pv`, `special_uv`, `other_pv`, `other_uv`) VALUES (1, '2026-02-08', 115, 0, 0, 0, 0, 0, 0, 0, 115, 0);
COMMIT;

-- ----------------------------
-- Table structure for cms_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `cms_visit_log`;
CREATE TABLE `cms_visit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `page_url` varchar(255) DEFAULT NULL,
  `page_type` varchar(50) DEFAULT NULL,
  `ref_type_id` int DEFAULT NULL,
  `ip_address` varchar(128) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `visit_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`log_id`),
  KEY `IDX_2b0f918783569d08b923884931` (`page_url`),
  KEY `IDX_4f7c3b0b38d31b5df150f64df4` (`page_type`),
  KEY `IDX_2e6ffe78738d4defffb9c3de7b` (`ref_type_id`),
  KEY `IDX_085a96e37b4316f92bec1d529e` (`visit_time`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cms_visit_log
-- ----------------------------
BEGIN;
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (1, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:51:59.392000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (2, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:06.555000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (3, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:07.078000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (4, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:08.877000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (5, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:12.490000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (6, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:53:20.707000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (7, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:54:00.943000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (8, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:54:15.457000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (9, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:55:58.147000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (10, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:11:54.428000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (11, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:12:16.319000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (12, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:12:27.459000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (13, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:33:10.196000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (14, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:33:24.626000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (15, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:36:41.611000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (16, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:37:25.632000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (17, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:37:36.163000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (18, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:39:40.907000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (19, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:46:33.090000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (20, NULL, NULL, NULL, NULL, NULL, '2026-02-08 12:52:21.378000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (21, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:00:20.366000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (22, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:02:03.826000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (23, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:11:32.646000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (24, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:17:05.221000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (25, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:17:26.401000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (26, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:17:50.407000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (27, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:17:51.464000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (28, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:18:16.730000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (29, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:18:17.463000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (30, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:21:58.230000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (31, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:10.647000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (32, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:11.462000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (33, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:20.548000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (34, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:21.457000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (35, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:32.113000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (36, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:32.455000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (37, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:42.167000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (38, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:23:42.192000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (39, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:24:28.404000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (40, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:24:41.586000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (41, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:25:20.837000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (42, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:26:13.927000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (43, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:26:13.938000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (44, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:26:16.076000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (45, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:28:37.275000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (46, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:28:37.456000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (47, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:28:54.144000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (48, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:30:00.144000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (49, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:31:12.600000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (50, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:32:06.542000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (51, NULL, NULL, NULL, NULL, NULL, '2026-02-08 13:52:46.152000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (52, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:14.148000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (53, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:15.495000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (54, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:16.394000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (55, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:24.377000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (56, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:28.419000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (57, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:12:33.528000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (58, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:14:15.064000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (59, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:14:21.363000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (60, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:16:53.958000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (61, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:17:00.296000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (62, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:17:05.512000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (63, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:18:25.769000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (64, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:18:32.049000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (65, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:18:37.562000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (66, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:18:40.831000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (67, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:31:07.442000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (68, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:31:24.954000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (69, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:31:58.661000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (70, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:33:14.490000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (71, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:33:25.282000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (72, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:33:25.486000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (73, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:34:00.494000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (74, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:34:37.512000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (75, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:34:51.541000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (76, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:34:53.492000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (77, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:34:55.714000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (78, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:35:00.938000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (79, NULL, NULL, NULL, NULL, NULL, '2026-02-08 14:59:16.651000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (80, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:22:11.739000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (81, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:22:48.516000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (82, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:25:12.838000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (83, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:25:16.833000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (84, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:25:20.248000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (85, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:25:37.337000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (86, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:25:43.101000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (87, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:33:09.942000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (88, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:33:14.134000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (89, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:13.039000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (90, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:16.595000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (91, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:40.841000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (92, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:40.870000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (93, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:50.070000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (94, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:34:50.082000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (95, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:00.470000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (96, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:03.891000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (97, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:06.543000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (98, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:20.785000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (99, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:20.790000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (100, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:29.527000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (101, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:35:32.390000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (102, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:38:24.571000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (103, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:38:33.588000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (104, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:38:45.092000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (105, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:40:24.584000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (106, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:40:43.753000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (107, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:46:06.258000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (108, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:47:35.571000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (109, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:47:48.087000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (110, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:47:52.759000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (111, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:47:58.475000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (112, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:48:01.999000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (113, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:48:06.531000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (114, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:50:04.409000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (115, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:52:14.074000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (116, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:52:31.995000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (117, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:52:38.591000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (118, NULL, NULL, NULL, NULL, NULL, '2026-02-08 15:56:25.393000');
INSERT INTO `cms_visit_log` (`log_id`, `page_url`, `page_type`, `ref_type_id`, `ip_address`, `user_agent`, `visit_time`) VALUES (119, NULL, NULL, NULL, NULL, NULL, '2026-02-08 16:01:00.662000');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) NOT NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) NOT NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) NOT NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) NOT NULL DEFAULT 'element-plus' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) NOT NULL COMMENT '生成包路径',
  `module_name` varchar(30) NOT NULL COMMENT '生成模块名',
  `business_name` varchar(30) NOT NULL COMMENT '生成业务名',
  `function_name` varchar(50) NOT NULL COMMENT '生成功能名',
  `function_author` varchar(50) NOT NULL COMMENT '生成功能作者',
  `gen_type` char(1) NOT NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) NOT NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) NOT NULL DEFAULT '' COMMENT '其它生成选项',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` int NOT NULL COMMENT '归属表编号',
  `column_name` varchar(200) NOT NULL COMMENT '列名称',
  `column_comment` varchar(500) NOT NULL COMMENT '列描述',
  `column_type` varchar(100) NOT NULL COMMENT '列类型',
  `java_type` varchar(500) NOT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) NOT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) NOT NULL DEFAULT '0' COMMENT '是否主键（1是）',
  `is_increment` char(1) NOT NULL DEFAULT '0' COMMENT '是否自增（1是）',
  `is_required` char(1) NOT NULL DEFAULT '0' COMMENT '是否必填（1是）',
  `is_insert` char(1) NOT NULL DEFAULT '0' COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT '0' COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT '0' COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT '1' COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) NOT NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) NOT NULL DEFAULT '' COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) NOT NULL DEFAULT '' COMMENT '字典类型',
  `column_default` varchar(200) DEFAULT NULL COMMENT '默认值',
  `sort` int NOT NULL COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) NOT NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) NOT NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) NOT NULL DEFAULT 'N' COMMENT '系统内置',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父部门ID',
  `ancestors` varchar(50) NOT NULL DEFAULT '0' COMMENT '祖级列表',
  `dept_name` varchar(30) NOT NULL COMMENT '部门名称',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) NOT NULL COMMENT '负责人',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_sort` int NOT NULL DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `css_class` varchar(100) NOT NULL DEFAULT '' COMMENT '样式属性',
  `list_class` varchar(100) NOT NULL COMMENT '表格回显样式',
  `is_default` char(1) NOT NULL DEFAULT 'N' COMMENT '是否默认',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `IDX_f4e4273658733a3bbe6a2479bf` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT NULL COMMENT '异常信息',
  `create_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) NOT NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) NOT NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '提示消息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `login_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (100, '', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:02:32.004412');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (101, '', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '1', '帐号或密码错误', '0', '2026-02-08 16:04:01.680325');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (102, '', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '1', '帐号或密码错误', '0', '2026-02-08 16:04:48.755266');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (103, '', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '1', '帐号或密码错误', '0', '2026-02-08 16:06:19.127545');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (104, '', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '1', '帐号或密码错误', '0', '2026-02-08 16:07:17.696903');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (105, 'admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:08:29.344056');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (106, '', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '1', '验证码错误', '0', '2026-02-08 16:09:32.527252');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (107, 'admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:13:59.272223');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (108, 'admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:14:56.661506');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (109, 'cms_admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:15:01.353106');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (110, 'cms_admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:20:31.392777');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (111, 'cms_admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:20:36.142507');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (112, 'cms_admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:23:04.059547');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (113, 'admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:23:10.146420');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (114, 'admin', '::1', '陕西省西安市 联通', 'Chrome 144.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:30:37.532079');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (115, 'admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '退出成功', '0', '2026-02-08 16:38:26.472978');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `del_flag`, `login_time`) VALUES (116, 'cms_admin', '::1', '陕西省西安市 联通', 'Chrome 135.0.0', 'Mac OS X', '0', '登录成功', '0', '2026-02-08 16:38:30.889981');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int NOT NULL COMMENT '父菜单ID',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_frame` char(1) NOT NULL DEFAULT '1' COMMENT '是否为外链',
  `is_cache` char(1) NOT NULL DEFAULT '0' COMMENT '是否缓存',
  `menu_type` char(1) NOT NULL DEFAULT 'M' COMMENT '菜单类型',
  `visible` char(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `perms` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1, '系统管理', 0, 3, 'system', NULL, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '系统管理目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '系统监控目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (3, '系统工具', 0, 5, 'tool', NULL, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '系统工具目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '用户管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '角色管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '菜单管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '部门管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '岗位管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '字典管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '参数设置菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '通知公告菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '日志管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '在线用户菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '定时任务菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '数据监控菜单', '1');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '服务监控菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '缓存监控菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '缓存列表菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '表单构建菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '代码生成菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '系统接口菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '操作日志菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '登录日志菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1000, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1001, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1002, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1003, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1004, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1005, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1006, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1007, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1008, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1009, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1010, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1011, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1012, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1013, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1014, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1015, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1016, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1017, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1018, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1019, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1020, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1021, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1022, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1023, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1024, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1025, '字典查询', 105, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1026, '字典新增', 105, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1027, '字典修改', 105, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1028, '字典删除', 105, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1029, '参数查询', 106, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1030, '参数新增', 106, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1031, '参数修改', 106, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1032, '参数删除', 106, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1033, '参数导出', 106, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1034, '通知查询', 107, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1035, '通知新增', 107, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1036, '通知修改', 107, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1037, '通知删除', 107, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1038, '操作查询', 500, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1039, '操作删除', 500, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1040, '操作导出', 500, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1041, '登录查询', 501, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1042, '登录删除', 501, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1043, '登录导出', 501, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1044, '账户解锁', 501, 4, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1045, '任务查询', 110, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1046, '任务新增', 110, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1047, '任务修改', 110, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1048, '任务删除', 110, 4, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1049, '任务导出', 110, 5, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1050, '状态修改', 110, 6, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1051, '任务执行', 110, 7, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:execute', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1052, '生成查询', 116, 1, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1053, '生成修改', 116, 2, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1054, '生成删除', 116, 3, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1055, '导入代码', 116, 4, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1056, '预览代码', 116, 5, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1057, '生成代码', 116, 6, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (1058, '下载代码', 116, 7, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:download', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2000, '内容管理', 0, 1, 'cms', '', '', '1', '0', 'M', '0', '0', '', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '内容管理目录', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2001, '协会概况', 2000, 1, 'about', 'cms/about/index', '', '1', '0', 'C', '0', '0', 'cms:about:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '协会概况菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2002, '要闻动态', 2000, 2, 'news', 'cms/article/index', 'categoryCode=news', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '要闻动态菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2003, '党建工作', 2000, 3, 'party', 'cms/article/index', 'categoryCode=party', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '党建工作菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2004, '品牌活动', 2000, 4, 'activities', 'cms/article/index', 'categoryCode=activities', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '品牌活动菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2005, '表彰激励', 2000, 5, 'awards', 'cms/article/index', 'categoryCode=awards', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '表彰激励菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2006, '公告公示', 2000, 6, 'announcements', 'cms/article/index', 'categoryCode=notice', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '公告公示菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2007, '专题', 2000, 7, 'topics', 'cms/special/index', '', '1', '0', 'C', '0', '0', 'cms:special:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '专题菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2008, '全国联动', 2000, 8, 'cooperation', 'cms/article/index', 'categoryCode=cooperation', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '全国联动菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2009, '网站导航', 2000, 9, 'navigation', 'cms/navigation/index', '', '1', '0', 'C', '0', '0', 'cms:navigation:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '网站导航菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2010, '文章分类', 2000, 10, 'category', 'cms/category/index', '', '1', '0', 'C', '0', '0', 'cms:category:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '文章分类菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2011, '轮播图管理', 2000, 11, 'banner', 'cms/banner/index', '', '1', '0', 'C', '0', '1', 'cms:banner:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 15:37:01.000000', '轮播图管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2012, '焦点图管理', 2000, 12, 'focus', 'cms/focus/index', '', '1', '0', 'C', '0', '0', 'cms:focus:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '焦点图管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2013, '友情链接', 2000, 13, 'link', 'cms/link/index', '', '1', '0', 'C', '0', '0', 'cms:link:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '友情链接菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2014, '快捷链接', 2000, 14, 'quickLink', 'cms/quickLink/index', '', '1', '0', 'C', '0', '0', 'cms:quickLink:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '快捷链接菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2015, '单页管理', 2000, 15, 'page', 'cms/page/index', '', '1', '0', 'C', '0', '1', 'cms:page:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 15:37:08.000000', '单页管理菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2016, '网站配置', 2000, 16, 'siteConfig', 'cms/site-config/index', '', '1', '0', 'C', '0', '1', 'cms:siteConfig:list', 'list', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 15:37:05.000000', '网站配置菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2101, '协会概况查询', 2001, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2102, '协会概况新增', 2001, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2103, '协会概况修改', 2001, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2104, '协会概况删除', 2001, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2105, '文章查询', 2002, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2106, '文章新增', 2002, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2107, '文章修改', 2002, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2108, '文章删除', 2002, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2109, '专题查询', 2007, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2110, '专题新增', 2007, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2111, '专题修改', 2007, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2112, '专题删除', 2007, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2113, '导航查询', 2009, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:navigation:query', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2114, '导航新增', 2009, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:navigation:add', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2115, '导航修改', 2009, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:navigation:edit', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2116, '导航删除', 2009, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:navigation:remove', '#', 'admin', '2026-02-08 12:47:48.000000', 'admin', '2026-02-08 12:47:48.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2204, '文章审核', 2000, 10, 'article-audit', 'cms/article-audit/index', '', '1', '0', 'C', '0', '0', 'cms:article:audit', 'checkbox', 'admin', '2026-02-08 14:50:21.000000', 'admin', '2026-02-08 14:54:05.000000', '文章审核菜单', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2205, '文章审核查询', 2204, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:query', '#', 'admin', '2026-02-08 14:50:21.000000', 'admin', '2026-02-08 14:50:21.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2206, '文章审核操作', 2204, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:exec', '#', 'admin', '2026-02-08 14:50:21.000000', 'admin', '2026-02-08 14:50:21.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2207, '文章发布', 2204, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:publish', '#', 'admin', '2026-02-08 14:50:21.000000', 'admin', '2026-02-08 14:50:21.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2208, '文章审核', 2000, 10, 'article-audit', 'cms/article-audit/index', '', '1', '0', 'C', '0', '0', 'cms:article:audit', 'check', 'admin', '2026-02-08 14:53:28.000000', 'admin', '2026-02-08 14:53:54.000000', '文章审核菜单', '1');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2209, '文章审核查询', 2208, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:query', '#', 'admin', '2026-02-08 14:53:28.000000', 'admin', '2026-02-08 14:53:28.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2210, '文章审核操作', 2208, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:exec', '#', 'admin', '2026-02-08 14:53:28.000000', 'admin', '2026-02-08 14:53:28.000000', '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2211, '文章发布', 2208, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:publish', '#', 'admin', '2026-02-08 14:53:28.000000', 'admin', '2026-02-08 14:53:28.000000', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL DEFAULT '' COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型',
  `notice_content` longtext COMMENT '公告内容',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NOT NULL DEFAULT '0' COMMENT '业务类型',
  `request_method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方式',
  `oper_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求URL',
  `oper_location` varchar(255) NOT NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) NOT NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) NOT NULL DEFAULT '' COMMENT '返回参数',
  `error_msg` varchar(2000) NOT NULL DEFAULT '' COMMENT '错误消息',
  `oper_id` int NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `method` varchar(100) NOT NULL DEFAULT '' COMMENT '方法名称',
  `oper_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '主机地址',
  `oper_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '操作时间',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '登录状态',
  `cost_time` int NOT NULL DEFAULT '0' COMMENT '消耗时间',
  `operator_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作类别',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `data_scope` char(1) NOT NULL DEFAULT '1' COMMENT '数据范围',
  `menu_check_strictly` tinyint NOT NULL DEFAULT '0' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint NOT NULL DEFAULT '0' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-02-08 14:52:59.000000', 'admin', '2026-02-08 14:52:59.000000', '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2026-02-08 11:57:09.000000', 'admin', '2026-02-08 11:57:09.000000', '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '内容审核员', 'content_auditor', 3, '1', 0, 0, '0', '0', 'admin', '2026-02-08 14:53:28.000000', 'admin', '2026-02-08 14:53:28.000000', '负责审核文章内容');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色ID',
  `dept_id` int NOT NULL DEFAULT '0' COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int NOT NULL DEFAULT '0' COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 117);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2204);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2205);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2206);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2207);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2208);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2209);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2210);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2211);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 3);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 117);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1019);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1020);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1021);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1022);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1023);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1024);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1025);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1026);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1027);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1028);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1029);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1030);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1031);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1032);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1033);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1034);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1035);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1036);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1037);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1038);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1039);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1040);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1041);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1042);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1043);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1044);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1045);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1046);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1047);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1048);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1049);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1050);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1051);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1052);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1053);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1054);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1055);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1056);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1057);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 1058);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 2116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2007);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2008);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2009);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2105);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2106);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2107);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2108);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2109);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2110);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2111);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2112);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2113);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2114);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2115);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2116);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2204);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2205);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2206);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2207);
COMMIT;

-- ----------------------------
-- Table structure for sys_upload
-- ----------------------------
DROP TABLE IF EXISTS `sys_upload`;
CREATE TABLE `sys_upload` (
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `upload_id` varchar(255) NOT NULL COMMENT '任务Id',
  `size` int NOT NULL COMMENT '文件大小',
  `file_name` varchar(255) NOT NULL COMMENT '文件路径',
  `new_file_name` varchar(255) NOT NULL COMMENT '文件名',
  `url` varchar(255) NOT NULL COMMENT '文件地址',
  `ext` varchar(255) DEFAULT NULL COMMENT '拓展名',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传记录';

-- ----------------------------
-- Records of sys_upload
-- ----------------------------
BEGIN;
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:12:23.671607', '', '2026-02-08 15:12:23.671607', NULL, '079ad3ba88b5467d8b380fae72769684', 182353, '/public/PixPin_2026-02-08_15-12-22.png_1770534743669.png', 'PixPin_2026-02-08_15-12-22.png_1770534743669.png', 'http:/localhost:8080/public/PixPin_2026-02-08_15-12-22.png_1770534743669.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:39:00.516847', '', '2026-02-08 15:39:00.516847', NULL, '0e547cdc5ce44f2fa7eb015ee93d386e', 236007, '/public/35_20240326192614A018.png_1770536340470.png', '35_20240326192614A018.png_1770536340470.png', 'http:/localhost:8080/public/35_20240326192614A018.png_1770536340470.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:42:09.043735', '', '2026-02-08 14:42:09.043735', NULL, '23a0d6bea80b4d68bc4f92fbeb36649d', 12064, '/public/20231017112056A013_20240103101656A013_20240103145652A042.png_1770532929027.png', '20231017112056A013_20240103101656A013_20240103145652A042.png_1770532929027.png', 'http:/localhost:8080/public/20231017112056A013_20240103101656A013_20240103145652A042.png_1770532929027.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:18:16.924181', '', '2026-02-08 15:18:16.924181', NULL, '2a0df8fada3943d99256543e345de1ed', 88930, '/public/640_20250407163757A193.jpg_1770535096918.jpeg', '640_20250407163757A193.jpg_1770535096918.jpeg', 'http:/localhost:8080/public/640_20250407163757A193.jpg_1770535096918.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:36:51.127895', '', '2026-02-08 14:36:51.127895', NULL, '2e213e963f0a4f97aa4c85e24bc36334', 137025, '/public/PixPin_2026-02-08_14-36-50.png_1770532611124.png', 'PixPin_2026-02-08_14-36-50.png_1770532611124.png', 'http:/localhost:8080/public/PixPin_2026-02-08_14-36-50.png_1770532611124.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:25:07.665370', '', '2026-02-08 15:25:07.665370', NULL, '31b297a134644d029c2131e8dc9b15d7', 230212, '/public/要闻_20251129210255A439.png_1770535507661.png', '要闻_20251129210255A439.png_1770535507661.png', 'http:/localhost:8080/public/要闻_20251129210255A439.png_1770535507661.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:08:55.899006', '', '2026-02-08 15:08:55.899006', NULL, '35d1dbd8d171465fabb5c16a616d8b05', 280836, '/public/1012海报_20240326194759A029.png_1770534535894.png', '1012海报_20240326194759A029.png_1770534535894.png', 'http:/localhost:8080/public/1012海报_20240326194759A029.png_1770534535894.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:09:50.624283', '', '2026-02-08 13:09:50.624283', NULL, '38e7184acef64edcbdfcdcd51e9b23cc', 74796, '/public/660_20250407164737A195.jpg_1770527390616.jpeg', '660_20250407164737A195.jpg_1770527390616.jpeg', 'http:/localhost:8080/public/660_20250407164737A195.jpg_1770527390616.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:40:16.788170', '', '2026-02-08 15:40:16.788170', NULL, '433ba1499d9a463cbba34b45aa0eb14c', 149667, '/public/微信截图_20250127152704_20250127152712A189.png_1770536416785.png', '微信截图_20250127152704_20250127152712A189.png_1770536416785.png', 'http:/localhost:8080/public/微信截图_20250127152704_20250127152712A189.png_1770536416785.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:21:47.777162', '', '2026-02-08 13:21:47.777162', NULL, '4d0d5014fd554c40860fb218a00934a9', 96217, '/public/1225-_20240105162138A010.jpg_1770528107773.jpeg', '1225-_20240105162138A010.jpg_1770528107773.jpeg', 'http:/localhost:8080/public/1225-_20240105162138A010.jpg_1770528107773.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 12:46:02.721339', '', '2026-02-08 12:46:02.721339', NULL, '5322bfcb7c2a467ebf6a7090df38f7b9', 122154, '/public/1225_20240105161435A007.jpg_1770525962704.jpeg', '1225_20240105161435A007.jpg_1770525962704.jpeg', 'http:/localhost:8080/public/1225_20240105161435A007.jpg_1770525962704.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:22:23.275374', '', '2026-02-08 15:22:23.275374', NULL, '54751b4f92be44b7bca4101dcb2fad77', 122154, '/public/1225_20240105161435A007.jpg_1770535343269.jpeg', '1225_20240105161435A007.jpg_1770535343269.jpeg', 'http:/localhost:8080/public/1225_20240105161435A007.jpg_1770535343269.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:39:21.978144', '', '2026-02-08 15:39:21.978144', NULL, '547abe90c7144d99882b5ac121df3fcf', 466597, '/public/微信截图_20250127152457_20250127152507A188.png_1770536361972.png', '微信截图_20250127152457_20250127152507A188.png_1770536361972.png', 'http:/localhost:8080/public/微信截图_20250127152457_20250127152507A188.png_1770536361972.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:38:34.978399', '', '2026-02-08 14:38:34.978399', NULL, '56e59a34830e46239dcdf994cff8c0ce', 74796, '/public/660_20250407164737A195.jpg_1770532714969.jpeg', '660_20250407164737A195.jpg_1770532714969.jpeg', 'http:/localhost:8080/public/660_20250407164737A195.jpg_1770532714969.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:36:43.145221', '', '2026-02-08 14:36:43.145221', NULL, '6d87c6e447694a4f8d2c07db174297bd', 74796, '/public/660_20250407164737A195.jpg_1770532603140.jpeg', '660_20250407164737A195.jpg_1770532603140.jpeg', 'http:/localhost:8080/public/660_20250407164737A195.jpg_1770532603140.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:23:21.139035', '', '2026-02-08 13:23:21.139035', NULL, '7be2167aa3514a8aa474906fada30e0b', 91155, '/public/640 (1)_20240326195455A031.jpg_1770528201136.jpeg', '640 (1)_20240326195455A031.jpg_1770528201136.jpeg', 'http:/localhost:8080/public/640 (1)_20240326195455A031.jpg_1770528201136.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:10:31.330055', '', '2026-02-08 13:10:31.330055', NULL, '7c60e80900314a3eb77e2f16198dd57e', 96004, '/public/650_20250407164124A194.jpg_1770527431327.jpeg', '650_20250407164124A194.jpg_1770527431327.jpeg', 'http:/localhost:8080/public/650_20250407164124A194.jpg_1770527431327.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:42:28.888670', '', '2026-02-08 14:42:28.888670', NULL, '7f1dbe9d7dc64780b9a16a7aae14c110', 133861, '/public/微信截图_20250527094917_20250527094929A372.png_1770532948886.png', '微信截图_20250527094917_20250527094929A372.png_1770532948886.png', 'http:/localhost:8080/public/微信截图_20250527094917_20250527094929A372.png_1770532948886.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:10:47.053080', '', '2026-02-08 13:10:47.053080', NULL, '895cfba120c2461bb720ef55ae05fd34', 91155, '/public/640 (1)_20240326195455A031.jpg_1770527447048.jpeg', '640 (1)_20240326195455A031.jpg_1770527447048.jpeg', 'http:/localhost:8080/public/640 (1)_20240326195455A031.jpg_1770527447048.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:10:09.227393', '', '2026-02-08 15:10:09.227393', NULL, '8b571c90142942e4bf320c8188634f8e', 138006, '/public/640_20240326195300A030.jpg_1770534609221.jpeg', '640_20240326195300A030.jpg_1770534609221.jpeg', 'http:/localhost:8080/public/640_20240326195300A030.jpg_1770534609221.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:56:52.407773', '', '2026-02-08 15:56:52.407773', NULL, '8eae6fe45e1f4b888f66059fb01690ee', 96217, '/public/1225-_20240105162138A010.jpg_1770537412404.jpeg', '1225-_20240105162138A010.jpg_1770537412404.jpeg', 'http:/localhost:8080/public/1225-_20240105162138A010.jpg_1770537412404.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:12:13.914092', '', '2026-02-08 15:12:13.914092', NULL, '8eb6ebe81dc0498d87f04524a1966be6', 280836, '/public/1012海报_20240326194759A029.png_1770534733907.png', '1012海报_20240326194759A029.png_1770534733907.png', 'http:/localhost:8080/public/1012海报_20240326194759A029.png_1770534733907.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:40:06.960111', '', '2026-02-08 15:40:06.960111', NULL, 'bdb872bfc0bb4384be6cddc78eeae7b6', 150179, '/public/微信截图_20250128134002_20250128134020A192.png_1770536406956.png', '微信截图_20250128134002_20250128134020A192.png_1770536406956.png', 'http:/localhost:8080/public/微信截图_20250128134002_20250128134020A192.png_1770536406956.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 12:43:57.914473', '', '2026-02-08 12:43:57.914473', NULL, 'be01dfe93897468eaf034d2174c61046', 122154, '/public/1225_20240105161435A007.jpg_1770525837910.jpeg', '1225_20240105161435A007.jpg_1770525837910.jpeg', 'http:/localhost:8080/public/1225_20240105161435A007.jpg_1770525837910.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 12:43:51.697973', '', '2026-02-08 12:43:51.697973', NULL, 'c6450169d65246458483a623bb295cf8', 268393, '/public/640_20250127152953A190.jpg_1770525831667.jpeg', '640_20250127152953A190.jpg_1770525831667.jpeg', 'http:/localhost:8080/public/640_20250127152953A190.jpg_1770525831667.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:39:50.462153', '', '2026-02-08 15:39:50.462153', NULL, 'cb6eb6cb1cc54aa380290f4e45bc3ac0', 223221, '/public/微信图片_20240105160055_20240105160104A005.png_1770536390459.png', '微信图片_20240105160055_20240105160104A005.png_1770536390459.png', 'http:/localhost:8080/public/微信图片_20240105160055_20240105160104A005.png_1770536390459.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:57:15.164644', '', '2026-02-08 15:57:15.164644', NULL, 'd65006ea87324b8d8f1b0c836a65c361', 149667, '/public/微信截图_20250127152704_20250127152712A189.png_1770537435161.png', '微信截图_20250127152704_20250127152712A189.png_1770537435161.png', 'http:/localhost:8080/public/微信截图_20250127152704_20250127152712A189.png_1770537435161.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:06:28.362807', '', '2026-02-08 15:06:28.362807', NULL, 'decc75a91c5348c5963b937fc2adc72c', 280836, '/public/1012海报_20240326194759A029.png_1770534388356.png', '1012海报_20240326194759A029.png_1770534388356.png', 'http:/localhost:8080/public/1012海报_20240326194759A029.png_1770534388356.png', '.png');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 13:11:13.071911', '', '2026-02-08 13:11:13.071911', NULL, 'ea5d13917184494abc4feea81de091b3', 96217, '/public/1225-_20240105162138A010.jpg_1770527473068.jpeg', '1225-_20240105162138A010.jpg_1770527473068.jpeg', 'http:/localhost:8080/public/1225-_20240105162138A010.jpg_1770527473068.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 15:14:35.342870', '', '2026-02-08 15:14:35.342870', NULL, 'ebb961406e7047daac36118e6269b653', 268393, '/public/640_20250127152953A190.jpg_1770534875336.jpeg', '640_20250127152953A190.jpg_1770534875336.jpeg', 'http:/localhost:8080/public/640_20250127152953A190.jpg_1770534875336.jpeg', '.jpeg');
INSERT INTO `sys_upload` (`status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `upload_id`, `size`, `file_name`, `new_file_name`, `url`, `ext`) VALUES ('0', '0', '', '2026-02-08 14:37:05.276166', '', '2026-02-08 14:37:05.276166', NULL, 'ee62410376694520b0693a11efa78582', 74796, '/public/660_20250407164737A195.jpg_1770532625272.jpeg', '660_20250407164737A195.jpg_1770532625272.jpeg', 'http:/localhost:8080/public/660_20250407164737A195.jpg_1770532625272.jpeg', '.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) NOT NULL DEFAULT '00' COMMENT '用户类型',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `phonenumber` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `login_ip` varchar(128) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  `login_date` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `password`, `status`, `del_flag`, `login_ip`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `avatar`, `login_date`) VALUES (1, 103, 'admin', 'cms-admin', '00', 'ry@163.com', '15888888888', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '::1', 'admin', '2025-02-28 16:52:10.000000', '', '2026-02-08 16:30:37.000000', '管理员', '', '2026-02-08 16:30:38');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `password`, `status`, `del_flag`, `login_ip`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `avatar`, `login_date`) VALUES (2, 105, 'ry', 'cms-admin', '00', 'ry@qq.com', '15666666666', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '127.0.0.1', 'admin', '2025-02-28 16:52:10.000000', '', NULL, '测试员', '', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `password`, `status`, `del_flag`, `login_ip`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `avatar`, `login_date`) VALUES (100, 100, 'cms_admin', '内容审核员', '10', '', '', '0', '$2b$10$vAY7HE78VKyY7WnQ9m/X5.oOPRb6lCE.xOyFPJwXIcySmspdUg7Zu', '0', '0', '::1', 'admin', '2026-02-08 16:14:50.431172', 'admin', '2026-02-08 16:38:30.000000', NULL, '', '2026-02-08 16:38:31');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 2);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (100, 100);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
