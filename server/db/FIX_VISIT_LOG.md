# 修复访问统计表结构

## 问题描述

访问统计功能启动时出现错误：
```
Field 'page_url' doesn't have a default value
Field 'page_type' doesn't have a default value
```

## 原因

数据库表 `cms_visit_log` 中 `page_url` 和 `page_type` 字段定义为 `NOT NULL`，但实体类中定义为可空，导致 TypeORM 尝试插入 NULL 值时出错。

## 解决方案

### 方案一：手动执行 SQL（推荐）

1. 登录 MySQL：
```bash
mysql -u root -p
```

2. 选择数据库：
```sql
USE nest_admin;
```

3. 执行修复 SQL：
```sql
-- 修改 page_url 字段
ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_url` varchar(255) DEFAULT NULL COMMENT '访问页面';

-- 修改 page_type 字段
ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_type` varchar(50) DEFAULT NULL COMMENT '页面类型：home首页 article文章 special专题';

-- 添加索引
ALTER TABLE `cms_visit_log` 
ADD INDEX `idx_page_url` (`page_url`);
```

4. 退出 MySQL：
```sql
exit;
```

### 方案二：使用修复脚本

执行修复脚本：
```bash
mysql -u root -p nest_admin < server/db/fix_visit_log.sql
```

### 方案三：重新导入完整 SQL

如果数据库中没有重要数据，可以重新导入：
```bash
mysql -u root -p nest_admin < server/db/nest_admin_complete.sql
```

## 验证修复

执行修复后，重启后端服务：

```bash
# 如果使用 PM2
pm2 restart nest-admin-server

# 或者
npm run start:dev
```

检查日志是否还有错误：
```bash
pm2 logs nest-admin-server
```

## 表结构说明

修复后的 `cms_visit_log` 表结构：

| 字段名 | 类型 | 说明 | 是否可空 |
|--------|------|------|----------|
| log_id | int | 日志ID（主键）| NO |
| page_url | varchar(255) | 访问页面 | YES |
| page_type | varchar(50) | 页面类型 | YES |
| ref_type_id | int | 关联ID | YES |
| ip_address | varchar(128) | IP地址 | YES |
| user_agent | varchar(500) | 浏览器信息 | YES |
| visit_time | datetime(6) | 访问时间 | NO |

## 索引说明

- PRIMARY KEY: log_id
- idx_visit_time: visit_time
- idx_page_type: page_type
- idx_ref_type_id: ref_type_id
- idx_page_url: page_url

## 注意事项

1. **备份数据**: 执行 ALTER TABLE 前建议备份数据库
2. **生产环境**: 生产环境执行前先在测试环境验证
3. **服务影响**: 修改表结构期间可能短暂影响访问统计功能
4. **权限要求**: 需要 ALTER TABLE 权限

## 常见问题

### Q: 执行 SQL 时提示权限不足
A: 使用有足够权限的数据库用户，或联系数据库管理员

### Q: 修改后仍然报错
A: 检查 TypeORM 配置中的 synchronize 设置，建议设为 false

### Q: 如何回滚修改
A: 执行反向 SQL：
```sql
ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_url` varchar(255) NOT NULL COMMENT '访问页面';

ALTER TABLE `cms_visit_log` 
MODIFY COLUMN `page_type` varchar(50) NOT NULL COMMENT '页面类型：home首页 article文章 special专题';

ALTER TABLE `cms_visit_log` 
DROP INDEX `idx_page_url`;
```
