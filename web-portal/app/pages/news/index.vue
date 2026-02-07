<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '要闻动态', path: '/news' }
]

const sideMenuItems = [
  { name: '要闻动态', active: true },
  { name: '各地动态', active: false },
  { name: '媒体报道', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神',
    date: '2024-07-22 10:20',
    image: '/origin-html/中国文艺志愿者-要闻动态_files/640_20250408153932A231.jpg'
  },
  {
    id: 2,
    title: '中国文艺志愿者协会工作年中推进会强调：在新征程上推动文艺志愿服务高质量发展',
    date: '2024-07-15 09:30',
    image: '/origin-html/中国文艺志愿者-要闻动态_files/640_20250408154210A232.jpg'
  },
  {
    id: 3,
    title: '与人民同行——新时代文明实践文艺志愿服务｜2023年中国文联文艺志愿服务工作会暨新时代文明实践文艺志愿服务项目年度总结会召开',
    date: '2023-09-02 14:44:18'
  },
  {
    id: 4,
    title: '时代风尚｜中国文艺志愿者走进中车松原新能源装备产业基地',
    date: '2023-09-02 14:44:22'
  },
  {
    id: 5,
    title: '中国文联、中国文艺志愿者协会召开"强基工程"项目工作推进会',
    date: '2023-08-31 14:25:10'
  },
  {
    id: 6,
    title: '中国文联、中央精神文明建设办公室联合印发《"强基工程"——文艺助力基层精神文明建设行动（2023-2025年）实施方案》',
    date: '2023-09-02 14:44:15'
  },
  {
    id: 7,
    title: '时代风尚——中国文艺志愿者走进中车松原新能源装备产业基地',
    date: '2023-09-02 14:44:25'
  },
  {
    id: 8,
    title: '"强基工程"——文艺助力基层精神文明建设行动工作推进会召开',
    date: '2023-12-13 20:09',
    image: '/origin-html/中国文艺志愿者-要闻动态_files/1213_20240105162701A012.jpg'
  },
  {
    id: 9,
    title: '庆祝中国共产党成立102周年｜文艺志愿者向党致敬 祝愿祖国繁荣昌盛',
    date: '2023-09-02 14:44:27'
  },
  {
    id: 10,
    title: '与人民同行——新时代文明实践文艺志愿服务特别节目在全国四级媒体平台播出 央媒广泛报道 反响热烈',
    date: '2023-09-02 14:44:30'
  }
])
</script>

<template>
  <div class="news-page">
    <Breadcrumb :items="breadcrumbs" />
    
    <div class="mx-auto px-4 max-w-[1200px] list-wrap">
      <div class="list">
        <!-- 左侧栏目导航 -->
        <div class="second-menu">
          <h1 class="menu-title">栏目导航</h1>
          <ul class="menu-list">
            <li
              v-for="(item, index) in sideMenuItems"
              :key="index"
              :class="{ active: item.active }"
            >
              {{ item.name }}
            </li>
          </ul>
        </div>
        
        <!-- 右侧内容区域 -->
        <div class="content">
          <div class="ant-tabs">
            <div class="ant-tabs-nav">
              <div class="ant-tabs-tab active">
                <div class="ant-tabs-tab-btn">要闻动态</div>
              </div>
            </div>
          </div>
          
          <ContentList :items="newsItems" />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.news-page {
  background: #ffffff;
}
</style>
