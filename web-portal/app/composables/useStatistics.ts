export interface StatisticsResponse {
  code: number
  msg: string
  data: {
    totalPv: number
    totalUv: number
  }
}

export const useStatistics = () => {
  const api = useApi()

  const getTotalVisits = async (): Promise<number> => {
    try {
      const response = await api.get<StatisticsResponse>('/cms/statistics/total')
      if (response.code === 200 && response.data) {
        return response.data.totalPv || 0
      }
      return 0
    } catch (error) {
      console.error('获取访问量失败:', error)
      return 0
    }
  }

  const recordVisit = async (data: {
    pageUrl: string
    pageType: string
    refTypeId?: number
    ipAddress?: string
    userAgent?: string
  }) => {
    try {
      await api.post('/cms/statistics/record', data)
    } catch (error) {
      console.error('记录访问失败:', error)
    }
  }

  return {
    getTotalVisits,
    recordVisit,
  }
}
