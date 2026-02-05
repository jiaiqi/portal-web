-- 文艺志愿者官网CMS模块数据库初始化脚本
-- 创建日期: 2026-02-04

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 1. 文章分类表
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_code` varchar(50) NOT NULL COMMENT '分类编码',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_category_code` (`category_code`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章分类表';

-- ----------------------------
-- 2. 文章表
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `category_id` int NOT NULL COMMENT '分类ID',
  `summary` varchar(500) DEFAULT NULL COMMENT '文章摘要',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '封面图',
  `content` longtext COMMENT '文章内容',
  `source` varchar(100) DEFAULT NULL COMMENT '文章来源',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0草稿 1已发布',
  `is_top` char(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  `open_type` varchar(10) NOT NULL DEFAULT 'current' COMMENT '打开方式：current当前页 new新标签页',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '浏览量',
  `seo_title` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(500) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_description` varchar(500) DEFAULT NULL COMMENT 'SEO描述',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`article_id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_status` (`status`),
  KEY `idx_publish_time` (`publish_time`),
  KEY `idx_is_top` (`is_top`),
  FULLTEXT KEY `ft_title_content` (`title`, `content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';

-- ----------------------------
-- 3. 专题表
-- ----------------------------
DROP TABLE IF EXISTS `cms_special`;
CREATE TABLE `cms_special` (
  `special_id` int NOT NULL AUTO_INCREMENT COMMENT '专题ID',
  `title` varchar(200) NOT NULL COMMENT '专题标题',
  `cover_image` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` varchar(500) DEFAULT NULL COMMENT '专题描述',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`special_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专题表';

-- ----------------------------
-- 4. 专题文章关联表
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_article`;
CREATE TABLE `cms_special_article` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `special_id` int NOT NULL COMMENT '专题ID',
  `article_id` int NOT NULL COMMENT '文章ID',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_special_article` (`special_id`, `article_id`),
  KEY `idx_special_id` (`special_id`),
  KEY `idx_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专题文章关联表';

-- ----------------------------
-- 5. 轮播图表
-- ----------------------------
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `link_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`banner_id`),
  KEY `idx_status` (`status`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='轮播图表';

-- ----------------------------
-- 6. 友情链接表
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `link_id` int NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `link_name` varchar(100) NOT NULL COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `link_logo` varchar(255) DEFAULT NULL COMMENT '链接Logo',
  `link_type` char(1) NOT NULL DEFAULT '0' COMMENT '链接类型：0普通链接 1全国分会',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`link_id`),
  KEY `idx_link_type` (`link_type`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接表';

-- ----------------------------
-- 7. 快捷链接表
-- ----------------------------
DROP TABLE IF EXISTS `cms_quick_link`;
CREATE TABLE `cms_quick_link` (
  `link_id` int NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `link_name` varchar(100) NOT NULL COMMENT '链接名称',
  `link_url` varchar(255) NOT NULL COMMENT '链接地址',
  `link_position` varchar(50) NOT NULL COMMENT '链接位置：top顶部 sidebar侧边栏',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`link_id`),
  KEY `idx_position` (`link_position`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='快捷链接表';

-- ----------------------------
-- 8. 单页内容表
-- ----------------------------
DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE `cms_page` (
  `page_id` int NOT NULL AUTO_INCREMENT COMMENT '页面ID',
  `page_key` varchar(50) NOT NULL COMMENT '页面标识',
  `page_name` varchar(100) NOT NULL COMMENT '页面名称',
  `content` longtext COMMENT '内容',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `uk_page_key` (`page_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='单页内容表';

-- ----------------------------
-- 9. 访问日志表
-- ----------------------------
DROP TABLE IF EXISTS `cms_visit_log`;
CREATE TABLE `cms_visit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `page_url` varchar(255) NOT NULL COMMENT '访问页面',
  `page_type` varchar(50) NOT NULL COMMENT '页面类型：home首页 article文章 special专题',
  `ref_type_id` int DEFAULT NULL COMMENT '关联ID',
  `ip_address` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '浏览器信息',
  `visit_time` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '访问时间',
  PRIMARY KEY (`log_id`),
  KEY `idx_visit_time` (`visit_time`),
  KEY `idx_page_type` (`page_type`),
  KEY `idx_ref_type_id` (`ref_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='访问日志表';

-- ----------------------------
-- 10. 统计汇总表
-- ----------------------------
DROP TABLE IF EXISTS `cms_statistics`;
CREATE TABLE `cms_statistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `total_pv` int NOT NULL DEFAULT '0' COMMENT '总PV',
  `total_uv` int NOT NULL DEFAULT '0' COMMENT '总UV',
  `article_pv` int NOT NULL DEFAULT '0' COMMENT '文章页PV',
  `article_uv` int NOT NULL DEFAULT '0' COMMENT '文章页UV',
  `home_pv` int NOT NULL DEFAULT '0' COMMENT '首页PV',
  `home_uv` int NOT NULL DEFAULT '0' COMMENT '首页UV',
  `special_pv` int NOT NULL DEFAULT '0' COMMENT '专题页PV',
  `special_uv` int NOT NULL DEFAULT '0' COMMENT '专题页UV',
  `other_pv` int NOT NULL DEFAULT '0' COMMENT '其他页PV',
  `other_uv` int NOT NULL DEFAULT '0' COMMENT '其他页UV',
  PRIMARY KEY (`stat_id`),
  UNIQUE KEY `uk_stat_date` (`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='统计汇总表';

-- ----------------------------
-- 初始化分类数据
-- ----------------------------
INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `create_by`) VALUES
('要闻动态', 'news', 0, 1, '1', 'admin'),
('党建工作', 'party', 0, 2, '1', 'admin'),
('品牌活动', 'activity', 0, 3, '1', 'admin'),
('表彰激励', 'honor', 0, 4, '1', 'admin'),
('公告公示', 'notice', 0, 5, '1', 'admin'),
('专题文章', 'special_article', 0, 6, '1', 'admin');

-- ----------------------------
-- 初始化单页数据
-- ----------------------------
INSERT INTO `cms_page` (`page_key`, `page_name`, `content`, `create_by`) VALUES
('association_overview', '协会概况', '', 'admin'),
('organization', '组织架构', '', 'admin'),
('leadership', '领导介绍', '', 'admin'),
('constitution', '协会章程', '', 'admin'),
('contact', '联系方式', '', 'admin');

-- ----------------------------
-- 初始化快捷链接数据
-- ----------------------------
INSERT INTO `cms_quick_link` (`link_name`, `link_url`, `link_position`, `sort_order`, `status`, `create_by`) VALUES
('中国文艺网', 'http://www.cflac.org.cn/', 'top', 1, '1', 'admin'),
('中国文联', 'http://www.cflac.org.cn/', 'top', 2, '1', 'admin'),
('中国文艺志愿服务智慧平台', 'https://zyfw.wenlian.com/', 'sidebar', 1, '1', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
