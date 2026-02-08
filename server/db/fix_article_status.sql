-- 修复文章状态，将草稿状态改为已发布
USE nest_admin;

-- 更新所有文章状态为已发布（status='1'）
UPDATE cms_article SET status = '1' WHERE status = '0';

-- 验证更新结果
SELECT status, COUNT(*) as count FROM cms_article GROUP BY status;
