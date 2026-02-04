<script setup lang="ts">
const announcementItems = [
  {
    id: 1,
    title: '中国文联文艺志愿服务中心2024年度部门决算',
    date: '2025-08-18 12:00',
    link: '/announcements/1',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '公告公示', path: '/announcements' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <ContentList :items="announcementItems" />
    </div>
  </div>
</template>
