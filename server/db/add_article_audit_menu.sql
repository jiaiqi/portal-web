-- 添加文章审核菜单和权限
-- 此菜单只对管理员和内容审核员角色可见

-- 先确保 admin 角色存在
SET @admin_role_id = (SELECT role_id FROM sys_role WHERE role_key = 'admin' LIMIT 1);

-- 如果 admin 角色不存在，先创建
INSERT INTO `sys_role` 
(`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
SELECT 1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', NOW(), 'admin', NOW(), '超级管理员'
FROM DUAL
WHERE @admin_role_id IS NULL;

-- 重新获取 admin 角色 ID
SET @admin_role_id = IFNULL(@admin_role_id, 1);

-- 1. 添加文章审核菜单（在CMS管理下）
INSERT INTO `sys_menu` (`menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
('文章审核', 2000, 10, 'article-audit', 'cms/article-audit/index', '', '1', '0', 'C', '0', '0', 'cms:article:audit', 'check', 'admin', NOW(), 'admin', NOW(), '文章审核菜单', '0');

-- 获取刚插入的菜单ID
SET @audit_menu_id = LAST_INSERT_ID();

-- 2. 添加文章审核相关按钮权限
INSERT INTO `sys_menu` (`menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES 
('文章审核查询', @audit_menu_id, 1, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:query', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
('文章审核操作', @audit_menu_id, 2, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:audit:exec', '#', 'admin', NOW(), 'admin', NOW(), '', '0'),
('文章发布', @audit_menu_id, 3, '', '', '', '1', '0', 'F', '0', '0', 'cms:article:publish', '#', 'admin', NOW(), 'admin', NOW(), '', '0');

-- 3. 给管理员角色分配权限
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) 
SELECT @admin_role_id, menu_id FROM sys_menu 
WHERE menu_name IN ('文章审核', '文章审核查询', '文章审核操作', '文章发布') 
AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 4. 创建内容审核员角色（如果不存在）
INSERT INTO `sys_role` (`role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`)
SELECT '内容审核员', 'content_auditor', 3, '1', '0', 'admin', NOW(), 'admin', NOW(), '负责审核文章内容', '0'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM sys_role WHERE role_key = 'content_auditor');

-- 获取内容审核员角色ID
SET @auditor_role_id = (SELECT role_id FROM sys_role WHERE role_key = 'content_auditor' LIMIT 1);

-- 5. 给内容审核员角色分配文章审核相关权限（如果角色存在）
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) 
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE menu_name IN ('文章审核', '文章审核查询', '文章审核操作', '文章发布') 
AND del_flag = '0'
AND @auditor_role_id IS NOT NULL
ON DUPLICATE KEY UPDATE role_id = role_id;

-- 6. 验证菜单和权限是否添加成功
SELECT 
    m.menu_id,
    m.menu_name,
    m.perms,
    m.menu_type,
    r.role_name
FROM sys_menu m
LEFT JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
LEFT JOIN sys_role r ON rm.role_id = r.role_id
WHERE m.menu_name LIKE '%审核%' 
   OR m.perms LIKE '%audit%'
   OR m.perms LIKE '%publish%'
ORDER BY m.menu_id;
