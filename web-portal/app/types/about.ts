export interface AboutSection {
  sectionId: number
  sectionKey: string
  sectionName: string
  sectionType: 'richText' | 'list'
  content?: string
  sortOrder: number
  status: string
  createTime: string
  updateTime: string
}

export interface AboutArticle {
  articleId: number
  sectionKey: string
  title: string
  content?: string
  sortOrder: number
  status: string
  createTime: string
  updateTime: string
}
