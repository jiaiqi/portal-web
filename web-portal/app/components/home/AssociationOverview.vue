<script setup lang="ts">
/**
 * 首页协会概况区域组件
 * 包含协会介绍、链接和 Logo 下载
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
  overviewBanner?: FocusItem
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

// Logo下载功能
function downloadLogo() {
  const logoUrl = '/assets/images/logo.png'
  const link = document.createElement('a')
  link.href = logoUrl
  link.download = 'logo.png'
  link.target = '_blank'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}
</script>

<template>
  <div>
    <!-- 协会概况 -->
    <div class="bg-gray-50 p-4 rounded-sm">
      <h1 class="text-lg font-bold text-black mb-3 xhgk">协会概况</h1>
      <div class="text-sm text-gray-600 leading-relaxed mb-4 text-justify">
        <p class="indent-8">
          中国文艺志愿者协会（China Literary and Art Volunteers' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。
        </p>
      </div>
      <div class="flex flex-wrap gap-2 text-sm text-gray-500 justify-center mb-4">
        <NuxtLink to="/about" class="hover:text-[#c31f1f]">协会简介</NuxtLink>
        <span class="text-gray-300">|</span>
        <NuxtLink to="/about/leadership" class="hover:text-[#c31f1f]">组织机构</NuxtLink>
        <span class="text-gray-300">|</span>
        <NuxtLink to="/about/council" class="hover:text-[#c31f1f]">理事会</NuxtLink>
        <span class="text-gray-300">|</span>
        <NuxtLink to="/about/charter" class="hover:text-[#c31f1f]">制度建设</NuxtLink>
      </div>
      <div class="text-center">
        <button
          class="text-white px-6 py-1.5 rounded text-sm cursor-pointer"
          style="background: linear-gradient(262deg, #e55741, #cc0000)"
          @click="downloadLogo"
        >
          logo下载
        </button>
      </div>
    </div>

    <!-- 协会概况下方焦点图 -->
    <a
      v-if="overviewBanner"
      :href="getLinkUrl(overviewBanner)"
      :target="getOpenType(overviewBanner)"
      class="mt-6 cursor-pointer block"
    >
      <img :src="getFullImageUrl(overviewBanner.imageUrl)" class="w-full h-[100px] object-cover" />
    </a>
  </div>
</template>

<style scoped>
.xhgk {
  position: relative;
}

.xhgk::after {
  position: absolute;
  content: "";
  display: block;
  width: 29%;
  height: 8px;
  left: 0%;
  top: 18px;
  background: rgba(204, 0, 0, .2);
}
</style>
