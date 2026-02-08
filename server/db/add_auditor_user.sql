-- 创建内容审核员初始账号
-- 用户名: auditor
-- 密码: auditor123
-- 角色: 内容审核员 (content_auditor)

-- 1. 确保内容审核员角色存在
INSERT INTO `sys_role` 
(`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
SELECT 3, '内容审核员', 'content_auditor', 3, '1', 1, 1, '0', '0', 'admin', NOW(), 'admin', NOW(), '负责审核文章内容'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM sys_role WHERE role_key = 'content_auditor');

-- 获取内容审核员角色ID
SET @auditor_role_id = (SELECT role_id FROM sys_role WHERE role_key = 'content_auditor' LIMIT 1);

-- 2. 创建内容审核员用户
-- 密码: auditor123 (BCrypt加密)
INSERT INTO `sys_user` 
(`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES 
(3, 100, 'auditor', '内容审核员', '00', 'auditor@163.com', '15999999999', '0', '', '$2a$10$7JB720yubVSoevNNd6JOnu9BdmEY9v7PKq/73rX8y7wKNrTuqK3HC', '0', '0', '127.0.0.1', NOW(), 'admin', NOW(), '', NULL, '内容审核员')
ON DUPLICATE KEY UPDATE
`user_name` = 'auditor',
`nick_name` = '内容审核员',
`status` = '0',
`del_flag` = '0';

-- 3. 关联用户和角色
INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES (3, @auditor_role_id)
ON DUPLICATE KEY UPDATE `role_id` = @auditor_role_id;

-- 4. 给内容审核员角色分配文章审核相关菜单权限
-- 先获取文章审核相关菜单ID
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT @auditor_role_id, menu_id FROM sys_menu 
WHERE perms LIKE '%cms:article:audit%' OR perms LIKE '%cms:article:publish%'
AND del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = @auditor_role_id;

-- 5. 验证内容审核员账号是否创建成功
SELECT 
    u.user_id,
    u.user_name,
    u.nick_name,
    u.email,
    u.phonenumber,
    u.status as user_status,
    r.role_id,
    r.role_name,
    r.role_key
FROM sys_user u
LEFT JOIN sys_user_role ur ON u.user_id = ur.user_id
LEFT JOIN sys_role r ON ur.role_id = r.role_id
WHERE u.user_name = 'auditor';

-- 6. 查看内容审核员角色的权限
SELECT 
    m.menu_id,
    m.menu_name,
    m.perms,
    m.menu_type
FROM sys_menu m
INNER JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
WHERE rm.role_id = @auditor_role_id
AND m.del_flag = '0'
ORDER BY m.menu_id;
