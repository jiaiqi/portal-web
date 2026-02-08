# 修复后台菜单问题

## 问题描述

后台管理系统只剩首页菜单，其他菜单（系统管理、内容管理等）都消失了。

## 原因分析

数据库 `sys_menu` 表中缺少工作台（首页）菜单，导致管理员角色（role_id=2）没有首页菜单权限。

## 解决方案

### 方案一：执行快速修复脚本（推荐）

执行修复脚本，添加首页菜单：

```bash
mysql -u root -p nest_admin < server/db/fix_menu.sql
```

### 方案二：执行完整菜单初始化

如果菜单数据完全混乱，可以执行完整初始化：

```bash
mysql -u root -p nest_admin < server/db/init_menu.sql
```

### 方案三：手动执行 SQL

登录 MySQL 后手动执行：

```sql
USE nest_admin;

-- 删除可能存在的旧工作台菜单
DELETE FROM sys_menu WHERE menu_id = 4;

-- 插入工作台菜单
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`, `del_flag`) 
VALUES (4, '首页', 0, 4, 'index', 'dashboard/index', '', '1', '0', 'C', '0', '0', '', 'dashboard', 'admin', NOW(), 'admin', NOW(), '首页菜单', '0');

-- 为管理员角色（role_id=2）分配工作台菜单
INSERT IGNORE INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (2, 4);
```

## 验证修复

执行修复后，重新登录后台管理系统，检查菜单是否正常显示。

## 菜单结构说明

修复后的菜单结构：

### 一级菜单
| menu_id | menu_name | order_num | path | icon |
|---------|-----------|-----------|------|-------|
| 4 | 首页 | 4 | index | dashboard |
| 1 | 系统管理 | 1 | system | system |
| 2 | 系统监控 | 2 | monitor | monitor |
| 3 | 系统工具 | 3 | tool | tool |
| 2000 | 内容管理 | 5 | cms | list |

### 系统管理子菜单
| menu_id | menu_name | parent_id | path | icon |
|---------|-----------|-----------|------|-------|
| 100 | 用户管理 | 1 | user | user |
| 101 | 角色管理 | 1 | role | peoples |
| 102 | 菜单管理 | 1 | menu | tree-table |
| 103 | 部门管理 | 1 | dept | tree |
| 104 | 岗位管理 | 1 | post | post |
| 105 | 字典管理 | 1 | dict | dict |
| 106 | 参数设置 | 1 | config | edit |
| 107 | 通知公告 | 1 | notice | message |
| 108 | 日志管理 | 1 | log | log |

### 内容管理子菜单
| menu_id | menu_name | parent_id | path | icon |
|---------|-----------|-----------|------|-------|
| 2001 | 文章管理 | 2000 | article | list |
| 2010 | 分类管理 | 2000 | category | list |
| 2020 | 轮播图管理 | 2000 | banner | list |
| 2030 | 焦点图管理 | 2000 | focus | list |
| 2040 | 公告管理 | 2000 | notice | list |
| 2050 | 友情链接 | 2000 | link | list |
| 2060 | 单页管理 | 2000 | page | list |
| 2070 | 快捷链接 | 2000 | quickLink | list |
| 2080 | 专题管理 | 2000 | special | list |
| 2090 | 协会概况 | 2000 | about | list |
| 2100 | 网站配置 | 2000 | siteConfig | list |

## 注意事项

1. **备份数据**: 执行 SQL 前建议备份数据库
2. **重新登录**: 修复后需要重新登录后台才能看到新菜单
3. **清除缓存**: 如果使用了 Redis 缓存，需要清除菜单缓存
4. **角色权限**: 确保管理员角色（role_id=2）有所有菜单权限

## 常见问题

### Q: 执行 SQL 后菜单还是不显示
A: 
1. 清除浏览器缓存
2. 重新登录后台
3. 检查 Redis 缓存是否清除
4. 查看浏览器控制台是否有错误

### Q: 部分菜单显示，部分不显示
A: 检查当前登录用户的角色是否有对应菜单权限，可以查询 `sys_role_menu` 表

### Q: 如何查看当前用户的菜单权限
A: 执行以下 SQL：
```sql
SELECT m.menu_id, m.menu_name, m.parent_id, m.path, m.component
FROM sys_menu m
INNER JOIN sys_role_menu rm ON m.menu_id = rm.menu_id
WHERE rm.role_id = 2
ORDER BY m.parent_id, m.order_num;
```

## 技术支持

如有问题，请查看：
- 后端日志：`server/logs/`
- 数据库日志：MySQL 错误日志
- API 文档：`http://localhost:8080/api/swagger-ui/`
