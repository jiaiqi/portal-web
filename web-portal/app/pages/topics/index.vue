<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '专题', path: '/topics' }
]

const sideMenuItems = [
  { name: '专题', active: true },
  { name: '2024专题', active: false },
  { name: '2023专题', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神专题',
    date: '2024-07-22 10:20'
  },
  {
    id: 2,
    title: '新时代文明实践文艺志愿服务专题',
    date: '2023-09-02 14:44:18'
  },
  {
    id: 3,
    title: '"强基工程"——文艺助力基层精神文明建设行动专题',
    date: '2023-09-02 15:02'
  },
  {
    id: 4,
    title: '学雷锋文艺志愿服务专题',
    date: '2023-09-02 15:02:48'
  },
  {
    id: 5,
    title: '"与人民同行——新时代文明实践文艺志愿服务特别节目"专题',
    date: '2023-09-02 15:03:27'
  }
])
</script>

<template>
  <div class="topics-page">
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
                <div class="ant-tabs-tab-btn">专题</div>
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
.topics-page {
  background: #ffffff;
}
</style>
