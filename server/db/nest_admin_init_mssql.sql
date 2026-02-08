-- ========================================================
-- Nest Admin SQL Server 初始化脚本
-- 基于 MySQL 版本 nest_admin_init.sql 转换
-- 转换规则：
--   - AUTO_INCREMENT -> IDENTITY(1,1)
--   - VARCHAR -> NVARCHAR
--   - LONGTEXT/TEXT -> NVARCHAR(MAX)
--   - DATETIME(6) -> DATETIME2(6)
--   - TIMESTAMP(6) -> DATETIME2(6)
--   - 移除 ENGINE 和 CHARSET
--   - 移除反引号
-- ========================================================

-- 创建数据库（如需要）
-- CREATE DATABASE nest_admin;
-- GO
-- USE nest_admin;
-- GO

-- 设置 ANSI 标准
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

-- ========================================================
-- 表结构创建
-- ========================================================

-- ----------------------------
-- Table structure for cms_about_article
-- ----------------------------
IF OBJECT_ID('dbo.cms_about_article', 'U') IS NOT NULL DROP TABLE cms_about_article;
GO
CREATE TABLE cms_about_article (
  about_id INT IDENTITY(1,1) NOT NULL,
  section_id INT NOT NULL COMMENT '关联栏目ID',
  title NVARCHAR(200) NOT NULL COMMENT '文章标题',
  content NVARCHAR(MAX) COMMENT '文章内容',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (about_id)
);
GO

-- ----------------------------
-- Table structure for cms_about_section
-- ----------------------------
IF OBJECT_ID('dbo.cms_about_section', 'U') IS NOT NULL DROP TABLE cms_about_section;
GO
CREATE TABLE cms_about_section (
  section_id INT IDENTITY(1,1) NOT NULL,
  section_name NVARCHAR(100) NOT NULL COMMENT '栏目名称',
  section_code NVARCHAR(50) NOT NULL COMMENT '栏目编码',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (section_id)
);
GO

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
IF OBJECT_ID('dbo.cms_article', 'U') IS NOT NULL DROP TABLE cms_article;
GO
CREATE TABLE cms_article (
  article_id INT IDENTITY(1,1) NOT NULL,
  title NVARCHAR(200) NOT NULL COMMENT '文章标题',
  summary NVARCHAR(500) DEFAULT NULL COMMENT '摘要',
  content NVARCHAR(MAX) COMMENT '文章内容',
  cover_image NVARCHAR(255) DEFAULT NULL COMMENT '封面图',
  author NVARCHAR(50) DEFAULT NULL COMMENT '作者',
  source NVARCHAR(100) DEFAULT NULL COMMENT '来源',
  source_url NVARCHAR(500) DEFAULT NULL COMMENT '来源链接',
  category_id INT NOT NULL COMMENT '分类ID',
  is_top NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  view_count INT NOT NULL DEFAULT 0 COMMENT '浏览次数',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态：0草稿 1已发布 2已下线',
  audit_status NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0待审核 1审核通过 2审核拒绝',
  publish_time DATETIME2(6) DEFAULT NULL COMMENT '发布时间',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (article_id)
);
GO
CREATE INDEX IDX_cms_article_category_id ON cms_article(category_id);
CREATE INDEX IDX_cms_article_status ON cms_article(status);
CREATE INDEX IDX_cms_article_create_time ON cms_article(create_time);
GO

-- ----------------------------
-- Table structure for cms_banner
-- ----------------------------
IF OBJECT_ID('dbo.cms_banner', 'U') IS NOT NULL DROP TABLE cms_banner;
GO
CREATE TABLE cms_banner (
  banner_id INT IDENTITY(1,1) NOT NULL,
  title NVARCHAR(100) NOT NULL COMMENT '轮播图标题',
  position NVARCHAR(50) NOT NULL DEFAULT 'home' COMMENT '位置：home首页 focus焦点图',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  image NVARCHAR(500) NOT NULL DEFAULT '' COMMENT '图片URL',
  link_url NVARCHAR(500) DEFAULT NULL COMMENT '链接地址',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (banner_id)
);
GO

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
IF OBJECT_ID('dbo.cms_category', 'U') IS NOT NULL DROP TABLE cms_category;
GO
CREATE TABLE cms_category (
  category_id INT IDENTITY(1,1) NOT NULL,
  category_name NVARCHAR(50) NOT NULL COMMENT '分类名称',
  category_code NVARCHAR(50) NOT NULL COMMENT '分类编码',
  parent_id INT NOT NULL DEFAULT 0 COMMENT '父分类ID',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  icon NVARCHAR(100) DEFAULT NULL COMMENT '图标',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (category_id)
);
GO
CREATE UNIQUE INDEX IDX_cms_category_code ON cms_category(category_code);
GO

-- ----------------------------
-- Table structure for cms_focus
-- ----------------------------
IF OBJECT_ID('dbo.cms_focus', 'U') IS NOT NULL DROP TABLE cms_focus;
GO
CREATE TABLE cms_focus (
  focus_id INT IDENTITY(1,1) NOT NULL,
  focus_key NVARCHAR(50) NOT NULL COMMENT '焦点图标识',
  focus_name NVARCHAR(100) NOT NULL COMMENT '焦点图名称',
  image_url NVARCHAR(500) NOT NULL COMMENT '图片URL',
  image_source_type NVARCHAR(20) NOT NULL DEFAULT 'upload' COMMENT '图片来源类型：upload上传 link链接',
  link_type NVARCHAR(20) NOT NULL DEFAULT 'external' COMMENT '链接类型：internal内部文章 external外部地址',
  link_value NVARCHAR(500) DEFAULT NULL COMMENT '链接值（文章ID或外部URL）',
  open_type NVARCHAR(20) NOT NULL DEFAULT 'new' COMMENT '打开方式：current当前页 new新标签页',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  is_fixed NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '是否固定：0否 1是（固定数据不可删除）',
  PRIMARY KEY (focus_id)
);
GO
CREATE UNIQUE INDEX IDX_cms_focus_key ON cms_focus(focus_key);
GO

-- ----------------------------
-- Table structure for cms_focus_history
-- ----------------------------
IF OBJECT_ID('dbo.cms_focus_history', 'U') IS NOT NULL DROP TABLE cms_focus_history;
GO
CREATE TABLE cms_focus_history (
  history_id INT IDENTITY(1,1) NOT NULL,
  focus_id INT NOT NULL COMMENT '关联的焦点图ID',
  focus_key NVARCHAR(50) NOT NULL COMMENT '焦点图标识',
  focus_name NVARCHAR(100) NOT NULL COMMENT '焦点图名称',
  image_url NVARCHAR(500) NOT NULL COMMENT '图片URL',
  image_source_type NVARCHAR(20) NOT NULL DEFAULT 'upload' COMMENT '图片来源类型',
  link_type NVARCHAR(20) NOT NULL DEFAULT 'external' COMMENT '链接类型',
  link_value NVARCHAR(500) DEFAULT NULL COMMENT '链接值',
  open_type NVARCHAR(20) NOT NULL DEFAULT 'new' COMMENT '打开方式',
  remark NVARCHAR(200) DEFAULT NULL COMMENT '修改备注',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '修改人',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '修改时间',
  PRIMARY KEY (history_id)
);
GO

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
IF OBJECT_ID('dbo.cms_link', 'U') IS NOT NULL DROP TABLE cms_link;
GO
CREATE TABLE cms_link (
  link_id INT IDENTITY(1,1) NOT NULL,
  link_name NVARCHAR(100) NOT NULL COMMENT '链接名称',
  link_url NVARCHAR(255) NOT NULL COMMENT '链接地址',
  link_logo NVARCHAR(255) DEFAULT NULL COMMENT '链接Logo',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  link_type NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '链接类型：0普通链接 1全国分会',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (link_id)
);
GO

-- ----------------------------
-- Table structure for cms_navigation
-- ----------------------------
IF OBJECT_ID('dbo.cms_navigation', 'U') IS NOT NULL DROP TABLE cms_navigation;
GO
CREATE TABLE cms_navigation (
  nav_id INT IDENTITY(1,1) NOT NULL,
  nav_name NVARCHAR(50) NOT NULL COMMENT '导航名称',
  nav_path NVARCHAR(200) NOT NULL COMMENT '导航路径/路由',
  nav_type NVARCHAR(20) NOT NULL DEFAULT 'internal' COMMENT '导航类型：internal内部 external外部',
  nav_target NVARCHAR(20) NOT NULL DEFAULT '_self' COMMENT '打开方式：_self当前页 _blank新标签页',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  is_fixed NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否固定：0否 1是（不可编辑删除）',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (nav_id)
);
GO

-- ----------------------------
-- Table structure for cms_notice
-- ----------------------------
IF OBJECT_ID('dbo.cms_notice', 'U') IS NOT NULL DROP TABLE cms_notice;
GO
CREATE TABLE cms_notice (
  notice_id INT IDENTITY(1,1) NOT NULL,
  title NVARCHAR(200) NOT NULL COMMENT '公告标题',
  content NVARCHAR(MAX) COMMENT '公告内容',
  notice_type NVARCHAR(20) NOT NULL DEFAULT 'notice' COMMENT '公告类型：notice公告 announcement公示',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常 1关闭',
  is_top NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否置顶：0否 1是',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (notice_id)
);
GO

-- ----------------------------
-- Table structure for cms_page
-- ----------------------------
IF OBJECT_ID('dbo.cms_page', 'U') IS NOT NULL DROP TABLE cms_page;
GO
CREATE TABLE cms_page (
  page_id INT IDENTITY(1,1) NOT NULL,
  page_key NVARCHAR(50) NOT NULL COMMENT '页面标识',
  page_name NVARCHAR(100) NOT NULL COMMENT '页面名称',
  content NVARCHAR(MAX) COMMENT '内容',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  PRIMARY KEY (page_id)
);
GO
CREATE UNIQUE INDEX IDX_cms_page_key ON cms_page(page_key);
GO

-- ----------------------------
-- Table structure for cms_quick_link
-- ----------------------------
IF OBJECT_ID('dbo.cms_quick_link', 'U') IS NOT NULL DROP TABLE cms_quick_link;
GO
CREATE TABLE cms_quick_link (
  link_id INT IDENTITY(1,1) NOT NULL,
  link_name NVARCHAR(100) NOT NULL COMMENT '链接名称',
  link_url NVARCHAR(255) NOT NULL COMMENT '链接地址',
  link_position NVARCHAR(50) NOT NULL COMMENT '链接位置：top顶部 sidebar侧边栏',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (link_id)
);
GO

-- ----------------------------
-- Table structure for cms_site_config
-- ----------------------------
IF OBJECT_ID('dbo.cms_site_config', 'U') IS NOT NULL DROP TABLE cms_site_config;
GO
CREATE TABLE cms_site_config (
  config_id INT IDENTITY(1,1) NOT NULL,
  config_key NVARCHAR(100) NOT NULL COMMENT '配置键',
  config_value NVARCHAR(MAX) COMMENT '配置值',
  config_name NVARCHAR(200) NOT NULL COMMENT '配置名称',
  config_type NVARCHAR(20) NOT NULL DEFAULT 'text' COMMENT '配置类型：text文本 textarea多行文本 rich富文本 image图片',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  PRIMARY KEY (config_id)
);
GO
CREATE UNIQUE INDEX IDX_cms_site_config_key ON cms_site_config(config_key);
GO

-- ----------------------------
-- Table structure for cms_special
-- ----------------------------
IF OBJECT_ID('dbo.cms_special', 'U') IS NOT NULL DROP TABLE cms_special;
GO
CREATE TABLE cms_special (
  special_id INT IDENTITY(1,1) NOT NULL,
  title NVARCHAR(200) NOT NULL COMMENT '专题标题',
  cover_image NVARCHAR(255) DEFAULT NULL COMMENT '封面图',
  description NVARCHAR(500) DEFAULT NULL COMMENT '专题描述',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (special_id)
);
GO

-- ----------------------------
-- Table structure for cms_special_article
-- ----------------------------
IF OBJECT_ID('dbo.cms_special_article', 'U') IS NOT NULL DROP TABLE cms_special_article;
GO
CREATE TABLE cms_special_article (
  id INT IDENTITY(1,1) NOT NULL,
  special_id INT NOT NULL COMMENT '专题ID',
  article_id INT NOT NULL COMMENT '文章ID',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  category_id INT DEFAULT NULL COMMENT '栏目ID',
  PRIMARY KEY (id)
);
GO

-- ----------------------------
-- Table structure for cms_special_category
-- ----------------------------
IF OBJECT_ID('dbo.cms_special_category', 'U') IS NOT NULL DROP TABLE cms_special_category;
GO
CREATE TABLE cms_special_category (
  category_id INT IDENTITY(1,1) NOT NULL,
  special_id INT NOT NULL COMMENT '专题ID',
  category_name NVARCHAR(100) NOT NULL COMMENT '栏目名称',
  category_code NVARCHAR(50) NOT NULL COMMENT '栏目编码',
  sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  status NVARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  del_flag NVARCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (category_id)
);
GO

-- ----------------------------
-- Table structure for cms_statistics
-- ----------------------------
IF OBJECT_ID('dbo.cms_statistics', 'U') IS NOT NULL DROP TABLE cms_statistics;
GO
CREATE TABLE cms_statistics (
  stat_id INT IDENTITY(1,1) NOT NULL,
  stat_date DATE NOT NULL,
  total_pv INT NOT NULL DEFAULT 0,
  total_uv INT NOT NULL DEFAULT 0,
  article_pv INT NOT NULL DEFAULT 0,
  article_uv INT NOT NULL DEFAULT 0,
  home_pv INT NOT NULL DEFAULT 0,
  home_uv INT NOT NULL DEFAULT 0,
  special_pv INT NOT NULL DEFAULT 0,
  special_uv INT NOT NULL DEFAULT 0,
  other_pv INT NOT NULL DEFAULT 0,
  other_uv INT NOT NULL DEFAULT 0,
  PRIMARY KEY (stat_id)
);
GO
CREATE INDEX IDX_cms_statistics_date ON cms_statistics(stat_date);
GO

-- ----------------------------
-- Table structure for cms_visit_log
-- ----------------------------
IF OBJECT_ID('dbo.cms_visit_log', 'U') IS NOT NULL DROP TABLE cms_visit_log;
GO
CREATE TABLE cms_visit_log (
  log_id INT IDENTITY(1,1) NOT NULL,
  page_url NVARCHAR(255) DEFAULT NULL,
  page_type NVARCHAR(50) DEFAULT NULL,
  ref_type_id INT DEFAULT NULL,
  ip_address NVARCHAR(128) DEFAULT NULL,
  user_agent NVARCHAR(500) DEFAULT NULL,
  visit_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME(),
  PRIMARY KEY (log_id)
);
GO
CREATE INDEX IDX_cms_visit_log_url ON cms_visit_log(page_url);
CREATE INDEX IDX_cms_visit_log_type ON cms_visit_log(page_type);
CREATE INDEX IDX_cms_visit_log_ref ON cms_visit_log(ref_type_id);
CREATE INDEX IDX_cms_visit_log_time ON cms_visit_log(visit_time);
GO

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
IF OBJECT_ID('dbo.gen_table', 'U') IS NOT NULL DROP TABLE gen_table;
GO
CREATE TABLE gen_table (
  table_id INT IDENTITY(1,1) NOT NULL COMMENT '编号',
  table_name NVARCHAR(200) NOT NULL DEFAULT '' COMMENT '表名称',
  table_comment NVARCHAR(500) NOT NULL DEFAULT '' COMMENT '表描述',
  sub_table_name NVARCHAR(64) DEFAULT NULL COMMENT '关联子表的表名',
  sub_table_fk_name NVARCHAR(64) DEFAULT NULL COMMENT '子表关联的外键名',
  class_name NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '实体类名称',
  tpl_category NVARCHAR(200) NOT NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  tpl_web_type NVARCHAR(30) NOT NULL DEFAULT 'element-plus' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  package_name NVARCHAR(100) NOT NULL COMMENT '生成包路径',
  module_name NVARCHAR(30) NOT NULL COMMENT '生成模块名',
  business_name NVARCHAR(30) NOT NULL COMMENT '生成业务名',
  function_name NVARCHAR(50) NOT NULL COMMENT '生成功能名',
  function_author NVARCHAR(50) NOT NULL COMMENT '生成功能作者',
  gen_type NCHAR(1) NOT NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  gen_path NVARCHAR(200) NOT NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  options NVARCHAR(1000) NOT NULL DEFAULT '' COMMENT '其它生成选项',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (table_id)
);
GO

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
IF OBJECT_ID('dbo.gen_table_column', 'U') IS NOT NULL DROP TABLE gen_table_column;
GO
CREATE TABLE gen_table_column (
  column_id INT IDENTITY(1,1) NOT NULL COMMENT '编号',
  table_id INT NOT NULL COMMENT '归属表编号',
  column_name NVARCHAR(200) NOT NULL COMMENT '列名称',
  column_comment NVARCHAR(500) NOT NULL COMMENT '列描述',
  column_type NVARCHAR(100) NOT NULL COMMENT '列类型',
  java_type NVARCHAR(500) NOT NULL COMMENT 'JAVA类型',
  java_field NVARCHAR(200) NOT NULL COMMENT 'JAVA字段名',
  is_pk NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否主键（1是）',
  is_increment NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否自增（1是）',
  is_required NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否必填（1是）',
  is_insert NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否为插入字段（1是）',
  is_edit NCHAR(1) DEFAULT '0' COMMENT '是否编辑字段（1是）',
  is_list NCHAR(1) DEFAULT '0' COMMENT '是否列表字段（1是）',
  is_query NCHAR(1) DEFAULT '1' COMMENT '是否查询字段（1是）',
  query_type NVARCHAR(200) NOT NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  html_type NVARCHAR(200) NOT NULL DEFAULT '' COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  dict_type NVARCHAR(200) NOT NULL DEFAULT '' COMMENT '字典类型',
  column_default NVARCHAR(200) DEFAULT NULL COMMENT '默认值',
  sort INT NOT NULL COMMENT '排序',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (column_id)
);
GO

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
IF OBJECT_ID('dbo.sys_config', 'U') IS NOT NULL DROP TABLE sys_config;
GO
CREATE TABLE sys_config (
  config_id INT IDENTITY(1,1) NOT NULL COMMENT '参数主键',
  config_name NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '参数名称',
  config_key NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '参数键名',
  config_value NVARCHAR(500) NOT NULL DEFAULT '' COMMENT '参数键值',
  config_type NCHAR(1) NOT NULL DEFAULT 'N' COMMENT '系统内置',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (config_id)
);
GO

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
IF OBJECT_ID('dbo.sys_dept', 'U') IS NOT NULL DROP TABLE sys_dept;
GO
CREATE TABLE sys_dept (
  dept_id INT IDENTITY(1,1) NOT NULL COMMENT '部门ID',
  parent_id INT NOT NULL DEFAULT 0 COMMENT '父部门ID',
  ancestors NVARCHAR(50) NOT NULL DEFAULT '0' COMMENT '祖级列表',
  dept_name NVARCHAR(30) NOT NULL COMMENT '部门名称',
  order_num INT NOT NULL DEFAULT 0 COMMENT '显示顺序',
  leader NVARCHAR(20) NOT NULL COMMENT '负责人',
  phone NVARCHAR(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  email NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (dept_id)
);
GO

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
IF OBJECT_ID('dbo.sys_dict_data', 'U') IS NOT NULL DROP TABLE sys_dict_data;
GO
CREATE TABLE sys_dict_data (
  dict_code INT IDENTITY(1,1) NOT NULL COMMENT '字典主键',
  dict_sort INT NOT NULL DEFAULT 0 COMMENT '字典排序',
  dict_label NVARCHAR(100) NOT NULL COMMENT '字典标签',
  dict_value NVARCHAR(100) NOT NULL COMMENT '字典键值',
  dict_type NVARCHAR(100) NOT NULL COMMENT '字典类型',
  css_class NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '样式属性',
  list_class NVARCHAR(100) NOT NULL COMMENT '表格回显样式',
  is_default NCHAR(1) NOT NULL DEFAULT 'N' COMMENT '是否默认',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (dict_code)
);
GO

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
IF OBJECT_ID('dbo.sys_dict_type', 'U') IS NOT NULL DROP TABLE sys_dict_type;
GO
CREATE TABLE sys_dict_type (
  dict_id INT IDENTITY(1,1) NOT NULL COMMENT '字典主键',
  dict_name NVARCHAR(100) NOT NULL COMMENT '字典名称',
  dict_type NVARCHAR(100) NOT NULL COMMENT '字典类型',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (dict_id)
);
GO
CREATE UNIQUE INDEX IDX_sys_dict_type_type ON sys_dict_type(dict_type);
GO

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
IF OBJECT_ID('dbo.sys_job', 'U') IS NOT NULL DROP TABLE sys_job;
GO
CREATE TABLE sys_job (
  job_id INT IDENTITY(1,1) NOT NULL COMMENT '任务ID',
  job_name NVARCHAR(64) NOT NULL COMMENT '任务名称',
  job_group NVARCHAR(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  invoke_target NVARCHAR(500) NOT NULL COMMENT '调用目标字符串',
  cron_expression NVARCHAR(255) DEFAULT NULL COMMENT 'cron执行表达式',
  misfire_policy NVARCHAR(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  concurrent NCHAR(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (job_id)
);
GO

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
IF OBJECT_ID('dbo.sys_job_log', 'U') IS NOT NULL DROP TABLE sys_job_log;
GO
CREATE TABLE sys_job_log (
  job_log_id INT IDENTITY(1,1) NOT NULL COMMENT '任务日志ID',
  job_name NVARCHAR(64) NOT NULL COMMENT '任务名称',
  job_group NVARCHAR(64) NOT NULL COMMENT '任务组名',
  invoke_target NVARCHAR(500) NOT NULL COMMENT '调用目标字符串',
  job_message NVARCHAR(500) DEFAULT NULL COMMENT '日志信息',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  exception_info NVARCHAR(2000) DEFAULT NULL COMMENT '异常信息',
  create_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  PRIMARY KEY (job_log_id)
);
GO

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
IF OBJECT_ID('dbo.sys_logininfor', 'U') IS NOT NULL DROP TABLE sys_logininfor;
GO
CREATE TABLE sys_logininfor (
  info_id INT IDENTITY(1,1) NOT NULL COMMENT '访问ID',
  user_name NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  ipaddr NVARCHAR(128) NOT NULL DEFAULT '' COMMENT '登录IP地址',
  login_location NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '登录地点',
  browser NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  os NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '操作系统',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  msg NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '提示消息',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  login_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '访问时间',
  PRIMARY KEY (info_id)
);
GO

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
IF OBJECT_ID('dbo.sys_menu', 'U') IS NOT NULL DROP TABLE sys_menu;
GO
CREATE TABLE sys_menu (
  menu_id INT IDENTITY(1,1) NOT NULL COMMENT '菜单ID',
  menu_name NVARCHAR(50) NOT NULL COMMENT '菜单名称',
  parent_id INT NOT NULL COMMENT '父菜单ID',
  order_num INT NOT NULL DEFAULT 0 COMMENT '显示顺序',
  path NVARCHAR(200) NOT NULL DEFAULT '' COMMENT '路由地址',
  component NVARCHAR(255) DEFAULT NULL COMMENT '组件路径',
  query NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '路由参数',
  is_frame NCHAR(1) NOT NULL DEFAULT '1' COMMENT '是否为外链',
  is_cache NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否缓存',
  menu_type NCHAR(1) NOT NULL DEFAULT 'M' COMMENT '菜单类型',
  visible NCHAR(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  perms NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  icon NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (menu_id)
);
GO

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
IF OBJECT_ID('dbo.sys_notice', 'U') IS NOT NULL DROP TABLE sys_notice;
GO
CREATE TABLE sys_notice (
  notice_id INT IDENTITY(1,1) NOT NULL COMMENT '公告ID',
  notice_title NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '公告标题',
  notice_type NCHAR(1) NOT NULL COMMENT '公告类型',
  notice_content NVARCHAR(MAX) COMMENT '公告内容',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (notice_id)
);
GO

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
IF OBJECT_ID('dbo.sys_oper_log', 'U') IS NOT NULL DROP TABLE sys_oper_log;
GO
CREATE TABLE sys_oper_log (
  oper_id INT IDENTITY(1,1) NOT NULL COMMENT '日志主键',
  title NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  business_type INT NOT NULL DEFAULT 0 COMMENT '业务类型',
  request_method NVARCHAR(10) NOT NULL DEFAULT '' COMMENT '请求方式',
  oper_name NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '操作人员',
  dept_name NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  oper_url NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '请求URL',
  oper_location NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '操作地点',
  oper_param NVARCHAR(2000) NOT NULL DEFAULT '' COMMENT '请求参数',
  json_result NVARCHAR(2000) NOT NULL DEFAULT '' COMMENT '返回参数',
  error_msg NVARCHAR(2000) NOT NULL DEFAULT '' COMMENT '错误消息',
  method NVARCHAR(100) NOT NULL DEFAULT '' COMMENT '方法名称',
  oper_ip NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '主机地址',
  oper_time DATETIME2(6) NOT NULL DEFAULT SYSUTCDATETIME() COMMENT '操作时间',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '登录状态',
  cost_time INT NOT NULL DEFAULT 0 COMMENT '消耗时间',
  operator_type NVARCHAR(255) NOT NULL DEFAULT '0' COMMENT '操作类别',
  PRIMARY KEY (oper_id)
);
GO

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
IF OBJECT_ID('dbo.sys_post', 'U') IS NOT NULL DROP TABLE sys_post;
GO
CREATE TABLE sys_post (
  post_id INT IDENTITY(1,1) NOT NULL COMMENT '岗位ID',
  post_code NVARCHAR(64) NOT NULL COMMENT '岗位编码',
  post_name NVARCHAR(50) NOT NULL COMMENT '岗位名称',
  post_sort INT NOT NULL DEFAULT 0 COMMENT '显示顺序',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (post_id)
);
GO

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
IF OBJECT_ID('dbo.sys_role', 'U') IS NOT NULL DROP TABLE sys_role;
GO
CREATE TABLE sys_role (
  role_id INT IDENTITY(1,1) NOT NULL COMMENT '角色ID',
  role_name NVARCHAR(30) NOT NULL COMMENT '角色名称',
  role_key NVARCHAR(100) NOT NULL COMMENT '角色权限字符串',
  role_sort INT NOT NULL DEFAULT 0 COMMENT '显示顺序',
  data_scope NCHAR(1) NOT NULL DEFAULT '1' COMMENT '数据范围',
  menu_check_strictly SMALLINT NOT NULL DEFAULT 0 COMMENT '菜单树选择项是否关联显示',
  dept_check_strictly SMALLINT NOT NULL DEFAULT 0 COMMENT '部门树选择项是否关联显示',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (role_id)
);
GO

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
IF OBJECT_ID('dbo.sys_role_dept', 'U') IS NOT NULL DROP TABLE sys_role_dept;
GO
CREATE TABLE sys_role_dept (
  role_id INT NOT NULL DEFAULT 0 COMMENT '角色ID',
  dept_id INT NOT NULL DEFAULT 0 COMMENT '部门ID',
  PRIMARY KEY (role_id, dept_id)
);
GO

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
IF OBJECT_ID('dbo.sys_role_menu', 'U') IS NOT NULL DROP TABLE sys_role_menu;
GO
CREATE TABLE sys_role_menu (
  role_id INT NOT NULL DEFAULT 0 COMMENT '角色ID',
  menu_id INT NOT NULL DEFAULT 0 COMMENT '菜单ID',
  PRIMARY KEY (role_id, menu_id)
);
GO

-- ----------------------------
-- Table structure for sys_upload
-- ----------------------------
IF OBJECT_ID('dbo.sys_upload', 'U') IS NOT NULL DROP TABLE sys_upload;
GO
CREATE TABLE sys_upload (
  upload_id NVARCHAR(255) NOT NULL COMMENT '任务Id',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  size INT NOT NULL COMMENT '文件大小',
  file_name NVARCHAR(255) NOT NULL COMMENT '文件路径',
  new_file_name NVARCHAR(255) NOT NULL COMMENT '文件名',
  url NVARCHAR(255) NOT NULL COMMENT '文件地址',
  ext NVARCHAR(255) DEFAULT NULL COMMENT '拓展名',
  PRIMARY KEY (upload_id)
);
GO

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
IF OBJECT_ID('dbo.sys_user', 'U') IS NOT NULL DROP TABLE sys_user;
GO
CREATE TABLE sys_user (
  user_id INT IDENTITY(1,1) NOT NULL COMMENT '用户ID',
  dept_id INT DEFAULT NULL COMMENT '部门ID',
  user_name NVARCHAR(30) NOT NULL COMMENT '用户账号',
  nick_name NVARCHAR(30) NOT NULL COMMENT '用户昵称',
  user_type NVARCHAR(2) NOT NULL DEFAULT '00' COMMENT '用户类型',
  email NVARCHAR(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  phonenumber NVARCHAR(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  sex NCHAR(1) NOT NULL DEFAULT '0' COMMENT '性别',
  password NVARCHAR(200) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  status NCHAR(1) NOT NULL DEFAULT '0' COMMENT '状态',
  del_flag NCHAR(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  login_ip NVARCHAR(128) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  create_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '创建者',
  create_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '创建时间',
  update_by NVARCHAR(64) NOT NULL DEFAULT '' COMMENT '更新者',
  update_time DATETIME2(6) DEFAULT SYSUTCDATETIME() COMMENT '更新时间',
  remark NVARCHAR(500) DEFAULT NULL COMMENT '备注',
  avatar NVARCHAR(255) NOT NULL DEFAULT '' COMMENT '头像地址',
  login_date DATETIME2(6) DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (user_id)
);
GO

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
IF OBJECT_ID('dbo.sys_user_post', 'U') IS NOT NULL DROP TABLE sys_user_post;
GO
CREATE TABLE sys_user_post (
  user_id INT NOT NULL COMMENT '用户ID',
  post_id INT NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (user_id, post_id)
);
GO

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
IF OBJECT_ID('dbo.sys_user_role', 'U') IS NOT NULL DROP TABLE sys_user_role;
GO
CREATE TABLE sys_user_role (
  user_id INT NOT NULL COMMENT '用户ID',
  role_id INT NOT NULL COMMENT '角色ID',
  PRIMARY KEY (user_id, role_id)
);
GO

-- ========================================================
-- 插入初始数据
-- ========================================================

-- 设置 IDENTITY_INSERT 以插入指定 ID 的数据
SET IDENTITY_INSERT cms_about_section ON;
INSERT INTO cms_about_section (section_id, section_name, section_code, sort_order, create_by, create_time, update_by, update_time, status, del_flag) VALUES
(1, N'协会概况', N'overview', 1, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(2, N'组织架构', N'organization', 2, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(3, N'领导介绍', N'leadership', 3, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(4, N'协会章程', N'constitution', 4, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(5, N'联系方式', N'contact', 5, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0');
SET IDENTITY_INSERT cms_about_section OFF;
GO

SET IDENTITY_INSERT cms_banner ON;
INSERT INTO cms_banner (banner_id, title, position, sort_order, create_by, create_time, update_by, update_time, image, link_url, status, del_flag) VALUES
(1, N'焦点横幅', N'focus', 1, N'admin', '2026-02-07 18:07:57.000000', N'admin', '2026-02-07 18:07:57.000000', N'', NULL, N'1', N'0'),
(2, N'右侧顶部轮播图', N'right_top', 1, N'admin', '2026-02-07 18:07:57.000000', N'admin', '2026-02-07 18:07:57.000000', N'', NULL, N'1', N'0'),
(3, N'右侧平台轮播图', N'right_platform', 1, N'admin', '2026-02-07 18:07:57.000000', N'admin', '2026-02-07 18:07:57.000000', N'', NULL, N'1', N'0');
SET IDENTITY_INSERT cms_banner OFF;
GO

SET IDENTITY_INSERT cms_category ON;
INSERT INTO cms_category (category_id, category_name, category_code, parent_id, sort_order, icon, create_by, create_time, update_by, update_time, status, del_flag) VALUES
(3, N'品牌活动', N'activity', 0, 3, NULL, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(4, N'表彰激励', N'honor', 0, 4, NULL, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(6, N'专题', N'special', 0, 6, NULL, N'admin', '2026-02-08 11:51:24.416711', N'', '2026-02-08 11:51:24.416711', N'1', N'0'),
(8, N'学习贯彻党的二十届三中全会精神', N'special_1', 6, 1, NULL, N'admin', '2026-02-08 11:51:24.417199', N'', '2026-02-08 11:51:24.417199', N'1', N'0'),
(9, N'与人民同行', N'special_2', 6, 2, NULL, N'admin', '2026-02-08 11:51:24.417199', N'', '2026-02-08 11:51:24.417199', N'1', N'0'),
(10, N'时代风尚', N'special_3', 6, 3, NULL, N'admin', '2026-02-08 11:51:24.417199', N'', '2026-02-08 11:51:24.417199', N'1', N'0'),
(11, N'百花迎春', N'special_4', 6, 4, NULL, N'admin', '2026-02-08 11:51:24.417199', N'', '2026-02-08 11:51:24.417199', N'1', N'0'),
(18, N'要闻动态', N'news', 0, 1, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(19, N'党建工作', N'party', 0, 2, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(20, N'品牌活动', N'activities', 0, 3, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(21, N'表彰激励', N'awards', 0, 4, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(22, N'公告公示', N'notice', 0, 5, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(23, N'全国联动', N'cooperation', 0, 6, NULL, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'1', N'0'),
(26, N'要闻', N'news_important', 18, 1, NULL, N'admin', '2026-02-08 13:21:11.000000', N'admin', '2026-02-08 13:21:11.000000', N'1', N'0'),
(27, N'资讯', N'news_info', 18, 2, NULL, N'admin', '2026-02-08 13:21:11.000000', N'admin', '2026-02-08 13:21:11.000000', N'1', N'0');
SET IDENTITY_INSERT cms_category OFF;
GO

SET IDENTITY_INSERT cms_focus ON;
INSERT INTO cms_focus (focus_id, focus_key, focus_name, image_url, image_source_type, link_type, link_value, open_type, sort_order, create_by, create_time, update_by, update_time, is_fixed) VALUES
(1, N'focus_big', N'焦点大图', N'/public/640_20250127152953A190.jpg_1770525831667.jpeg', N'upload', N'external', N'#', N'new', 1, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 12:43:52.000000', N'1'),
(2, N'focus_small_1', N'焦点小图1', N'/public/1225_20240105161435A007.jpg_1770525837910.jpeg', N'upload', N'external', N'#', N'new', 2, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 12:43:58.000000', N'1'),
(3, N'focus_small_2', N'焦点小图2', N'/public/35_20240326192614A018.png_1770536340470.png', N'upload', N'external', N'https://www.baidu.com', N'new', 3, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 15:39:13.000000', N'1'),
(4, N'focus_small_3', N'焦点小图3', N'/public/微信截图_20250127152457_20250127152507A188.png_1770536361972.png', N'upload', N'external', N'https://www.wyzyz.org/home', N'new', 4, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 15:39:40.000000', N'1'),
(5, N'focus_banner', N'焦点下Banner图', N'/public/微信图片_20240105160055_20240105160104A005.png_1770536390459.png', N'upload', N'external', N'https://www.wyzyz.org/home', N'new', 5, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 15:39:53.000000', N'1'),
(6, N'notice_banner', N'公告上方焦点图', N'/public/微信截图_20250128134002_20250128134020A192.png_1770536406956.png', N'upload', N'external', N'https://www.wyzyz.org/home', N'new', 6, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 15:40:08.000000', N'1'),
(7, N'overview_banner', N'协会概况下方焦点图', N'/public/微信截图_20250127152704_20250127152712A189.png_1770536416785.png', N'upload', N'external', N'https://www.wyzyz.org/home', N'new', 7, N'admin', '2026-02-08 11:51:24.417869', N'1', '2026-02-08 15:40:18.000000', N'1');
SET IDENTITY_INSERT cms_focus OFF;
GO

SET IDENTITY_INSERT cms_focus_history ON;
INSERT INTO cms_focus_history (history_id, focus_id, focus_key, focus_name, image_url, image_source_type, link_type, link_value, open_type, remark, create_by, create_time) VALUES
(1, 1, N'focus_big', N'焦点大图', N'/origin-html/中国文艺志愿者-首页_files/640_20250407163757A193.jpg', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 12:43:52.544145'),
(2, 2, N'focus_small_1', N'焦点小图1', N'/origin-html/中国文艺志愿者-首页_files/660_20250407164737A195.jpg', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 12:43:58.758084'),
(3, 3, N'focus_small_2', N'焦点小图2', N'/origin-html/中国文艺志愿者-首页_files/650_20250407164124A194.jpg', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 15:39:13.971030'),
(4, 4, N'focus_small_3', N'焦点小图3', N'/origin-html/中国文艺志愿者-首页_files/640_20250127152953A190.jpg', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 15:39:40.382896'),
(5, 5, N'focus_banner', N'焦点下Banner图', N'/origin-html/中国文艺志愿者-首页_files/微信截图_20250527095422_20250527095430A374.png', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 15:39:53.547830'),
(6, 6, N'notice_banner', N'公告上方焦点图', N'/origin-html/中国文艺志愿者-首页_files/1012海报_20240326194759A029.png', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 15:40:08.916303'),
(7, 7, N'overview_banner', N'协会概况下方焦点图', N'/origin-html/中国文艺志愿者-首页_files/微信截图_20250128134002_20250128134020A192.png', N'upload', N'external', N'#', N'new', N'自动保存', N'1', '2026-02-08 15:40:18.736680');
SET IDENTITY_INSERT cms_focus_history OFF;
GO

SET IDENTITY_INSERT cms_link ON;
INSERT INTO cms_link (link_id, link_name, link_url, link_logo, sort_order, create_by, create_time, update_by, update_time, link_type, status, del_flag) VALUES
(1, N'中国文联 111', N'https://www.cflac.org.cn/', NULL, 1, N'admin', '2026-02-08 11:51:24.419871', N'admin', '2026-02-08 15:50:00.000000', N'0', N'1', N'0'),
(2, N'中国作协', N'https://www.chinawriter.com.cn/', NULL, 2, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(3, N'中国剧协', N'https://www.chinatheatre.org.cn/', NULL, 3, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(4, N'中国影协', N'http://www.cfa1949.com/', NULL, 4, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(5, N'中国音协', N'https://www.chnmusic.org/', NULL, 5, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(6, N'中国美协', N'https://www.caanet.org.cn/', NULL, 6, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(7, N'中国曲协', N'http://www.zhongguoyi.cn/', NULL, 7, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(8, N'中国舞协', N'https://www.chinadance.org/', NULL, 8, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(9, N'中国民协', N'http://www.cflas.com.cn/', NULL, 9, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(10, N'中国摄协 111', N'https://www.chpanet.org.cn/', NULL, 10, N'admin', '2026-02-08 11:51:24.419871', N'admin', '2026-02-08 12:44:05.000000', N'0', N'1', N'0'),
(11, N'中国书协', N'http://www.chca1981.org.cn/', NULL, 11, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(12, N'中国杂协', N'http://www.zgmx.org/', NULL, 12, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(13, N'中国视协', N'http://www.ctaa.org.cn/', NULL, 13, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0'),
(14, N'中国评协', N'http://www.zgpjxh.org/', NULL, 14, N'admin', '2026-02-08 11:51:24.419871', N'', '2026-02-08 11:51:24.419871', N'0', N'1', N'0');
SET IDENTITY_INSERT cms_link OFF;
GO

SET IDENTITY_INSERT cms_navigation ON;
INSERT INTO cms_navigation (nav_id, nav_name, nav_path, nav_type, nav_target, sort_order, create_by, create_time, update_by, update_time, is_fixed, status, del_flag) VALUES
(1, N'首页', N'/', N'internal', N'_self', 1, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(2, N'协会概况', N'/about', N'internal', N'_self', 2, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(3, N'要闻动态', N'/news', N'internal', N'_self', 3, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(4, N'党建工作', N'/party', N'internal', N'_self', 4, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(5, N'品牌活动', N'/activities', N'internal', N'_self', 5, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(6, N'表彰激励', N'/awards', N'internal', N'_self', 6, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(7, N'公告公示', N'/announcements', N'internal', N'_self', 7, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(8, N'专题', N'/topics', N'internal', N'_self', 8, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(9, N'全国联动', N'/cooperation', N'internal', N'_self', 9, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0'),
(10, N'智慧平台', N'https://zg.wyzyz.org', N'external', N'_blank', 10, N'admin', '2026-02-08 12:21:05.000000', N'admin', '2026-02-08 12:21:05.000000', N'0', N'1', N'0');
SET IDENTITY_INSERT cms_navigation OFF;
GO

SET IDENTITY_INSERT cms_notice ON;
INSERT INTO cms_notice (notice_id, title, content, notice_type, sort_order, create_by, create_time, update_by, update_time, status, is_top, del_flag) VALUES
(1, N'关于2024年度中国文艺志愿者协会会员发展公告', N'根据《中国文艺志愿者协会章程》规定，现开展2024年度会员发展工作。请符合条件的申请人按要求提交申请材料。', N'notice', 1, N'admin', '2026-02-08 11:51:24.420307', N'', '2026-02-08 11:51:24.420307', N'0', N'0', N'0'),
(2, N'中国文艺志愿者协会2023年度财务公开报告', N'根据相关规定，现将中国文艺志愿者协会2023年度财务收支情况进行公开，接受社会监督。', N'announcement', 2, N'admin', '2026-02-08 11:51:24.420307', N'', '2026-02-08 11:51:24.420307', N'0', N'0', N'0'),
(3, N'关于规范文艺志愿服务行为的通知', N'为进一步规范文艺志愿服务活动，提升服务质量，现就有关事项通知如下...', N'notice', 3, N'admin', '2026-02-08 11:51:24.420307', N'', '2026-02-08 11:51:24.420307', N'0', N'0', N'0'),
(4, N'中国文艺志愿者协会办公地址变更公告', N'因工作需要，中国文艺志愿者协会办公地址已变更，新地址为：北京市朝阳区...', N'announcement', 4, N'admin', '2026-02-08 11:51:24.420307', N'', '2026-02-08 11:51:24.420307', N'0', N'0', N'0'),
(5, N'关于征集文艺志愿服务典型案例的通知', N'为总结推广文艺志愿服务经验，现面向各单位征集文艺志愿服务典型案例。', N'notice', 5, N'admin', '2026-02-08 11:51:24.420307', N'', '2026-02-08 11:51:24.420307', N'0', N'0', N'0');
SET IDENTITY_INSERT cms_notice OFF;
GO

SET IDENTITY_INSERT cms_page ON;
INSERT INTO cms_page (page_id, page_key, page_name, content, create_by, create_time, update_by, update_time) VALUES
(1, N'association_overview', N'协会概况', N'', N'admin', '2026-02-08 11:51:24.418320', N'', '2026-02-08 11:51:24.418320'),
(2, N'organization', N'组织架构', N'', N'admin', '2026-02-08 11:51:24.418320', N'', '2026-02-08 11:51:24.418320'),
(3, N'leadership', N'领导介绍', N'', N'admin', '2026-02-08 11:51:24.418320', N'', '2026-02-08 11:51:24.418320'),
(4, N'constitution', N'协会章程', N'', N'admin', '2026-02-08 11:51:24.418320', N'', '2026-02-08 11:51:24.418320'),
(5, N'contact', N'联系方式', N'', N'admin', '2026-02-08 11:51:24.418320', N'', '2026-02-08 11:51:24.418320');
SET IDENTITY_INSERT cms_page OFF;
GO

SET IDENTITY_INSERT cms_quick_link ON;
INSERT INTO cms_quick_link (link_id, link_name, link_url, link_position, sort_order, create_by, create_time, update_by, update_time, status, del_flag) VALUES
(1, N'中国文艺网', N'http://www.cflac.org.cn/', N'top', 1, N'admin', '2026-02-08 11:51:24.419532', N'', '2026-02-08 11:51:24.419532', N'1', N'0'),
(2, N'中国文联', N'http://www.cflac.org.cn/', N'top', 2, N'admin', '2026-02-08 11:51:24.419532', N'', '2026-02-08 11:51:24.419532', N'1', N'0'),
(3, N'中国文艺志愿服务智慧平台', N'https://zyfw.wenlian.com/', N'sidebar', 1, N'admin', '2026-02-08 11:51:24.419532', N'', '2026-02-08 11:51:24.419532', N'1', N'0');
SET IDENTITY_INSERT cms_quick_link OFF;
GO

SET IDENTITY_INSERT cms_site_config ON;
INSERT INTO cms_site_config (config_id, config_key, config_value, config_name, config_type, sort_order, create_by, create_time, update_by, update_time) VALUES
(1, N'site_icp', N'京ICP备14001194号-1', N'ICP备案号', N'text', 1, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(2, N'site_police', N'京公网安备11010502025171', N'公安备案号', N'text', 2, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(3, N'site_copyright', N'中国文艺志愿者协会 版权所有', N'版权信息', N'text', 3, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(4, N'site_contact', N'联系咨询', N'联系咨询', N'text', 4, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(5, N'site_complaint', N'投诉建议', N'投诉建议', N'text', 5, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(6, N'site_forum', N'文艺论坛', N'文艺论坛', N'text', 6, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(7, N'site_department', N'职能部门', N'职能部门', N'text', 7, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(8, N'site_member', N'团体会员', N'团体会员', N'text', 8, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(9, N'site_organization', N'组织机构', N'组织机构', N'text', 9, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423'),
(10, N'site_qrcode', N'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20231017112056A013_20240103101656A013_20240103145652A042.png', N'公众号二维码', N'image', 10, N'admin', '2026-02-08 11:51:24.417423', N'', '2026-02-08 11:51:24.417423');
SET IDENTITY_INSERT cms_site_config OFF;
GO

SET IDENTITY_INSERT cms_special ON;
INSERT INTO cms_special (special_id, title, cover_image, description, sort_order, create_by, create_time, update_by, update_time, status, del_flag) VALUES
(1, N'学习贯彻党的二十届三中全会精神', NULL, N'深入学习宣传贯彻党的二十届三中全会精神，推动文艺志愿服务高质量发展', 1, N'admin', '2026-02-08 11:51:24.420661', N'', '2026-02-08 11:51:24.420661', N'1', N'0'),
(2, N'新时代文明实践文艺志愿服务', NULL, N'记录新时代文明实践文艺志愿服务的生动实践', 2, N'admin', '2026-02-08 11:51:24.420661', N'admin', '2026-02-08 14:43:14.000000', N'1', N'0'),
(3, N'致敬大国重器', NULL, N'文艺志愿者走进大国重器，致敬建设者', 3, N'admin', '2026-02-08 11:51:24.420661', N'', '2026-02-08 11:51:24.420661', N'1', N'0'),
(4, N'我们的中国梦', NULL, N'文化进万家，共筑中国梦', 4, N'admin', '2026-02-08 11:51:24.420661', N'', '2026-02-08 11:51:24.420661', N'1', N'0');
SET IDENTITY_INSERT cms_special OFF;
GO

SET IDENTITY_INSERT cms_special_article ON;
INSERT INTO cms_special_article (id, special_id, article_id, sort_order, category_id) VALUES
(1, 1, 50, 0, NULL),
(2, 1, 60, 0, NULL),
(3, 2, 61, 0, NULL);
SET IDENTITY_INSERT cms_special_article OFF;
GO

SET IDENTITY_INSERT cms_statistics ON;
INSERT INTO cms_statistics (stat_id, stat_date, total_pv, total_uv, article_pv, article_uv, home_pv, home_uv, special_pv, special_uv, other_pv, other_uv) VALUES
(1, '2026-02-08', 115, 0, 0, 0, 0, 0, 0, 0, 115, 0);
SET IDENTITY_INSERT cms_statistics OFF;
GO

SET IDENTITY_INSERT cms_visit_log ON;
INSERT INTO cms_visit_log (log_id, page_url, page_type, ref_type_id, ip_address, user_agent, visit_time) VALUES
(1, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:51:59.392000'),
(2, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:06.555000'),
(3, NULL, NULL, NULL, NULL, NULL, '2026-02-08 11:52:07.078000');
SET IDENTITY_INSERT cms_visit_log OFF;
GO

SET IDENTITY_INSERT sys_logininfor ON;
INSERT INTO sys_logininfor (info_id, user_name, ipaddr, login_location, browser, os, status, msg, del_flag, login_time) VALUES
(100, N'', N'::1', N'陕西省西安市 联通', N'Chrome 144.0.0', N'Mac OS X', N'0', N'退出成功', N'0', '2026-02-08 16:02:32.004412'),
(101, N'', N'::1', N'陕西省西安市 联通', N'Chrome 144.0.0', N'Mac OS X', N'1', N'帐号或密码错误', N'0', '2026-02-08 16:04:01.680325'),
(107, N'admin', N'::1', N'陕西省西安市 联通', N'Chrome 135.0.0', N'Mac OS X', N'0', N'登录成功', N'0', '2026-02-08 16:13:59.272223');
SET IDENTITY_INSERT sys_logininfor OFF;
GO

SET IDENTITY_INSERT sys_menu ON;
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark, del_flag) VALUES
(1, N'系统管理', 0, 3, N'system', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'system', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'系统管理目录', N'0'),
(2, N'系统监控', 0, 4, N'monitor', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'monitor', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'系统监控目录', N'0'),
(3, N'系统工具', 0, 5, N'tool', NULL, N'', N'1', N'0', N'M', N'0', N'0', N'', N'tool', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'系统工具目录', N'0'),
(100, N'用户管理', 1, 1, N'user', N'system/user/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:user:list', N'user', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'用户管理菜单', N'0'),
(101, N'角色管理', 1, 2, N'role', N'system/role/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:role:list', N'peoples', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'角色管理菜单', N'0'),
(102, N'菜单管理', 1, 3, N'menu', N'system/menu/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:menu:list', N'tree-table', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'菜单管理菜单', N'0'),
(103, N'部门管理', 1, 4, N'dept', N'system/dept/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:dept:list', N'tree', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'部门管理菜单', N'0'),
(104, N'岗位管理', 1, 5, N'post', N'system/post/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:post:list', N'post', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'岗位管理菜单', N'0'),
(105, N'字典管理', 1, 6, N'dict', N'system/dict/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:dict:list', N'dict', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'字典管理菜单', N'0'),
(106, N'参数设置', 1, 7, N'config', N'system/config/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:config:list', N'edit', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'参数设置菜单', N'0'),
(107, N'通知公告', 1, 8, N'notice', N'system/notice/index', N'', N'1', N'0', N'C', N'0', N'0', N'system:notice:list', N'message', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'通知公告菜单', N'0'),
(108, N'日志管理', 1, 9, N'log', N'', N'', N'1', N'0', N'M', N'0', N'0', N'', N'log', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'日志管理菜单', N'0'),
(109, N'在线用户', 2, 1, N'online', N'monitor/online/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:online:list', N'online', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'在线用户菜单', N'0'),
(110, N'定时任务', 2, 2, N'job', N'monitor/job/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:job:list', N'job', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'定时任务菜单', N'0'),
(111, N'数据监控', 2, 3, N'druid', N'monitor/druid/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:druid:list', N'druid', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'数据监控菜单', N'1'),
(112, N'服务监控', 2, 4, N'server', N'monitor/server/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:server:list', N'server', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'服务监控菜单', N'0'),
(113, N'缓存监控', 2, 5, N'cache', N'monitor/cache/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:cache:list', N'redis', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'缓存监控菜单', N'0'),
(114, N'缓存列表', 2, 6, N'cacheList', N'monitor/cache/list', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:cache:list', N'redis-list', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'缓存列表菜单', N'0'),
(115, N'表单构建', 3, 1, N'build', N'tool/build/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:build:list', N'build', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'表单构建菜单', N'0'),
(116, N'代码生成', 3, 2, N'gen', N'tool/gen/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:gen:list', N'code', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'代码生成菜单', N'0'),
(117, N'系统接口', 3, 3, N'swagger', N'tool/swagger/index', N'', N'1', N'0', N'C', N'0', N'0', N'tool:swagger:list', N'swagger', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'系统接口菜单', N'0'),
(500, N'操作日志', 108, 1, N'operlog', N'monitor/operlog/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:operlog:list', N'form', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'操作日志菜单', N'0'),
(501, N'登录日志', 108, 2, N'logininfor', N'monitor/logininfor/index', N'', N'1', N'0', N'C', N'0', N'0', N'monitor:logininfor:list', N'logininfor', N'admin', '2026-02-08 12:47:48.000000', N'admin', '2026-02-08 12:47:48.000000', N'登录日志菜单', N'0');
SET IDENTITY_INSERT sys_menu OFF;
GO

SET IDENTITY_INSERT sys_role ON;
INSERT INTO sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) VALUES
(1, N'超级管理员', N'admin', 1, N'1', 1, 1, N'0', N'0', N'admin', '2026-02-08 14:52:59.000000', N'admin', '2026-02-08 14:52:59.000000', N'超级管理员'),
(2, N'普通角色', N'common', 2, N'1', 1, 1, N'0', N'0', N'admin', '2026-02-08 11:57:09.000000', N'admin', '2026-02-08 11:57:09.000000', N'普通角色'),
(100, N'内容审核员', N'content_auditor', 3, N'1', 0, 0, N'0', N'0', N'admin', '2026-02-08 14:53:28.000000', N'admin', '2026-02-08 14:53:28.000000', N'负责审核文章内容');
SET IDENTITY_INSERT sys_role OFF;
GO

SET IDENTITY_INSERT sys_user ON;
INSERT INTO sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, password, status, del_flag, login_ip, create_by, create_time, update_by, update_time, remark, avatar, login_date) VALUES
(1, 103, N'admin', N'cms-admin', N'00', N'ry@163.com', N'15888888888', N'1', N'$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', N'0', N'0', N'::1', N'admin', '2025-02-28 16:52:10.000000', N'', '2026-02-08 16:30:37.000000', N'管理员', N'', '2026-02-08 16:30:38'),
(2, 105, N'ry', N'cms-admin', N'00', N'ry@qq.com', N'15666666666', N'1', N'$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', N'0', N'0', N'127.0.0.1', N'admin', '2025-02-28 16:52:10.000000', N'', NULL, N'测试员', N'', NULL),
(100, 100, N'cms_admin', N'内容审核员', N'10', N'', N'', N'0', N'$2b$10$vAY7HE78VKyY7WnQ9m/X5.oOPRb6lCE.xOyFPJwXIcySmspdUg7Zu', N'0', N'0', N'::1', N'admin', '2026-02-08 16:14:50.431172', N'admin', '2026-02-08 16:38:30.000000', NULL, N'', '2026-02-08 16:38:31');
SET IDENTITY_INSERT sys_user OFF;
GO

INSERT INTO sys_user_role (user_id, role_id) VALUES
(1, 1),
(1, 2),
(100, 100);
GO

-- ========================================================
-- 完成
-- ========================================================
PRINT 'SQL Server 数据库初始化完成！';
GO
