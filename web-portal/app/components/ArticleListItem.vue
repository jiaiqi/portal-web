<script setup lang="ts">
import type { Article } from '~/types/category'
import dayjs from 'dayjs'
import { useArticleLink } from '~/composables/useArticleLink'
import { useImage } from '~/composables/useImage'

const props = defineProps<{
  article: Article
  basePath?: string
}>()

const { getFullImageUrl } = useImage()
const { getArticleLink } = useArticleLink()

// 计算链接
const link = computed(() => getArticleLink(props.article, props.basePath))

// 格式化日期
function formatDate(dateStr: string | undefined): string {
  if (!dateStr) {
    return ''
  }
  return dayjs(dateStr).format('YYYY-MM-DD HH:mm')
}
</script>

<template>
  <NuxtLink
    :to="link.href"
    :target="link.target"
    class="article-item"
  >
    <div v-if="article.coverImage" class="article-image">
      <img :src="getFullImageUrl(article.coverImage)" :alt="article.title" />
    </div>
    <div v-else class="article-image bg-gray-100"></div>
    <div class="article-content">
      <h3 class="article-title">{{ article.title }}</h3>
      <p class="article-summary">{{ article.summary }}</p>
      <p class="article-date">{{ formatDate(article.publishTime || article.createTime) }}</p>
    </div>
  </NuxtLink>
</template>

<style scoped>
.article-item {
  display: flex;
  gap: 20px;
  padding: 20px 0;
  border-bottom: 1px solid #eee;
  text-decoration: none;
  color: inherit;
  transition: all 0.3s ease;
  cursor: pointer;
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
