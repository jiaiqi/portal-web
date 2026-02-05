import { useApi } from './useApi'

export interface Article {
  articleId: number
  title: string
  summary?: string
  coverImage?: string
  content?: string
  publishTime: string
  status: string
  categoryId: number
  openType?: 'current' | 'new'
}

export interface ArticleListResponse {
  list: Article[]
  total: number
}

export const useArticle = () => {
  const api = useApi()

  const getArticleList = async (params?: {
    pageNum?: number
    pageSize?: number
    categoryId?: number
    status?: string
    title?: string
  }): Promise<ArticleListResponse> => {
    const queryParams = new URLSearchParams()
    if (params?.pageNum) queryParams.append('pageNum', String(params.pageNum))
    if (params?.pageSize) queryParams.append('pageSize', String(params.pageSize))
    if (params?.categoryId) queryParams.append('categoryId', String(params.categoryId))
    if (params?.status) queryParams.append('status', params.status)
    if (params?.title) queryParams.append('title', params.title)

    const response = await api.get<any>(`/cms/article/list?${queryParams.toString()}`)
    if (response.code === 200) {
      return response.data
    }
    throw new Error(response.msg || '获取文章列表失败')
  }

  const getArticleDetail = async (id: number): Promise<Article> => {
    const response = await api.get<any>(`/cms/article/${id}`)
    if (response.code === 200) {
      return response.data
    }
    throw new Error(response.msg || '获取文章详情失败')
  }

  return {
    getArticleList,
    getArticleDetail,
  }
}
