<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useCategory } from '~/composables/useCategory'
import { useImage } from '~/composables/useImage'

const { getArticlesByCategory } = useCategory()
const { getFullImageUrl } = useImage()

const loading = ref(false)
const error = ref<string | null>(null)
const articles = ref<any[]>([])
const total = ref(0)
const pageNum = ref(1)
const pageSize = ref(10)

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '全国联动', path: '/cooperation' }
]

async function loadData() {
  loading.value = true
  try {
    const response = await getArticlesByCategory('cooperation', pageNum.value, pageSize.value)
    articles.value = response.list
    total.value = response.total
  } catch (err) {
    console.error('获取全国联动数据失败:', err)
    error.value = '获取数据失败，显示默认内容'
  } finally {
    loading.value = false
  }
}

function handlePageChange(page: number) {
  pageNum.value = page
  loadData()
}

onMounted(() => {
  loadData()
})
</script>

<template>
  <div class="cooperation-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <div class="content full-width">
          <!-- <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">全国联动</div>
              </div>
            </div>
          </div> -->

          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <div v-else-if="error" class="text-center py-10 text-gray-500">
            <p>{{ error }}</p>
          </div>

          <div v-else class="article-list">
            <NuxtLink
              v-for="article in articles"
              :key="article.articleId"
              :to="`/cooperation/${article.articleId}`"
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
.cooperation-page {
  background: #ffffff;
  min-height: 100vh;
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
