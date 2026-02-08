<script setup lang="ts">
/**
 * 首页新闻 Tab 区域组件
 * 包含要闻/资讯切换和新闻列表
 */
import { useArticleLink } from '~/composables/useArticleLink'

export interface NewsItem {
  id: number
  articleId?: number
  title: string
  date: string
  image?: string
  contentType?: string
  externalLink?: string
}

const props = defineProps<{
  activeTab: 'news' | 'information'
  newsItems: NewsItem[]
  informationItems: NewsItem[]
}>()

const emit = defineEmits<{
  (e: 'tabChange', tab: 'news' | 'information'): void
}>()

const { getArticleLink } = useArticleLink()

// 获取完整图片URL
function getFullImageUrl(url?: string) {
  if (!url) return ''
  if (url.startsWith('http')) return url
  if (url.startsWith('/')) {
    const config = useRuntimeConfig()
    const baseUrl = config.public.apiBase || 'http://localhost:8080'
    return baseUrl + url
  }
  return url
}

function handleTabChange(tab: 'news' | 'information') {
  emit('tabChange', tab)
}

// 获取文章链接（兼容类型转换）
function getNewsLink(item: NewsItem, basePath: string) {
  return getArticleLink(item as any, basePath)
}
</script>

<template>
  <div>
    <!-- Tab 切换 -->
    <div class="border-b border-gray-200 mb-6 flex justify-between items-end">
      <div class="flex">
        <div
          @click="handleTabChange('news')"
          :class="[
            'px-6 py-3 text-lg cursor-pointer font-bold',
            activeTab === 'news'
              ? 'text-[#c31f1f] border-b-2 border-[#c31f1f]'
              : 'text-gray-600 hover:text-[#c31f1f]'
          ]"
        >
          要闻
        </div>
        <div
          @click="handleTabChange('information')"
          :class="[
            'px-6 py-3 text-lg cursor-pointer font-bold',
            activeTab === 'information'
              ? 'text-[#c31f1f] border-b-2 border-[#c31f1f]'
              : 'text-gray-600 hover:text-[#c31f1f]'
          ]"
        >
          资讯
        </div>
      </div>
      <a href="/news" class="text-sm text-gray-500 mb-3 hover:text-[#c31f1f]">更多>></a>
    </div>

    <!-- 新闻列表 -->
    <div class="space-y-6">
      <template v-if="activeTab === 'news'">
        <NuxtLink
          v-for="item in newsItems"
          :key="item.id"
          :to="getNewsLink(item, '/news').href"
          :target="getNewsLink(item, '/news').target"
          class="flex gap-4 pb-6 border-b border-gray-100 last:border-0"
        >
          <div v-if="item.image" class="w-[180px] h-[110px] flex-shrink-0 focus-img-box">
            <img :src="getFullImageUrl(item.image)" class="w-full h-full object-cover" />
          </div>
          <div v-else class="w-[180px] h-[110px] flex-shrink-0 bg-gray-100"></div>
          <div class="flex-1 flex flex-col justify-between py-1">
            <h3 class="text-base font-medium text-gray-800 leading-snug hover:text-[#c31f3a] cursor-pointer line-clamp-2">
              {{ item.title }}
            </h3>
            <p class="text-xs text-gray-400 text-right">{{ item.date }}</p>
          </div>
        </NuxtLink>
      </template>

      <template v-else>
        <NuxtLink
          v-for="item in informationItems"
          :key="item.id"
          :to="getNewsLink(item, '/news').href"
          :target="getNewsLink(item, '/news').target"
          class="flex gap-4 pb-6 border-b border-gray-100 last:border-0"
        >
          <div v-if="item.image" class="w-[180px] h-[110px] flex-shrink-0 focus-img-box">
            <img :src="getFullImageUrl(item.image)" class="w-full h-full object-cover" />
          </div>
          <div v-else class="w-[180px] h-[110px] flex-shrink-0 bg-gray-100"></div>
          <div class="flex-1 flex flex-col justify-between py-1">
            <h3 class="text-base font-medium text-gray-800 leading-snug hover:text-[#c31f3a] cursor-pointer line-clamp-2">
              {{ item.title }}
            </h3>
            <p class="text-xs text-gray-400 text-right">{{ item.date }}</p>
          </div>
        </NuxtLink>
      </template>
    </div>
  </div>
</template>

<style scoped>
.focus-img-box {
  transition: all 0.3s ease;
}

.focus-img-box:hover {
  opacity: 0.9;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
