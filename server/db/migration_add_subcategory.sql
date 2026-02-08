-- ============================================
-- 子分类功能数据库迁移脚本
-- ============================================

-- 1. 检查并添加 sub_category_id 字段（MySQL 兼容方式）
-- 先检查字段是否存在
SET @column_exists = (
    SELECT COUNT(*) 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'cms_article' 
    AND COLUMN_NAME = 'sub_category_id'
    AND TABLE_SCHEMA = DATABASE()
);

-- 如果字段不存在，则添加
SET @add_column_sql = IF(@column_exists = 0, 
    'ALTER TABLE cms_article ADD COLUMN sub_category_id INT NULL COMMENT "子分类ID" AFTER category_id',
    'SELECT "sub_category_id 字段已存在" AS message'
);

PREPARE stmt FROM @add_column_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 2. 获取要闻动态分类的ID
SET @news_category_id = (SELECT category_id FROM cms_category WHERE category_code = 'news' LIMIT 1);

-- 如果找不到，使用默认值 1
SET @news_category_id = IFNULL(@news_category_id, 1);

-- 3. 删除已存在的子分类（避免重复）
DELETE FROM cms_category WHERE category_code IN ('news_important', 'news_info');

-- 4. 插入子分类：要闻
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
) VALUES (
    '要闻',
    'news_important',
    @news_category_id,
    1,
    '1',
    NULL,
    'admin',
    NOW(),
    'admin',
    NOW(),
    '0'
);

-- 5. 插入子分类：资讯
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
) VALUES (
    '资讯',
    'news_info',
    @news_category_id,
    2,
    '1',
    NULL,
    'admin',
    NOW(),
    'admin',
    NOW(),
    '0'
);

-- 6. 验证插入结果
SELECT 
    c1.category_id AS parent_id,
    c1.category_name AS parent_name,
    c2.category_id AS sub_category_id,
    c2.category_name AS sub_category_name,
    c2.category_code AS sub_category_code
FROM cms_category c1
JOIN cms_category c2 ON c2.parent_id = c1.category_id
WHERE c1.category_code = 'news';

-- ============================================
-- 迁移完成
-- ============================================
