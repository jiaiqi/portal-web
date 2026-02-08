-- ============================================
-- 检查和修复子分类数据
-- ============================================

-- 1. 先查看当前的分类数据
SELECT category_id, category_name, category_code, parent_id, status, del_flag 
FROM cms_category 
ORDER BY category_id;

-- 2. 查看是否有 sub_category_id 字段
SHOW COLUMNS FROM cms_article;

-- 3. 手动添加 sub_category_id 字段（如果不存在）
-- 注意：如果字段已存在，这条语句会报错，可以忽略
ALTER TABLE cms_article 
ADD COLUMN sub_category_id INT NULL COMMENT '子分类ID' 
AFTER category_id;

-- 4. 获取要闻动态分类的ID
SELECT category_id, category_name, category_code 
FROM cms_category 
WHERE category_code = 'news';

-- 5. 删除可能存在的旧子分类
DELETE FROM cms_category WHERE category_code IN ('news_important', 'news_info');

-- 6. 手动插入子分类（假设要闻动态的 category_id = 1）
-- 如果实际的 category_id 不是 1，请修改下面的 parent_id 值
INSERT INTO cms_category (
    category_name,
    category_code,
    parent_id,
    sort_order,
    status,
    icon,
    create_by,
    create_time,
    update_by,
    update_time,
    del_flag
) VALUES 
('要闻', 'news_important', 1, 1, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0'),
('资讯', 'news_info', 1, 2, '1', NULL, 'admin', NOW(), 'admin', NOW(), '0');

-- 7. 验证子分类是否正确插入
SELECT 
    c1.category_id AS parent_id,
    c1.category_name AS parent_name,
    c2.category_id AS sub_category_id,
    c2.category_name AS sub_category_name,
    c2.category_code AS sub_category_code,
    c2.parent_id
FROM cms_category c1
JOIN cms_category c2 ON c2.parent_id = c1.category_id
WHERE c1.category_code = 'news';

-- ============================================
-- 完成
-- ============================================
