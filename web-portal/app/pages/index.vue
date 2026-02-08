<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useArticle } from '~/composables/useArticle'
import { useNotice } from '~/composables/useNotice'
import { usePageTracking } from '~/composables/usePageTracking'

const { getArticleList } = useArticle()
const { getNoticeList } = useNotice()
const { trackPageVisit } = usePageTracking()

// 追踪首页访问
trackPageVisit('home')

const loading = ref(true)
const error = ref<string | null>(null)
const activeTab = ref<'news' | 'information'>('news')

// 焦点图数据
const focusList = ref<any[]>([])

// 默认静态数据
const defaultNewsItems = [
  {
    id: 1,
    title: '中国文联、中国文艺志愿者协会深入学习宣传贯彻党的二十届三中全会精神',
    date: '2024-07-22 10:20',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408153932A231.jpg'
  },
  {
    id: 2,
    title: '中国文艺志愿者协会工作年中推进会强调：在新征程上推动文艺志愿服务高质量发展',
    date: '2024-07-15 09:30',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408154210A232.jpg'
  },
  {
    id: 3,
    title: '与人民同行——新时代文明实践文艺志愿服务走进四川广安',
    date: '2024-07-10 14:45',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408154313A233.jpg'
  },
  {
    id: 4,
    title: '纪念毛泽东同志《在延安文艺座谈会上的讲话》发表82周年座谈会在京召开',
    date: '2024-05-23 09:00',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408154449A234.jpg'
  },
  {
    id: 5,
    title: '2024年全国文艺志愿服务工作会在云南昆明召开',
    date: '2024-05-20 11:30',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408154643A235.jpg'
  },
  {
    id: 6,
    title: '时代风尚——中国文艺志愿者致敬大国重器特别节目在中央广播电视总台播出',
    date: '2024-05-18 20:00',
    image: '/origin-html/中国文艺志愿者-首页_files/640_20250408154756A236.jpg'
  }
]

const defaultInformationItems = [
  { id: 1, title: '各地文艺志愿服务队积极开展"学雷锋"主题活动', date: '2024-03-05 16:00' },
  { id: 2, title: '中国文艺志愿者协会新增会员单位名单公布', date: '2024-03-01 10:00' },
  { id: 3, title: '关于开展2024年度文艺志愿服务项目申报工作的通知', date: '2024-02-28 09:00' },
  { id: 4, title: '2024年春节联欢晚会文艺志愿服务工作协调会召开', date: '2024-02-20 14:00' }
]

const defaultNoticeList = [
  '关于2024年度中国文艺志愿者协会会员发展公告',
  '中国文艺志愿者协会2023年度财务公开报告',
  '关于规范文艺志愿服务行为的通知',
  '中国文艺志愿者协会办公地址变更公告',
  '关于征集文艺志愿服务典型案例的通知'
]

// 默认焦点图数据
const defaultFocusList = [
  {
    focusKey: 'focus_big',
    focusName: '焦点大图',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/640_20250407163757A193.jpg',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'focus_small_1',
    focusName: '焦点小图1',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/660_20250407164737A195.jpg',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'focus_small_2',
    focusName: '焦点小图2',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/650_20250407164124A194.jpg',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'focus_small_3',
    focusName: '焦点小图3',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/640_20250127152953A190.jpg',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'focus_banner',
    focusName: '焦点下Banner图',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/微信截图_20250527095422_20250527095430A374.png',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'notice_banner',
    focusName: '公告上方焦点图',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/1012海报_20240326194759A029.png',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  },
  {
    focusKey: 'overview_banner',
    focusName: '协会概况下方焦点图',
    imageUrl: '/origin-html/中国文艺志愿者-首页_files/微信截图_20250128134002_20250128134020A192.png',
    linkType: 'external',
    linkValue: '#',
    openType: 'new'
  }
]

// 响应式数据
const newsItems = ref([...defaultNewsItems])
const informationItems = ref([...defaultInformationItems])
const noticeList = ref<Array<{ id: number; title: string }>>([...defaultNoticeList.map(title => ({ id: 0, title }))])

// 计算属性 - 获取各类焦点图
const focusBig = computed(() => {
  const list = Array.isArray(focusList.value) ? focusList.value : []
  const item = list.find(f => f.focusKey === 'focus_big')
  return item || defaultFocusList.find(f => f.focusKey === 'focus_big')
})

const focusSmallList = computed(() => {
  const list = Array.isArray(focusList.value) ? focusList.value : []
  const keys = ['focus_small_1', 'focus_small_2', 'focus_small_3']
  return keys.map(key => {
    const item = list.find(f => f.focusKey === key)
    return item || defaultFocusList.find(f => f.focusKey === key)
  })
})

const focusBanner = computed(() => {
  const list = Array.isArray(focusList.value) ? focusList.value : []
  const item = list.find(f => f.focusKey === 'focus_banner')
  return item || defaultFocusList.find(f => f.focusKey === 'focus_banner')
})

const noticeBanner = computed(() => {
  const list = Array.isArray(focusList.value) ? focusList.value : []
  const item = list.find(f => f.focusKey === 'notice_banner')
  return item || defaultFocusList.find(f => f.focusKey === 'notice_banner')
})

const overviewBanner = computed(() => {
  const list = Array.isArray(focusList.value) ? focusList.value : []
  const item = list.find(f => f.focusKey === 'overview_banner')
  return item || defaultFocusList.find(f => f.focusKey === 'overview_banner')
})

// 获取链接地址
function getLinkUrl(item: any) {
  if (!item) return '#'
  if (item.linkType === 'internal') {
    return `/news/${item.linkValue}`
  }
  return item.linkValue || '#'
}

// 获取打开方式
function getOpenType(item: any) {
  if (!item) return '_self'
  return item.openType === 'new' ? '_blank' : '_self'
}

// Logo下载功能
function downloadLogo() {
  const logoUrl = '/assets/images/logo.png'
  const link = document.createElement('a')
  link.href = logoUrl
  link.download = 'logo.png'
  link.target = '_blank'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

// 获取完整图片URL
function getFullImageUrl(url: string | undefined) {
  if (!url) return ''
  // 如果已经是完整URL，直接返回
  if (url.startsWith('http')) return url
  // 如果已经是绝对路径（以/开头），拼接API基础URL
  if (url.startsWith('/')) {
    const config = useRuntimeConfig()
    const baseUrl = config.public.apiBase || 'http://localhost:8080'
    return baseUrl + url
  }
  return url
}

const api = useApi()

// 加载要闻数据
async function loadNewsData() {
  try {
    const newsRes = await getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'news' }).catch(() => null)
    if (newsRes?.list?.length > 0) {
      newsItems.value = newsRes.list.map((item: any) => ({
        id: item.articleId,
        title: item.title,
        date: item.publishTime,
        image: getFullImageUrl(item.coverImage) || ''
      }))
    }
  } catch (err) {
    console.error('获取要闻数据失败:', err)
  }
}

// 加载资讯数据
async function loadInformationData() {
  try {
    const infoRes = await getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'information' }).catch(() => null)
    if (infoRes?.list?.length > 0) {
      informationItems.value = infoRes.list.map((item: any) => ({
        id: item.articleId,
        title: item.title,
        date: item.publishTime
      }))
    }
  } catch (err) {
    console.error('获取资讯数据失败:', err)
  }
}

// Tab 切换处理
function handleTabChange(tab: 'news' | 'information') {
  activeTab.value = tab
  // 切换 tab 时重新加载对应数据
  if (tab === 'news') {
    loadNewsData()
  } else if (tab === 'information') {
    loadInformationData()
  }
}

onMounted(async () => {
  try {
    // 并行获取所有数据
    const [focusRes, articleRes, infoRes, noticeRes] = await Promise.all([
      api.get('/cms/focus/all').catch(() => null),
      getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'news' }).catch(() => null),
      getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'information' }).catch(() => null),
      getNoticeList({ pageNum: 1, pageSize: 5, status: '0' }).catch(() => null)
    ])

    // 处理焦点图数据
    if (focusRes) {
      // 处理两种可能的返回格式: 直接数组或 { code, msg, data } 格式
      const focusData = Array.isArray(focusRes) ? focusRes : (focusRes.data || [])
      if (focusData.length > 0) {
        focusList.value = focusData
      } else {
        focusList.value = defaultFocusList
      }
    } else {
      focusList.value = defaultFocusList
    }

    // 处理文章数据（要闻）
    if (articleRes?.list?.length > 0) {
      newsItems.value = articleRes.list.map((item: any) => ({
        id: item.articleId,
        title: item.title,
        date: item.publishTime,
        image: getFullImageUrl(item.coverImage) || ''
      }))
    }

    // 处理资讯数据
    if (infoRes?.list?.length > 0) {
      informationItems.value = infoRes.list.map((item: any) => ({
        id: item.articleId,
        title: item.title,
        date: item.publishTime
      }))
    }

    // 处理公告数据
    if (noticeRes?.list?.length > 0) {
      noticeList.value = noticeRes.list.map((item: any) => ({
        id: item.articleId,
        title: item.title
      }))
    }
  } catch (err) {
    console.error('获取首页数据失败:', err)
    error.value = '获取数据失败，显示默认内容'
    focusList.value = defaultFocusList
  } finally {
    loading.value = false
  }
})
</script>

<template>
  <div class="home-page">
    <div class="mx-auto px-4 py-8 max-w-[1200px]">
      <!-- 加载状态 -->
      <div v-if="loading" class="flex justify-center items-center py-20">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-[#c31f1f]"></div>
      </div>

      <!-- 错误提示 -->
      <div v-else-if="error" class="text-center py-10 text-gray-500">
        <p>{{ error }}</p>
      </div>

      <!-- 内容区域 -->
      <div v-else class="flex flex-col lg:flex-row gap-6">
        <div class="flex-1 w-full lg:w-[870px]">
          <!-- 焦点图区域 -->
          <div class="flex flex-col sm:flex-row gap-4 mb-6 h-auto sm:h-[370px]">
            <!-- 焦点大图 -->
            <a
              v-if="focusBig"
              :href="getLinkUrl(focusBig)"
              :target="getOpenType(focusBig)"
              class="flex-1 relative h-[250px] sm:h-full focus-img-box cursor-pointer block"
            >
              <img :src="getFullImageUrl(focusBig.imageUrl)" class="w-full h-full object-cover" />
            </a>
            <!-- 焦点小图 -->
            <div class="flex flex-row sm:flex-col gap-4 w-full sm:w-[190px] h-[110px] sm:h-full overflow-x-auto">
              <a
                v-for="(item, index) in focusSmallList"
                :key="index"
                :href="getLinkUrl(item)"
                :target="getOpenType(item)"
                class="w-[180px] h-[110px] flex-shrink-0 focus-img-box cursor-pointer block"
              >
                <img :src="getFullImageUrl(item?.imageUrl)" class="w-full h-full object-cover" />
              </a>
            </div>
          </div>

          <!-- 焦点下Banner图 -->
          <a
            v-if="focusBanner"
            :href="getLinkUrl(focusBanner)"
            :target="getOpenType(focusBanner)"
            class="mb-8 focus-img-box cursor-pointer block"
          >
            <img :src="getFullImageUrl(focusBanner.imageUrl)" class="w-full h-[95px] object-cover" />
          </a>

          <!-- Tab 切换 -->
          <div class="border-b border-gray-200 mb-6 flex justify-between items-end">
            <div class="flex">
              <div @click="handleTabChange('news')" :class="[
                'px-6 py-3 text-lg cursor-pointer font-bold',
                activeTab === 'news'
                  ? 'text-[#c31f1f] border-b-2 border-[#c31f1f]'
                  : 'text-gray-600 hover:text-[#c31f1f]'
              ]">
                要闻
              </div>
              <div @click="handleTabChange('information')" :class="[
                'px-6 py-3 text-lg cursor-pointer font-bold',
                activeTab === 'information'
                  ? 'text-[#c31f1f] border-b-2 border-[#c31f1f]'
                  : 'text-gray-600 hover:text-[#c31f1f]'
              ]">
                资讯
              </div>
            </div>
            <a href="/news" class="text-sm text-gray-500 mb-3 hover:text-[#c31f1f]">更多>></a>
          </div>

          <!-- 新闻列表 -->
          <div class="space-y-6">
            <template v-if="activeTab === 'news'">
              <NuxtLink v-for="item in newsItems" :key="item.id" :to="`/news/${item.id}`"
                class="flex gap-4 pb-6 border-b border-gray-100 last:border-0">
                <div v-if="item.image" class="w-[180px] h-[110px] flex-shrink-0 focus-img-box">
                  <img :src="getFullImageUrl(item.image)" class="w-full h-full object-cover" />
                </div>
                <div v-else class="w-[180px] h-[110px] flex-shrink-0 bg-gray-100"></div>
                <div class="flex-1 flex flex-col justify-between py-1">
                  <h3 class="text-base font-medium text-gray-800 leading-snug hover:text-[#c31f3a] cursor-pointer line-clamp-2">
                    {{ item.title }}
                  </h3>
                  <p class="text-xs text-gray-400 text-right">{{ item.date }}</p>
                </div>
              </NuxtLink>
            </template>

            <template v-else>
              <NuxtLink v-for="item in informationItems" :key="item.id" :to="`/news/${item.id}`"
                class="flex gap-4 pb-6 border-b border-gray-100 last:border-0">
                <div class="w-[180px] h-[110px] flex-shrink-0 bg-gray-100"></div>
                <div class="flex-1 flex flex-col justify-between py-1">
                  <h3 class="text-base font-medium text-gray-800 leading-snug hover:text-[#c31f3a] cursor-pointer line-clamp-2">
                    {{ item.title }}
                  </h3>
                  <p class="text-xs text-gray-400 text-right">{{ item.date }}</p>
                </div>
              </NuxtLink>
            </template>
          </div>
        </div>

        <!-- 右侧区域 -->
        <div class="w-full lg:w-[310px] space-y-8">
          <!-- 公告上方焦点图 -->
          <a
            v-if="noticeBanner"
            :href="getLinkUrl(noticeBanner)"
            :target="getOpenType(noticeBanner)"
            class="mb-6 cursor-pointer block"
          >
            <img :src="getFullImageUrl(noticeBanner.imageUrl)" class="w-full h-auto object-cover" />
          </a>

          <!-- 公告公示 -->
          <div>
            <div class="border-b border-gray-200 mb-4 flex justify-between items-end">
              <div class="px-2 py-2 text-base font-bold text-[#c31f1f] border-b-2 border-[#c31f1f]">
                公告/公示
              </div>
              <a href="/announcements" class="text-xs text-gray-500 mb-2 hover:text-[#c31f1f]">更多>></a>
            </div>
            <ul class="space-y-3">
              <NuxtLink v-for="(notice, index) in noticeList" :key="index" :to="`/announcements/${notice.id}`"
                class="flex items-start gap-2 text-sm text-gray-700 hover:text-[#c31f1f] cursor-pointer">
                <span class="font-bold text-gray-400 mt-[2px]">·</span>
                <span class="line-clamp-1 flex-1">{{ notice.title }}</span>
              </NuxtLink>
            </ul>
          </div>

          <!-- 协会概况 -->
          <div class="bg-gray-50 p-4 rounded-sm">
            <h1 class="text-lg font-bold text-black mb-3 xhgk">协会概况</h1>
            <div class="text-sm text-gray-600 leading-relaxed mb-4 text-justify">
              <p class="indent-8">
                中国文艺志愿者协会（China Literary and Art Volunteers' Association，CLAVA），2013年5月23日在北京成立，现任主席是殷秀梅。中国文艺志愿者协会是在中国文联党组领导下，由文艺志愿者、文艺志愿服务组织以及关心支持文艺志愿服务事业的单位或组织自愿组成，按照章程开展活动的全国性、联合性、非营利性社会组织。
              </p>
            </div>
            <div class="flex flex-wrap gap-2 text-sm text-gray-500 justify-center mb-4">
              <a href="/about" class="hover:text-[#c31f1f]">协会简介</a>
              <span class="text-gray-300">|</span>
              <a href="/about" class="hover:text-[#c31f1f]">组织机构</a>
              <span class="text-gray-300">|</span>
              <a href="/about" class="hover:text-[#c31f1f]">理事会</a>
              <span class="text-gray-300">|</span>
              <a href="/about" class="hover:text-[#c31f1f]">制度建设</a>
            </div>
            <div class="text-center">
              <button class="text-white px-6 py-1.5 rounded text-sm cursor-pointer"
                style="background: linear-gradient(262deg, #e55741, #cc0000)"
                @click="downloadLogo">
                logo下载
              </button>
            </div>
          </div>

          <!-- 协会概况下方焦点图 -->
          <a
            v-if="overviewBanner"
            :href="getLinkUrl(overviewBanner)"
            :target="getOpenType(overviewBanner)"
            class="mt-6 cursor-pointer block"
          >
            <img :src="getFullImageUrl(overviewBanner.imageUrl)" class="w-full h-[100px] object-cover" />
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.home-page {
  background: #ffffff;
  min-height: calc(100vh - 200px);
}

.home-page .xhgk {
  position: relative;
}

.home-page .xhgk::after {
  position: absolute;
  content: "";
  display: block;
  width: 29%;
  height: 8px;
  left: 0%;
  top: 18px;
  background: rgba(204, 0, 0, .2);
}

.focus-img-box {
  transition: all 0.3s ease;
}

.focus-img-box:hover {
  opacity: 0.9;
}

.line-clamp-1 {
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
