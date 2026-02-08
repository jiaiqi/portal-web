<script setup lang="ts">
/**
 * 首页公告区域组件
 * 包含公告焦点图和公告列表
 */

interface FocusItem {
  focusKey: string
  focusName: string
  imageUrl: string
  linkType: 'internal' | 'external'
  linkValue: string
  openType: 'new' | 'current'
}

interface NoticeItem {
  id: number
  title: string
}

const props = defineProps<{
  noticeBanner?: FocusItem
  noticeList: NoticeItem[]
}>()

// 获取链接地址
function getLinkUrl(item?: FocusItem) {
  if (!item) return '#'
  if (item.linkType === 'internal') {
    return `/news/${item.linkValue}`
  }
  return item.linkValue || '#'
}

// 获取打开方式
function getOpenType(item?: FocusItem) {
  if (!item) return '_self'
  return item.openType === 'new' ? '_blank' : '_self'
}

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
</script>

<template>
  <div>
    <!-- 公告上方焦点图 -->
    <a
      v-if="noticeBanner"
      :href="getLinkUrl(noticeBanner)"
      :target="getOpenType(noticeBanner)"
      class="mb-6 cursor-pointer block"
    >
      <img :src="getFullImageUrl(noticeBanner.imageUrl)" class="w-full h-auto object-cover" />
    </a>

    <!-- 公告公示 -->
    <div>
      <div class="border-b border-gray-200 mb-4 flex justify-between items-end">
        <div class="px-2 py-2 text-base font-bold text-[#c31f1f] border-b-2 border-[#c31f1f]">
          公告/公示
        </div>
        <a href="/announcements" class="text-xs text-gray-500 mb-2 hover:text-[#c31f1f]">更多>></a>
      </div>
      <ul class="space-y-3">
        <NuxtLink
          v-for="(notice, index) in noticeList"
          :key="index"
          :to="`/announcements/${notice.id}`"
          class="flex items-start gap-2 text-sm text-gray-700 hover:text-[#c31f1f] cursor-pointer"
        >
          <span class="font-bold text-gray-400 mt-[2px]">·</span>
          <span class="line-clamp-1 flex-1">{{ notice.title }}</span>
        </NuxtLink>
      </ul>
    </div>
  </div>
</template>

<style scoped>
.line-clamp-1 {
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
