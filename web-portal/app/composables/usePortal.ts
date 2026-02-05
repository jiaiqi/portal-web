import { useApi } from './useApi'

export interface FocusImages {
  big: string
  small1: string
  small2: string
  small3: string
}

export interface RightBanners {
  top: string
  platform: string
}

export interface NewsItem {
  id: number
  title: string
  date: string
  image?: string
  openType?: 'current' | 'new'
  link?: string
}

export interface HomeData {
  focusImages: FocusImages
  focusBanner: string
  newsItems: NewsItem[]
  rightBanners: RightBanners
  noticeList: string[]
}

export const usePortal = () => {
  const api = useApi()

  const getHomeData = async (): Promise<HomeData> => {
    const response = await api.get<any>('/cms/portal/home')
    if (response.code === 200) {
      return response.data
    }
    throw new Error(response.msg || '获取首页数据失败')
  }

  return {
    getHomeData,
  }
}
