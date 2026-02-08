/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027 (8.0.27)
 Source Host           : localhost:3306
 Source Schema         : nest_admin

 Target Server Type    : MySQL
 Target Server Version : 80027 (8.0.27)
 File Encoding         : 65001

 Date: 28/02/2025 17:07:11

 合并说明：
 本文件合并了以下初始化脚本：
 1. init.sql - 系统基础表结构及数据
 2. cms_init.sql - CMS模块表结构及基础数据
 3. cms_menu_init.sql - CMS菜单权限数据
 4. cms_default_data.sql - CMS默认业务数据

 修复的问题：
 1. 修复了 cms_init.sql 中的重复序号问题（第4节和第6节重复）
 2. 统一了分类数据，避免重复插入冲突
 3. 统一了单页数据的 page_key 命名
 4. 统一了快捷链接数据
 5. 调整了文章数据的 category_id 引用，使用确定的ID
 6. 优化了数据插入顺序，确保外键关联正确
 7. 移除了 DELETE 语句，避免误删数据
 8. 统一使用 nest_admin 数据库名

 使用说明：
 1. 先创建数据库：CREATE DATABASE nest_admin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 2. 然后执行本 SQL 文件
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 使用数据库
USE nest_admin;

-- ============================================================
-- 第一部分：系统基础表结构 (来自 init.sql)
-- ============================================================

-- 代码生成业务表
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

-- 代码生成业务表字段
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

-- 参数配置表
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

-- 部门表
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

-- 字典数据表
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

-- 字典类型表
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

-- 定时任务表
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务表';

-- 任务调度日志表
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

-- 系统访问记录
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

-- 菜单权限表
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
) ENGINE=InnoDB AUTO_INCREMENT=3000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

-- 通知公告表
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

-- 操作日志记录
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NOT NULL DEFAULT '0' COMMENT '业务类型',
  `request_method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NOT NULL DEFAULT '0' COMMENT '操作类别',
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
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

-- 岗位信息表
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

-- 角色信息表
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

-- 角色和部门关联表
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色ID',
  `dept_id` int NOT NULL DEFAULT '0' COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

-- 角色和菜单关联表
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int NOT NULL DEFAULT '0' COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

-- 文件上传记录
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

-- 用户信息表
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

-- 用户与岗位关联表
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `post_id` int NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

-- 用户和角色关联表
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

-- ============================================================
-- 第二部分：CMS 模块表结构
-- ============================================================

-- 文章分类表
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

-- 文章表
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

-- 专题表
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

-- 专题文章关联表
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

-- 焦点图表
DROP TABLE IF EXISTS `cms_focus`;
CREATE TABLE `cms_focus` (
  `focus_id` int NOT NULL AUTO_INCREMENT COMMENT '焦点图ID',
  `title` varchar(200) DEFAULT NULL COMMENT '焦点图标题',
  `image_url` varchar(500) NOT NULL COMMENT '图片URL',
  `image_type` varchar(20) NOT NULL DEFAULT 'big' COMMENT '图片类型：big大图 small小图',
  `link_url` varchar(500) DEFAULT NULL COMMENT '跳转链接',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常 1停用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`focus_id`),
  KEY `idx_image_type` (`image_type`),
  KEY `idx_status` (`status`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='焦点图表';

-- 公告表
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

-- 轮播图表
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT COMMENT '轮播图ID',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `link_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `position` varchar(50) NOT NULL DEFAULT 'home' COMMENT '位置：home首页 focus首页焦点 right_top右侧顶部 right_platform右侧平台',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '状态：0禁用 1启用',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`banner_id`),
  KEY `idx_status` (`status`),
  KEY `idx_position` (`position`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='轮播图表';

-- 友情链接表
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

-- 快捷链接表
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

-- 单页内容表
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

-- 协会概况栏目表
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

-- 协会文章表（理事会等列表类型栏目使用）
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

-- 访问日志表
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

-- 统计汇总表
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

-- ============================================================
-- 第三部分：系统基础数据
-- ============================================================

-- 参数配置数据
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `status`, `del_flag`) VALUES 
(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', NOW(), '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '0', '0'),
(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', NOW(), '', NULL, '初始化密码 123456', '0', '0'),
(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', NOW(), '', NULL, '深色主题theme-dark，浅色主题theme-light', '0', '0'),
(4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', NOW(), '', NULL, '是否开启验证码功能（true开启，false关闭）', '0', '0'),
(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', NOW(), '', NULL, '是否开启注册用户功能（true开启，false关闭）', '0', '0'),
(6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', NOW(), '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）', '0', '0');

-- 部门数据
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES 
(100, 0, '0', 'CMS科技', 0, 'CMS', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(101, 100, '0,100', '深圳总公司', 1, 'CMS', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(102, 100, '0,100', '长沙分公司', 2, 'CMS', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(103, 101, '0,100,101', '研发部门', 1, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(104, 101, '0,100,101', '市场部门', 2, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(105, 101, '0,100,101', '测试部门', 3, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(106, 101, '0,100,101', '财务部门', 4, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(107, 101, '0,100,101', '运维部门', 5, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(108, 102, '0,100,102', '市场部门', 1, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL),
(109, 102, '0,100,102', '财务部门', 2, 'cms-admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', NOW(), '', NULL, NULL);

-- 字典类型数据
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(1, '用户性别', 'sys_user_sex', '0', 'admin', NOW(), '', NULL, '用户性别列表', '0'),
(2, '菜单状态', 'sys_show_hide', '0', 'admin', NOW(), '', NULL, '菜单状态列表', '0'),
(3, '系统开关', 'sys_normal_disable', '0', 'admin', NOW(), '', NULL, '系统开关列表', '0'),
(4, '任务状态', 'sys_job_status', '0', 'admin', NOW(), '', NULL, '任务状态列表', '0'),
(5, '任务分组', 'sys_job_group', '0', 'admin', NOW(), '', NULL, '任务分组列表', '0'),
(6, '系统是否', 'sys_yes_no', '0', 'admin', NOW(), '', NULL, '系统是否列表', '0'),
(7, '通知类型', 'sys_notice_type', '0', 'admin', NOW(), '', NULL, '通知类型列表', '0'),
(8, '通知状态', 'sys_notice_status', '0', 'admin', NOW(), '', NULL, '通知状态列表', '0'),
(9, '操作类型', 'sys_oper_type', '0', 'admin', NOW(), '', NULL, '操作类型列表', '0'),
(10, '系统状态', 'sys_common_status', '0', 'admin', NOW(), '', NULL, '登录状态列表', '0');

-- 字典数据
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', NOW(), '', NULL, '性别男', '0'),
(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', NOW(), '', NULL, '性别女', '0'),
(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', NOW(), '', NULL, '性别未知', '0'),
(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', NOW(), '', NULL, '显示菜单', '0'),
(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '隐藏菜单', '0'),
(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', NOW(), '', NULL, '正常状态', '0'),
(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '停用状态', '0'),
(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', NOW(), '', NULL, '正常状态', '0'),
(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '停用状态', '0'),
(10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', NOW(), '', NULL, '默认分组', '0'),
(11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', NOW(), '', NULL, '系统分组', '0'),
(12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', NOW(), '', NULL, '系统默认是', '0'),
(13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '系统默认否', '0'),
(14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', NOW(), '', NULL, '通知', '0'),
(15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', NOW(), '', NULL, '公告', '0'),
(16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', NOW(), '', NULL, '正常状态', '0'),
(17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '关闭状态', '0'),
(18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', NOW(), '', NULL, '其他操作', '0'),
(19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', NOW(), '', NULL, '新增操作', '0'),
(20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', NOW(), '', NULL, '修改操作', '0'),
(21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '删除操作', '0'),
(22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '授权操作', '0'),
(23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', NOW(), '', NULL, '导出操作', '0'),
(24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', NOW(), '', NULL, '导入操作', '0'),
(25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '强退操作', '0'),
(26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', NOW(), '', NULL, '生成操作', '0'),
(27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '清空操作', '0'),
(28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '正常状态', '0'),
(29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', NOW(), '', NULL, '停用状态', '0');

-- 定时任务数据
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES 
(1, '系统默认（无参）', 'DEFAULT', 'task.noParams', '0/10 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, ''),
(2, '系统默认（有参）', 'DEFAULT', 'task.params(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, ''),
(3, '系统默认（多参）', 'DEFAULT', 'task.multipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', NOW(), '', NULL, '');

-- 菜单数据
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(1, '系统管理', 0, 2, 'system', NULL, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', NOW(), '', NULL, '系统管理目录', '0'),
(2, '系统监控', 0, 3, 'monitor', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', NOW(), '', NULL, '系统监控目录', '0'),
(3, '系统工具', 0, 4, 'tool', NULL, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', NOW(), '', NULL, '系统工具目录', '0'),
(100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', NOW(), '', NULL, '用户管理菜单', '0'),
(101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', NOW(), '', NULL, '角色管理菜单', '0'),
(102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', NOW(), '', NULL, '菜单管理菜单', '0'),
(103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', NOW(), '', NULL, '部门管理菜单', '0'),
(104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', NOW(), '', NULL, '岗位管理菜单', '0'),
(105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', NOW(), '', NULL, '字典管理菜单', '0'),
(106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', NOW(), '', NULL, '参数设置菜单', '0'),
(107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', NOW(), '', NULL, '通知公告菜单', '0'),
(108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', NOW(), '', NULL, '日志管理菜单', '0'),
(109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', NOW(), '', NULL, '在线用户菜单', '0'),
(110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', NOW(), '', NULL, '定时任务菜单', '0'),
(111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', NOW(), '', NULL, '数据监控菜单', '1'),
(112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', NOW(), '', NULL, '服务监控菜单', '0'),
(113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', NOW(), '', NULL, '缓存监控菜单', '0'),
(114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', NOW(), '', NULL, '缓存列表菜单', '0'),
(115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', NOW(), '', NULL, '表单构建菜单', '0'),
(116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', NOW(), '', NULL, '代码生成菜单', '0'),
(117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', NOW(), '', NULL, '系统接口菜单', '0'),
(500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', NOW(), '', NULL, '操作日志菜单', '0'),
(501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', NOW(), '', NULL, '登录日志菜单', '0'),
(1000, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1001, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1002, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1003, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1004, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1005, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', NOW(), '', NULL, '', '0'),
(1006, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', NOW(), '', NULL, '', '0'),
(1007, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1008, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1009, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1010, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1011, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1012, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1013, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1014, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1015, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1016, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1017, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1018, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1019, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1020, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1021, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1022, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1023, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1024, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1025, '字典查询', 105, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1026, '字典新增', 105, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1027, '字典修改', 105, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1028, '字典删除', 105, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1029, '字典导出', 105, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1030, '参数查询', 106, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1031, '参数新增', 106, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1032, '参数修改', 106, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1033, '参数删除', 106, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1034, '参数导出', 106, 5, '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1035, '公告查询', 107, 1, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1036, '公告新增', 107, 2, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1037, '公告修改', 107, 3, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1038, '公告删除', 107, 4, '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1039, '操作查询', 500, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1040, '操作删除', 500, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1041, '日志导出', 500, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1042, '登录查询', 501, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1043, '登录删除', 501, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1044, '日志导出', 501, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1045, '账户解锁', 501, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', NOW(), '', NULL, '', '0'),
(1046, '在线查询', 109, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1047, '批量强退', 109, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', NOW(), '', NULL, '', '0'),
(1048, '单条强退', 109, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', NOW(), '', NULL, '', '0'),
(1049, '任务查询', 110, 1, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1050, '任务新增', 110, 2, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', NOW(), '', NULL, '', '0'),
(1051, '任务修改', 110, 3, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1052, '任务删除', 110, 4, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1053, '状态修改', 110, 5, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', NOW(), '', NULL, '', '0'),
(1054, '任务导出', 110, 6, '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', NOW(), '', NULL, '', '0'),
(1055, '生成查询', 116, 1, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', NOW(), '', NULL, '', '0'),
(1056, '生成修改', 116, 2, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', NOW(), '', NULL, '', '0'),
(1057, '生成删除', 116, 3, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', NOW(), '', NULL, '', '0'),
(1058, '导入代码', 116, 4, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', NOW(), '', NULL, '', '0'),
(1059, '预览代码', 116, 5, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', NOW(), '', NULL, '', '0'),
(1060, '生成代码', 116, 6, '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', NOW(), '', NULL, '', '0');

-- 系统公告数据
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `del_flag`, `remark`) VALUES 
(1, '温馨提醒：2018-07-01 cms-admin新版本发布啦', '2', '新版本内容', '0', 'admin', NOW(), '', NULL, '0', NULL),
(2, '维护通知：2018-07-01 cms-admin系统凌晨维护', '1', '维护内容', '0', 'admin', NOW(), '', NULL, '0', NULL);

-- 岗位数据
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(1, 'ceo', '董事长', 1, '0', 'admin', NOW(), '', NULL, '', '0'),
(2, 'se', '项目经理', 2, '0', 'admin', NOW(), '', NULL, '', '0'),
(3, 'hr', '人力资源', 3, '0', 'admin', NOW(), '', NULL, '', '0'),
(4, 'user', '普通员工', 4, '0', 'admin', NOW(), '', NULL, '', '0');

-- 角色数据
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES 
(1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', NOW(), '', NULL, '超级管理员'),
(2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', NOW(), '', NULL, '普通角色');

-- 角色部门关联
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES 
(2, 100),
(2, 101),
(2, 105);

-- 角色菜单关联（普通角色）
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES 
(2, 1), (2, 2), (2, 3), (2, 4), (2, 100), (2, 101), (2, 102), (2, 103), (2, 104), (2, 105),
(2, 106), (2, 107), (2, 108), (2, 109), (2, 110), (2, 111), (2, 112), (2, 113), (2, 114), (2, 115),
(2, 116), (2, 117), (2, 500), (2, 501), (2, 1000), (2, 1001), (2, 1002), (2, 1003), (2, 1004), (2, 1005),
(2, 1006), (2, 1007), (2, 1008), (2, 1009), (2, 1010), (2, 1011), (2, 1012), (2, 1013), (2, 1014), (2, 1015),
(2, 1016), (2, 1017), (2, 1018), (2, 1019), (2, 1020), (2, 1021), (2, 1022), (2, 1023), (2, 1024), (2, 1025),
(2, 1026), (2, 1027), (2, 1028), (2, 1029), (2, 1030), (2, 1031), (2, 1032), (2, 1033), (2, 1034), (2, 1035),
(2, 1036), (2, 1037), (2, 1038), (2, 1039), (2, 1040), (2, 1041), (2, 1042), (2, 1043), (2, 1044), (2, 1045),
(2, 1046), (2, 1047), (2, 1048), (2, 1049), (2, 1050), (2, 1051), (2, 1052), (2, 1053), (2, 1054), (2, 1055),
(2, 1056), (2, 1057), (2, 1058), (2, 1059), (2, 1060);

-- 用户数据
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `password`, `status`, `del_flag`, `login_ip`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `avatar`, `login_date`) VALUES 
(1, 103, 'admin', 'cms-admin', '00', 'ry@163.com', '15888888888', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '127.0.0.1', 'admin', NOW(), '', NULL, '管理员', '', NULL),
(2, 105, 'ry', 'cms-admin', '00', 'ry@qq.com', '15666666666', '1', '$2b$10$d4Z9Iq.v9J4pjX55I9mzRuPHsOMKLupOqxlb/UfbD9oYsYxd5ezeS', '0', '0', '127.0.0.1', 'admin', NOW(), '', NULL, '测试员', '', NULL);

-- 用户岗位关联
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES 
(1, 1),
(2, 2);

-- 用户角色关联
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES 
(1, 1),
(2, 2);

-- ============================================================
-- 第四部分：CMS 菜单权限数据
-- ============================================================

-- 内容管理父菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2000, '内容管理', 0, 1, 'cms', '', '', '1', '0', 'M', '0', '0', '', 'list', 'admin', NOW(), 'admin', NOW(), '内容管理目录', '0');

-- 文章管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2001, '文章管理', 2000, 1, 'article', 'cms/article/index', '', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', NOW(), 'admin', NOW(), '文章管理菜单', '0'),
(2002, '文章查询', 2001, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2003, '文章新增', 2001, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2004, '文章修改', 2001, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2005, '文章删除', 2001, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2006, '文章导出', 2001, 5, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 分类管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2010, '分类管理', 2000, 2, 'category', 'cms/category/index', '', '1', '0', 'C', '0', '0', 'cms:category:list', 'list', 'admin', NOW(), 'admin', NOW(), '分类管理菜单', '0'),
(2011, '分类查询', 2010, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2012, '分类新增', 2010, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2013, '分类修改', 2010, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2014, '分类删除', 2010, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 轮播图管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2020, '轮播图管理', 2000, 3, 'banner', 'cms/banner/index', '', '1', '0', 'C', '0', '0', 'cms:banner:list', 'list', 'admin', NOW(), 'admin', NOW(), '轮播图管理菜单', '0'),
(2021, '轮播图查询', 2020, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2022, '轮播图新增', 2020, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2023, '轮播图修改', 2020, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2024, '轮播图删除', 2020, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 焦点图管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2030, '焦点图管理', 2000, 4, 'focus', 'cms/focus/index', '', '1', '0', 'C', '0', '0', 'cms:focus:list', 'list', 'admin', NOW(), 'admin', NOW(), '焦点图管理菜单', '0'),
(2031, '焦点图查询', 2030, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:focus:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2032, '焦点图新增', 2030, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:focus:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2033, '焦点图修改', 2030, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:focus:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2034, '焦点图删除', 2030, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:focus:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 公告管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2040, '公告管理', 2000, 5, 'notification', 'cms/notice/index', '', '1', '0', 'C', '0', '0', 'cms:notice:list', 'list', 'admin', NOW(), 'admin', NOW(), '公告管理菜单', '0'),
(2041, '公告查询', 2040, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:notice:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2042, '公告新增', 2040, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:notice:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2043, '公告修改', 2040, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:notice:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2044, '公告删除', 2040, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:notice:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 友情链接
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2050, '友情链接', 2000, 6, 'link', 'cms/link/index', '', '1', '0', 'C', '0', '0', 'cms:link:list', 'list', 'admin', NOW(), 'admin', NOW(), '友情链接菜单', '0'),
(2051, '友情链接查询', 2050, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2052, '友情链接新增', 2050, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2053, '友情链接修改', 2050, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2054, '友情链接删除', 2050, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 单页管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2060, '单页管理', 2000, 7, 'page', 'cms/page/index', '', '1', '0', 'C', '0', '0', 'cms:page:list', 'list', 'admin', NOW(), 'admin', NOW(), '单页管理菜单', '0'),
(2061, '单页查询', 2060, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2062, '单页新增', 2060, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2063, '单页修改', 2060, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2064, '单页删除', 2060, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 快捷链接
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2070, '快捷链接', 2000, 8, 'quickLink', 'cms/quickLink/index', '', '1', '0', 'C', '0', '0', 'cms:quickLink:list', 'list', 'admin', NOW(), 'admin', NOW(), '快捷链接菜单', '0'),
(2071, '快捷链接查询', 2070, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2072, '快捷链接新增', 2070, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2073, '快捷链接修改', 2070, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2074, '快捷链接删除', 2070, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 专题管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2080, '专题管理', 2000, 9, 'special', 'cms/special/index', '', '1', '0', 'C', '0', '0', 'cms:special:list', 'list', 'admin', NOW(), 'admin', NOW(), '专题管理菜单', '0'),
(2081, '专题查询', 2080, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2082, '专题新增', 2080, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2083, '专题修改', 2080, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2084, '专题删除', 2080, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 协会概况管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2090, '协会概况', 2000, 10, 'about', '', '', '1', '0', 'M', '0', '0', '', 'list', 'admin', NOW(), 'admin', NOW(), '协会概况管理目录', '0');

-- 协会概况-栏目管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2091, '栏目管理', 2090, 1, 'aboutSection', 'cms/about/section', '', '1', '0', 'C', '0', '0', 'cms:about:list', 'list', 'admin', NOW(), 'admin', NOW(), '栏目管理菜单', '0'),
(2092, '栏目查询', 2091, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2093, '栏目新增', 2091, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2094, '栏目修改', 2091, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(2095, '栏目删除', 2091, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:about:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 协会概况-理事会文章管理
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES 
(2096, '理事会文章', 2090, 2, 'aboutArticle', 'cms/about/article', '', '1', '0', 'C', '0', '0', 'cms:about:list', 'list', 'admin', NOW(), 'admin', NOW(), '理事会文章管理菜单', '0');

-- ============================================================
-- 第五部分：CMS 默认业务数据
-- ============================================================

-- 分类数据（使用确定的ID，避免自增冲突）
INSERT INTO `cms_category` (`category_id`, `category_name`, `category_code`, `parent_id`, `sort_order`, `status`, `create_by`, `create_time`) VALUES 
(1, '要闻动态', 'news', 0, 1, '1', 'admin', NOW()),
(2, '资讯', 'information', 0, 2, '1', 'admin', NOW()),
(3, '公告公示', 'announcement', 0, 3, '1', 'admin', NOW()),
(4, '党建工作', 'party', 0, 4, '1', 'admin', NOW()),
(5, '品牌活动', 'activity', 0, 5, '1', 'admin', NOW()),
(6, '表彰激励', 'honor', 0, 6, '1', 'admin', NOW());

-- 焦点图数据
INSERT INTO `cms_focus` (`title`, `image_url`, `image_type`, `link_url`, `sort_order`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('焦点图大图', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/640_20250127152953A190.jpg', 'big', '', 1, '0', 'admin', 'admin', NOW(), NOW()),
('焦点图小图1', 'https://www.wyzyz.org/claav-api/profile/upload/2024/03/26/换届_20240326194203A028.png', 'small', '', 1, '0', 'admin', 'admin', NOW(), NOW()),
('焦点图小图2', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100743A007_20240103145744A044.png', 'small', '', 2, '0', 'admin', 'admin', NOW(), NOW()),
('焦点图小图3', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100333A006_20240103145721A043.png', 'small', '', 3, '0', 'admin', 'admin', NOW(), NOW());

-- 轮播图数据
INSERT INTO `cms_banner` (`title`, `image`, `link_url`, `position`, `sort_order`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('焦点横幅', 'https://www.wyzyz.org/claav-api/profile/upload/2025/12/30/mmexport1767076004004_20251230142654A441.jpg', '', 'focus', 1, '1', 'admin', 'admin', NOW(), NOW()),
('右侧顶部轮播图', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100209A005_20240103145859A047.png', '', 'right_top', 1, '1', 'admin', 'admin', NOW(), NOW()),
('右侧平台轮播图', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/03/20240103100840A009 (1)_20240103145523A040.png', '', 'right_platform', 1, '1', 'admin', 'admin', NOW(), NOW());

-- 文章数据（要闻动态 - category_id = 1）
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `publish_time`, `status`, `is_top`, `open_type`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('习近平致中国志愿服务联合会第三届会员代表大会的贺信', 1, '习近平致中国志愿服务联合会第三届会员代表大会的贺信', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210255A439.png', '<p>习近平致中国志愿服务联合会第三届会员代表大会的贺信内容...</p>', '2025-11-29 12:00:00', '1', '1', 'current', 'admin', 'admin', NOW(), NOW()),
('习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响', 1, '习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响', 'https://www.wyzyz.org/claav-api/profile/upload/2025/11/29/要闻_20251129210446A440.png', '<p>习近平总书记致中国志愿服务联合会第三届会员代表大会的贺信引发热烈反响内容...</p>', '2025-11-29 12:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('第12个中国文艺志愿者服务日|"强基工程"——"与人民同行"新时代文明实践中国文艺志愿者小分队走进辽宁沈阳', 1, '第12个中国文艺志愿者服务日活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095142_20250527095153A373.png', '<p>第12个中国文艺志愿者服务日活动内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('中央宣传思想文化工作领导小组关于认定命名第七届全国文明城市、文明村镇、文明单位和第三届全国文明家庭、文明校园的决定', 1, '中央宣传思想文化工作领导小组决定', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527095422_20250527095430A374.png', '<p>中央宣传思想文化工作领导小组决定内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('第12个中国文艺志愿者服务日|文艺志愿者们在行动', 1, '第12个中国文艺志愿者服务日活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/05/27/微信截图_20250527094917_20250527094929A372.png', '<p>第12个中国文艺志愿者服务日活动内容...</p>', '2025-05-27 12:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('共唱团圆家 百花再出发|"百花迎春——中国文学艺术界2025春节大联欢"报道', 1, '春节大联欢活动报道', 'https://www.wyzyz.org/claav-api/profile/upload/2025/01/27/微信截图_20250127152109_20250127152122A187.png', '<p>春节大联欢活动内容...</p>', '2025-01-27 15:20:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW());

-- 文章数据（资讯 - category_id = 2）
INSERT INTO `cms_article` (`title`, `category_id`, `summary`, `cover_image`, `content`, `publish_time`, `status`, `is_top`, `open_type`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('各地文艺志愿服务队积极开展"学雷锋"主题活动', 2, '各地文艺志愿服务队积极开展"学雷锋"主题活动', NULL, '<p>各地文艺志愿服务队积极开展"学雷锋"主题活动内容...</p>', '2025-03-05 16:00:00', '1', '1', 'current', 'admin', 'admin', NOW(), NOW()),
('中国文艺志愿者协会新增会员单位名单公布', 2, '中国文艺志愿者协会新增会员单位名单公布', NULL, '<p>中国文艺志愿者协会新增会员单位名单公布内容...</p>', '2025-03-01 10:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('关于开展2024年度文艺志愿服务项目申报工作的通知', 2, '关于开展2024年度文艺志愿服务项目申报工作的通知', NULL, '<p>关于开展2024年度文艺志愿服务项目申报工作的通知内容...</p>', '2025-02-28 09:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('2024年春节联欢晚会文艺志愿服务工作协调会召开', 2, '2024年春节联欢晚会文艺志愿服务工作协调会召开', NULL, '<p>2024年春节联欢晚会文艺志愿服务工作协调会召开内容...</p>', '2025-02-20 14:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('文艺志愿者走进社区开展送温暖活动', 2, '文艺志愿者走进社区开展送温暖活动', NULL, '<p>文艺志愿者走进社区开展送温暖活动内容...</p>', '2025-02-15 10:30:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW()),
('中国文艺志愿者协会举办新会员培训班', 2, '中国文艺志愿者协会举办新会员培训班', NULL, '<p>中国文艺志愿者协会举办新会员培训班内容...</p>', '2025-02-10 09:00:00', '1', '0', 'current', 'admin', 'admin', NOW(), NOW());

-- 公告数据
INSERT INTO `cms_notice` (`title`, `content`, `notice_type`, `status`, `is_top`, `sort_order`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('中国文联文艺志愿服务中心部门预算 （2025 年）', '中国文联文艺志愿服务中心部门预算内容...', 'notice', '0', '1', 1, 'admin', 'admin', NOW(), NOW()),
('第三届"时代风尚"学雷锋文艺志愿服务先进典型名单公布', '第三届"时代风尚"学雷锋文艺志愿服务先进典型名单公布内容...', 'notice', '0', '0', 2, 'admin', 'admin', NOW(), NOW()),
('中国文联文艺志愿服务中心2023年度部门决算', '中国文联文艺志愿服务中心2023年度部门决算内容...', 'notice', '0', '0', 3, 'admin', 'admin', NOW(), NOW()),
('中国文联文艺志愿服务中心部门决算（2022年度）', '中国文联文艺志愿服务中心部门决算（2022年度）内容...', 'notice', '0', '0', 4, 'admin', 'admin', NOW(), NOW()),
('公示｜第三届宣传推选"时代风尚"学雷锋文艺志愿服务先进典型公示名单', '公示｜第三届宣传推选"时代风尚"学雷锋文艺志愿服务先进典型公示名单内容...', 'announcement', '0', '0', 5, 'admin', 'admin', NOW(), NOW()),
('中国文联文艺志愿服务中心部门预算（2024年）', '中国文联文艺志愿服务中心部门预算（2024年）内容...', 'notice', '0', '0', 6, 'admin', 'admin', NOW(), NOW());

-- 单页数据（统一使用一套key）
INSERT INTO `cms_page` (`page_key`, `page_name`, `content`, `create_by`, `create_time`) VALUES
('about', '协会概况', '<p>中国文艺志愿者协会（China Literary and Art Volunteers'' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下...</p>', 'admin', NOW()),
('charter', '协会章程', '<p>中国文艺志愿者协会章程内容...</p>', 'admin', NOW()),
('leaders', '协会领导', '<p>协会领导介绍内容...</p>', 'admin', NOW()),
('council', '理事会', '<p>理事会介绍内容...</p>', 'admin', NOW()),
('regulations', '会员工作条例', '<p>会员工作条例内容...</p>', 'admin', NOW()),
('organization', '组织架构', '<p>组织架构介绍内容...</p>', 'admin', NOW()),
('contact', '联系方式', '<p>联系方式内容...</p>', 'admin', NOW());

-- 快捷链接数据（合并两套数据）
INSERT INTO `cms_quick_link` (`link_name`, `link_url`, `link_position`, `sort_order`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('中国文艺网', 'http://www.cflac.org.cn/', 'top', 1, '1', 'admin', 'admin', NOW(), NOW()),
('中国文联', 'http://www.cflac.org.cn/', 'top', 2, '1', 'admin', 'admin', NOW(), NOW()),
('中国文艺志愿服务智慧平台', 'https://zyfw.wenlian.com/', 'sidebar', 1, '1', 'admin', 'admin', NOW(), NOW()),
('协会简介', '/about', 'top', 3, '1', 'admin', 'admin', NOW(), NOW()),
('组织机构', '/about/leaders', 'top', 4, '1', 'admin', 'admin', NOW(), NOW()),
('理事会', '/about/council', 'top', 5, '1', 'admin', 'admin', NOW(), NOW()),
('制度建设', '/about/regulations', 'top', 6, '1', 'admin', 'admin', NOW(), NOW());

-- 友情链接数据
INSERT INTO `cms_link` (`link_name`, `link_url`, `link_type`, `sort_order`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('中国文艺网', 'http://www.cflac.org.cn', '0', 1, '1', 'admin', 'admin', NOW(), NOW()),
('中国志愿者服务网', 'http://www.chinavolunteer.cn', '0', 2, '1', 'admin', 'admin', NOW(), NOW()),
('中国文联', 'http://www.cflac.org.cn', '0', 3, '1', 'admin', 'admin', NOW(), NOW());

-- 专题数据
INSERT INTO `cms_special` (`title`, `cover_image`, `description`, `sort_order`, `status`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES
('时代风尚', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/时代风尚.jpg', '时代风尚专题', 1, '1', 'admin', 'admin', NOW(), NOW()),
('文艺志愿服务', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/文艺志愿服务.jpg', '文艺志愿服务专题', 2, '1', 'admin', 'admin', NOW(), NOW()),
('新时代文明实践', 'https://www.wyzyz.org/claav-api/profile/upload/2024/01/01/新时代文明实践.jpg', '新时代文明实践专题', 3, '1', 'admin', 'admin', NOW(), NOW());

-- 协会概况栏目数据
INSERT INTO `cms_about_section` (`section_id`, `section_key`, `section_name`, `section_type`, `content`, `sort_order`, `status`, `create_by`, `create_time`) VALUES
(1, 'overview', '协会概况', 'richText', '<p>中国文艺志愿者协会（China Literary and Art Volunteers'' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。</p><p>中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p><p>协会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平文化思想，培育和践行社会主义核心价值观，广泛动员文艺工作者、文艺爱好者投身志愿服务，弘扬奉献、友爱、互助、进步的志愿精神，丰富人民群众精神文化生活，推动文艺事业和志愿服务事业健康发展。</p>', 1, '1', 'admin', NOW()),
(2, 'charter', '协会章程', 'richText', '<p><strong>第一章 总则</strong></p><p>第一条 中国文艺志愿者协会（简称"中国文艺志愿者协会"，英文名称：China Literary and Art Volunteers'' Association，缩写：CLAVA）是由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。</p><p>第二条 本会的宗旨是：高举中国特色社会主义伟大旗帜，以马克思列宁主义、毛泽东思想、邓小平理论、"三个代表"重要思想、科学发展观、习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平文化思想，培育和践行社会主义核心价值观，广泛动员文艺工作者、文艺爱好者投身志愿服务，弘扬奉献、友爱、互助、进步的志愿精神，丰富人民群众精神文化生活，推动文艺事业和志愿服务事业健康发展。</p>', 2, '1', 'admin', NOW()),
(3, 'leadership', '协会领导', 'richText', '<p><strong>主席</strong></p><p>殷秀梅</p><p><strong>副主席</strong></p><p>（按姓氏笔画排序）</p><p>王  宏  冯双白  刘  劲  李  丹  何加林  张  凯  林  永  赵  保  姜  昆  姚建萍  黄渤  龚  宇  康  辉  寒  露</p><p><strong>秘书长</strong></p><p>李  丹（兼）</p>', 3, '1', 'admin', NOW()),
(4, 'council', '理事会', 'list', NULL, 4, '1', 'admin', NOW()),
(5, 'regulations', '会员工作条例', 'richText', '<p><strong>第一章 总则</strong></p><p>第一条 为加强中国文艺志愿者协会会员队伍建设，规范会员管理工作，根据《中国文艺志愿者协会章程》，制定本条例。</p><p>第二条 本会会员分为单位会员和个人会员。</p><p>第三条 会员入会自愿，退会自由。</p><p><strong>第二章 会员条件</strong></p><p>第四条 申请加入本会的会员，必须具备下列条件：</p><p>（一）拥护本会章程；</p><p>（二）有加入本会的意愿；</p><p>（三）在本会的业务领域内具有一定的影响；</p><p>（四）热心文艺志愿服务事业。</p>', 5, '1', 'admin', NOW());

-- 协会概况-理事会文章数据
INSERT INTO `cms_about_article` (`article_id`, `section_key`, `title`, `content`, `sort_order`, `status`, `create_by`, `create_time`) VALUES
(1, 'council', '中国文艺志愿者协会第二届理事会第一次会议在京召开', '<p>中国文艺志愿者协会第二届理事会第一次会议在北京召开，会议审议通过了第一届理事会工作报告，选举产生了新一届领导机构。</p><p>会议号召广大文艺志愿者深入学习贯彻习近平新时代中国特色社会主义思想，坚持以人民为中心的工作导向，积极投身文艺志愿服务事业。</p>', 1, '1', 'admin', NOW()),
(2, 'council', '中国文艺志愿者协会理事会审议通过2024年度工作计划', '<p>理事会审议通过了2024年度工作计划，明确了全年工作重点和目标任务。</p><p>会议强调，要紧紧围绕学习宣传贯彻党的二十大精神这条主线，组织开展形式多样的文艺志愿服务活动，为推动文艺事业高质量发展贡献力量。</p>', 2, '1', 'admin', NOW()),
(3, 'council', '理事会关于增补理事的决定', '<p>根据工作需要，经理事会审议通过，决定增补以下同志为理事会理事。</p><p>增补理事名单：（按姓氏笔画排序）</p><p>王某、李某、张某、刘某、陈某</p>', 3, '1', 'admin', NOW());

SET FOREIGN_KEY_CHECKS = 1;
