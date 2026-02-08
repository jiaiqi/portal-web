export interface Category {
  categoryId: number
  categoryName: string
  categoryCode: string
  parentId: number
  sortOrder: number
  status: string
  icon?: string
  createTime: string
  updateTime: string
  children?: Category[]
}

export interface Article {
  articleId: number
  title: string
  categoryId: number
  summary?: string
  coverImage?: string
  contentType?: string
  content?: string
  externalLink?: string
  source?: string
  author?: string
  publishTime?: string
  status: string
  isTop: string
  viewCount: number
  createTime: string
  updateTime: string
  category?: Category
}
