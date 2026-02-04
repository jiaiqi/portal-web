<script setup lang="ts">
const awardItems = [
  {
    id: 1,
    title: '四个100 | 2015—2022年度由中国文联推荐并荣获全国学雷锋志愿服务"四个100"先进典型名单',
    date: '2023-09-01 14:22:09',
    link: '/awards/1',
  },
  {
    id: 2,
    title: '四个100 | 中国文联11个先进典型入选！2022年度全国学雷锋志愿服务"四个100"先进典型名单公布',
    date: '2023-09-02 15:05:47',
    link: '/awards/2',
  },
  {
    id: 3,
    title: '四个100 | 中国文联党组领导会见由中国文联推荐并荣获2021年度全国学雷锋志愿服务"四个100"先进典型代表',
    date: '2023-09-02 15:05:49',
    link: '/awards/3',
  },
  {
    id: 4,
    title: '时代风尚 | 第二届宣传推选学雷锋文艺志愿服务"时代风尚"先进典型名单公布',
    date: '2023-09-02 15:05:51',
    link: '/awards/4',
  },
  {
    id: 5,
    title: '时代风尚 | 首届宣传推选学雷锋文艺志愿服务"时代风尚"先进典型名单公布',
    date: '2023-09-02 15:05:56',
    link: '/awards/5',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '表彰激励', path: '/awards' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <ContentList :items="awardItems" />
    </div>
  </div>
</template>
