import { useApi } from './useApi'

export interface Notice {
  noticeId: number
  title: string
  content?: string
  noticeType: string
  status: string
  isTop: string
  sortOrder: number
  createTime: string
}

export interface NoticeListResponse {
  list: Notice[]
  total: number
}

export const useNotice = () => {
  const api = useApi()

  const getNoticeList = async (params?: {
    pageNum?: number
    pageSize?: number
    noticeType?: string
    status?: string
    title?: string
  }): Promise<NoticeListResponse> => {
    const queryParams = new URLSearchParams()
    if (params?.pageNum) queryParams.append('pageNum', String(params.pageNum))
    if (params?.pageSize) queryParams.append('pageSize', String(params.pageSize))
    if (params?.noticeType) queryParams.append('noticeType', params.noticeType)
    if (params?.status) queryParams.append('status', params.status)
    if (params?.title) queryParams.append('title', params.title)

    const response = await api.get<any>(`/cms/notice/list?${queryParams.toString()}`)
    if (response.code === 200) {
      return response.data
    }
    throw new Error(response.msg || '获取公告列表失败')
  }

  const getNoticeDetail = async (id: number): Promise<Notice> => {
    const response = await api.get<any>(`/cms/notice/${id}`)
    if (response.code === 200) {
      return response.data
    }
    throw new Error(response.msg || '获取公告详情失败')
  }

  return {
    getNoticeList,
    getNoticeDetail,
  }
}
