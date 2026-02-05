<script setup lang="ts">
import { usePortal } from '~/composables/usePortal'

const { getHomeData } = usePortal()

const homeData = ref<any>(null)
const loading = ref(true)
const error = ref<string | null>(null)
const activeTab = ref<'news' | 'information'>('news')

onMounted(async () => {
  try {
    loading.value = true
    homeData.value = await getHomeData()
  } catch (err) {
    error.value = err instanceof Error ? err.message : '获取数据失败'
    console.error('获取首页数据失败:', err)
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="bg-white min-h-screen font-sans">
    <div v-if="loading" class="flex items-center justify-center min-h-[500px]">
      <div class="text-gray-500">加载中...</div>
    </div>

    <div v-else-if="error" class="flex items-center justify-center min-h-[500px]">
      <div class="text-red-500">{{ error }}</div>
    </div>

    <div v-else-if="homeData" class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="flex flex-col lg:flex-row gap-6">
        <!-- Left Column -->
        <div class="flex-1 w-full lg:w-[860px] lg:flex-shrink-0">
          <!-- Focus Area -->
          <div class="flex flex-col sm:flex-row gap-4 mb-6 h-auto sm:h-[370px]">
            <!-- Big Image -->
            <div class="flex-1 relative h-[250px] sm:h-full">
              <img :src="homeData.focusImages.big" class="w-full h-full object-cover" />
            </div>
            <!-- Small Images Column -->
            <div
              class="flex flex-row sm:flex-col gap-4 w-full sm:w-[180px] h-[110px] sm:h-full overflow-x-auto sm:overflow-visible"
            >
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="homeData.focusImages.small1"
                  class="w-full h-full object-cover"
                />
              </div>
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="homeData.focusImages.small2"
                  class="w-full h-full object-cover"
                />
              </div>
              <div class="w-[180px] h-[110px] flex-shrink-0">
                <img
                  :src="homeData.focusImages.small3"
                  class="w-full h-full object-cover"
                />
              </div>
            </div>
          </div>

          <!-- Focus Mini Banner -->
          <div class="mb-8">
            <img :src="homeData.focusBanner" class="w-full h-[95px] object-cover" />
          </div>

          <!-- Tabs -->
          <div
            class="border-b border-gray-200 mb-6 flex justify-between items-end"
          >
            <div class="flex">
              <div
                @click="activeTab = 'news'"
                :class="[
                  'px-6 py-3 text-lg cursor-pointer',
                  activeTab === 'news'
                    ? 'font-bold text-[#c41e3a] border-b-2 border-[#c41e3a]'
                    : 'font-medium text-gray-600 hover:text-[#c41e3a]'
                ]"
              >
                要闻
              </div>
              <div
                @click="activeTab = 'information'"
                :class="[
                  'px-6 py-3 text-lg cursor-pointer',
                  activeTab === 'information'
                    ? 'font-bold text-[#c41e3a] border-b-2 border-[#c41e3a]'
                    : 'font-medium text-gray-600 hover:text-[#c41e3a]'
                ]"
              >
                资讯
              </div>
            </div>
            <a href="#" class="text-sm text-gray-500 mb-3 hover:text-[#c41e3a]"
              >更多>></a
          >
          </div>

          <!-- News List -->
          <div class="space-y-6">
            <div
              v-for="item in activeTab === 'news' ? homeData.newsItems : homeData.informationItems"
              :key="item.id"
              class="flex gap-4 pb-6 border-b border-gray-100 last:border-0"
            >
              <template v-if="item.image">
                <div class="w-[180px] h-[110px] flex-shrink-0">
                  <img :src="item.image" class="w-full h-full object-cover" />
                </div>
                <div class="flex-1 flex flex-col justify-between py-1">
                  <h3
                    class="text-base font-bold text-gray-800 leading-snug hover:text-[#c41e3a] cursor-pointer"
                  >
                    {{ item.title }}
                  </h3>
                  <p class="text-xs text-gray-400 text-right">
                    {{ item.date }}
                  </p>
                </div>
              </template>
            </div>
          </div>
        </div>

        <!-- Right Column -->
        <div class="w-full lg:w-[320px] lg:flex-shrink-0 space-y-8">
          <!-- Link Box -->
          <div>
            <img :src="homeData.rightBanners.top" class="w-full h-auto object-cover" />
          </div>

          <!-- Hots / Notices -->
          <div>
            <div
              class="border-b border-gray-200 mb-4 flex justify-between items-end"
            >
              <div
                class="px-2 py-2 text-base font-bold text-[#c41e3a] border-b-2 border-[#c41e3a]"
              >
                公告/公示
              </div>
              <a
                href="/announcements"
                class="text-xs text-gray-500 mb-2 hover:text-[#c41e3a]"
                >更多>></a
            >
            </div>
            <ul class="space-y-3">
              <li
                v-for="(notice, index) in homeData.noticeList"
                :key="index"
                class="flex items-start gap-2 text-sm text-gray-700 hover:text-[#c41e3a] cursor-pointer"
              >
                <span class="font-bold text-gray-400 mt-[2px]">·</span>
                <span class="line-clamp-1 flex-1">{{ notice }}</span>
              </li>
            </ul>
          </div>

          <!-- Association Overview -->
          <div class="bg-gray-50 p-4 rounded-sm">
            <h2 class="text-lg font-bold text-[#c41e3a] mb-3">协会概况</h2>
            <div
              class="text-sm text-gray-600 leading-relaxed mb-4 text-justify"
            >
              <p class="indent-8">
                中国文艺志愿者协会（China Literary and Art Volunteers'
                Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下...
              </p>
            </div>
            <div
              class="flex flex-wrap gap-2 text-sm text-gray-500 justify-center mb-4"
            >
              <template v-for="(link, i) in ['协会简介', '组织机构', '理事会', '制度建设']" :key="link">
                <a href="/about" class="hover:text-[#c41e3a]">{{ link }}</a>
                <span v-if="i < 3">|</span>
              </template>
            </div>
            <div class="text-center">
              <button
                class="text-white px-6 py-1.5 rounded text-sm transition-colors"
                style="background: linear-gradient(262deg, #e55741, #cc0000)"
              >
                logo下载
              </button>
            </div>
          </div>

          <!-- Platform Banner -->
          <div>
            <img
              :src="homeData.rightBanners.platform"
              class="w-full h-[100px] object-cover"
            />
          </div>
        </div>
      </div>
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
</style>
