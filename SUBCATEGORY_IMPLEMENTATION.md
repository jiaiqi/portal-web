# 子分类功能实现总结

## 功能需求

1. 在"要闻动态"分类下增加两个子分类："要闻"和"资讯"
2. 编辑文章时可以选择子分类，默认为"要闻"
3. 门户网站首页：
   - "要闻" tab 下查分类为"要闻资讯"，子分类是"要闻"的
   - "动态" tab 下查分类为"要闻资讯"，子分类为"资讯"的

## 实现内容

### 1. 数据库层面 ✅

**文件：** [migration_add_subcategory.sql](file:///Users/jiaqi/Downloads/nest-admin-master/server/db/migration_add_subcategory.sql)

**修改：**
- 在 `cms_article` 表添加 `sub_category_id` 字段
- 在 `cms_category` 表添加子分类数据（要闻、资讯）

### 2. 后端层面 ✅

**文件：**
- [article.entity.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/article/entities/article.entity.ts) - 添加 `subCategoryId` 字段
- [article.dto.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/article/dto/article.dto.ts) - 添加 `subCategoryId` 参数
- [article.service.ts](file:///Users/jiaqi/Downloads/nest-admin-master/server/src/module/cms/article/article.service.ts) - 支持按子分类查询

### 3. 后台管理页面 ✅

**文件：** [admin-vue3/src/views/cms/article/index.vue](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/views/cms/article/index.vue)

**修改：**
- 添加子分类选择框
- 新增文章时默认选择第一个子分类（要闻）
- 支持按子分类筛选文章

**API 文件：** [admin-vue3/src/api/cms/category.js](file:///Users/jiaqi/Downloads/nest-admin-master/admin-vue3/src/api/cms/category.js)
- 添加 `listSubCategory` 函数

### 4. 门户网站首页 ✅

**文件：**
- [useArticle.ts](file:///Users/jiaqi/Downloads/nest-admin-master/web-portal/app/composables/useArticle.ts) - 添加 `subCategoryId` 参数
- [index.vue](file:///Users/jiaqi/Downloads/nest-admin-master/web-portal/app/pages/index.vue) - 根据子分类查询文章

**逻辑：**
- 首先获取子分类ID
- "要闻" tab 查询子分类为"要闻"的文章
- "动态" tab 查询子分类为"资讯"的文章

## 部署步骤

### 1. 执行数据库迁移

```bash
cd /Users/jiaqi/Downloads/nest-admin-master/server/db
mysql -u root -p nest_admin < migration_add_subcategory.sql
```

### 2. 重启后端服务器

```bash
cd /Users/jiaqi/Downloads/nest-admin-master/server
npm run start:dev
```

### 3. 重启后台管理系统

```bash
cd /Users/jiaqi/Downloads/nest-admin-master/admin-vue3
npm run dev
```

### 4. 重启门户网站

```bash
cd /Users/jiaqi/Downloads/nest-admin-master/web-portal
npm run dev
```

## 测试步骤

### 后台管理系统

1. **查看子分类**
   - 进入"内容管理" → "文章分类"
   - 确认"要闻动态"下有两个子分类："要闻"和"资讯"

2. **添加文章**
   - 进入"要闻动态"菜单
   - 点击"新增"
   - 确认子分类默认选择"要闻"
   - 可以选择切换到"资讯"
   - 保存文章

3. **查看文章列表**
   - 确认文章显示正确的子分类
   - 可以按子分类筛选文章

### 门户网站

1. **查看要闻 tab**
   - 访问首页
   - 确认"要闻" tab 显示的是子分类为"要闻"的文章

2. **查看动态 tab**
   - 点击"动态" tab
   - 确认显示的是子分类为"资讯"的文章

## 数据结构

### 子分类数据

| category_id | category_name | category_code | parent_id |
|-------------|---------------|---------------|-----------|
| 100 | 要闻 | news_important | 1 |
| 101 | 资讯 | news_info | 1 |

### 文章数据

| article_id | title | category_id | sub_category_id |
|------------|-------|-------------|-----------------|
| 1 | 文章标题1 | 1 | 100 |
| 2 | 文章标题2 | 1 | 101 |

## 注意事项

1. 子分类的 `category_code` 使用 `news_important` 和 `news_info`，避免与父分类冲突
2. 新增文章时默认选择第一个子分类（要闻）
3. 门户网站首页需要先获取子分类ID，再根据ID查询文章
4. 如果子分类不存在，门户网站会显示空列表

## 相关文件

- [migration_add_subcategory.sql](file:///Users/jiaqi/Downloads/nest-admin-master/server/db/migration_add_subcategory.sql) - 数据库迁移脚本
- [SUBCATEGORY_IMPLEMENTATION.md](file:///Users/jiaqi/Downloads/nest-admin-master/SUBCATEGORY_IMPLEMENTATION.md) - 本文档
