<script setup lang="ts">
/**
 * 首页焦点图区域组件
 * 包含焦点大图、焦点小图和 Banner 图
 */

interface FocusItem {
  focusKey: string
  focusName: string
  imageUrl: string
  linkType: 'internal' | 'external'
  linkValue: string
  openType: 'new' | 'current'
}

const props = defineProps<{
  focusBig?: FocusItem
  focusSmallList: (FocusItem | undefined)[]
  focusBanner?: FocusItem
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
    <!-- 焦点图区域 -->
    <div class="flex flex-col sm:flex-row gap-4 mb-6 h-auto sm:h-[370px]">
      <!-- 焦点大图 -->
      <a
        v-if="focusBig"
        :href="getLinkUrl(focusBig)"
        :target="getOpenType(focusBig)"
        class="flex-1 relative h-[250px] sm:h-full focus-img-box cursor-pointer block"
      >
        <img :src="getFullImageUrl(focusBig.imageUrl)" class="w-full h-full object-cover" />
      </a>
      <!-- 焦点小图 -->
      <div class="flex flex-row sm:flex-col gap-4 w-full sm:w-[190px] h-[110px] sm:h-full overflow-x-auto">
        <a
          v-for="(item, index) in focusSmallList"
          :key="index"
          :href="getLinkUrl(item)"
          :target="getOpenType(item)"
          class="w-[180px] h-[110px] flex-shrink-0 focus-img-box cursor-pointer block"
        >
          <img :src="getFullImageUrl(item?.imageUrl)" class="w-full h-full object-cover" />
        </a>
      </div>
    </div>

    <!-- 焦点下Banner图 -->
    <a
      v-if="focusBanner"
      :href="getLinkUrl(focusBanner)"
      :target="getOpenType(focusBanner)"
      class="mb-8 focus-img-box cursor-pointer block"
    >
      <img :src="getFullImageUrl(focusBanner.imageUrl)" class="w-full h-[95px] object-cover" />
    </a>
  </div>
</template>

<style scoped>
.focus-img-box {
  transition: all 0.3s ease;
}

.focus-img-box:hover {
  opacity: 0.9;
}
</style>
