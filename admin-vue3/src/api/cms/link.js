import request from '@/utils/request'

export function listLink(query) {
  return request({
    url: '/cms/link/list',
    method: 'get',
    params: query
  })
}

export function getLink(linkId) {
  return request({
    url: '/cms/link/' + linkId,
    method: 'get'
  })
}

export function addLink(data) {
  return request({
    url: '/cms/link',
    method: 'post',
    data: data
  })
}

export function updateLink(data) {
  return request({
    url: '/cms/link',
    method: 'put',
    data: data
  })
}

export function delLink(linkId) {
  return request({
    url: '/cms/link/' + linkId,
    method: 'delete'
  })
}
