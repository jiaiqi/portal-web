-- 给内容审核员角色(role_id=100)分配所有 CMS 内容管理菜单权限

-- 获取内容审核员角色ID (role_id = 100)
SET @auditor_role_id = 100;

-- 1. 先删除内容审核员现有的菜单权限（避免重复）
DELETE FROM sys_role_menu WHERE role_id = @auditor_role_id;

-- 2. 给内容审核员添加所有 CMS 相关的菜单权限
-- 包括 CMS 管理主菜单 和 所有 CMS 子菜单及其按钮
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE (
    -- CMS 管理主菜单 (menu_id = 2000)
    menu_id = 2000
    -- 所有 CMS 下的子菜单 (parent_id = 2000)
    OR parent_id = 2000
    -- 所有 CMS 子菜单的子菜单
    OR parent_id IN (
        SELECT menu_id FROM sys_menu WHERE parent_id = 2000 AND del_flag = '0'
    )
)
AND del_flag = '0';

-- 3. 验证内容审核员的菜单权限
SELECT 
    m.menu_id,
    m.menu_name,
    m.perms,
    m.menu_type,
    m.parent_id,
    CASE 
        WHEN m.menu_id = 2000 THEN 'CMS主菜单'
        WHEN m.parent_id = 2000 THEN 'CMS子菜单'
        ELSE '按钮权限'
    END as menu_level
FROM sys_menu m
INNER JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
WHERE rm.role_id = @auditor_role_id
AND m.del_flag = '0'
ORDER BY m.parent_id, m.order_num;
