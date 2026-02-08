-- 门户网站完整数据库初始化脚本
-- 创建日期: 2026-02-08

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

USE nest_admin;

-- ----------------------------
-- 1. 文章分类表（已有，添加初始化数据）
-- ----------------------------
DELETE FROM cms_category WHERE category_code IN ('news', 'party', 'activities', 'awards', 'notice', 'cooperation');

INSERT INTO `cms_category` (`category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES
('要闻动态', 'news', 0, 1, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('党建工作', 'party', 0, 2, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('品牌活动', 'activities', 0, 3, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('表彰激励', 'awards', 0, 4, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('公告公示', 'notice', 0, 5, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('全国联动', 'cooperation', 0, 6, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0');

-- ----------------------------
-- 2. 协会概况栏目表（已有，添加初始化数据）
-- ----------------------------
DELETE FROM cms_about_section WHERE section_key IN ('overview', 'charter', 'leadership', 'council', 'regulations');

INSERT INTO `cms_about_section` (`section_key`, `section_name`, `section_type`, `content`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES
('overview', '协会概况', 'richText', '<p>协会概况内容...</p>', 1, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('charter', '协会章程', 'richText', '<p>协会章程内容...</p>', 2, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('leadership', '协会领导', 'richText', '<p>协会领导内容...</p>', 3, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('council', '理事会', 'list', NULL, 4, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('regulations', '会员工作条例', 'richText', '<p>会员工作条例内容...</p>', 5, '1', 'admin', NOW(), 'admin', NOW(), '0');

-- ----------------------------
-- 3. 网站导航表（新增）
-- ----------------------------
DROP TABLE IF EXISTS `cms_navigation`;
CREATE TABLE `cms_navigation` (
  `nav_id` int NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `nav_name` varchar(50) NOT NULL COMMENT '导航名称',
  `nav_path` varchar(200) NOT NULL COMMENT '导航路径/路由',
  `nav_type` varchar(20) NOT NULL DEFAULT 'internal' COMMENT '导航类型：internal内部 external外部',
  `nav_target` varchar(20) DEFAULT '_self' COMMENT '打开方式：_self当前页 _blank新标签页',
  `is_fixed` char(1) NOT NULL DEFAULT '0' COMMENT '是否固定：0否 1是（不可编辑删除）',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`nav_id`),
  KEY `idx_sort_order` (`sort_order`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网站导航表';

-- 初始化导航数据
INSERT INTO `cms_navigation` (`nav_name`, `nav_path`, `nav_type`, `nav_target`, `is_fixed`, `sort_order`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`) VALUES
('首页', '/', 'internal', '_self', '1', 1, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('协会概况', '/about', 'internal', '_self', '0', 2, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('要闻动态', '/news', 'internal', '_self', '0', 3, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('党建工作', '/party', 'internal', '_self', '0', 4, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('品牌活动', '/activities', 'internal', '_self', '0', 5, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('表彰激励', '/awards', 'internal', '_self', '0', 6, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('公告公示', '/announcements', 'internal', '_self', '0', 7, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('专题', '/topics', 'internal', '_self', '0', 8, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('全国联动', '/cooperation', 'internal', '_self', '0', 9, '1', 'admin', NOW(), 'admin', NOW(), '0'),
('智慧平台', 'https://zg.wyzyz.org', 'external', '_blank', '0', 10, '1', 'admin', NOW(), 'admin', NOW(), '0');

-- ----------------------------
-- 4. 专题栏目表（新增）
-- ----------------------------
DROP TABLE IF EXISTS `cms_special_category`;
CREATE TABLE `cms_special_category` (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `special_id` int NOT NULL COMMENT '专题ID',
  `category_name` varchar(100) NOT NULL COMMENT '栏目名称',
  `category_code` varchar(50) NOT NULL COMMENT '栏目编码',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_special_code` (`special_id`, `category_code`),
  KEY `idx_special_id` (`special_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专题栏目表';

-- ----------------------------
-- 5. 修改专题文章关联表（添加 category_id 字段）
-- ----------------------------
ALTER TABLE `cms_special_article`
ADD COLUMN `category_id` int DEFAULT NULL COMMENT '栏目ID' AFTER `article_id`,
ADD KEY `idx_category_id` (`category_id`);

-- ----------------------------
-- 6. 查看初始化结果
-- ----------------------------
SELECT '=== 文章分类 ===' as '';
SELECT category_id, category_name, category_code, sort_order, status FROM cms_category WHERE del_flag = '0' ORDER BY sort_order;

SELECT '=== 协会概况栏目 ===' as '';
SELECT section_id, section_key, section_name, section_type, sort_order, status FROM cms_about_section WHERE del_flag = '0' ORDER BY sort_order;

SELECT '=== 网站导航 ===' as '';
SELECT nav_id, nav_name, nav_path, nav_type, nav_target, is_fixed, sort_order, status FROM cms_navigation WHERE del_flag = '0' ORDER BY sort_order;

SET FOREIGN_KEY_CHECKS = 1;
