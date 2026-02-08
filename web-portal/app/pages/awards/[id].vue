<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import { useCategory } from '~/composables/useCategory'
import { useImage } from '~/composables/useImage'

const route = useRoute()
const { getArticleById } = useCategory()
const { getFullImageUrl } = useImage()

const articleId = computed(() => Number(route.params.id))
const loading = ref(false)
const article = ref<any>(null)

const breadcrumbs = computed(() => [
  { name: '首页', path: '/' },
  { name: '表彰激励', path: '/awards' },
  { name: article.value?.title || '文章详情', path: '' }
])

async function loadData() {
  if (!articleId.value) return
  
  loading.value = true
  try {
    article.value = await getArticleById(articleId.value)
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
  <div class="article-detail-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <div class="content full-width">
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

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

            <div class="article-footer">
              <NuxtLink to="/awards" class="back-link">
                ← 返回列表
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.article-detail-page {
  background: #ffffff;
  min-height: 100vh;
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
