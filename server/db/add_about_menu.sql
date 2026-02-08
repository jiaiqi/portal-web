-- 协会概况管理菜单数据
-- 执行此脚本添加协会概况菜单到后台

USE nest_admin;

-- 协会概况管理父菜单
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

-- 为超级管理员角色（role_id=1）添加菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES 
(1, 2090), (1, 2091), (1, 2092), (1, 2093), (1, 2094), (1, 2095), (1, 2096);
