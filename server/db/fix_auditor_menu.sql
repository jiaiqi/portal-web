-- 修复内容审核员菜单权限
-- 给内容审核员添加 CMS 内容管理相关菜单权限

-- 获取内容审核员角色ID
SET @auditor_role_id = (SELECT role_id FROM sys_role WHERE role_key = 'content_auditor' LIMIT 1);

-- 1. 给内容审核员添加 CMS 管理主菜单权限（parent_id = 0 的 CMS 菜单）
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name = 'CMS管理' AND parent_id = 0 AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 2. 给内容审核员添加文章管理菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name = '文章管理' AND parent_id = 2000 AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 3. 给内容审核员添加文章管理子菜单权限（查询、新增、编辑、删除）
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE parent_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name = '文章管理' AND parent_id = 2000
) AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 4. 给内容审核员添加焦点图管理菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name = '焦点图管理' AND parent_id = 2000 AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 5. 给内容审核员添加焦点图管理子菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE parent_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name = '焦点图管理' AND parent_id = 2000
) AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 6. 给内容审核员添加公告管理菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name = '公告管理' AND parent_id = 2000 AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 7. 给内容审核员添加公告管理子菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE parent_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name = '公告管理' AND parent_id = 2000
) AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 8. 给内容审核员添加关于我们管理菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name = '关于我们' AND parent_id = 2000 AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 9. 给内容审核员添加关于我们子菜单权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE parent_id IN (
    SELECT menu_id FROM sys_menu WHERE menu_name = '关于我们' AND parent_id = 2000
) AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 10. 验证内容审核员的菜单权限
SELECT 
    m.menu_id,
    m.menu_name,
    m.perms,
    m.menu_type,
    m.parent_id,
    r.role_name
FROM sys_menu m
INNER JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
INNER JOIN sys_role r ON rm.role_id = r.role_id
WHERE r.role_key = 'content_auditor'
AND m.del_flag = '0'
ORDER BY m.parent_id, m.order_num;
