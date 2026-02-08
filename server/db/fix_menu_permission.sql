-- 修复菜单权限问题
USE nest_admin;

-- 1. 确保管理员角色（role_id=2）存在
INSERT IGNORE INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) 
VALUES (2, '普通角色', 'common', 2, '1', '1', '1', '0', '0', 'admin', NOW(), 'admin', NOW(), '普通角色');

-- 2. 确保管理员用户有角色
INSERT IGNORE INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1), (1, 2);

-- 3. 清空并重新插入菜单数据
DELETE FROM sys_role_menu WHERE role_id = 2;

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
(2, 1038), (2, 1039), (2, 1040), (2, 1041), (2, 1042), (2, 1043), (2, 1044),
(2, 1045), (2, 1046), (2, 1047), (2, 1048), (2, 1049), (2, 1050), (2, 1051), (2, 1052), (2, 1053), (2, 1054), (2, 1055), (2, 1056), (2, 1057), (2, 1058);

-- 4. 验证结果
SELECT '=== 检查结果 ===' as '';
SELECT '用户角色关联:' as info;
SELECT ur.user_id, ur.role_id, r.role_name
FROM sys_user_role ur
LEFT JOIN sys_role r ON ur.role_id = r.role_id;

SELECT '角色菜单关联数量:' as info;
SELECT role_id, COUNT(*) as menu_count
FROM sys_role_menu
GROUP BY role_id;

SELECT '一级菜单列表:' as info;
SELECT menu_id, menu_name, parent_id, order_num, status, visible, menu_type
FROM sys_menu
WHERE parent_id = 0 AND del_flag = '0'
ORDER BY order_num;
