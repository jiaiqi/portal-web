<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'
import { useCategory } from '~/composables/useCategory'
import { useImage } from '~/composables/useImage'

const route = useRoute()
const { getCategoryByCode, getArticlesByCategory, getChildCategories } = useCategory()
const { getFullImageUrl } = useImage()

const categoryCode = computed(() => route.params.code as string)

const loading = ref(false)
const category = ref<any>(null)
const articles = ref<any[]>([])
const childCategories = ref<any[]>([])
const total = ref(0)
const pageNum = ref(1)
const pageSize = ref(10)

// 生成分类名称映射
const categoryNameMap: Record<string, string> = {
  'news': '要闻动态',
  'party': '党建工作',
  'activity': '品牌活动',
  'honor': '表彰激励',
  'notice': '公告公示',
  'special': '专题',
  'cooperation': '全国联动'
}

const breadcrumbs = computed(() => [
  { name: '首页', path: '/' },
  { name: categoryNameMap[categoryCode.value] || category.value?.categoryName || '列表', path: `/category/${categoryCode.value}` }
])

async function loadData() {
  if (!categoryCode.value) return
  
  loading.value = true
  try {
    // 获取分类信息
    const categoryRes = await getCategoryByCode(categoryCode.value)
    category.value = categoryRes
    
    // 获取子分类
    if (categoryRes?.categoryId) {
      const childrenRes = await getChildCategories(categoryRes.categoryId)
      childCategories.value = childrenRes
    }
    
    // 获取文章列表
    const articlesRes = await getArticlesByCategory(categoryCode.value, pageNum.value, pageSize.value)
    articles.value = articlesRes.list
    total.value = articlesRes.total
  } catch (error) {
    console.error('加载数据失败:', error)
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  loadData()
})

watch(() => categoryCode.value, () => {
  loadData()
})

function handlePageChange(page: number) {
  pageNum.value = page
  loadData()
}
</script>

<template>
  <div class="category-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div :class="['list', { 'no-sidebar': categoryCode !== 'special' }]">
        <!-- 左侧栏目导航 - 仅专题显示 -->
        <div v-if="categoryCode === 'special'" class="second-menu">
          <h1 class="menu-title">栏目导航</h1>
          <ul class="menu-list">
            <li :class="{ active: categoryCode === 'news' }">
              <NuxtLink to="/category/news" class="menu-link">要闻动态</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'party' }">
              <NuxtLink to="/category/party" class="menu-link">党建工作</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'activities' }">
              <NuxtLink to="/category/activities" class="menu-link">品牌活动</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'awards' }">
              <NuxtLink to="/category/awards" class="menu-link">表彰激励</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'notice' }">
              <NuxtLink to="/category/notice" class="menu-link">公告公示</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'special' }">
              <NuxtLink to="/category/special" class="menu-link">专题</NuxtLink>
            </li>
            <li :class="{ active: categoryCode === 'cooperation' }">
              <NuxtLink to="/category/cooperation" class="menu-link">全国联动</NuxtLink>
            </li>
          </ul>
        </div>

        <!-- 右侧内容区域 -->
        <div :class="['content', { 'full-width': categoryCode !== 'special' }]">
          <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">{{ categoryNameMap[categoryCode] || category?.categoryName || '列表' }}</div>
              </div>
            </div>
          </div>

          <!-- 加载状态 -->
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <!-- 子分类（如果有） -->
          <div v-else-if="childCategories.length > 0" class="sub-categories mb-6">
            <div class="flex flex-wrap gap-3">
              <NuxtLink
                v-for="child in childCategories"
                :key="child.categoryId"
                :to="`/category/${child.categoryCode}`"
                class="px-4 py-2 bg-gray-100 rounded-lg hover:bg-[#c31f1f] hover:text-white transition-colors"
              >
                {{ child.categoryName }}
              </NuxtLink>
            </div>
          </div>

          <!-- 文章列表 -->
          <div v-else class="article-list">
            <NuxtLink
              v-for="article in articles"
              :key="article.articleId"
              :to="`/article/${article.articleId}?from=${categoryCode}`"
              class="article-item"
            >
              <div v-if="article.coverImage" class="article-image">
                <img :src="getFullImageUrl(article.coverImage)" :alt="article.title" />
              </div>
              <div class="article-content">
                <h3 class="article-title">{{ article.title }}</h3>
                <p class="article-summary">{{ article.summary }}</p>
                <p class="article-date">{{ article.publishTime || article.createTime }}</p>
              </div>
            </NuxtLink>
            
            <div v-if="articles.length === 0" class="text-gray-500 text-center py-10">
              暂无内容
            </div>

            <!-- 分页 -->
            <div v-if="total > pageSize" class="pagination mt-6 flex justify-center gap-2">
              <button
                v-for="page in Math.ceil(total / pageSize)"
                :key="page"
                :class="['px-3 py-1 rounded', page === pageNum ? 'bg-[#c31f1f] text-white' : 'bg-gray-200']"
                @click="handlePageChange(page)"
              >
                {{ page }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.category-page {
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

.sub-categories {
  padding: 20px;
  border-bottom: 1px solid #eee;
}

.article-list {
  padding: 20px 0;
}

.article-item {
  display: flex;
  gap: 20px;
  padding: 20px 0;
  border-bottom: 1px solid #eee;
  text-decoration: none;
  color: inherit;
  transition: all 0.3s ease;
}

.article-item:hover {
  background: #f9f9f9;
  padding-left: 10px;
}

.article-item:last-child {
  border-bottom: none;
}

.article-image {
  width: 200px;
  height: 120px;
  flex-shrink: 0;
  overflow: hidden;
  border-radius: 4px;
}

.article-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.article-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 5px 0;
}

.article-title {
  font-size: 18px;
  font-weight: 500;
  color: #333;
  line-height: 1.6;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  transition: color 0.3s ease;
}

.article-item:hover .article-title {
  color: #c31f1f;
}

.article-summary {
  font-size: 14px;
  color: #666;
  margin-top: 8px;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.article-date {
  font-size: 14px;
  color: #999;
  margin-top: 10px;
}

.pagination button {
  cursor: pointer;
  transition: all 0.3s;
}

.pagination button:hover:not(.bg-\[#c31f1f\]) {
  background: #ddd;
}

@media (max-width: 768px) {
  .article-item {
    flex-direction: column;
  }
  
  .article-image {
    width: 100%;
    height: 180px;
  }
}
</style>
