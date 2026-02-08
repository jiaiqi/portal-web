/**
 * 首页数据 Composable
 * 集中管理首页所有数据的获取和处理
 */
import { ref, computed, onMounted } from 'vue'
import dayjs from 'dayjs'
import { useArticle } from './useArticle'
import { useNotice } from './useNotice'
import { useApi } from './useApi'

// 类型定义
export interface FocusItem {
  focusKey: string
  focusName: string
  imageUrl: string
  linkType: 'internal' | 'external'
  linkValue: string
  openType: 'new' | 'current'
}

export interface HomeNewsItem {
  id: number
  articleId?: number
  title: string
  date: string
  image?: string
  contentType?: string
  externalLink?: string
}

export interface HomeNoticeItem {
  id: number
  title: string
}

// 默认数据
const defaultFocusList: FocusItem[] = [
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

export const useHomeData = () => {
  const api = useApi()
  const { getArticleList } = useArticle()
  const { getNoticeList } = useNotice()

  // 状态
  const loading = ref(true)
  const error = ref<string | null>(null)
  const focusList = ref<FocusItem[]>([])
  const newsItems = ref<HomeNewsItem[]>([])
  const informationItems = ref<HomeNewsItem[]>([])
  const noticeList = ref<HomeNoticeItem[]>([])

  // 子分类ID缓存
  const subCategoryIds = ref<{ important?: number; info?: number }>({})

  // 获取完整图片URL
  const getFullImageUrl = (url?: string) => {
    if (!url) return ''
    if (url.startsWith('http')) return url
    if (url.startsWith('/')) {
      const config = useRuntimeConfig()
      const baseUrl = config.public.apiBase || 'http://localhost:8080'
      return baseUrl + url
    }
    return url
  }

  // 将文章数据转换为 HomeNewsItem
  const mapArticleToNewsItem = (item: any): HomeNewsItem => ({
    id: item.articleId,
    articleId: item.articleId,
    title: item.title,
    date: item.publishTime ? dayjs(item.publishTime).format('YYYY-MM-DD HH:mm') : '',
    image: getFullImageUrl(item.coverImage) || '',
    contentType: item.contentType,
    externalLink: item.externalLink,
  })

  // 计算属性 - 获取各类焦点图
  const focusBig = computed(() => {
    const list = Array.isArray(focusList.value) ? focusList.value : []
    return list.find(f => f.focusKey === 'focus_big') || defaultFocusList.find(f => f.focusKey === 'focus_big')
  })

  const focusSmallList = computed(() => {
    const list = Array.isArray(focusList.value) ? focusList.value : []
    const keys = ['focus_small_1', 'focus_small_2', 'focus_small_3']
    return keys.map(key => {
      return list.find(f => f.focusKey === key) || defaultFocusList.find(f => f.focusKey === key)
    })
  })

  const focusBanner = computed(() => {
    const list = Array.isArray(focusList.value) ? focusList.value : []
    return list.find(f => f.focusKey === 'focus_banner') || defaultFocusList.find(f => f.focusKey === 'focus_banner')
  })

  const noticeBanner = computed(() => {
    const list = Array.isArray(focusList.value) ? focusList.value : []
    return list.find(f => f.focusKey === 'notice_banner') || defaultFocusList.find(f => f.focusKey === 'notice_banner')
  })

  const overviewBanner = computed(() => {
    const list = Array.isArray(focusList.value) ? focusList.value : []
    return list.find(f => f.focusKey === 'overview_banner') || defaultFocusList.find(f => f.focusKey === 'overview_banner')
  })

  // 获取子分类ID
  const fetchSubCategoryIds = async (): Promise<{ important?: number; info?: number }> => {
    const result: { important?: number; info?: number } = {}
    try {
      const categoryRes = await api.get<any>('/cms/category/children/18').catch(() => null)
      const subCategories = categoryRes?.data || []
      subCategories.forEach((cat: any) => {
        if (cat.categoryCode === 'news_important') {
          result.important = cat.categoryId
          subCategoryIds.value.important = cat.categoryId
        } else if (cat.categoryCode === 'news_info') {
          result.info = cat.categoryId
          subCategoryIds.value.info = cat.categoryId
        }
      })
    } catch (err) {
      console.error('获取子分类ID失败:', err)
    }
    return result
  }

  // 加载要闻数据
  const loadNewsData = async (subIds?: { important?: number; info?: number }) => {
    try {
      const ids = subIds || await fetchSubCategoryIds()
      const newsRes = await getArticleList({
        pageNum: 1,
        pageSize: 6,
        status: '1',
        categoryCode: 'news',
        subCategoryId: ids.important
      }).catch(() => null)
      if (newsRes?.list?.length > 0) {
        newsItems.value = newsRes.list.map(mapArticleToNewsItem)
      }
    } catch (err) {
      console.error('获取要闻数据失败:', err)
    }
  }

  // 加载资讯数据
  const loadInformationData = async (subIds?: { important?: number; info?: number }) => {
    try {
      const ids = subIds || await fetchSubCategoryIds()
      const infoRes = await getArticleList({
        pageNum: 1,
        pageSize: 6,
        status: '1',
        categoryCode: 'news',
        subCategoryId: ids.info
      }).catch(() => null)
      if (infoRes?.list?.length > 0) {
        informationItems.value = infoRes.list.map(mapArticleToNewsItem)
      }
    } catch (err) {
      console.error('获取资讯数据失败:', err)
    }
  }

  // 初始化加载所有数据
  const initData = async () => {
    loading.value = true
    error.value = null
    try {
      // 首先获取子分类ID
      const subIds = await fetchSubCategoryIds()

      // 并行获取所有数据
      const [focusRes, articleRes, infoRes, noticeRes] = await Promise.all([
        api.get<any>('/cms/focus/all').catch(() => null),
        getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'news', subCategoryId: subIds.important }).catch(() => null),
        getArticleList({ pageNum: 1, pageSize: 6, status: '1', categoryCode: 'news', subCategoryId: subIds.info }).catch(() => null),
        getNoticeList({ pageNum: 1, pageSize: 5, status: '0' }).catch(() => null)
      ])

      // 处理焦点图数据
      if (focusRes) {
        const focusData = Array.isArray(focusRes) ? focusRes : (focusRes.data || [])
        focusList.value = focusData.length > 0 ? focusData : defaultFocusList
      } else {
        focusList.value = defaultFocusList
      }

      // 处理文章数据
      if (articleRes?.list?.length > 0) {
        newsItems.value = articleRes.list.map(mapArticleToNewsItem)
      }

      // 处理资讯数据
      if (infoRes?.list?.length > 0) {
        informationItems.value = infoRes.list.map(mapArticleToNewsItem)
      }

      // 处理公告数据
      if (noticeRes?.list?.length > 0) {
        noticeList.value = noticeRes.list.map((item: any) => ({
          id: item.noticeId,
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
  }

  return {
    // 状态
    loading,
    error,
    newsItems,
    informationItems,
    noticeList,
    // 计算属性
    focusBig,
    focusSmallList,
    focusBanner,
    noticeBanner,
    overviewBanner,
    // 方法
    initData,
    loadNewsData,
    loadInformationData,
  }
}
