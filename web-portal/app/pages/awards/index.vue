<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '表彰激励', path: '/awards' }
]

const sideMenuItems = [
  { name: '表彰激励', active: true },
  { name: '时代风尚', active: false },
  { name: '最美志愿者', active: false },
  { name: '四个100', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '关于开展2023年度宣传推选学雷锋文艺志愿服务"时代风尚"先进典型活动的通知',
    date: '2023-09-01 14:22:09'
  },
  {
    id: 2,
    title: '四个100｜中国文联11个先进典型入选！2022年度全国学雷锋志愿服务"四个100"先进典型名单公布',
    date: '2023-09-02 15:05:47'
  },
  {
    id: 3,
    title: '四个100｜中国文联党组领导会见由中国文联推荐并荣获2021年度全国学雷锋志愿服务"四个100"先进典型代表',
    date: '2023-09-02 15:05:49'
  },
  {
    id: 4,
    title: '时代风尚｜第二届宣传推选学雷锋文艺志愿服务"时代风尚"先进典型名单公布',
    date: '2023-09-02 15:05:51'
  },
  {
    id: 5,
    title: '时代风尚｜首届宣传推选学雷锋文艺志愿服务"时代风尚"先进典型名单公布',
    date: '2023-09-02 15:05:56'
  }
])
</script>

<template>
  <div class="awards-page">
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
                <div class="ant-tabs-tab-btn">表彰激励</div>
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
.awards-page {
  background: #ffffff;
}
</style>
