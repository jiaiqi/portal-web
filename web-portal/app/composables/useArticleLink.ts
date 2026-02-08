import type { Article } from '~/types/category'

interface ArticleLink {
  isExternal: boolean
  href: string
  target?: string
}

export function useArticleLink() {
  /**
   * 获取文章链接信息
   * @param article 文章对象
   * @param basePath 基础路径（如 '/news', '/party' 等）
   * @returns 链接信息
   */
  function getArticleLink(article: Article, basePath: string = ''): ArticleLink {
    // 外部链接类型
    if (article.contentType === 'link' && article.externalLink) {
      // 清理链接，去除反引号和多余空格
      const cleanLink = article.externalLink.replace(/[`\s]/g, '')
      return {
        isExternal: true,
        href: cleanLink,
        target: '_blank'
      }
    }

    // 普通文章，返回内部链接
    const path = basePath || '/article'
    return {
      isExternal: false,
      href: `${path}/${article.articleId}`
    }
  }

  /**
   * 处理文章点击
   * @param article 文章对象
   * @param basePath 基础路径
   */
  function handleArticleClick(article: Article, basePath: string = '') {
    // eslint-disable-next-line no-console
    console.warn('Article clicked:', article)
    // eslint-disable-next-line no-console
    console.warn('contentType:', article.contentType, 'externalLink:', article.externalLink)
    debugger
    const link = getArticleLink(article, basePath)

    if (link.isExternal) {
      // 外部链接，在新窗口打开
      window.open(link.href, link.target)
    } else {
      // 内部链接，使用路由导航
      navigateTo(link.href)
    }
  }

  return {
    getArticleLink,
    handleArticleClick
  }
}
