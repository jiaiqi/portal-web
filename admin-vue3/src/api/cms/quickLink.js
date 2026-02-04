import request from '@/utils/request'

export function listQuickLink(query) {
  return request({
    url: '/cms/quick-link/list',
    method: 'get',
    params: query
  })
}

export function getQuickLink(linkId) {
  return request({
    url: '/cms/quick-link/' + linkId,
    method: 'get'
  })
}

export function addQuickLink(data) {
  return request({
    url: '/cms/quick-link',
    method: 'post',
    data: data
  })
}

export function updateQuickLink(data) {
  return request({
    url: '/cms/quick-link',
    method: 'put',
    data: data
  })
}

export function delQuickLink(linkId) {
  return request({
    url: '/cms/quick-link/' + linkId,
    method: 'delete'
  })
}
