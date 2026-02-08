-- 文艺志愿者官网CMS模块数据库初始化脚本
-- 创建日期: 2026-02-04

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE nest_admin;

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
  `cover_image_source_type` varchar(20) NOT NULL DEFAULT 'upload' COMMENT '封面图片来源类型：upload上传 link链接',
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
-- 4. 焦点图表（合并焦点图和轮播图）
-- ----------------------------
DROP TABLE IF EXISTS `cms_focus`;
CREATE TABLE `cms_focus` (
  `focus_id` int NOT NULL AUTO_INCREMENT COMMENT '焦点图ID',
  `focus_key` varchar(50) NOT NULL COMMENT '焦点图标识',
  `focus_name` varchar(100) NOT NULL COMMENT '焦点图名称',
  `image_url` varchar(500) NOT NULL COMMENT '图片URL',
  `image_source_type` varchar(20) NOT NULL DEFAULT 'upload' COMMENT '图片来源类型：upload上传 link链接',
  `link_type` varchar(20) NOT NULL DEFAULT 'external' COMMENT '链接类型：internal内部文章 external外部地址',
  `link_value` varchar(500) DEFAULT NULL COMMENT '链接值（文章ID或外部URL）',
  `open_type` varchar(20) NOT NULL DEFAULT 'new' COMMENT '打开方式：current当前页 new新标签页',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `is_fixed` char(1) NOT NULL DEFAULT '1' COMMENT '是否固定：0否 1是（固定数据不可删除）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`focus_id`),
  UNIQUE KEY `uk_focus_key` (`focus_key`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='焦点图表';

-- ----------------------------
-- 5. 公告表
-- ----------------------------
DROP TABLE IF EXISTS `cms_notice`;
CREATE TABLE `cms_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` text DEFAULT NULL COMMENT '公告内容',
  `notice_type` varchar(20) NOT NULL DEFAULT 'notice' COMMENT '公告类型：notice公告 announcement公示',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常 1关闭',
  `is_top` char(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`notice_id`),
  KEY `idx_notice_type` (`notice_type`),
  KEY `idx_status` (`status`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公告表';

-- ----------------------------
-- 6. 焦点图历史记录表
-- ----------------------------
DROP TABLE IF EXISTS `cms_focus_history`;
CREATE TABLE `cms_focus_history` (
  `history_id` int NOT NULL AUTO_INCREMENT COMMENT '历史记录ID',
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
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`history_id`),
  KEY `idx_focus_id` (`focus_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='焦点图历史记录表';

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
-- 9. 协会概况栏目表
-- ----------------------------
DROP TABLE IF EXISTS `cms_about_section`;
CREATE TABLE `cms_about_section` (
  `section_id` int NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `section_key` varchar(50) NOT NULL COMMENT '栏目标识：overview概况 charter章程 leadership领导 council理事会 regulations条例',
  `section_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `section_type` varchar(20) NOT NULL DEFAULT 'richText' COMMENT '栏目类型：richText富文本 list列表',
  `content` longtext COMMENT '富文本内容（type=richText时使用）',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `uk_section_key` (`section_key`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='协会概况栏目表';

-- ----------------------------
-- 10. 协会文章表（理事会等列表类型栏目使用）
-- ----------------------------
DROP TABLE IF EXISTS `cms_about_article`;
CREATE TABLE `cms_about_article` (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `section_key` varchar(50) NOT NULL COMMENT '栏目标识',
  `title` varchar(200) NOT NULL COMMENT '文章标题',
  `content` longtext COMMENT '文章内容',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`article_id`),
  KEY `idx_section_key` (`section_key`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='协会文章表';

-- ----------------------------
-- 11. 访问日志表
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
-- 11. 网站配置表
-- ----------------------------
DROP TABLE IF EXISTS `cms_site_config`;
CREATE TABLE `cms_site_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `config_key` varchar(100) NOT NULL COMMENT '配置键',
  `config_value` text DEFAULT NULL COMMENT '配置值',
  `config_name` varchar(200) NOT NULL COMMENT '配置名称',
  `config_type` varchar(20) DEFAULT 'text' COMMENT '配置类型：text文本 textarea多行文本 rich富文本 image图片',
  `sort_order` int DEFAULT 0 COMMENT '排序',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `uk_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网站配置表';

-- ----------------------------
-- 初始化分类数据
-- ----------------------------
-- 一级分类
INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `create_by`) VALUES
('要闻动态', 'news', 0, 1, '1', 'admin'),
('党建工作', 'party', 0, 2, '1', 'admin'),
('品牌活动', 'activity', 0, 3, '1', 'admin'),
('表彰激励', 'honor', 0, 4, '1', 'admin'),
('公告公示', 'notice', 0, 5, '1', 'admin'),
('专题', 'special', 0, 6, '1', 'admin'),
('全国联动', 'cooperation', 0, 7, '1', 'admin');

-- 专题的二级分类
INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `create_by`) VALUES
('学习贯彻党的二十届三中全会精神', 'special_1', 6, 1, '1', 'admin'),
('与人民同行', 'special_2', 6, 2, '1', 'admin'),
('时代风尚', 'special_3', 6, 3, '1', 'admin'),
('百花迎春', 'special_4', 6, 4, '1', 'admin');

-- ----------------------------
-- 初始化网站配置数据
-- ----------------------------
INSERT INTO `cms_site_config` (`config_key`, `config_value`, `config_name`, `config_type`, `sort_order`, `create_by`) VALUES
('site_icp', '京ICP备14001194号-1', 'ICP备案号', 'text', 1, 'admin'),
('site_police', '京公网安备11010502025171', '公安备案号', 'text', 2, 'admin'),
('site_copyright', '中国文艺志愿者协会 版权所有', '版权信息', 'text', 3, 'admin'),
('site_contact', '联系咨询', '联系咨询', 'text', 4, 'admin'),
('site_complaint', '投诉建议', '投诉建议', 'text', 5, 'admin'),
('site_forum', '文艺论坛', '文艺论坛', 'text', 6, 'admin'),
('site_department', '职能部门', '职能部门', 'text', 7, 'admin'),
('site_member', '团体会员', '团体会员', 'text', 8, 'admin'),
('site_organization', '组织机构', '组织机构', 'text', 9, 'admin'),
('site_qrcode', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20231017112056A013_20240103101656A013_20240103145652A042.png', '公众号二维码', 'image', 10, 'admin');

-- ----------------------------
-- 初始化焦点图数据（固定7条，不可删除）
-- ----------------------------
INSERT INTO `cms_focus` (`focus_key`, `focus_name`, `image_url`, `image_source_type`, `link_type`, `link_value`, `open_type`, `sort_order`, `is_fixed`, `create_by`) VALUES
('focus_big', '焦点大图', '/origin-html/中国文艺志愿者-首页_files/640_20250407163757A193.jpg', 'upload', 'external', '#', 'new', 1, '1', 'admin'),
('focus_small_1', '焦点小图1', '/origin-html/中国文艺志愿者-首页_files/660_20250407164737A195.jpg', 'upload', 'external', '#', 'new', 2, '1', 'admin'),
('focus_small_2', '焦点小图2', '/origin-html/中国文艺志愿者-首页_files/650_20250407164124A194.jpg', 'upload', 'external', '#', 'new', 3, '1', 'admin'),
('focus_small_3', '焦点小图3', '/origin-html/中国文艺志愿者-首页_files/640_20250127152953A190.jpg', 'upload', 'external', '#', 'new', 4, '1', 'admin'),
('focus_banner', '焦点下Banner图', '/origin-html/中国文艺志愿者-首页_files/微信截图_20250527095422_20250527095430A374.png', 'upload', 'external', '#', 'new', 5, '1', 'admin'),
('notice_banner', '公告上方焦点图', '/origin-html/中国文艺志愿者-首页_files/1012海报_20240326194759A029.png', 'upload', 'external', '#', 'new', 6, '1', 'admin'),
('overview_banner', '协会概况下方焦点图', '/origin-html/中国文艺志愿者-首页_files/微信截图_20250128134002_20250128134020A192.png', 'upload', 'external', '#', 'new', 7, '1', 'admin');

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
-- 初始化协会概况栏目数据
-- ----------------------------
INSERT INTO `cms_about_section` (`section_key`, `section_name`, `section_type`, `content`, `sort_order`, `status`, `create_by`) VALUES
('overview', '协会概况', 'richText', '<p>中国文艺志愿者协会（China Literary and Art Volunteers'' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。</p>
<p>中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p>
<p>协会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平文化思想，培育和践行社会主义核心价值观，广泛动员文艺工作者、文艺爱好者投身志愿服务，弘扬奉献、友爱、互助、进步的志愿精神，丰富人民群众精神文化生活，推动文艺事业和志愿服务事业健康发展。</p>', 1, '1', 'admin'),
('charter', '协会章程', 'richText', '<p><strong>第一章 总则</strong></p>
<p>第一条 中国文艺志愿者协会（简称"中国文艺志愿者协会"，英文名称：China Literary and Art Volunteers'' Association，缩写：CLAVA）是由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p>
<p>第二条 本会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平文化思想，培育和践行社会主义核心价值观，广泛动员文艺工作者、文艺爱好者投身志愿服务，弘扬奉献、友爱、互助、进步的志愿精神，丰富人民群众精神文化生活，推动文艺事业和志愿服务事业健康发展。</p>', 2, '1', 'admin'),
('leadership', '协会领导', 'richText', '<p><strong>主席</strong></p>
<p>殷秀梅</p>
<p><strong>副主席</strong></p>
<p>（按姓氏笔画排序）</p>
<p>王  宏  冯双白  刘  劲  李  丹  何加林  张  凯  林  永  赵  保  姜  昆  姚建萍  黄渤  龚  宇  康  辉  寒  露</p>
<p><strong>秘书长</strong></p>
<p>李  丹（兼）</p>', 3, '1', 'admin'),
('council', '理事会', 'list', NULL, 4, '1', 'admin'),
('regulations', '会员工作条例', 'richText', '<p><strong>第一章 总则</strong></p>
<p>第一条 为加强中国文艺志愿者协会会员队伍建设，规范会员管理工作，根据《中国文艺志愿者协会章程》，制定本条例。</p>
<p>第二条 本会会员分为单位会员和个人会员。</p>
<p>第三条 会员入会自愿，退会自由。</p>
<p><strong>第二章 会员条件</strong></p>
<p>第四条 申请加入本会的会员，必须具备下列条件：</p>
<p>（一）拥护本会章程；</p>
<p>（二）有加入本会的意愿；</p>
<p>（三）在本会的业务领域内具有一定的影响；</p>
<p>（四）热心文艺志愿服务事业。</p>', 5, '1', 'admin');

-- ----------------------------
-- 初始化协会文章数据（理事会）
-- ----------------------------
INSERT INTO `cms_about_article` (`section_key`, `title`, `content`, `sort_order`, `status`, `create_by`) VALUES
('council', '中国文艺志愿者协会第二届理事会第一次会议在京召开', '<p>中国文艺志愿者协会第二届理事会第一次会议在北京召开，会议审议通过了第一届理事会工作报告，选举产生了新一届领导机构。</p><p>会议号召广大文艺志愿者深入学习贯彻习近平新时代中国特色社会主义思想，坚持以人民为中心的工作导向，积极投身文艺志愿服务事业。</p>', 1, '1', 'admin'),
('council', '中国文艺志愿者协会理事会审议通过2024年度工作计划', '<p>理事会审议通过了2024年度工作计划，明确了全年工作重点和目标任务。</p><p>会议强调，要紧紧围绕学习宣传贯彻党的二十大精神这条主线，组织开展形式多样的文艺志愿服务活动，为推动文艺事业高质量发展贡献力量。</p>', 2, '1', 'admin'),
('council', '理事会关于增补理事的决定', '<p>根据工作需要，经理事会审议通过，决定增补以下同志为理事会理事。</p><p>增补理事名单：（按姓氏笔画排序）</p><p>王某、李某、张某、刘某、陈某</p>', 3, '1', 'admin');

-- ----------------------------
-- 初始化快捷链接数据
-- ----------------------------
INSERT INTO `cms_quick_link` (`link_name`, `link_url`, `link_position`, `sort_order`, `status`, `create_by`) VALUES
('中国文艺网', 'http://www.cflac.org.cn/', 'top', 1, '1', 'admin'),
('中国文联', 'http://www.cflac.org.cn/', 'top', 2, '1', 'admin'),
('中国文艺志愿服务智慧平台', 'https://zyfw.wenlian.com/', 'sidebar', 1, '1', 'admin');

-- ----------------------------
-- 初始化友情链接数据
-- ----------------------------
INSERT INTO `cms_link` (`link_name`, `link_url`, `link_logo`, `link_type`, `sort_order`, `status`, `create_by`) VALUES
('中国文联', 'https://www.cflac.org.cn/', NULL, '0', 1, '1', 'admin'),
('中国作协', 'https://www.chinawriter.com.cn/', NULL, '0', 2, '1', 'admin'),
('中国剧协', 'https://www.chinatheatre.org.cn/', NULL, '0', 3, '1', 'admin'),
('中国影协', 'http://www.cfa1949.com/', NULL, '0', 4, '1', 'admin'),
('中国音协', 'https://www.chnmusic.org/', NULL, '0', 5, '1', 'admin'),
('中国美协', 'https://www.caanet.org.cn/', NULL, '0', 6, '1', 'admin'),
('中国曲协', 'http://www.zhongguoquyi.cn/', NULL, '0', 7, '1', 'admin'),
('中国舞协', 'https://www.cdanet.org/', NULL, '0', 8, '1', 'admin'),
('中国民协', 'http://www.cflas.com.cn/', NULL, '0', 9, '1', 'admin'),
('中国摄协', 'https://www.cpanet.org.cn/', NULL, '0', 10, '1', 'admin'),
('中国书协', 'http://www.cca1981.org.cn/', NULL, '0', 11, '1', 'admin'),
('中国杂协', 'http://www.zgmx.org/', NULL, '0', 12, '1', 'admin'),
('中国视协', 'http://www.ctaa.org.cn/', NULL, '0', 13, '1', 'admin'),
('中国评协', 'http://www.zgpjxh.org/', NULL, '0', 14, '1', 'admin');

-- ----------------------------
-- 初始化公告数据
-- ----------------------------
INSERT INTO `cms_notice` (`title`, `content`, `notice_type`, `status`, `is_top`, `sort_order`, `create_by`) VALUES
('关于2024年度中国文艺志愿者协会会员发展公告', '根据《中国文艺志愿者协会章程》规定，现开展2024年度会员发展工作。请符合条件的申请人按要求提交申请材料。', 'notice', '0', '1', 1, 'admin'),
('中国文艺志愿者协会2023年度财务公开报告', '根据相关规定，现将中国文艺志愿者协会2023年度财务收支情况进行公开，接受社会监督。', 'announcement', '0', '0', 2, 'admin'),
('关于规范文艺志愿服务行为的通知', '为进一步规范文艺志愿服务活动，提升服务质量，现就有关事项通知如下...', 'notice', '0', '0', 3, 'admin'),
('中国文艺志愿者协会办公地址变更公告', '因工作需要，中国文艺志愿者协会办公地址已变更，新地址为：北京市朝阳区...', 'announcement', '0', '0', 4, 'admin'),
('关于征集文艺志愿服务典型案例的通知', '为总结推广文艺志愿服务经验，现面向各单位征集文艺志愿服务典型案例。', 'notice', '0', '0', 5, 'admin');

-- ----------------------------
-- 初始化文章数据（要闻动态）
-- ----------------------------
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `source`, `author`, `publish_time`, `status`, `is_top`, `open_type`, `view_count`, `create_by`) VALUES
('中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神', 1, '中国文联、中国文艺志愿者协会召开专题会议，深入学习宣传贯彻党的二十届三中全会精神，研究部署贯彻落实举措。', '/origin-html/中国文艺志愿者-首页_files/640_20250408153932A231.jpg', '<p>7月22日，中国文联、中国文艺志愿者协会召开专题会议，深入学习宣传贯彻党的二十届三中全会精神。</p><p>会议指出，党的二十届三中全会是在以中国式现代化全面推进强国建设、民族复兴伟业的关键时期召开的一次十分重要的会议。全会通过的《决定》，是新时代新征程上推动全面深化改革向广度和深度进军的总动员、总部署。</p><p>会议强调，要把学习宣传贯彻全会精神作为当前和今后一个时期的重大政治任务，切实把思想和行动统一到党中央决策部署上来。</p>', '中国文艺网', '管理员', NOW(), '1', '1', 'new', 128, 'admin'),
('中国文艺志愿者协会工作年中推进会强调：在新征程上推动文艺志愿服务高质量发展', 1, '中国文艺志愿者协会工作年中推进会在京召开，总结上半年工作，部署下半年重点任务。', '/origin-html/中国文艺志愿者-首页_files/640_20250408154210A232.jpg', '<p>7月15日，中国文艺志愿者协会工作年中推进会在京召开。会议深入学习贯彻习近平新时代中国特色社会主义思想，总结上半年工作，部署下半年重点任务。</p><p>会议指出，上半年，协会紧紧围绕党和国家工作大局，组织开展了一系列主题鲜明、形式多样的文艺志愿服务活动，取得了显著成效。</p>', '中国文艺网', '管理员', DATE_SUB(NOW(), INTERVAL 7 DAY), '1', '0', 'new', 96, 'admin'),
('与人民同行——新时代文明实践文艺志愿服务走进四川广安', 1, '文艺志愿服务小分队走进四川广安，为当地群众送去精彩的文化盛宴。', '/origin-html/中国文艺志愿者-首页_files/640_20250408154313A233.jpg', '<p>7月10日，"与人民同行——新时代文明实践文艺志愿服务"活动走进四川广安。来自全国各地的文艺志愿者为当地群众带来了精彩的文艺演出。</p><p>活动现场，文艺志愿者们表演了歌曲、舞蹈、相声、魔术等节目，赢得了现场观众的阵阵掌声。</p>', '中国文艺网', '管理员', DATE_SUB(NOW(), INTERVAL 12 DAY), '1', '0', 'new', 85, 'admin'),
('纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开', 1, '纪念《讲话》发表82周年，重温《讲话》精神，推动新时代文艺事业繁荣发展。', '/origin-html/中国文艺志愿者-首页_files/640_20250408154449A234.jpg', '<p>5月23日，纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开。</p><p>与会代表重温了《讲话》精神，一致认为，《讲话》所阐明的文艺为人民服务的根本方向，至今仍然具有重要的现实指导意义。</p>', '中国文艺网', '管理员', DATE_SUB(NOW(), INTERVAL 30 DAY), '1', '0', 'new', 156, 'admin'),
('2024年全国文艺志愿服务工作会在云南昆明召开', 1, '全国文艺志愿服务工作会在昆明召开，交流经验，部署工作。', '/origin-html/中国文艺志愿者-首页_files/640_20250408154643A235.jpg', '<p>5月20日，2024年全国文艺志愿服务工作会在云南昆明召开。来自全国各地的文艺志愿服务工作者齐聚一堂，交流经验，部署工作。</p>', '中国文艺网', '管理员', DATE_SUB(NOW(), INTERVAL 35 DAY), '1', '0', 'new', 112, 'admin'),
('时代风尚——中国文艺志愿者致敬大国重器特别节目在中央广播电视总台播出', 1, '特别节目展现文艺志愿者走进大国重器，致敬建设者的感人故事。', '/origin-html/中国文艺志愿者-首页_files/640_20250408154756A236.jpg', '<p>5月18日，"时代风尚——中国文艺志愿者致敬大国重器"特别节目在中央广播电视总台播出。</p><p>节目记录了文艺志愿者走进C919大飞机、港珠澳大桥、中国天眼等大国重器，慰问建设者的感人故事。</p>', '中国文艺网', '管理员', DATE_SUB(NOW(), INTERVAL 40 DAY), '1', '0', 'new', 203, 'admin');

-- ----------------------------
-- 初始化文章数据（资讯）
-- ----------------------------
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `source`, `author`, `publish_time`, `status`, `is_top`, `open_type`, `view_count`, `create_by`) VALUES
('各地文艺志愿服务队积极开展"学雷锋"主题活动', 2, '各地文艺志愿服务队积极开展"学雷锋"主题活动', NULL, '<p>各地文艺志愿服务队积极开展"学雷锋"主题活动内容...</p>', '活动部', '管理员', DATE_SUB(NOW(), INTERVAL 3 DAY), '1', '1', 'new', 88, 'admin'),
('中国文艺志愿者协会新增会员单位名单公布', 2, '中国文艺志愿者协会新增会员单位名单公布', NULL, '<p>中国文艺志愿者协会新增会员单位名单公布内容...</p>', '协会办公室', '管理员', DATE_SUB(NOW(), INTERVAL 7 DAY), '1', '0', 'new', 76, 'admin'),
('关于开展2024年度文艺志愿服务项目申报工作的通知', 2, '关于开展2024年度文艺志愿服务项目申报工作的通知', NULL, '<p>关于开展2024年度文艺志愿服务项目申报工作的通知内容...</p>', '活动部', '管理员', DATE_SUB(NOW(), INTERVAL 10 DAY), '1', '0', 'new', 95, 'admin'),
('文艺志愿者走进社区开展送温暖活动', 2, '文艺志愿者走进社区开展送温暖活动', NULL, '<p>文艺志愿者走进社区开展送温暖活动内容...</p>', '活动部', '管理员', DATE_SUB(NOW(), INTERVAL 12 DAY), '1', '0', 'new', 67, 'admin');

-- ----------------------------
-- 初始化文章数据（党建工作）
-- ----------------------------
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `source`, `author`, `publish_time`, `status`, `is_top`, `open_type`, `view_count`, `create_by`) VALUES
('深入学习贯彻习近平新时代中国特色社会主义思想', 3, '协会党支部组织专题学习，深入学习贯彻习近平新时代中国特色社会主义思想。', NULL, '<p>协会党支部召开专题学习会，深入学习贯彻习近平新时代中国特色社会主义思想。</p><p>会议要求，全体党员要深刻领会这一思想的核心要义、精神实质、丰富内涵和实践要求，切实做到学思用贯通、知信行统一。</p>', '协会党支部', '管理员', DATE_SUB(NOW(), INTERVAL 5 DAY), '1', '1', 'new', 78, 'admin'),
('开展主题党日活动 重温入党誓词', 3, '协会党支部开展主题党日活动，组织党员重温入党誓词，坚定理想信念。', NULL, '<p>为深入开展党史学习教育，协会党支部组织全体党员开展主题党日活动。</p><p>活动中，全体党员面对党旗庄严宣誓，重温入党誓词，表达了为共产主义事业奋斗终身的决心。</p>', '协会党支部', '管理员', DATE_SUB(NOW(), INTERVAL 15 DAY), '1', '0', 'new', 65, 'admin');

-- ----------------------------
-- 初始化文章数据（品牌活动）
-- ----------------------------
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `source`, `author`, `publish_time`, `status`, `is_top`, `open_type`, `view_count`, `create_by`) VALUES
('"我们的中国梦"文化进万家活动走进基层', 4, '"我们的中国梦"文化进万家活动深入基层，为群众送去文化大餐。', NULL, '<p>春节期间，"我们的中国梦"文化进万家活动走进全国各地，为广大基层群众送去了丰富多彩的文化活动。</p><p>文艺志愿者们深入农村、社区、企业、军营，通过文艺演出、书画赠送、培训辅导等形式，将欢乐和文明送到千家万户。</p>', '活动部', '管理员', DATE_SUB(NOW(), INTERVAL 20 DAY), '1', '1', 'new', 145, 'admin'),
('"到人民中去"文艺志愿服务主题活动启动', 4, '"到人民中去"文艺志愿服务主题活动在全国启动，号召文艺工作者深入生活、扎根人民。', NULL, '<p>5月23日，"到人民中去"文艺志愿服务主题活动在全国启动。</p><p>活动号召广大文艺工作者坚持以人民为中心的创作导向，深入生活、扎根人民，创作出更多无愧于时代的优秀作品。</p>', '活动部', '管理员', DATE_SUB(NOW(), INTERVAL 25 DAY), '1', '0', 'new', 132, 'admin');

-- ----------------------------
-- 初始化专题数据
-- ----------------------------
INSERT INTO `cms_special` (`title`, `cover_image`, `description`, `sort_order`, `status`, `create_by`) VALUES
('学习贯彻党的二十届三中全会精神', NULL, '深入学习宣传贯彻党的二十届三中全会精神，推动文艺志愿服务高质量发展', 1, '1', 'admin'),
('新时代文明实践文艺志愿服务', NULL, '记录新时代文明实践文艺志愿服务的生动实践', 2, '1', 'admin'),
('致敬大国重器', NULL, '文艺志愿者走进大国重器，致敬建设者', 3, '1', 'admin'),
('我们的中国梦', NULL, '文化进万家，共筑中国梦', 4, '1', 'admin');

-- ----------------------------
-- 初始化单页内容（协会概况）
-- ----------------------------
UPDATE `cms_page` SET `content` = '<p>中国文艺志愿者协会（China Literary and Art Volunteers'' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。</p>
<p>中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p>
<p>协会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平文化思想，培育和践行社会主义核心价值观，广泛动员文艺工作者、文艺爱好者投身志愿服务，弘扬奉献、友爱、互助、进步的志愿精神，丰富人民群众精神文化生活，推动文艺事业和志愿服务事业健康发展。</p>
<p>协会的主要任务是：团结凝聚文艺志愿者力量，组织开展文艺志愿服务活动，培训文艺志愿服务骨干，开展文艺志愿服务理论研究，加强文艺志愿服务宣传推广，维护文艺志愿者合法权益，推动文艺志愿服务制度化、规范化、常态化发展。</p>' WHERE `page_key` = 'association_overview';

-- ----------------------------
-- 初始化单页内容（组织架构）
-- ----------------------------
UPDATE `cms_page` SET `content` = '<p>中国文艺志愿者协会最高权力机构为会员代表大会，会员代表大会选举产生理事会，理事会选举产生主席、副主席、秘书长。</p>
<p>协会设秘书处，负责协会日常工作。秘书处下设办公室、活动部、联络部、宣传部等部门。</p>
<p>协会根据工作需要设立专业委员会，负责相关专业领域的文艺志愿服务工作。</p>' WHERE `page_key` = 'organization';

-- ----------------------------
-- 初始化单页内容（联系方式）
-- ----------------------------
UPDATE `cms_page` SET `content` = '<p><strong>中国文艺志愿者协会</strong></p>
<p>地址：北京市朝阳区北沙滩1号院32号楼</p>
<p>邮编：100083</p>
<p>电话：010-xxxxxxxx</p>
<p>邮箱：wyzyz@china.com</p>
<p>官方网站：www.wyzyz.org</p>' WHERE `page_key` = 'contact';

SET FOREIGN_KEY_CHECKS = 1;
