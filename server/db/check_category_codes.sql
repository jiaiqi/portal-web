-- 检查分类代码是否正确
SELECT category_id, category_name, category_code, parent_id, status, del_flag 
FROM cms_category 
WHERE del_flag = '0'
ORDER BY category_id;

-- 检查各分类下的文章数量
SELECT 
    c.category_name,
    c.category_code,
    COUNT(a.article_id) as article_count
FROM cms_category c
LEFT JOIN cms_article a ON a.category_id = c.category_id AND a.del_flag = '0' AND a.status = '1'
WHERE c.del_flag = '0'
GROUP BY c.category_id, c.category_name, c.category_code
ORDER BY c.category_id;
