export const useImage = () => {
  const config = useRuntimeConfig()

  const getFullImageUrl = (url: string | undefined): string => {
    if (!url) return ''
    if (url.startsWith('http')) return url
    const baseUrl = config.public.apiBase || 'http://localhost:8080'
    return `${baseUrl}${url}`
  }

  return {
    getFullImageUrl
  }
}
