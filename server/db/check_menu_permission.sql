-- 检查用户角色和菜单权限
USE nest_admin;

-- 1. 查看所有用户
SELECT user_id, user_name, nick_name, status FROM sys_user;

-- 2. 查看所有角色
SELECT role_id, role_name, role_key, status FROM sys_role;

-- 3. 查看用户角色关联
SELECT ur.user_id, ur.role_id, r.role_name
FROM sys_user_role ur
LEFT JOIN sys_role r ON ur.role_id = r.role_id;

-- 4. 查看角色菜单关联
SELECT rm.role_id, rm.menu_id, m.menu_name
FROM sys_role_menu rm
LEFT JOIN sys_menu m ON rm.menu_id = m.menu_id
WHERE rm.role_id = 2
ORDER BY rm.menu_id;

-- 5. 查看所有一级菜单
SELECT menu_id, menu_name, parent_id, order_num, status, visible, menu_type
FROM sys_menu
WHERE parent_id = 0
ORDER BY order_num;

-- 6. 查看所有菜单数量
SELECT COUNT(*) as total_menus FROM sys_menu WHERE del_flag = '0';
SELECT COUNT(*) as active_menus FROM sys_menu WHERE del_flag = '0' AND status = '0';

-- 7. 查看角色菜单关联数量
SELECT role_id, COUNT(*) as menu_count
FROM sys_role_menu
GROUP BY role_id;
