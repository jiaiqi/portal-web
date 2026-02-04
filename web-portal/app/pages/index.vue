<script setup lang="ts">
const carouselSlides = [
  {
    title: '深入学习贯彻习近平文化思想',
    image: 'https://picsum.photos/800/400?random=1',
    link: '/news/1',
  },
  {
    title: '中国文艺志愿者协会第三次全国代表大会',
    image: 'https://picsum.photos/800/400?random=2',
    link: '/news/2',
  },
  {
    title: '文艺志愿服务走进基层',
    image: 'https://picsum.photos/800/400?random=3',
    link: '/news/3',
  },
]

const newsItems = [
  {
    id: 1,
    title: '习近平总书记在中国文联十一大、中国作协十大开幕式上的重要讲话',
    date: '2024-01-15',
    link: '/news/1',
    image: 'https://picsum.photos/200/120?random=4',
  },
  {
    id: 2,
    title: '中国文艺志愿者协会组织开展"送欢乐下基层"慰问演出活动',
    date: '2024-01-14',
    link: '/news/2',
    image: 'https://picsum.photos/200/120?random=5',
  },
  {
    id: 3,
    title: '文艺志愿者走进乡村振兴一线，用艺术助力乡村文化建设',
    date: '2024-01-13',
    link: '/news/3',
    image: 'https://picsum.photos/200/120?random=6',
  },
  {
    id: 4,
    title: '"我们的中国梦"文化进万家活动在全国各地蓬勃开展',
    date: '2024-01-12',
    link: '/news/4',
    image: 'https://picsum.photos/200/120?random=7',
  },
  {
    id: 5,
    title: '新时代文明实践文艺志愿服务项目模式试点工作推进会召开',
    date: '2024-01-11',
    link: '/news/5',
    image: 'https://picsum.photos/200/120?random=8',
  },
  {
    id: 6,
    title: '中国文联文艺支教项目招募志愿者公告',
    date: '2024-01-10',
    link: '/news/6',
    image: 'https://picsum.photos/200/120?random=9',
  },
  {
    id: 7,
    title: '"到人民中去"文艺志愿服务主题活动在全国多地同步开展',
    date: '2024-01-09',
    link: '/news/7',
    image: 'https://picsum.photos/200/120?random=10',
  },
  {
    id: 8,
    title: '中国文艺志愿者协会组织开展文艺培训志愿服务活动',
    date: '2024-01-08',
    link: '/news/8',
    image: 'https://picsum.photos/200/120?random=11',
  },
]

const localNewsItems = [
  {
    id: 1,
    title: '北京市文联组织开展文艺志愿服务活动',
    date: '2024-01-15',
    link: '/news/local/1',
  },
  {
    id: 2,
    title: '上海市文艺志愿者走进社区慰问演出',
    date: '2024-01-14',
    link: '/news/local/2',
  },
  {
    id: 3,
    title: '广东省文联举办文艺志愿服务培训班',
    date: '2024-01-13',
    link: '/news/local/3',
  },
  {
    id: 4,
    title: '浙江省文艺志愿者开展送温暖活动',
    date: '2024-01-12',
    link: '/news/local/4',
  },
]

const quickLinks = [
  { name: '会员登录', url: '/login' },
  { name: '活动报名', url: '/activities/register' },
  { name: '志愿者注册', url: '/volunteer/register' },
  { name: '资料下载', url: '/downloads' },
]

const specialTopics = [
  {
    id: 1,
    title: '学习贯彻习近平文化思想',
    image: 'https://picsum.photos/300/200?random=20',
    link: '/topics/cultural-thought',
  },
  {
    id: 2,
    title: '百花迎春',
    image: 'https://picsum.photos/300/200?random=21',
    link: '/topics/baihua',
  },
  {
    id: 3,
    title: '文艺进万家',
    image: 'https://picsum.photos/300/200?random=22',
    link: '/topics/volunteer-service',
  },
]
</script>

<template>
  <div>
    <!-- Hero Section - 轮播图 + 右侧快捷入口 -->
    <div class="bg-white">
      <div class="mx-auto px-4 py-6 max-w-7xl lg:px-8 sm:px-6">
        <div class="gap-6 grid grid-cols-1 lg:grid-cols-3">
          <!-- Carousel - 占2/3宽度 -->
          <div class="lg:col-span-2">
            <NewsCarousel :slides="carouselSlides" />
          </div>
          <!-- 右侧快捷入口 -->
          <div class="space-y-4">
            <!-- 百花迎春 -->
            <div class="group rounded-lg h-36 cursor-pointer relative overflow-hidden">
              <img src="https://picsum.photos/400/200?random=100" alt="百花迎春" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
              <div class="flex items-center inset-0 justify-center absolute from-red-800/90 to-red-600/80 bg-gradient-to-r">
                <div class="text-white text-center">
                  <h3 class="text-xl font-bold mb-1">
                    百花迎春
                  </h3>
                  <p class="text-sm opacity-90">
                    中国文学艺术界春节大联欢
                  </p>
                </div>
              </div>
            </div>
            <!-- 文艺进万家 -->
            <div class="group rounded-lg h-36 cursor-pointer relative overflow-hidden">
              <img src="https://picsum.photos/400/200?random=101" alt="文艺进万家" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
              <div class="flex items-center inset-0 justify-center absolute from-amber-700/90 to-amber-500/80 bg-gradient-to-r">
                <div class="text-white text-center">
                  <h3 class="text-xl font-bold mb-1">
                    文艺进万家
                  </h3>
                  <p class="text-sm opacity-90">
                    健康你我他
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 学习贯彻党的二十大精神 Banner -->
    <div class="mx-auto mb-6 px-4 max-w-7xl lg:px-8 sm:px-6">
      <div class="text-white p-6 rounded-lg from-red-900 to-red-700 bg-gradient-to-r">
        <h2 class="text-xl font-bold">
          深入学习贯彻党的二十届四中全会精神
        </h2>
      </div>
    </div>

    <!-- News Section -->
    <div class="mx-auto px-4 pb-8 max-w-7xl lg:px-8 sm:px-6">
      <div class="gap-6 grid grid-cols-1 lg:grid-cols-3">
        <!-- Main News - 要闻 -->
        <div class="lg:col-span-2">
          <div class="p-6 rounded-lg bg-white">
            <div class="mb-6 pb-3 border-b border-gray-200 flex items-center justify-between">
              <div class="flex gap-2 items-center">
                <span class="rounded bg-[#c41e3a] h-5 w-1" />
                <h2 class="text-lg text-gray-800 font-bold">
                  要闻
                </h2>
              </div>
              <NuxtLink to="/news" class="text-sm text-gray-500 flex gap-1 transition-colors items-center hover:text-[#c41e3a]">
                更多
                <span class="text-xs">›</span>
              </NuxtLink>
            </div>
            <div class="space-y-4">
              <NuxtLink
                v-for="item in newsItems"
                :key="item.id"
                :to="item.link"
                class="group flex gap-4"
              >
                <div v-if="item.image" class="rounded flex-shrink-0 h-24 w-40 overflow-hidden">
                  <img :src="item.image" :alt="item.title" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
                </div>
                <div class="flex-1 min-w-0">
                  <h3 class="text-sm text-gray-800 font-medium mb-2 transition-colors line-clamp-2 group-hover:text-[#c41e3a]">
                    {{ item.title }}
                  </h3>
                  <p class="text-xs text-gray-400">
                    {{ item.date }}
                  </p>
                </div>
              </NuxtLink>
            </div>
          </div>
        </div>

        <!-- Sidebar -->
        <div class="space-y-6">
          <!-- 协会概况 -->
          <div class="p-6 rounded-lg bg-white">
            <div class="mb-4 pb-3 border-b border-gray-200 flex items-center justify-between">
              <div class="flex gap-2 items-center">
                <span class="rounded bg-[#c41e3a] h-5 w-1" />
                <h2 class="text-lg text-gray-800 font-bold">
                  协会概况
                </h2>
              </div>
              <NuxtLink to="/about" class="text-sm text-gray-500 transition-colors hover:text-[#c41e3a]">
                更多 ›
              </NuxtLink>
            </div>
            <div class="text-sm text-gray-600 leading-relaxed">
              <p class="mb-3 text-justify">
                中国文艺志愿者协会（China Literary and Art Volunteers' Association，CLAVA）是由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位和个人自愿组成的全国性、联合性、非营利性社会组织...
              </p>
              <NuxtLink to="/about" class="text-sm text-[#c41e3a] hover:underline">
                查看详情 ›
              </NuxtLink>
            </div>
          </div>

          <!-- 基层动态 -->
          <div class="p-6 rounded-lg bg-white">
            <div class="mb-4 pb-3 border-b border-gray-200 flex items-center justify-between">
              <div class="flex gap-2 items-center">
                <span class="rounded bg-[#c41e3a] h-5 w-1" />
                <h2 class="text-lg text-gray-800 font-bold">
                  基层动态
                </h2>
              </div>
              <NuxtLink to="/news/local" class="text-sm text-gray-500 transition-colors hover:text-[#c41e3a]">
                更多 ›
              </NuxtLink>
            </div>
            <div class="space-y-3">
              <NuxtLink
                v-for="item in localNewsItems"
                :key="item.id"
                :to="item.link"
                class="group block"
              >
                <h3 class="text-sm text-gray-700 transition-colors line-clamp-1 group-hover:text-[#c41e3a]">
                  {{ item.title }}
                </h3>
                <p class="text-xs text-gray-400 mt-1">
                  {{ item.date }}
                </p>
              </NuxtLink>
            </div>
          </div>

          <!-- 快捷入口 -->
          <div class="p-6 rounded-lg bg-white">
            <div class="mb-4 pb-3 border-b border-gray-200 flex gap-2 items-center">
              <span class="rounded bg-[#c41e3a] h-5 w-1" />
              <h2 class="text-lg text-gray-800 font-bold">
                快捷入口
              </h2>
            </div>
            <div class="gap-3 grid grid-cols-2">
              <NuxtLink
                v-for="link in quickLinks"
                :key="link.name"
                :to="link.url"
                class="text-sm text-gray-700 px-4 py-3 rounded bg-gray-50 flex transition-all items-center justify-center hover:text-white hover:bg-[#c41e3a]"
              >
                {{ link.name }}
              </NuxtLink>
            </div>
          </div>

          <!-- 专题活动 -->
          <div class="p-6 rounded-lg bg-white">
            <div class="mb-4 pb-3 border-b border-gray-200 flex gap-2 items-center">
              <span class="rounded bg-[#c41e3a] h-5 w-1" />
              <h2 class="text-lg text-gray-800 font-bold">
                专题活动
              </h2>
            </div>
            <div class="space-y-3">
              <NuxtLink
                v-for="topic in specialTopics"
                :key="topic.id"
                :to="topic.link"
                class="group rounded-lg h-24 block relative overflow-hidden"
              >
                <img :src="topic.image" :alt="topic.title" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
                <div class="flex items-end inset-0 absolute from-black/70 to-transparent bg-gradient-to-t">
                  <span class="text-sm text-white font-medium p-3">{{ topic.title }}</span>
                </div>
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 学习贯彻习近平文化思想 专题横幅 -->
    <div class="mx-auto mb-8 px-4 max-w-7xl lg:px-8 sm:px-6">
      <div class="rounded-lg overflow-hidden">
        <div class="h-32 relative">
          <img src="https://picsum.photos/1200/300?random=30" alt="学习贯彻习近平文化思想" class="h-full w-full object-cover">
          <div class="flex items-center inset-0 justify-center absolute from-red-800/95 to-red-600/90 bg-gradient-to-r">
            <div class="text-white text-center">
              <h2 class="text-2xl font-bold mb-2">
                学习贯彻习近平文化思想
              </h2>
              <p class="text-sm opacity-90">
                深入学习贯彻习近平新时代中国特色社会主义思想
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
