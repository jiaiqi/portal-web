-- 完整的菜单初始化SQL
USE nest_admin;

-- 清空现有菜单数据
DELETE FROM sys_role_menu;
DELETE FROM sys_menu;

-- 插入一级菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1, '系统管理', 0, 1, 'system', NULL, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', NOW(), 'admin', NOW(), '系统管理目录', '0'),
(2, '系统监控', 0, 2, 'monitor', NULL, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', NOW(), 'admin', NOW(), '系统监控目录', '0'),
(3, '系统工具', 0, 3, 'tool', NULL, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', NOW(), 'admin', NOW(), '系统工具目录', '0'),
(4, '首页', 0, 4, 'index', 'dashboard/index', '', '1', '0', 'C', '0', '0', '', 'dashboard', 'admin', NOW(), 'admin', NOW(), '首页菜单', '0'),
(2000, '内容管理', 0, 5, 'cms', '', '', '1', '0', 'M', '0', '0', '', 'list', 'admin', NOW(), 'admin', NOW(), '内容管理目录', '0');

-- 插入系统管理子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(100, '用户管理', 1, 1, 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', NOW(), 'admin', NOW(), '用户管理菜单', '0'),
(101, '角色管理', 1, 2, 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', NOW(), 'admin', NOW(), '角色管理菜单', '0'),
(102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', NOW(), 'admin', NOW(), '菜单管理菜单', '0'),
(103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', NOW(), 'admin', NOW(), '部门管理菜单', '0'),
(104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', NOW(), 'admin', NOW(), '岗位管理菜单', '0'),
(105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', NOW(), 'admin', NOW(), '字典管理菜单', '0'),
(106, '参数设置', 1, 7, 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', NOW(), 'admin', NOW(), '参数设置菜单', '0'),
(107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', NOW(), 'admin', NOW(), '通知公告菜单', '0'),
(108, '日志管理', 1, 9, 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', NOW(), 'admin', NOW(), '日志管理菜单', '0');

-- 插入系统监控子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', NOW(), 'admin', NOW(), '在线用户菜单', '0'),
(110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', NOW(), 'admin', NOW(), '定时任务菜单', '0'),
(111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', NOW(), 'admin', NOW(), '数据监控菜单', '1'),
(112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', NOW(), 'admin', NOW(), '服务监控菜单', '0'),
(113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', NOW(), 'admin', NOW(), '缓存监控菜单', '0'),
(114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', NOW(), 'admin', NOW(), '缓存列表菜单', '0');

-- 插入系统工具子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', NOW(), 'admin', NOW(), '表单构建菜单', '0'),
(116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', NOW(), 'admin', NOW(), '代码生成菜单', '0'),
(117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', NOW(), 'admin', NOW(), '系统接口菜单', '0');

-- 插入日志管理子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', NOW(), 'admin', NOW(), '操作日志菜单', '0'),
(501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', NOW(), 'admin', NOW(), '登录日志菜单', '0');

-- 插入内容管理子菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(2001, '文章管理', 2000, 1, 'article', 'cms/article/index', '', '1', '0', 'C', '0', '0', 'cms:article:list', 'list', 'admin', NOW(), 'admin', NOW(), '文章管理菜单', '0'),
(2010, '分类管理', 2000, 2, 'category', 'cms/category/index', '', '1', '0', 'C', '0', '0', 'cms:category:list', 'list', 'admin', NOW(), 'admin', NOW(), '分类管理菜单', '0'),
(2020, '轮播图管理', 2000, 3, 'banner', 'cms/banner/index', '', '1', '0', 'C', '0', '0', 'cms:banner:list', 'list', 'admin', NOW(), 'admin', NOW(), '轮播图管理菜单', '0'),
(2030, '焦点图管理', 2000, 4, 'focus', 'cms/focus/index', '', '1', '0', 'C', '0', '0', 'cms:focus:list', 'list', 'admin', NOW(), 'admin', NOW(), '焦点图管理菜单', '0'),
(2040, '公告管理', 2000, 5, 'notice', 'cms/notice/index', '', '1', '0', 'C', '0', '0', 'cms:notice:list', 'list', 'admin', NOW(), 'admin', NOW(), '公告管理菜单', '0'),
(2050, '友情链接', 2000, 6, 'link', 'cms/link/index', '', '1', '0', 'C', '0', '0', 'cms:link:list', 'list', 'admin', NOW(), 'admin', NOW(), '友情链接菜单', '0'),
(2060, '单页管理', 2000, 7, 'page', 'cms/page/index', '', '1', '0', 'C', '0', '0', 'cms:page:list', 'list', 'admin', NOW(), 'admin', NOW(), '单页管理菜单', '0'),
(2070, '快捷链接', 2000, 8, 'quickLink', 'cms/quickLink/index', '', '1', '0', 'C', '0', '0', 'cms:quickLink:list', 'list', 'admin', NOW(), 'admin', NOW(), '快捷链接菜单', '0'),
(2080, '专题管理', 2000, 9, 'special', 'cms/special/index', '', '1', '0', 'C', '0', '0', 'cms:special:list', 'list', 'admin', NOW(), 'admin', NOW(), '专题管理菜单', '0'),
(2090, '协会概况', 2000, 10, 'about', 'cms/about/index', '', '1', '0', 'C', '0', '0', 'cms:about:list', 'list', 'admin', NOW(), 'admin', NOW(), '协会概况菜单', '0'),
(2100, '网站配置', 2000, 11, 'siteConfig', 'cms/siteConfig/index', '', '1', '0', 'C', '0', '0', 'cms:siteConfig:list', 'list', 'admin', NOW(), 'admin', NOW(), '网站配置菜单', '0');

-- 插入用户管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1000, '用户查询', 100, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1001, '用户新增', 100, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1002, '用户修改', 100, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1003, '用户删除', 100, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1004, '用户导出', 100, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1005, '用户导入', 100, 6, '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1006, '重置密码', 100, 7, '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入角色管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1007, '角色查询', 101, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1008, '角色新增', 101, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1009, '角色修改', 101, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1010, '角色删除', 101, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1011, '角色导出', 101, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入菜单管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1012, '菜单查询', 102, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1013, '菜单新增', 102, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1014, '菜单修改', 102, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1015, '菜单删除', 102, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入部门管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1016, '部门查询', 103, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1017, '部门新增', 103, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1018, '部门修改', 103, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1019, '部门删除', 103, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入岗位管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1020, '岗位查询', 104, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1021, '岗位新增', 104, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1022, '岗位修改', 104, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1023, '岗位删除', 104, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1024, '岗位导出', 104, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入字典管理按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1025, '字典查询', 105, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1026, '字典新增', 105, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1027, '字典修改', 105, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1028, '字典删除', 105, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入参数设置按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1029, '参数查询', 106, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1030, '参数新增', 106, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1031, '参数修改', 106, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1032, '参数删除', 106, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1033, '参数导出', 106, 5, '', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入通知公告按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1034, '通知查询', 107, 1, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1035, '通知新增', 107, 2, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1036, '通知修改', 107, 3, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1037, '通知删除', 107, 4, '', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入操作日志按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1038, '操作查询', 500, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1039, '操作删除', 500, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1040, '操作导出', 500, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入登录日志按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1041, '登录查询', 501, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1042, '登录删除', 501, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1043, '登录导出', 501, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入定时任务按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1044, '任务查询', 110, 1, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1045, '任务新增', 110, 2, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1046, '任务修改', 110, 3, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1047, '任务删除', 110, 4, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1048, '任务导出', 110, 5, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1049, '状态修改', 110, 6, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1050, '任务执行', 110, 7, '', '', '', '1', '0', 'F', '0', '0', 'monitor:job:execute', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 插入代码生成按钮权限
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
(1051, '生成查询', 116, 1, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1052, '生成修改', 116, 2, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1053, '生成删除', 116, 3, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1054, '导入代码', 116, 4, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1055, '预览代码', 116, 5, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1056, '生成代码', 116, 6, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
(1057, '下载代码', 116, 7, '', '', '', '1', '0', 'F', '0', '0', 'tool:gen:download', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 为管理员角色（role_id=2）分配所有菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES 
(2, 1), (2, 2), (2, 3), (2, 4), 
(2, 100), (2, 101), (2, 102), (2, 103), (2, 104), (2, 105), (2, 106), (2, 107), (2, 108), (2, 109), (2, 110), (2, 111), (2, 112), (2, 113), (2, 114), (2, 115), (2, 116), (2, 117),
(2, 500), (2, 501),
(2, 1000), (2, 1001), (2, 1002), (2, 1003), (2, 1004), (2, 1005), (2, 1006),
(2, 1007), (2, 1008), (2, 1009), (2, 1010), (2, 1011),
(2, 1012), (2, 1013), (2, 1014), (2, 1015),
(2, 1016), (2, 1017), (2, 1018), (2, 1019),
(2, 1020), (2, 1021), (2, 1022), (2, 1023), (2, 1024),
(2, 1025), (2, 1026), (2, 1027), (2, 1028),
(2, 1029), (2, 1030), (2, 1031), (2, 1032), (2, 1033),
(2, 1034), (2, 1035), (2, 1036), (2, 1037),
(2, 1038), (2, 1039), (2, 1040), (2, 1041), (2, 1042), (2, 1043),
(2, 1044), (2, 1045), (2, 1046), (2, 1047), (2, 1048), (2, 1049), (2, 1050), (2, 1051), (2, 1052), (2, 1053), (2, 1054), (2, 1055), (2, 1056), (2, 1057),
(2, 2000),
(2, 2001), (2, 2010), (2, 2020), (2, 2030), (2, 2040), (2, 2050), (2, 2060), (2, 2070), (2, 2080), (2, 2090), (2, 2100);

-- 查看结果
SELECT menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status 
FROM sys_menu 
WHERE parent_id = 0 OR menu_id = 4
ORDER BY order_num;
