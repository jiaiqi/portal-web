<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '品牌活动', path: '/activities' }
]

const sideMenuItems = [
  { name: '品牌活动', active: true },
  { name: '与人民同行', active: false },
  { name: '时代风尚', active: false },
  { name: '强基工程', active: false },
  { name: '学雷锋', active: false },
  { name: '群众文艺', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '新时代文明实践文艺志愿服务｜2023年中国文联文艺志愿服务工作会暨新时代文明实践文艺志愿服务项目年度总结会召开',
    date: '2023-09-02 14:44:18'
  },
  {
    id: 2,
    title: '强基工程｜中国文联、中国文艺志愿者协会召开"强基工程"项目工作推进会',
    date: '2023-09-13 15:02'
  },
  {
    id: 3,
    title: '强基工程｜中国文联、中央精神文明建设办公室联合印发《"强基工程"——文艺助力基层精神文明建设行动（2023-2025年）实施方案》',
    date: '2023-09-02 15:02'
  },
  {
    id: 4,
    title: '学雷锋文艺志愿服务｜深刻把握雷锋精神的时代内涵，让雷锋精神在新时代绽放更加璀璨的光芒',
    date: '2023-09-02 15:02:48'
  },
  {
    id: 5,
    title: '学雷锋文艺志愿服务｜文艺志愿者吴为山雕塑作品《雷锋》落户雷锋学院揭幕仪式举行',
    date: '2023-09-02 15:03:05'
  },
  {
    id: 6,
    title: '群众文艺｜精品奉献人民 服务乡村振兴——中国文联文艺助力乡村振兴原创歌曲系列活动成功举办',
    date: '2023-09-02 15:03:08'
  },
  {
    id: 7,
    title: '与人民同行｜"与人民同行——新时代文明实践文艺志愿服务特别节目"在全国四级媒体平台播出 央媒广泛报道 反响热烈',
    date: '2023-09-02 15:03:27'
  },
  {
    id: 8,
    title: '时代风尚｜各级媒体报道 "时代风尚——文艺志愿者走进中车松原新能源装备产业基地文艺演出" 反响热烈',
    date: '2023-09-02 15:03:55'
  },
  {
    id: 9,
    title: '时代风尚｜央级媒体报道"时代风尚"——中国文艺志愿者致敬大国重器特别节目 全国四级媒体平台播出反响热烈',
    date: '2023-09-02 15:03:59'
  }
])
</script>

<template>
  <div class="activities-page">
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
                <div class="ant-tabs-tab-btn">品牌活动</div>
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
.activities-page {
  background: #ffffff;
}
</style>
