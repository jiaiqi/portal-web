# 文章列表页面更新说明

## 更新内容

### 1. 自动根据菜单分类过滤文章 ✅

**修改文件：** `admin-vue3/src/views/cms/article/index.vue`

**功能：**
- 从路由查询参数中获取 `categoryCode`（如 `news`, `party`, `activities` 等）
- 根据分类代码自动获取对应的分类信息
- 自动设置查询参数中的 `categoryId`，只显示当前分类下的文章

**涉及的菜单：**
- 要闻动态（categoryCode=news）
- 党建工作（categoryCode=party）
- 品牌活动（categoryCode=activities）
- 表彰激励（categoryCode=awards）
- 公告公示（categoryCode=notice）
- 全国联动（categoryCode=cooperation）

### 2. 移除搜索功能中的分类选择 ✅

**修改内容：**
- 删除了搜索表单中的"分类"选择框
- 保留了"文章标题"和"状态"搜索条件

### 3. 添加/编辑文章时自动设置分类 ✅

**修改内容：**
- 在添加文章对话框中，分类选择框设置为 `disabled`（不可修改）
- 新增文章时，自动将分类设置为当前菜单对应的分类
- 修改文章时，保持原有的分类不变

## 代码变更说明

### 新增依赖
```javascript
import { useRoute } from 'vue-router'
```

### 新增变量
```javascript
const route = useRoute()
const categoryCode = route.query.categoryCode  // 从路由参数获取分类代码
const currentCategory = ref(null)  // 当前分类信息
```

### 修改的函数

#### getCategoryList()
- 获取分类列表后，根据 `categoryCode` 查找对应的分类
- 设置 `currentCategory` 和 `queryParams.categoryId`
- 然后调用 `getList()` 获取文章列表

#### getList()
- 在获取文章列表前，自动设置 `categoryId`
- 确保只查询当前分类下的文章

#### resetQuery()
- 重置查询条件时，保留 `categoryId`
- 确保重置后仍然只显示当前分类的文章

#### reset()
- 重置表单时，将 `categoryId` 设置为当前分类的 ID
- 确保新增文章时自动使用正确的分类

## 使用说明

### 对于管理员

1. **查看文章列表**
   - 点击"要闻动态"菜单，自动显示 `news` 分类下的文章
   - 点击"党建工作"菜单，自动显示 `party` 分类下的文章
   - 其他菜单同理

2. **搜索文章**
   - 可以按"文章标题"搜索
   - 可以按"状态"搜索（草稿/已发布）
   - 不需要选择分类，系统会自动过滤当前分类

3. **添加文章**
   - 点击"新增"按钮
   - 分类会自动设置为当前菜单对应的分类（不可修改）
   - 填写其他信息后保存

4. **编辑文章**
   - 点击"修改"按钮
   - 分类会保持原有值（不可修改）
   - 修改其他信息后保存

### 对于开发者

如果要添加新的文章分类菜单，需要在 `update_menu.sql` 中添加菜单配置：

```sql
(menu_id, '菜单名称', parent_id, order_num, 'path', 'cms/article/index', 'categoryCode=your_category_code', ...)
```

确保 `categoryCode` 与数据库中的 `cms_category` 表的 `category_code` 字段对应。

## 测试步骤

1. 重启后台管理系统
   ```bash
   cd /Users/jiaqi/Downloads/nest-admin-master/admin-vue3
   npm run dev
   ```

2. 测试各个菜单
   - 访问"要闻动态"，确认只显示 `news` 分类的文章
   - 访问"党建工作"，确认只显示 `party` 分类的文章
   - 访问"品牌活动"，确认只显示 `activities` 分类的文章
   - 其他菜单同理

3. 测试搜索功能
   - 在"要闻动态"页面搜索，确认只搜索 `news` 分类的文章
   - 确认搜索表单中没有"分类"选择框

4. 测试添加文章
   - 在"要闻动态"页面点击"新增"
   - 确认分类自动设置为"要闻动态"（不可修改）
   - 保存后文章自动归类到"要闻动态"

5. 测试编辑文章
   - 修改一篇文章
   - 确认分类保持不变（不可修改）

## 注意事项

- 确保数据库中的 `cms_category` 表有对应的分类数据
- 确保菜单配置中的 `categoryCode` 与数据库中的 `category_code` 一致
- 如果菜单没有 `categoryCode` 参数，则显示所有文章（不分类过滤）
