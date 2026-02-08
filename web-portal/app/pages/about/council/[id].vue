<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { useAbout } from '~/composables/useAbout'

const route = useRoute()
const { getArticleById } = useAbout()

const breadcrumbs = ref([
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '理事会', path: '/about/council' },
  { name: '文章详情', path: '' }
])

const sideMenuItems = [
  { name: '协会概况', path: '/about', active: false },
  { name: '协会章程', path: '/about/charter', active: false },
  { name: '协会领导', path: '/about/leadership', active: false },
  { name: '理事会', path: '/about/council', active: true },
  { name: '会员工作条例', path: '/about/regulations', active: false }
]

const loading = ref(false)
const article = ref<any>(null)

onMounted(async () => {
  const articleId = Number(route.params.id)
  if (articleId) {
    loading.value = true
    article.value = await getArticleById(articleId)
    if (article.value) {
      breadcrumbs.value[3].name = article.value.title
    }
    loading.value = false
  }
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
                <div class="ant-tabs-tab-btn">文章详情</div>
              </div>
            </div>
          </div>

          <!-- 加载状态 -->
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <!-- 内容 -->
          <div v-else class="content-detail">
            <h1 v-if="article" class="text-2xl font-bold mb-6">{{ article.title }}</h1>
            <div v-if="article?.content" class="rich-text" v-html="article.content"></div>
            <div v-else class="text-gray-500 text-center py-10">
              暂无内容
            </div>
            <div class="mt-8">
              <NuxtLink to="/about/council" class="text-[#c31f1f] hover:underline">
                ← 返回理事会列表
              </NuxtLink>
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

.content-detail {
  padding: 30px 0;
}

.rich-text {
  line-height: 1.8;
  color: #333;
}

.rich-text p {
  margin-bottom: 16px;
}
</style>
