-- 文艺志愿者官网CMS模块菜单初始化脚本
-- 在后台管理系统中添加CMS管理菜单

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 添加CMS管理菜单
-- ----------------------------

-- 1. CMS管理主目录 (parent_id=0)
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2000, '内容管理', 0, 5, 'cms', NULL, '', '1', '0', 'M', '0', '0', '', 'documentation', 'admin', NOW(), '', NULL, 'CMS内容管理目录', '0');

-- 2. 文章管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2001, '文章管理', 2000, 1, 'article', 'cms/article/index', '', '1', '0', 'C', '0', '0', 'cms:article:list', 'edit', 'admin', NOW(), '', NULL, '文章管理菜单', '0');

-- 3. 分类管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2002, '分类管理', 2000, 2, 'category', 'cms/category/index', '', '1', '0', 'C', '0', '0', 'cms:category:list', 'tree', 'admin', NOW(), '', NULL, '分类管理菜单', '0');

-- 4. 轮播图管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2003, '轮播图管理', 2000, 3, 'banner', 'cms/banner/index', '', '1', '0', 'C', '0', '0', 'cms:banner:list', 'image', 'admin', NOW(), '', NULL, '轮播图管理菜单', '0');

-- 5. 专题管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2004, '专题管理', 2000, 4, 'special', 'cms/special/index', '', '1', '0', 'C', '0', '0', 'cms:special:list', 'tab', 'admin', NOW(), '', NULL, '专题管理菜单', '0');

-- 6. 友情链接管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2005, '友情链接', 2000, 5, 'link', 'cms/link/index', '', '1', '0', 'C', '0', '0', 'cms:link:list', 'link', 'admin', NOW(), '', NULL, '友情链接管理菜单', '0');

-- 7. 单页管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2006, '单页管理', 2000, 6, 'page', 'cms/page/index', '', '1', '0', 'C', '0', '0', 'cms:page:list', 'page', 'admin', NOW(), '', NULL, '单页管理菜单', '0');

-- 8. 快捷链接管理菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2007, '快捷链接', 2000, 7, 'quickLink', 'cms/quickLink/index', '', '1', '0', 'C', '0', '0', 'cms:quickLink:list', 'shortcut', 'admin', NOW(), '', NULL, '快捷链接管理菜单', '0');

-- ----------------------------
-- 文章管理按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2100, '文章查询', 2001, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2101, '文章新增', 2001, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2102, '文章修改', 2001, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2103, '文章删除', 2001, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:remove', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2104, '文章导出', 2001, 5, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:export', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 分类管理按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2200, '分类查询', 2002, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2201, '分类新增', 2002, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2202, '分类修改', 2002, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2203, '分类删除', 2002, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:category:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 轮播图管理按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2300, '轮播图查询', 2003, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2301, '轮播图新增', 2003, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2302, '轮播图修改', 2003, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2303, '轮播图删除', 2003, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:banner:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 专题管理按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2400, '专题查询', 2004, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2401, '专题新增', 2004, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2402, '专题修改', 2004, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2403, '专题删除', 2004, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:special:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 友情链接按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2500, '链接查询', 2005, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2501, '链接新增', 2005, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2502, '链接修改', 2005, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2503, '链接删除', 2005, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:link:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 单页管理按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2600, '单页查询', 2006, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2601, '单页新增', 2006, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2602, '单页修改', 2006, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2603, '单页删除', 2006, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:page:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 快捷链接按钮权限
-- ----------------------------
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2700, '快捷链接查询', 2007, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:query', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2701, '快捷链接新增', 2007, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:add', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2702, '快捷链接修改', 2007, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:edit', '#', 'admin', NOW(), '', NULL, '', '0');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (2703, '快捷链接删除', 2007, 4, '', '', '', '1', '0', 'F', '0', '0', 'cms:quickLink:remove', '#', 'admin', NOW(), '', NULL, '', '0');

-- ----------------------------
-- 将CMS菜单权限分配给管理员角色(role_id=1)
-- ----------------------------
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2006);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2007);
-- 按钮权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2100);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2101);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2102);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2103);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2104);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2200);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2201);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2202);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2203);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2300);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2301);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2302);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2303);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2400);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2401);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2402);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2403);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2500);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2501);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2502);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2503);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2600);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2601);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2602);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2603);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2700);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2701);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2702);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2703);

SET FOREIGN_KEY_CHECKS = 1;
