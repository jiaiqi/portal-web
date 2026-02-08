import request from '@/utils/request'

// ==================== 栏目管理 ====================

// 查询栏目列表
export function listSection(query) {
  return request({
    url: '/cms/about/section/list',
    method: 'get',
    params: query
  })
}

// 查询所有启用栏目
export function listAllSection() {
  return request({
    url: '/cms/about/section/all',
    method: 'get'
  })
}

// 查询栏目详情
export function getSection(sectionId) {
  return request({
    url: '/cms/about/section/' + sectionId,
    method: 'get'
  })
}

// 新增栏目
export function addSection(data) {
  return request({
    url: '/cms/about/section',
    method: 'post',
    data: data
  })
}

// 修改栏目
export function updateSection(data) {
  return request({
    url: '/cms/about/section',
    method: 'put',
    data: data
  })
}

// 删除栏目
export function delSection(sectionId) {
  return request({
    url: '/cms/about/section/' + sectionId,
    method: 'delete'
  })
}

// ==================== 文章管理 ====================

// 查询文章列表
export function listAboutArticle(query) {
  return request({
    url: '/cms/about/article/list',
    method: 'get',
    params: query
  })
}

// 查询文章详情
export function getAboutArticle(articleId) {
  return request({
    url: '/cms/about/article/' + articleId,
    method: 'get'
  })
}

// 新增文章
export function addAboutArticle(data) {
  return request({
    url: '/cms/about/article',
    method: 'post',
    data: data
  })
}

// 修改文章
export function updateAboutArticle(data) {
  return request({
    url: '/cms/about/article',
    method: 'put',
    data: data
  })
}

// 删除文章
export function delAboutArticle(articleId) {
  return request({
    url: '/cms/about/article/' + articleId,
    method: 'delete'
  })
}
