<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAbout } from '~/composables/useAbout'

const { getSectionByKey, getArticlesBySectionKey } = useAbout()

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '理事会', path: '/about/council' }
]

const sideMenuItems = [
  { name: '协会概况', path: '/about', active: false, key: 'overview' },
  { name: '协会章程', path: '/about/charter', active: false, key: 'charter' },
  { name: '协会领导', path: '/about/leadership', active: false, key: 'leadership' },
  { name: '理事会', path: '/about/council', active: true, key: 'council' },
  { name: '会员工作条例', path: '/about/regulations', active: false, key: 'regulations' }
]

const loading = ref(false)
const section = ref<any>(null)
const articles = ref<any[]>([])

onMounted(async () => {
  loading.value = true
  const [sectionRes, articlesRes] = await Promise.all([
    getSectionByKey('council'),
    getArticlesBySectionKey('council')
  ])
  section.value = sectionRes
  articles.value = articlesRes
  loading.value = false
})
</script>

<template>
  <div class="about-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧栏目导航 -->
        <div class="second-menu">
          <h1 class="menu-title">栏目导航</h1>
          <ul class="menu-list">
            <li
              v-for="(item, index) in sideMenuItems"
              :key="index"
              :class="{ active: item.active }"
            >
              <NuxtLink :to="item.path" class="menu-link">{{ item.name }}</NuxtLink>
            </li>
          </ul>
        </div>

        <!-- 右侧内容区域 -->
        <div class="content">
          <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">理事会</div>
              </div>
            </div>
          </div>

          <!-- 加载状态 -->
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <!-- 文章列表 -->
          <div v-else class="article-list">
            <NuxtLink
              v-for="article in articles"
              :key="article.articleId"
              :to="`/about/council/${article.articleId}`"
              class="article-item"
            >
              <div class="article-content">
                <h3 class="article-title">{{ article.title }}</h3>
                <p class="article-date">{{ article.createTime }}</p>
              </div>
            </NuxtLink>
            <div v-if="articles.length === 0" class="text-gray-500 text-center py-10">
              暂无内容
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.about-page {
  background: #ffffff;
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

.article-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 5px 0;
}

.article-title {
  font-size: 16px;
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

.article-date {
  font-size: 14px;
  color: #999;
  margin-top: 10px;
}

@media (max-width: 768px) {
  .article-item {
    flex-direction: column;
  }
}
</style>
