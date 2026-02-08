import { onMounted } from 'vue'
import { useStatistics } from './useStatistics'

export const usePageTracking = () => {
  const { recordVisit } = useStatistics()

  const trackPageVisit = (pageType: string, refTypeId?: number) => {
    onMounted(() => {
      const userAgent = navigator.userAgent
      const pageUrl = window.location.pathname

      recordVisit({
        pageUrl,
        pageType,
        refTypeId,
        userAgent,
      })
    })
  }

  return {
    trackPageVisit,
  }
}
