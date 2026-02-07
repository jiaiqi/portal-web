<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '全国联动', path: '/cooperation' }
]

const sideMenuItems = [
  { name: '全国联动', active: true },
  { name: '省级动态', active: false },
  { name: '地市级动态', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '北京市文联文艺志愿服务团开展"走进社区"系列活动',
    date: '2024-01-15 10:00'
  },
  {
    id: 2,
    title: '上海市文艺志愿者协会召开年度工作总结会',
    date: '2024-01-10 14:00'
  },
  {
    id: 3,
    title: '广东省文艺志愿服务工作经验交流会在广州召开',
    date: '2024-01-05 09:00'
  },
  {
    id: 4,
    title: '浙江省"文艺送万家"志愿服务活动启动',
    date: '2024-01-01 16:00'
  },
  {
    id: 5,
    title: '江苏省文艺志愿服务队赴基层开展慰问演出',
    date: '2023-12-28 11:00'
  },
  {
    id: 6,
    title: '四川省文艺志愿服务助力乡村振兴活动纪实',
    date: '2023-12-25 15:00'
  },
  {
    id: 7,
    title: '山东省文艺志愿服务工作推进会在济南召开',
    date: '2023-12-20 10:00'
  }
])
</script>

<template>
  <div class="cooperation-page">
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
                <div class="ant-tabs-tab-btn">全国联动</div>
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
.cooperation-page {
  background: #ffffff;
}
</style>
