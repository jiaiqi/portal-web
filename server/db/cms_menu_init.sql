-- CMS 菜单数据初始化脚本
-- 创建日期: 2026-02-06

USE nest_admin;

-- ----------------------------
-- 1. 删除已存在的 CMS 菜单
-- ----------------------------
DELETE FROM sys_menu WHERE menu_id >= 2000 AND menu_id < 3000;

-- ----------------------------
-- 2. 插入 CMS 菜单
-- ----------------------------

-- 内容管理父菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) VALUES (2000, '内容管理', 0, 5, 'cms', '', '', '1', '0', 'M', '0', '0', '', 'list', 'admin', NOW(), 'admin', NOW(), '内容管理目录', '0');

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
(2040, '公告管理', 2000, 5, 'notice', 'cms/notice/index', '', '1', '0', 'C', '0', '0', 'cms:notice:list', 'list', 'admin', NOW(), 'admin', NOW(), '公告管理菜单', '0'),
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
