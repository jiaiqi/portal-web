-- 给内容审核员分配所有 CMS 内容管理菜单权限
-- 包括 CMS 管理及其所有子菜单

-- 获取内容审核员角色ID
SET @auditor_role_id = (SELECT role_id FROM sys_role WHERE role_key = 'content_auditor' LIMIT 1);

-- 1. 给内容审核员添加所有 CMS 相关的菜单权限
-- 包括 CMS 管理主菜单(parent_id=0) 和 所有 parent_id=2000 的子菜单
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE (
    -- CMS 管理主菜单
    (menu_name = 'CMS管理' AND parent_id = 0)
    -- 所有 CMS 下的子菜单 (parent_id = 2000)
    OR parent_id = 2000
    -- 所有 CMS 子菜单的子菜单
    OR parent_id IN (
        SELECT menu_id FROM sys_menu WHERE parent_id = 2000 AND del_flag = '0'
    )
)
AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 2. 验证内容审核员的菜单权限
SELECT 
    m.menu_id,
    m.menu_name,
    m.perms,
    m.menu_type,
    m.parent_id,
    CASE 
        WHEN m.parent_id = 0 THEN '主菜单'
        WHEN m.parent_id = 2000 THEN 'CMS子菜单'
        ELSE '按钮权限'
    END as menu_level,
    r.role_name
FROM sys_menu m
INNER JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
INNER JOIN sys_role r ON rm.role_id = r.role_id
WHERE r.role_key = 'content_auditor'
AND m.del_flag = '0'
ORDER BY m.parent_id, m.order_num;
