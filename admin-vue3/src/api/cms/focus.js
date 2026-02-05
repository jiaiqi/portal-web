import request from '@/utils/request'

export function listFocus(query) {
  return request({
    url: '/cms/focus/list',
    method: 'get',
    params: query
  })
}

export function getFocus(id) {
  return request({
    url: '/cms/focus/' + id,
    method: 'get'
  })
}

export function addFocus(data) {
  return request({
    url: '/cms/focus',
    method: 'post',
    data: data
  })
}

export function updateFocus(data) {
  return request({
    url: '/cms/focus',
    method: 'put',
    data: data
  })
}

export function delFocus(id) {
  return request({
    url: '/cms/focus/' + id,
    method: 'delete'
  })
}
