-- 恢复 admin 超级管理员角色
-- 如果角色不存在则创建，存在则更新

-- 1. 恢复 admin 角色
INSERT INTO `sys_role` 
(`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES 
(1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', NOW(), 'admin', NOW(), '超级管理员')
ON DUPLICATE KEY UPDATE
`role_name` = '超级管理员',
`role_key` = 'admin',
`status` = '0',
`del_flag` = '0';

-- 2. 检查 admin 用户是否存在，如果不存在则创建
-- 默认密码: admin123 (需要替换为实际的加密密码)
INSERT INTO `sys_user` 
(`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES 
(1, 100, 'admin', '管理员', '00', 'admin@163.com', '15888888888', '0', '', '$2a$10$7JB720yubVSoevNNd6JOnu9BdmEY9v7PKq/73rX8y7wKNrTuqK3HC', '0', '0', '127.0.0.1', NOW(), 'admin', NOW(), '', NULL, '管理员')
ON DUPLICATE KEY UPDATE
`user_name` = 'admin',
`status` = '0',
`del_flag` = '0';

-- 3. 关联 admin 用户和 admin 角色
INSERT INTO `sys_user_role` (`user_id`, `role_id`)
VALUES (1, 1)
ON DUPLICATE KEY UPDATE `user_id` = 1;

-- 4. 给 admin 角色分配所有菜单权限
-- 先获取所有菜单ID
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`)
SELECT 1, menu_id FROM sys_menu WHERE del_flag = '0'
ON DUPLICATE KEY UPDATE role_id = 1;

-- 5. 验证 admin 角色是否恢复成功
SELECT 
    r.role_id,
    r.role_name,
    r.role_key,
    r.status,
    r.del_flag,
    u.user_id,
    u.user_name,
    u.nick_name,
    u.status as user_status
FROM sys_role r
LEFT JOIN sys_user_role ur ON r.role_id = ur.role_id
LEFT JOIN sys_user u ON ur.user_id = u.user_id
WHERE r.role_key = 'admin';

-- 6. 查看 admin 角色的菜单权限数量
SELECT COUNT(*) as menu_count FROM sys_role_menu WHERE role_id = 1;
