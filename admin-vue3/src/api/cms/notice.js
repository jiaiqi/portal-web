import request from '@/utils/request'

export function listNotice(query) {
  return request({
    url: '/cms/notice/list',
    method: 'get',
    params: query
  })
}

export function getNotice(id) {
  return request({
    url: '/cms/notice/' + id,
    method: 'get'
  })
}

export function addNotice(data) {
  return request({
    url: '/cms/notice',
    method: 'post',
    data: data
  })
}

export function updateNotice(data) {
  return request({
    url: '/cms/notice',
    method: 'put',
    data: data
  })
}

export function delNotice(id) {
  return request({
    url: '/cms/notice/' + id,
    method: 'delete'
  })
}
