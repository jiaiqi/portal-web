<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { useCategory } from '~/composables/useCategory'
import { usePageTracking } from '~/composables/usePageTracking'
import { useImage } from '~/composables/useImage'

const route = useRoute()
const { getArticleById, getCategoryByCode } = useCategory()
const { trackPageVisit } = usePageTracking()
const { getFullImageUrl } = useImage()

const articleId = computed(() => Number(route.params.id))
const fromCategory = computed(() => route.query.from as string)

// 追踪文章页访问
trackPageVisit('article', articleId.value)

const loading = ref(false)
const article = ref<any>(null)
const category = ref<any>(null)

// 分类名称映射
const categoryNameMap: Record<string, string> = {
  'news': '要闻动态',
  'party': '党建工作',
  'activity': '品牌活动',
  'honor': '表彰激励',
  'notice': '公告公示',
  'special': '专题',
  'cooperation': '全国联动'
}

// 面包屑导航
const breadcrumbs = computed(() => {
  const items = [
    { name: '首页', path: '/' }
  ]
  
  // 如果有来源分类，添加到面包屑
  if (fromCategory.value) {
    items.push({
      name: categoryNameMap[fromCategory.value] || category.value?.categoryName || '列表',
      path: `/category/${fromCategory.value}`
    })
  }
  
  // 添加文章标题
  items.push({
    name: article.value?.title || '文章详情',
    path: ''
  })
  
  return items
})

async function loadData() {
  if (!articleId.value) return
  
  loading.value = true
  try {
    // 获取文章详情
    const articleRes = await getArticleById(articleId.value)
    article.value = articleRes
    
    // 如果有来源分类，获取分类信息
    if (fromCategory.value) {
      const categoryRes = await getCategoryByCode(fromCategory.value)
      category.value = categoryRes
    }
  } catch (error) {
    console.error('加载数据失败:', error)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  loadData()
})
</script>

<template>
  <div class="article-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div :class="['list', { 'no-sidebar': fromCategory !== 'special' }]">
        <!-- 左侧栏目导航 - 仅专题显示 -->
        <div v-if="fromCategory === 'special'" class="second-menu">
          <h1 class="menu-title">栏目导航</h1>
          <ul class="menu-list">
            <li :class="{ active: fromCategory === 'news' }">
              <NuxtLink to="/category/news" class="menu-link">要闻动态</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'party' }">
              <NuxtLink to="/category/party" class="menu-link">党建工作</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'activity' }">
              <NuxtLink to="/category/activity" class="menu-link">品牌活动</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'honor' }">
              <NuxtLink to="/category/honor" class="menu-link">表彰激励</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'notice' }">
              <NuxtLink to="/category/notice" class="menu-link">公告公示</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'special' }">
              <NuxtLink to="/category/special" class="menu-link">专题</NuxtLink>
            </li>
            <li :class="{ active: fromCategory === 'cooperation' }">
              <NuxtLink to="/category/cooperation" class="menu-link">全国联动</NuxtLink>
            </li>
          </ul>
        </div>

        <!-- 右侧内容区域 -->
        <div :class="['content', { 'full-width': fromCategory !== 'special' }]">
          <!-- 加载状态 -->
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <!-- 文章内容 -->
          <div v-else class="article-detail">
            <h1 class="article-title">{{ article?.title }}</h1>
            
            <div class="article-meta">
              <span v-if="article?.author">作者：{{ article.author }}</span>
              <span v-if="article?.source">来源：{{ article.source }}</span>
              <span v-if="article?.publishTime || article?.createTime">
                发布时间：{{ article?.publishTime || article?.createTime }}
              </span>
              <span v-if="article?.viewCount">浏览量：{{ article.viewCount }}</span>
            </div>

            <div v-if="article?.coverImage" class="article-cover">
              <img :src="getFullImageUrl(article.coverImage)" :alt="article.title" />
            </div>

            <div v-if="article?.content" class="article-content rich-text" v-html="article.content"></div>
            
            <div v-else class="text-gray-500 text-center py-10">
              暂无内容
            </div>

            <!-- 返回按钮 -->
            <div class="article-footer">
              <NuxtLink 
                v-if="fromCategory" 
                :to="`/category/${fromCategory}`" 
                class="back-link"
              >
                ← 返回列表
              </NuxtLink>
              <NuxtLink 
                v-else 
                to="/" 
                class="back-link"
              >
                ← 返回首页
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.article-page {
  background: #ffffff;
  min-height: 100vh;
}

/* 无侧边栏时的布局 */
.list.no-sidebar {
  display: block;
}

.list.no-sidebar .content.full-width {
  width: 100%;
}

.article-detail {
  padding: 30px;
}

.article-title {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  line-height: 1.4;
  margin-bottom: 20px;
}

.article-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  padding: 15px 0;
  border-bottom: 1px solid #eee;
  margin-bottom: 30px;
  font-size: 14px;
  color: #666;
}

.article-cover {
  width: 100%;
  max-height: 400px;
  overflow: hidden;
  border-radius: 8px;
  margin-bottom: 30px;
}

.article-cover img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.article-content {
  line-height: 1.8;
  color: #333;
  font-size: 16px;
}

.article-content :deep(p) {
  margin-bottom: 16px;
}

.article-content :deep(img) {
  max-width: 100%;
  height: auto;
  border-radius: 4px;
}

.article-footer {
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid #eee;
}

.back-link {
  display: inline-flex;
  align-items: center;
  color: #c31f1f;
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s;
}

.back-link:hover {
  text-decoration: underline;
}

@media (max-width: 768px) {
  .article-detail {
    padding: 20px;
  }
  
  .article-title {
    font-size: 22px;
  }
  
  .article-meta {
    flex-direction: column;
    gap: 10px;
  }
}
</style>
