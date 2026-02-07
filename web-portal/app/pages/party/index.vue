<script setup lang="ts">
import { ref } from 'vue'

const breadcrumbs = [
  { name: '首页', path: '/' },
  { name: '党建工作', path: '/party' }
]

const sideMenuItems = [
  { name: '党建工作', active: true },
  { name: '党建动态', active: false },
  { name: '学习园地', active: false }
]

const newsItems = ref([
  {
    id: 1,
    title: '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神',
    date: '2023-09-02 14:44:10'
  },
  {
    id: 2,
    title: '中国文艺志愿者协会党支部召开主题教育专题组织生活会',
    date: '2023-09-02 14:58:32'
  },
  {
    id: 3,
    title: '庆祝中国共产党成立102周年｜文艺志愿者向党致敬 祝愿祖国繁荣昌盛',
    date: '2023-09-02 14:58:42'
  },
  {
    id: 4,
    title: '中国文艺志愿者协会学习贯彻党的二十大精神座谈会召开',
    date: '2023-09-02 14:58:44'
  },
  {
    id: 5,
    title: '守正创新 勇毅前行 | 全国文联系统深入学习党的二十大报告',
    date: '2023-09-02 14:58:46'
  },
  {
    id: 6,
    title: '努力铸就社会主义文化新辉煌 | 全国文艺界深入学习党的二十大报告',
    date: '2023-09-02 14:58:48'
  },
  {
    id: 7,
    title: '踔厉奋发 勇毅前行｜中国文艺志愿者协会认真学习党的二十大报告心得体会摘登（十）',
    date: '2023-09-02 14:58:51'
  },
  {
    id: 8,
    title: '踔厉奋发 勇毅前行｜中国文艺志愿者协会认真学习党的二十大报告心得体会摘登（九）',
    date: '2023-09-02 14:58:55'
  },
  {
    id: 9,
    title: '踔厉奋发 勇毅前行｜中国文艺志愿者协会认真学习党的二十大报告心得体会摘登（八）',
    date: '2023-09-02 14:58:59'
  }
])
</script>

<template>
  <div class="party-page">
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
                <div class="ant-tabs-tab-btn">党建工作</div>
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
.party-page {
  background: #ffffff;
}
</style>
