import type { AboutSection, AboutArticle } from '~/types/about'

interface ApiResponse<T> {
  code: number
  msg: string
  data: T
}

export function useAbout() {
  const api = useApi()

  // 获取所有栏目
  async function getSections(): Promise<AboutSection[]> {
    try {
      const res = await api.get<ApiResponse<AboutSection[]>>('/cms/about/section/all')
      return res.data || []
    } catch (error) {
      console.error('获取栏目列表失败:', error)
      return []
    }
  }

  // 根据key获取栏目
  async function getSectionByKey(sectionKey: string): Promise<AboutSection | null> {
    try {
      const res = await api.get<ApiResponse<AboutSection>>(`/cms/about/section/key/${sectionKey}`)
      return res.data || null
    } catch (error) {
      console.error('获取栏目详情失败:', error)
      return null
    }
  }

  // 获取栏目下的文章列表
  async function getArticlesBySectionKey(sectionKey: string): Promise<AboutArticle[]> {
    try {
      const res = await api.get<ApiResponse<AboutArticle[]>>(`/cms/about/article/section/${sectionKey}`)
      return res.data || []
    } catch (error) {
      console.error('获取文章列表失败:', error)
      return []
    }
  }

  // 获取文章详情
  async function getArticleById(articleId: number): Promise<AboutArticle | null> {
    try {
      const res = await api.get<ApiResponse<AboutArticle>>(`/cms/about/article/${articleId}`)
      return res.data || null
    } catch (error) {
      console.error('获取文章详情失败:', error)
      return null
    }
  }

  return {
    getSections,
    getSectionByKey,
    getArticlesBySectionKey,
    getArticleById,
  }
}
