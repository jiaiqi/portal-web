<script setup lang="ts">
/**
 * 首页 - 重构后的简化版本
 * 将原 618 行代码拆分为多个独立组件
 */
import { ref, onMounted } from 'vue'
import { useHomeData } from '~/composables/useHomeData'
import { usePageTracking } from '~/composables/usePageTracking'

// 使用首页数据 composable
const {
  loading,
  error,
  newsItems,
  informationItems,
  noticeList,
  focusBig,
  focusSmallList,
  focusBanner,
  noticeBanner,
  overviewBanner,
  initData,
  loadNewsData,
  loadInformationData,
} = useHomeData()

// 追踪首页访问
const { trackPageVisit } = usePageTracking()
trackPageVisit('home')

// Tab 状态
const activeTab = ref<'news' | 'information'>('news')

// Tab 切换处理
function handleTabChange(tab: 'news' | 'information') {
  activeTab.value = tab
  if (tab === 'news') {
    loadNewsData()
  } else {
    loadInformationData()
  }
}

// 初始化数据
onMounted(() => {
  initData()
})
</script>

<template>
  <div class="home-page">
    <div class="mx-auto px-4 py-8 max-w-[1200px]">
      <!-- 加载状态 -->
      <div v-if="loading" class="flex justify-center items-center py-20">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
      </div>

      <!-- 错误提示 -->
      <div v-else-if="error" class="text-center py-10 text-gray-500">
        <p>{{ error }}</p>
      </div>

      <!-- 内容区域 -->
      <div v-else class="flex flex-col lg:flex-row gap-6">
        <!-- 左侧主内容区 -->
        <div class="flex-1 w-full lg:w-[870px]">
          <!-- 焦点图区域 -->
          <HomeFocusSection
            :focus-big="focusBig"
            :focus-small-list="focusSmallList"
            :focus-banner="focusBanner"
          />

          <!-- 新闻 Tab 区域 -->
          <HomeNewsTabSection
            :active-tab="activeTab"
            :news-items="newsItems"
            :information-items="informationItems"
            @tab-change="handleTabChange"
          />
        </div>

        <!-- 右侧区域 -->
        <div class="w-full lg:w-[310px] space-y-8">
          <!-- 公告区域 -->
          <HomeNoticeSection
            :notice-banner="noticeBanner"
            :notice-list="noticeList"
          />

          <!-- 协会概况区域 -->
          <HomeAssociationOverview
            :overview-banner="overviewBanner"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.home-page {
  background: #ffffff;
  min-height: calc(100vh - 200px);
}
</style>
