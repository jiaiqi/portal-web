<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '公告公示', path: '/announcements' }
]

const sideMenuItems = [
  { name: '公告公示', active: true },
  { name: '通知', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '关于2024年度中国文艺志愿者协会会员发展公告',
    date: '2024-01-15 10:00'
  },
  {
    id: 2,
    title: '中国文艺志愿者协会2023年度财务公开报告',
    date: '2024-01-10 14:00'
  },
  {
    id: 3,
    title: '关于规范文艺志愿服务行为的通知',
    date: '2023-12-20 09:00'
  },
  {
    id: 4,
    title: '中国文艺志愿者协会办公地址变更公告',
    date: '2023-12-15 16:00'
  },
  {
    id: 5,
    title: '关于征集文艺志愿服务典型案例的通知',
    date: '2023-12-10 11:00'
  },
  {
    id: 6,
    title: '关于开展2024年度文艺志愿服务项目申报工作的通知',
    date: '2023-12-01 09:00'
  },
  {
    id: 7,
    title: '中国文艺志愿者协会章程（修订草案）征求意见公告',
    date: '2023-11-25 15:00'
  },
  {
    id: 8,
    title: '关于评选表彰文艺志愿服务先进典型的通知',
    date: '2023-11-20 10:00'
  }
])
</script>

<template>
  <div class="announcements-page">
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
                <div class="ant-tabs-tab-btn">公告公示</div>
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
.announcements-page {
  background: #ffffff;
}
</style>
