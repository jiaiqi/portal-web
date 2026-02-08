// 处理富文本内容，将相对路径转换为完整URL
export const useRichText = () => {
  const config = useRuntimeConfig()
  const baseUrl = config.public.apiBase || 'http://localhost:8888'

  // 处理HTML内容，将相对路径转换为完整URL
  const processHtml = (html: string | undefined | null): string => {
    if (!html) return ''
    
    // 替换图片src - 只替换以/开头的路径
    html = html.replace(/src="(\/[^"]+)"/g, `src="${baseUrl}$1"`)
    html = html.replace(/src='(\/[^']+)'/g, `src="${baseUrl}$1"`)
    
    // 替换链接href
    html = html.replace(/href="(\/[^"]+)"/g, `href="${baseUrl}$1"`)
    html = html.replace(/href='(\/[^']+)'/g, `href="${baseUrl}$1"`)
    
    return html
  }

  return {
    processHtml
  }
}
