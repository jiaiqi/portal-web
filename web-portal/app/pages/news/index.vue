<script setup lang="ts">
const newsItems = [
  {
    id: 1,
    title: '习近平总书记在中国文联十一大、中国作协十大开幕式上的重要讲话',
    date: '2024-01-15 09:30:00',
    link: '/news/1',
  },
  {
    id: 2,
    title: '中国文艺志愿者协会组织开展"送欢乐下基层"慰问演出活动',
    date: '2024-01-14 14:20:00',
    link: '/news/2',
  },
  {
    id: 3,
    title: '文艺志愿者走进乡村振兴一线，用艺术助力乡村文化建设',
    date: '2024-01-13 16:45:00',
    link: '/news/3',
  },
  {
    id: 4,
    title: '"我们的中国梦"文化进万家活动在全国各地蓬勃开展',
    date: '2024-01-12 10:15:00',
    link: '/news/4',
  },
  {
    id: 5,
    title: '新时代文明实践文艺志愿服务项目模式试点工作推进会召开',
    date: '2024-01-11 11:30:00',
    link: '/news/5',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '要闻动态', path: '/news' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <ContentList :items="newsItems" />
    </div>
  </div>
</template>
