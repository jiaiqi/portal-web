import request from '@/utils/request'

export function listSpecial(query) {
  return request({
    url: '/cms/special/list',
    method: 'get',
    params: query
  })
}

export function getSpecial(specialId) {
  return request({
    url: '/cms/special/' + specialId,
    method: 'get'
  })
}

export function addSpecial(data) {
  return request({
    url: '/cms/special',
    method: 'post',
    data: data
  })
}

export function updateSpecial(data) {
  return request({
    url: '/cms/special',
    method: 'put',
    data: data
  })
}

export function delSpecial(specialId) {
  return request({
    url: '/cms/special/' + specialId,
    method: 'delete'
  })
}

// 专题文章管理
export function listSpecialArticles(specialId, query) {
  return request({
    url: '/cms/special/' + specialId + '/articleList',
    method: 'get',
    params: query
  })
}

export function addSpecialArticle(data) {
  return request({
    url: '/cms/special/article',
    method: 'post',
    data: data
  })
}

export function delSpecialArticle(id) {
  return request({
    url: '/cms/special/article/' + id,
    method: 'delete'
  })
}
