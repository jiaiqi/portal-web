import type { Category, Article } from '~/types/category'

interface ApiResponse<T> {
  code: number
  msg: string
  data: T
}

export function useCategory() {
  const api = useApi()

  // 获取所有分类（树形结构）
  async function getCategoryTree(): Promise<Category[]> {
    try {
      const res = await api.get<ApiResponse<Category[]>>('/cms/category/tree')
      return res.data || []
    } catch (error) {
      console.error('获取分类树失败:', error)
      return []
    }
  }

  // 根据分类编码获取分类
  async function getCategoryByCode(categoryCode: string): Promise<Category | null> {
    try {
      const res = await api.get<ApiResponse<Category>>(`/cms/category/code/${categoryCode}`)
      return res.data || null
    } catch (error) {
      console.error('获取分类详情失败:', error)
      return null
    }
  }

  // 获取分类下的文章列表
  async function getArticlesByCategory(categoryCode: string, pageNum = 1, pageSize = 10): Promise<{ list: Article[], total: number }> {
    try {
      const res = await api.get<ApiResponse<{ list: Article[], total: number }>>(`/cms/article/list?categoryCode=${categoryCode}&pageNum=${pageNum}&pageSize=${pageSize}&status=1`)
      // eslint-disable-next-line no-console
      console.warn('Articles API response:', res.data)
      if (res.data?.list && res.data.list.length > 0) {
        // eslint-disable-next-line no-console
        console.warn('First article:', res.data.list[0])
      }
      return res.data || { list: [], total: 0 }
    } catch (error) {
      console.error('获取文章列表失败:', error)
      return { list: [], total: 0 }
    }
  }

  // 获取文章详情
  async function getArticleById(articleId: number): Promise<Article | null> {
    try {
      const res = await api.get<ApiResponse<Article>>(`/cms/article/${articleId}`)
      return res.data || null
    } catch (error) {
      console.error('获取文章详情失败:', error)
      return null
    }
  }

  // 获取子分类
  async function getChildCategories(parentId: number): Promise<Category[]> {
    try {
      const res = await api.get<ApiResponse<Category[]>>(`/cms/category/children/${parentId}`)
      return res.data || []
    } catch (error) {
      console.error('获取子分类失败:', error)
      return []
    }
  }

  return {
    getCategoryTree,
    getCategoryByCode,
    getArticlesByCategory,
    getArticleById,
    getChildCategories,
  }
}
