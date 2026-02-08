# 文章列表分类过滤最终修复

## 问题

文章列表页面没有按菜单分类过滤文章，所有菜单都显示所有文章。

## 根本原因

后端返回的菜单 `query` 参数是字符串格式（如 `"categoryCode=news"`），但前端代码在 `SidebarItem.vue` 的 `resolvePath` 函数中：
1. 首先尝试用 `JSON.parse` 解析
2. 解析失败后，直接将字符串作为 `query` 对象传递
3. Vue Router 无法正确识别字符串格式的 `query` 参数

## 修复方案

修改 `SidebarItem.vue` 中的 `resolvePath` 函数，当 `JSON.parse` 失败且字符串包含 `=` 时，将其解析为 URL 查询字符串格式。

## 修改内容

### SidebarItem.vue

```javascript
function resolvePath(routePath, routeQuery) {
  if (isExternal(routePath)) {
    return routePath
  }
  if (isExternal(props.basePath)) {
    return props.basePath
  }
  if (routeQuery) {
    let query
    try {
      query = JSON.parse(routeQuery)
    } catch (e) {
      // 如果不是 JSON 格式，尝试解析为 URL 查询字符串格式（如 "categoryCode=news"）
      if (typeof routeQuery === 'string' && routeQuery.includes('=')) {
        query = {}
        routeQuery.split('&').forEach(param => {
          const [key, value] = param.split('=')
          if (key && value !== undefined) {
            query[key] = value
          }
        })
      } else {
        query = routeQuery
      }
    }
    return { path: getNormalPath(props.basePath + '/' + routePath), query: query }
  }
  return getNormalPath(props.basePath + '/' + routePath)
}
```

## 工作流程

1. 用户点击"要闻动态"菜单
2. 后端返回的菜单数据包含 `query: "categoryCode=news"`
3. `SidebarItem.vue` 的 `resolvePath` 函数将字符串解析为对象 `{ categoryCode: 'news' }`
4. Vue Router 导航到 `/cms/article?categoryCode=news`
5. `article/index.vue` 从路由参数中获取 `categoryCode`
6. 调用后端接口 `/cms/article/list?categoryCode=news`
7. 后端根据 `categoryCode` 过滤文章列表

## 测试步骤

1. 重启后台管理系统
   ```bash
   cd /Users/jiaqi/Downloads/nest-admin-master/admin-vue3
   npm run dev
   ```

2. 打开浏览器开发者工具（F12），切换到 Network 标签

3. 点击"要闻动态"菜单
   - 检查页面 URL 是否包含 `?categoryCode=news`
   - 检查请求 URL 是否包含 `categoryCode=news`
   - 确认只显示 `news` 分类的文章

4. 点击"党建工作"菜单
   - 检查页面 URL 是否包含 `?categoryCode=party`
   - 检查请求 URL 是否包含 `categoryCode=party`
   - 确认只显示 `party` 分类的文章

5. 测试其他菜单（品牌活动、表彰激励、公告公示、全国联动）

## 验证方法

在浏览器控制台执行：
```javascript
// 检查当前路由参数
console.log($route.query)

// 应该输出：
// { categoryCode: 'news' }  // 如果点击的是要闻动态
// { categoryCode: 'party' } // 如果点击的是党建工作
// ...
```

## 注意事项

- 确保数据库中的 `cms_category` 表有对应的分类数据
- 确保菜单配置中的 `categoryCode` 与数据库中的 `category_code` 一致
- 如果菜单没有 `categoryCode` 参数，则显示所有文章（不分类过滤）
