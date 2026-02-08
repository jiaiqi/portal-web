# 文章列表分类过滤修复说明

## 问题

文章列表页面没有按菜单分类过滤文章，所有菜单都显示所有文章。

## 原因

前端代码中传递的是 `categoryId`，但后端接口支持的是 `categoryCode`。虽然前端尝试根据 `categoryCode` 查找 `categoryId`，但这种方式不够直接。

## 修复方案

直接在前端传递 `categoryCode` 给后端，由后端根据 `categoryCode` 自动查找对应的分类并过滤文章。

## 修改内容

### 1. 修改 queryParams 初始化

```javascript
const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
  title: undefined,
  categoryId: undefined,
  categoryCode: categoryCode || undefined, // 从路由参数获取分类代码
  status: undefined,
})
```

### 2. 修改 getList() 函数

```javascript
function getList() {
  loading.value = true
  // 直接传递 categoryCode 给后端，后端会自动处理
  listArticle(queryParams.value).then(response => {
    // ...
  })
}
```

### 3. 修改 resetQuery() 函数

```javascript
function resetQuery() {
  queryRef.value.resetFields()
  // 重置时保留分类代码
  queryParams.value.categoryCode = categoryCode || undefined
  handleQuery()
}
```

## 后端接口支持

后端 `article.service.ts` 中的 `findList()` 方法已经支持 `categoryCode` 参数：

```typescript
async findList(query: ArticleListDto): Promise<ResultData> {
  const { pageNum = 1, pageSize = 10, categoryId, categoryCode, title, status } = query;

  const where: any = { delFlag: '0' };
  if (categoryId) where.categoryId = categoryId;
  if (title) where.title = Like(`%${title}%`);
  if (status) where.status = status;

  // 如果提供了分类编码，先查询分类ID
  if (categoryCode) {
    const category = await this.categoryRepository.findOne({
      where: { categoryCode, status: '1', delFlag: '0' }
    });
    if (category) {
      where.categoryId = category.categoryId;
    }
  }

  // ...
}
```

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

3. 验证方法
   - 打开浏览器开发者工具（F12）
   - 切换到 Network 标签
   - 点击不同的菜单，查看请求 URL
   - 确认请求中包含了 `categoryCode` 参数
   - 例如：`/cms/article/list?pageNum=1&pageSize=10&categoryCode=news`

## 注意事项

- 确保数据库中的 `cms_category` 表有对应的分类数据
- 确保菜单配置中的 `categoryCode` 与数据库中的 `category_code` 一致
- 如果菜单没有 `categoryCode` 参数，则显示所有文章（不分类过滤）
