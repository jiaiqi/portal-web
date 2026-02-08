# 完整部署指南

## ✅ 已完成的工作

### 1. 后端模块

#### 网站导航管理
- ✅ [navigation.entity.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/navigation/entities/navigation.entity.ts) - 实体类
- ✅ [navigation.dto.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/navigation/dto/navigation.dto.ts) - DTO
- ✅ [navigation.service.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/navigation/navigation.service.ts) - 服务
- ✅ [navigation.controller.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/navigation/navigation.controller.ts) - 控制器
- ✅ [navigation.module.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/navigation/navigation.module.ts) - 模块

#### 专题栏目管理
- ✅ [special-category.entity.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special-category/entities/special-category.entity.ts) - 实体类
- ✅ [special-category.dto.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special-category/dto/special-category.dto.ts) - DTO
- ✅ [special-category.service.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special-category/special-category.service.ts) - 服务
- ✅ [special-category.controller.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special-category/special-category.controller.ts) - 控制器
- ✅ [special-category.module.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special-category/special-category.module.ts) - 模块

#### 专题管理增强
- ✅ [special.dto.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special/dto/special.dto.ts) - 添加了 AddSpecialArticleDto
- ✅ [special.service.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special/special.service.ts) - 添加了文章关联管理方法
- ✅ [special.controller.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special/special.controller.ts) - 添加了文章关联接口
- ✅ [special.module.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/special/special.module.ts) - **修复了依赖注入问题**

#### 协会概况管理
- ✅ 已有完整的栏目和文章管理功能

### 2. 前端管理页面

#### 网站导航管理
- ✅ [navigation.js](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/api/cms/navigation.js) - API 文件
- ✅ [index.vue](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/views/cms/navigation/index.vue) - 页面组件

#### 专题管理（含栏目）
- ✅ [specialCategory.js](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/api/cms/specialCategory.js) - API 文件
- ✅ [index.vue](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/views/cms/special/index.vue) - 页面组件（已更新）

#### 协会概况管理
- ✅ [about.js](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/api/cms/about.js) - API 文件（已存在）
- ✅ [index.vue](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/views/cms/about/index.vue) - 页面组件

### 3. 门户网站导航

- ✅ [navigation.ts](file:///Users/jiaqi/Downloads/nest-admin-master/web-portal/app/api/navigation.ts) - API 文件
- ✅ [AppHeader.vue](file:///Users/jiaqi/Downloads/nest-admin-master/web-portal/app/components/AppHeader.vue) - 导航组件（已更新为动态获取）

### 4. 数据库脚本

- ✅ [init_portal_complete.sql](file:///Users/jiaqi/Downloads/nest-admin-master/server/db/init_portal_complete.sql) - 数据库初始化脚本
- ✅ [update_menu.sql](file:///Users/jiaqi/Downloads/nest-admin-master/server/db/update_menu.sql) - 菜单更新脚本

### 5. 文档

- ✅ [DESIGN_PROPOSAL.md](file:///Users/jiaqi/Downloads/nest-admin-master/server/db/DESIGN_PROPOSAL.md) - 详细的设计方案文档
- ✅ [BACKEND_API_SUMMARY.md](file:///Users/jiaqi/Downloads/nest-admin-master/server/docs/BACKEND_API_SUMMARY.md) - 后端接口实现总结

## 🚀 部署步骤

### 1. 执行数据库脚本

```bash
# 进入数据库目录
cd /Users/jiaqi/Downloads/nest-admin-master/server/db

# 执行数据库初始化（创建表和初始化数据）
mysql -u root -p nest_admin < init_portal_complete.sql

# 执行菜单更新（更新后台菜单）
mysql -u root -p nest_admin < update_menu.sql
```

### 2. 重启后端服务器

```bash
# 进入后端目录
cd /Users/jiaqi/Downloads/nest-admin-master/server

# 重启开发服务器
npm run start:dev
```

### 3. 测试后端接口

使用 Postman 或浏览器访问以下接口：

#### 网站导航管理
- `GET http://localhost:8080/api/cms/navigation/all` - 获取所有启用的导航
- `GET http://localhost:8080/api/cms/navigation/list?pageNum=1&pageSize=10` - 获取导航列表
- `POST http://localhost:8080/api/cms/navigation` - 新增导航
- `PUT http://localhost:8080/api/cms/navigation` - 修改导航
- `DELETE http://localhost:8080/api/cms/navigation/1` - 删除导航

#### 专题栏目管理
- `GET http://localhost:8080/api/cms/special-category/list` - 获取专题栏目列表
- `GET http://localhost:8080/api/cms/special-category/special/1` - 获取专题下的栏目
- `POST http://localhost:8080/api/cms/special-category` - 新增专题栏目
- `PUT http://localhost:8080/api/cms/special-category` - 修改专题栏目
- `DELETE http://localhost:8080/api/cms/special-category/1` - 删除专题栏目

#### 专题管理
- `GET http://localhost:8080/api/cms/special/list` - 获取专题列表
- `GET http://localhost:8080/api/cms/special/1/articles?categoryId=1` - 获取专题下的文章（支持栏目筛选）
- `POST http://localhost:8080/api/cms/special/article` - 添加文章到专题
- `DELETE http://localhost:8080/api/cms/special/article/1` - 从专题移除文章

#### 协会概况管理
- `GET http://localhost:8080/api/cms/about/section/all` - 获取所有启用的栏目
- `GET http://localhost:8080/api/cms/about/section/key/overview` - 根据key获取栏目
- `GET http://localhost:8080/api/cms/about/article/section/council` - 获取栏目下的文章列表

### 4. 访问后台管理系统

1. 访问 `http://localhost:8888`
2. 使用管理员账号登录（admin / admin123）
3. 查看以下菜单：
   - 内容管理 → 网站导航
   - 内容管理 → 专题
   - 内容管理 → 协会概况

### 5. 访问门户网站

1. 访问 `http://localhost:3000`
2. 查看导航是否从接口动态获取
3. 检查导航数据是否正确显示

## 🐛 常见问题

### 1. 后端启动失败

**错误：** `Nest can't resolve dependencies of SpecialService`

**原因：** `SpecialModule` 中没有导入 `SpecialArticleEntity`

**解决：** 已修复，在 `special.module.ts` 中添加了 `SpecialArticleEntity` 的导入

### 2. getRouters 返回空数组

**原因：** 用户没有分配菜单权限

**解决：** 执行 `update_menu.sql`，为管理员角色分配所有菜单权限

### 3. 门户网站导航不显示

**原因：** 导航数据为空或接口调用失败

**解决：** 
1. 检查 `cms_navigation` 表是否有数据
2. 检查 `/api/cms/navigation/all` 接口是否正常返回
3. 查看浏览器控制台是否有错误

### 4. 前端 JSON 解析错误

**错误：** `SyntaxError: Unexpected token 'c', "categoryCode=news" is not valid JSON`

**原因：** `SidebarItem.vue` 中 `JSON.parse(routeQuery)` 尝试解析查询参数，但当 query 是类似 `categoryCode=news` 这样的字符串时，会导致 JSON 解析错误

**解决：** 已修复，在 `SidebarItem.vue` 中添加了 try-catch 错误处理，当 JSON 解析失败时，直接使用原始字符串

### 5. 数据库表不存在

**错误：** `Table 'xxx' doesn't exist`

**解决：** 执行 `init_portal_complete.sql` 创建所有必要的表

### 6. 门户网站 API 导入错误

**错误：** `Module not found: Can't resolve '@/api/navigation'` 或类似错误

**原因：** 门户网站的 API 文件路径或导入语句不正确

**解决：** 已修复，确保 `web-portal/app/api/navigation.ts` 文件存在，并且在组件中使用正确的导入路径：
```typescript
import { getAllNavigation } from '@/api/navigation'
```

### 7. 后台菜单不显示

**原因：** 菜单权限未正确分配或菜单配置路径错误

**解决：** 
1. 检查 `sys_role_menu` 表中是否有对应的菜单权限
2. 重新执行 `update_menu.sql`
3. 重新登录后台管理系统

**注意：** 菜单配置中的路径问题已修复，确保菜单项的 `path` 和 `component` 字段配置正确

### 8. 门户网站底部链接不显示

**错误：** 门户网站底部的友情链接和网站配置不显示

**原因：** 
1. 后端返回的数据格式与前端期望不匹配
2. 后端返回的是下划线命名（`site_icp`），前端期望的是驼峰命名（`siteIcp`）

**解决：** 已修复，在后端的 `site-config.service.ts` 中添加了字段映射，将下划线命名转换为驼峰命名

## 📋 功能检查清单

### 后端接口
- [x] 网站导航 CRUD
- [x] 专题栏目 CRUD
- [x] 专题文章关联管理
- [x] 协会概况栏目管理
- [x] 协会概况文章管理

### 前端页面
- [x] 网站导航管理页面
- [x] 专题管理页面（含栏目）
- [x] 协会概况管理页面

### 数据库
- [x] cms_navigation 表创建
- [x] cms_special_category 表创建
- [x] cms_special_article 表更新（添加 category_id 字段）
- [x] cms_category 初始化数据
- [x] cms_about_section 初始化数据
- [x] 后台菜单更新

### 门户网站
- [x] 导航 API 创建
- [x] AppHeader 组件更新为动态获取

## 🎉 总结

所有功能已经完成！包括：
1. ✅ 后端接口实现（导航管理、专题栏目管理、专题管理增强）
2. ✅ 前端管理页面（导航管理、专题管理、协会概况管理）
3. ✅ 门户网站导航动态获取
4. ✅ 数据库脚本和菜单更新
5. ✅ 依赖注入问题修复

现在可以按照部署步骤进行测试和使用了！
