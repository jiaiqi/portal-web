<script setup lang="ts">
const topics = [
  {
    id: 1,
    title: '学习贯彻党的二十大精神',
    description: '深入学习宣传贯彻党的二十大精神专题',
    link: '/topics/20th-congress',
    image: 'https://picsum.photos/400/300?random=20',
  },
  {
    id: 2,
    title: '学习贯彻习近平文化思想',
    description: '深入学习贯彻习近平文化思想专题',
    link: '/topics/cultural-thought',
    image: 'https://picsum.photos/400/300?random=21',
  },
  {
    id: 3,
    title: '新时代文明实践',
    description: '新时代文明实践文艺志愿服务专题',
    link: '/topics/civilization-practice',
    image: 'https://picsum.photos/400/300?random=22',
  },
  {
    id: 4,
    title: '文艺志愿服务',
    description: '文艺志愿服务活动展示专题',
    link: '/topics/volunteer-service',
    image: 'https://picsum.photos/400/300?random=23',
  },
  {
    id: 5,
    title: '到人民中去',
    description: '"到人民中去"文艺志愿服务品牌专题',
    link: '/topics/to-the-people',
    image: 'https://picsum.photos/400/300?random=24',
  },
  {
    id: 6,
    title: '百花迎春',
    description: '百花迎春——中国文学艺术界春节大联欢专题',
    link: '/topics/baihua',
    image: 'https://picsum.photos/400/300?random=25',
  },
]
</script>

<template>
  <div>
    <Breadcrumb :items="[{ name: '专题', path: '/topics' }, { name: '列表页' }]" />

    <div class="mx-auto px-4 py-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="gap-6 grid grid-cols-1 lg:grid-cols-3 md:grid-cols-2">
        <NuxtLink
          v-for="topic in topics"
          :key="topic.id"
          :to="topic.link"
          class="group rounded-lg bg-white shadow-sm transition-all overflow-hidden hover:shadow-md"
        >
          <div class="h-40 overflow-hidden">
            <img :src="topic.image" :alt="topic.title" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
          </div>
          <div class="p-4">
            <h3 class="text-gray-800 font-bold mb-2 transition-colors group-hover:text-red-700">
              {{ topic.title }}
            </h3>
            <p class="text-sm text-gray-500">
              {{ topic.description }}
            </p>
          </div>
        </NuxtLink>
      </div>
    </div>
  </div>
</template>
