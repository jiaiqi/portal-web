-- 清理外部链接数据，去除反引号和多余空格
UPDATE `cms_article`
SET `external_link` = TRIM(BOTH '`' FROM TRIM(`external_link`))
WHERE `content_type` = 'link' AND `external_link` LIKE '%`%';

-- 查看清理后的结果
SELECT `article_id`, `title`, `external_link` 
FROM `cms_article` 
WHERE `content_type` = 'link';
