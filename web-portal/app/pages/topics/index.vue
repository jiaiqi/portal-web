<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useSpecial } from '~/composables/useSpecial'
import { useImage } from '~/composables/useImage'

const { getSpecialList, getSpecialArticles } = useSpecial()
const { getFullImageUrl } = useImage()

const loading = ref(false)
const error = ref<string | null>(null)
const specials = ref<any[]>([])
const articles = ref<any[]>([])
const total = ref(0)
const pageNum = ref(1)
const pageSize = ref(10)

const activeSpecialId = ref<number>(0)

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '专题', path: '/topics' }
]

// 加载专题列表
async function loadSpecialList() {
  try {
    const data = await getSpecialList()
    specials.value = data
    // 默认选中第一个专题
    if (data.length > 0 && activeSpecialId.value === 0) {
      activeSpecialId.value = data[0].specialId
      loadArticles(data[0].specialId)
    }
  } catch (err) {
    console.error('获取专题列表失败:', err)
    error.value = '获取专题列表失败'
  }
}

// 加载专题下的文章
async function loadArticles(specialId: number) {
  loading.value = true
  try {
    const response = await getSpecialArticles(specialId, pageNum.value, pageSize.value)
    // 转换数据格式
    articles.value = response.list.map((item: any) => ({
      articleId: item.article?.articleId,
      title: item.article?.title,
      summary: item.article?.summary,
      coverImage: item.article?.coverImage,
      publishTime: item.article?.publishTime,
      createTime: item.article?.createTime,
    })).filter((item: any) => item.articleId)
    total.value = response.total
  } catch (err) {
    console.error('获取专题文章失败:', err)
    error.value = '获取文章列表失败'
  } finally {
    loading.value = false
  }
}

// 切换专题
function handleSpecialChange(specialId: number) {
  activeSpecialId.value = specialId
  pageNum.value = 1
  loadArticles(specialId)
}

// 分页切换
function handlePageChange(page: number) {
  pageNum.value = page
  loadArticles(activeSpecialId.value)
}

onMounted(() => {
  loadSpecialList()
})
</script>

<template>
  <div class="topics-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧专题列表 -->
        <div class="second-menu">
          <h1 class="menu-title">专题导航</h1>
          <ul class="menu-list">
            <li
              v-for="special in specials"
              :key="special.specialId"
              :class="{ active: activeSpecialId === special.specialId }"
              @click="handleSpecialChange(special.specialId)"
            >
              {{ special.title }}
            </li>
          </ul>
        </div>
        
        <!-- 右侧内容区域 -->
        <div class="content">
          <!-- <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">
                  {{ specials.find(s => s.specialId === activeSpecialId)?.title || '专题' }}
                </div>
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
              :to="`/topics/${article.articleId}`"
              class="article-item"
            >
              <div v-if="article.coverImage" class="article-image">
                <img :src="getFullImageUrl(article.coverImage)" :alt="article.title" />
              </div>
              <div v-else class="article-image bg-gray-100"></div>
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
.topics-page {
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
