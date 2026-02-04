<script setup lang="ts">
const partyItems = [
  {
    id: 1,
    title: '中国文艺志愿者协会党支部召开学习贯彻习近平新时代中国特色社会主义思想主题教育专题组织生活会',
    date: '2024-01-10 09:00:00',
    link: '/party/1',
  },
  {
    id: 2,
    title: '中国文艺志愿者协会党支部开展"学思想、强党性、重实践、建新功"主题党日活动',
    date: '2024-01-08 14:30:00',
    link: '/party/2',
  },
  {
    id: 3,
    title: '中国文艺志愿者协会党支部组织学习党的二十大精神专题党课',
    date: '2024-01-05 10:00:00',
    link: '/party/3',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '党建工作', path: '/party' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <ContentList :items="partyItems" />
    </div>
  </div>
</template>
