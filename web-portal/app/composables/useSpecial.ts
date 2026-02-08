import type { Article } from '~/types/category'

interface Special {
  specialId: number
  title: string
  coverImage: string
  description: string
  sortOrder: number
  status: string
}

interface SpecialArticle {
  id: number
  specialId: number
  articleId: number
  categoryId: number
  sortOrder: number
  article: Article
}

export function useSpecial() {
  const api = useApi()

  // 获取所有启用的专题列表
  async function getSpecialList(): Promise<Special[]> {
    try {
      const res: any = await api.get('/cms/special/all/active')
      // 后端返回格式: { code: 200, msg: 'success', data: [...] }
      return res.data || []
    } catch (error) {
      console.error('获取专题列表失败:', error)
      return []
    }
  }

  // 获取专题下的文章列表
  async function getSpecialArticles(specialId: number, pageNum = 1, pageSize = 10): Promise<{ list: SpecialArticle[], total: number }> {
    try {
      const res: any = await api.get(`/cms/special/${specialId}/articleList?pageNum=${pageNum}&pageSize=${pageSize}`)
      // 后端返回格式: { code: 200, msg: 'success', data: { list: [...], total: 0 } }
      return res.data || { list: [], total: 0 }
    } catch (error) {
      console.error('获取专题文章列表失败:', error)
      return { list: [], total: 0 }
    }
  }

  return {
    getSpecialList,
    getSpecialArticles,
  }
}
