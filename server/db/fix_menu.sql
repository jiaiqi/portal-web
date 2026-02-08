-- 修复菜单数据 - 添加工作台菜单
USE nest_admin;

-- 删除可能存在的旧工作台菜单
DELETE FROM sys_menu WHERE menu_id = 4;

-- 插入工作台菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (4, '首页', 0, 4, 'index', 'dashboard/index', '', '1', '0', 'C', '0', '0', '', 'dashboard', 'admin', NOW(), 'admin', NOW(), '首页菜单', '0');

-- 为管理员角色（role_id=2）分配工作台菜单
INSERT IGNORE INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);

-- 检查结果
SELECT menu_id, menu_name, parent_id, order_num, path, component, menu_type, visible, status 
FROM sys_menu 
WHERE parent_id = 0 OR menu_id = 4
ORDER BY order_num;
