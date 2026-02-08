# CMS 门户首页数据导入说明

## 已完成的工作

### 1. 后端接口开发
- ✅ 创建公告管理模块 (Notice)
- ✅ 创建焦点图管理模块 (Focus)
- ✅ 创建门户聚合接口 (Portal)
- ✅ 调整 Banner 接口，添加位置字段
- ✅ 添加公开访问权限装饰器 (@Public)
- ✅ 修复 PortalModule 缺少 Controller 导入的问题

### 2. 前端 API 调用
- ✅ 创建 useApi.ts - 通用 API 调用
- ✅ 创建 usePortal.ts - 门户数据 API
- ✅ 创建 useArticle.ts - 文章 API
- ✅ 创建 useNotice.ts - 公告 API
- ✅ 修改首页使用真实接口数据
- ✅ 修改新闻列表页使用真实接口
- ✅ 修改公告列表页使用真实接口

### 3. 数据库初始化
- ✅ 创建数据库表结构 (cms_init.sql)
- ✅ 导入默认数据 (cms_default_data.sql)

## 数据导入统计

| 表名 | 记录数 | 说明 |
|------|--------|------|
| cms_focus | 8 | 焦点图（1大3小 + 重复） |
| cms_banner | 6 | 轮播图 |
| cms_article | 6 | 文章 |
| cms_notice | 6 | 公告 |
| cms_page | 4 | 单页 |
| cms_quick_link | 4 | 快捷链接 |
| cms_link | 3 | 友情链接 |
| cms_special | 3 | 专题 |

## 接口列表

### 公开访问接口（无需认证）
- `GET /cms/portal/home` - 获取门户首页所有数据

### 管理接口（需要认证）
- `GET /cms/focus/list` - 获取焦点图列表
- `GET /cms/focus/home` - 获取首页焦点图
- `GET /cms/focus/:id` - 获取焦点图详情
- `POST /cms/focus` - 新增焦点图
- `PUT /cms/focus` - 修改焦点图
- `DELETE /cms/focus/:id` - 删除焦点图

- `GET /cms/notice/list` - 获取公告列表
- `GET /cms/notice/:id` - 获取公告详情
- `POST /cms/notice` - 新增公告
- `PUT /cms/notice` - 修改公告
- `DELETE /cms/notice/:id` - 删除公告

- `GET /cms/banner/list` - 获取轮播图列表
- `GET /cms/banner/all` - 获取所有启用轮播图
- `GET /cms/banner/:id` - 获取轮播图详情
- `POST /cms/banner` - 新增轮播图
- `PUT /cms/banner` - 修改轮播图
- `DELETE /cms/banner/:id` - 删除轮播图

- `GET /cms/article/list` - 获取文章列表
- `GET /cms/article/:id` - 获取文章详情
- `POST /cms/article` - 新增文章
- `PUT /cms/article` - 修改文章
- `DELETE /cms/article/:id` - 删除文章

## 需要重启后端服务

由于修改了以下文件，需要重启后端服务才能生效：

1. **PortalModule** - 添加了 PortalController 导入
2. **BannerEntity** - 添加了 position 字段
3. **BannerService** - 添加了 findByPosition 方法

## 重启步骤

```bash
cd /Users/jiaqi/Downloads/cms-admin-master/server

# 停止当前运行的服务（如果有）
# Ctrl+C

# 重新启动
npm run start:dev
```

## 验证接口

重启后端服务后，访问以下地址验证：

- **门户首页数据**：http://localhost:8080/cms/portal/home
- **Swagger 文档**：http://localhost:8080/swagger-ui/

## 前端配置

确保前端配置了正确的 API Base URL：

```bash
# web-portal/.env
NUXT_PUBLIC_API_BASE_URL=http://localhost:8080
```

## 预期结果

重启后端服务后，门户首页应该能够正常显示：
- ✅ 焦点图（1大3小）
- ✅ 焦点横幅图
- ✅ 新闻列表（6条）
- ✅ 右侧轮播图（顶部和平台）
- ✅ 公告列表（6条）
- ✅ 协会概况信息
