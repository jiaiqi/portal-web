-- 修复 cms_visit_log 表结构，允许 page_url 和 page_type 为空
USE nest_admin;

ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_url` varchar(255) DEFAULT NULL COMMENT '访问页面';

ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_type` varchar(50) DEFAULT NULL COMMENT '页面类型：home首页 article文章 special专题';

-- 添加索引（如果不存在）
ALTER TABLE `cms_visit_log` ADD INDEX `idx_page_url` (`page_url`);
