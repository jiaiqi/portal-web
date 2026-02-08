-- 添加要闻动态子分类
-- 先获取要闻动态分类的ID
SET @news_category_id = (SELECT category_id FROM cms_category WHERE category_code = 'news' LIMIT 1);

-- 删除已存在的子分类（避免重复）
DELETE FROM cms_category WHERE category_code IN ('news_important', 'news_info');

-- 插入子分类：要闻
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

-- 插入子分类：资讯
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

-- 验证插入结果
SELECT * FROM cms_category WHERE parent_id = @news_category_id;
