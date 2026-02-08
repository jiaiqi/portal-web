<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useCategory } from '~/composables/useCategory'

const { getArticlesByCategory } = useCategory()

const loading = ref(false)
const error = ref<string | null>(null)
const articles = ref<any[]>([])
const total = ref(0)
const pageNum = ref(1)
const pageSize = ref(10)

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '要闻动态', path: '/news' }
]

async function loadData() {
  loading.value = true
  try {
    const response = await getArticlesByCategory('news', pageNum.value, pageSize.value)
    articles.value = response.list
    total.value = response.total
  } catch (err) {
    console.error('获取要闻数据失败:', err)
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
  <div class="news-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <div class="content full-width">
          <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">要闻动态</div>
              </div>
            </div>
          </div>

          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <div v-else-if="error" class="text-center py-10 text-gray-500">
            <p>{{ error }}</p>
          </div>

          <div v-else class="article-list">
            <ArticleListItem
              v-for="article in articles"
              :key="article.articleId"
              :article="article"
              base-path="/news"
            />

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
.news-page {
  background: #ffffff;
  min-height: 100vh;
}

.article-list {
  padding: 20px 0;
}

.pagination button {
  cursor: pointer;
  transition: all 0.3s;
}

.pagination button:hover:not(.bg-\[#c31f1f\]) {
  background: #ddd;
}
</style>
