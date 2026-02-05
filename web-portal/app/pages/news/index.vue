<script setup lang="ts">
import { useArticle } from '~/composables/useArticle'

const { getArticleList } = useArticle()

const newsItems = ref<any[]>([])
const loading = ref(true)
const error = ref<string | null>(null)
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)

const fetchNewsList = async () => {
  try {
    loading.value = true
    const response = await getArticleList({
      pageNum: pageNum.value,
      pageSize: pageSize.value,
      status: '1',
    })
    newsItems.value = response.list.map(item => ({
      id: item.articleId,
      title: item.title,
      date: formatDate(item.publishTime),
      link: `/news/${item.articleId}`,
      openType: item.openType || 'current',
    }))
    total.value = response.total
  } catch (err) {
    error.value = err instanceof Error ? err.message : '获取新闻列表失败'
    console.error('获取新闻列表失败:', err)
  } finally {
    loading.value = false
  }
}

const formatDate = (date: Date): string => {
  if (!date) return ''
  const d = new Date(date)
  const year = d.getFullYear()
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  const hours = String(d.getHours()).padStart(2, '0')
  const minutes = String(d.getMinutes()).padStart(2, '0')
  const seconds = String(d.getSeconds()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
}

onMounted(() => {
  fetchNewsList()
})
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '要闻动态', path: '/news' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div v-if="loading" class="flex items-center justify-center min-h-[500px]">
        <div class="text-gray-500">加载中...</div>
      </div>

      <div v-else-if="error" class="flex items-center justify-center min-h-[500px]">
        <div class="text-red-500">{{ error }}</div>
      </div>

      <ContentList v-else :items="newsItems" />
    </div>
  </div>
</template>
