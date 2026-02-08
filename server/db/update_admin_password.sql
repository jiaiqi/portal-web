-- 更新 admin 用户密码为 123456
-- 密码使用 bcrypt 加密

UPDATE sys_user 
SET password = '$2b$10$7JB720yubVSoevNNd6JOnu9BdmEY9v7PKq/73rX8y7wKNrTuqK3HC' 
WHERE user_name = 'admin';

-- 同时更新 ry 用户的密码
UPDATE sys_user 
SET password = '$2b$10$7JB720yubVSoevNNd6JOnu9BdmEY9v7PKq/73rX8y7wKNrTuqK3HC' 
WHERE user_name = 'ry';
