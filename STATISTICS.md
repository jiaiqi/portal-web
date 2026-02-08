# 访问统计功能说明

## 功能概述

已为门户网站实现完整的访问统计功能，包括：
1. 访问日志记录
2. 访问量统计（PV/UV）
3. 页面访问追踪
4. 趋势分析

## 后端实现

### 1. 数据库表

已创建两个统计表：

**cms_visit_log** - 访问日志表
- log_id: 日志ID
- page_url: 访问页面
- page_type: 页面类型（home首页、article文章、special专题）
- ref_type_id: 关联ID
- ip_address: IP地址
- user_agent: 浏览器信息
- visit_time: 访问时间

**cms_statistics** - 统计汇总表
- stat_date: 统计日期
- total_pv: 总PV
- total_uv: 总UV
- article_pv: 文章页PV
- article_uv: 文章页UV
- home_pv: 首页PV
- home_uv: 首页UV
- special_pv: 专题页PV
- special_uv: 专题页UV
- other_pv: 其他页PV
- other_uv: 其他页UV

### 2. API接口

已创建以下统计接口：

| 接口 | 方法 | 说明 |
|------|------|------|
| `/cms/statistics/record` | POST | 记录访问 |
| `/cms/statistics/total` | GET | 获取总访问量 |
| `/cms/statistics/today` | GET | 获取今日访问量 |
| `/cms/statistics/trend?days=7` | GET | 获取访问趋势 |

### 3. 文件结构

```
server/src/module/cms/statistics/
├── entities/
│   ├── statistics.entity.ts
│   └── visit-log.entity.ts
├── dto/
│   └── record-visit.dto.ts
├── statistics.controller.ts
├── statistics.service.ts
└── statistics.module.ts
```

## 前端实现

### 1. Composables

已创建两个 composables：

**useStatistics.ts** - 统计数据获取
```typescript
import { useStatistics } from '~/composables/useStatistics'

const { getTotalVisits } = useStatistics()

// 获取总访问量
const total = await getTotalVisits()
```

**usePageTracking.ts** - 页面访问追踪
```typescript
import { usePageTracking } from '~/composables/usePageTracking'

const { trackPageVisit } = usePageTracking()

// 追踪页面访问
trackPageVisit('home')              // 首页
trackPageVisit('article', articleId)  // 文章页
trackPageVisit('special', specialId)  // 专题页
```

### 2. 已集成的页面

以下页面已自动集成访问追踪：

- **首页** (`/pages/index.vue`) - 追踪首页访问
- **文章详情页** (`/pages/article/[id]/index.vue`) - 追踪文章访问
- **公告详情页** (`/pages/announcements/[id].vue`) - 追踪公告访问

### 3. 底部访问量显示

底部组件 (`AppFooter.vue`) 已更新为从接口获取真实访问量：

```vue
<p class="visit-count">网站总访问量 : {{ totalVisits }}</p>
```

## 使用方法

### 1. 在新页面中添加访问追踪

```vue
<script setup lang="ts">
import { usePageTracking } from '~/composables/usePageTracking'

const { trackPageVisit } = usePageTracking()

// 根据页面类型追踪
trackPageVisit('home')              // 首页
trackPageVisit('article', articleId)  // 文章页（传入文章ID）
trackPageVisit('special', specialId)  // 专题页（传入专题ID）
</script>
```

### 2. 获取统计数据

```vue
<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useStatistics } from '~/composables/useStatistics'

const { getTotalVisits, getTodayVisits } = useStatistics()

const totalVisits = ref(0)
const todayVisits = ref(0)

onMounted(async () => {
  totalVisits.value = await getTotalVisits()
  todayVisits.value = await getTodayVisits()
})
</script>
```

### 3. 调用统计API

```typescript
import { useApi } from '~/composables/useApi'

const api = useApi()

// 获取总访问量
const total = await api.get('/cms/statistics/total')

// 获取今日访问量
const today = await api.get('/cms/statistics/today')

// 获取访问趋势（最近7天）
const trend = await api.get('/cms/statistics/trend?days=7')
```

## 数据统计说明

### PV（Page View）
- 页面浏览量
- 每次页面加载或刷新计为1次
- 不区分同一用户多次访问

### UV（Unique Visitor）
- 独立访客数
- 基于IP地址去重
- 同一IP在同一天内多次访问只计为1次

### 页面类型分类

| 类型 | 说明 | 示例 |
|------|------|------|
| home | 首页 | / |
| article | 文章页 | /article/123 |
| special | 专题页 | /special/456 |
| other | 其他页面 | /about, /contact 等 |

## 注意事项

1. **性能优化**: 访问记录是异步的，不会阻塞页面加载
2. **错误处理**: 统计接口失败不会影响页面正常显示
3. **隐私保护**: 不记录用户敏感信息，仅记录必要的统计数据
4. **数据清理**: 建议定期清理历史访问日志，避免数据量过大

## 扩展建议

1. **添加UV统计**: 当前仅统计PV，可以基于IP+日期去重实现UV统计
2. **热力图**: 记录用户点击位置，生成页面热力图
3. **用户行为**: 记录用户停留时间、跳出率等指标
4. **来源追踪**: 记录访问来源（搜索引擎、直接访问、外链等）
5. **设备统计**: 记录访问设备类型（PC、手机、平板）

## 故障排查

### 访问量不更新

1. 检查浏览器控制台是否有错误
2. 检查后端接口是否正常：`/cms/statistics/total`
3. 检查网络请求是否成功
4. 检查数据库表是否存在数据

### 统计接口返回错误

1. 检查后端服务是否启动
2. 检查数据库连接是否正常
3. 检查统计模块是否正确注册
4. 查看后端日志获取详细错误信息

## 技术支持

如有问题，请查看：
- 后端日志：`server/logs/`
- 前端控制台：浏览器开发者工具
- API文档：`http://localhost:8080/api/swagger-ui/`
