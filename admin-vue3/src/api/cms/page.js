import request from '@/utils/request'

export function listPage(query) {
  return request({
    url: '/cms/page/list',
    method: 'get',
    params: query
  })
}

export function getPage(pageId) {
  return request({
    url: '/cms/page/' + pageId,
    method: 'get'
  })
}

export function addPage(data) {
  return request({
    url: '/cms/page',
    method: 'post',
    data: data
  })
}

export function updatePage(data) {
  return request({
    url: '/cms/page',
    method: 'put',
    data: data
  })
}

export function delPage(pageId) {
  return request({
    url: '/cms/page/' + pageId,
    method: 'delete'
  })
}
