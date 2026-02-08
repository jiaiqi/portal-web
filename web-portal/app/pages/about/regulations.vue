<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useAbout } from '~/composables/useAbout'
import { useRichText } from '~/composables/useRichText'

const { getSectionByKey } = useAbout()
const { processHtml } = useRichText()

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '协会概况', path: '/about' },
  { name: '会员工作条例', path: '/about/regulations' },
]

const sideMenuItems = [
  { name: '协会概况', path: '/about', active: false, key: 'overview' },
  { name: '协会章程', path: '/about/charter', active: false, key: 'charter' },
  { name: '协会领导', path: '/about/leadership', active: false, key: 'leadership' },
  { name: '理事会', path: '/about/council', active: false, key: 'council' },
  { name: '会员工作条例', path: '/about/regulations', active: true, key: 'regulations' },
]

const loading = ref(false)
const section = ref<any>(null)

// 处理后的内容
const processedContent = computed(() => {
  return processHtml(section.value?.content)
})

onMounted(async () => {
  loading.value = true
  section.value = await getSectionByKey('regulations')
  loading.value = false
})
</script>

<template>
  <div class="about-page">
    <Breadcrumb :items="breadcrumbs" />

    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧栏目导航 -->
        <div class="second-menu">
          <h1 class="menu-title">协会概况</h1>
          <ul class="menu-list">
            <li
              v-for="(item, index) in sideMenuItems"
              :key="index"
              :class="{ active: item.active }"
            >
              <NuxtLink :to="item.path" class="menu-link">{{ item.name }}</NuxtLink>
            </li>
          </ul>
        </div>

        <!-- 右侧内容区域 -->
        <div class="content">
          <!-- 加载状态 -->
          <div v-if="loading" class="flex justify-center items-center py-20">
            <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
          </div>

          <!-- 内容 -->
          <div v-else class="content-detail">
            <div v-if="processedContent" class="rich-text" v-html="processedContent"></div>
            <div v-else class="text-gray-500 text-center py-10">
              暂无内容
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.about-page {
  background: #ffffff;
}

.content-detail {
  padding: 30px 0;
}

.rich-text {
  line-height: 1.8;
  color: #333;
}

.rich-text p {
  margin-bottom: 16px;
}
</style>
