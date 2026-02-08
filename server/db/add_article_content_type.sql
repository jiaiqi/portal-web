-- 添加文章内容类型和外部链接字段
ALTER TABLE `cms_article`
ADD COLUMN `content_type` VARCHAR(20) NOT NULL DEFAULT 'editor' COMMENT '内容类型：editor编辑器 link外部链接' AFTER `cover_image_source_type`,
ADD COLUMN `external_link` VARCHAR(500) NULL COMMENT '外部链接' AFTER `content`;

-- 查看表结构
DESCRIBE `cms_article`;
