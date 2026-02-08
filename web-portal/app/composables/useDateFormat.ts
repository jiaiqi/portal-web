import dayjs from 'dayjs'

export const useDateFormat = () => {
  // 格式化日期为 YYYY-MM-DD
  const formatDate = (date: string | Date | undefined | null): string => {
    if (!date) return ''
    return dayjs(date).format('YYYY-MM-DD')
  }

  // 格式化日期时间为 YYYY-MM-DD HH:mm
  const formatDateTime = (date: string | Date | undefined | null): string => {
    if (!date) return ''
    return dayjs(date).format('YYYY-MM-DD HH:mm')
  }

  // 格式化日期时间为 YYYY-MM-DD HH:mm:ss
  const formatDateTimeFull = (date: string | Date | undefined | null): string => {
    if (!date) return ''
    return dayjs(date).format('YYYY-MM-DD HH:mm:ss')
  }

  return {
    formatDate,
    formatDateTime,
    formatDateTimeFull,
  }
}
