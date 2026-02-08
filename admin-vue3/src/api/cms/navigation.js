import request from '@/utils/request'

export function listNavigation(query) {
  return request({
    url: '/cms/navigation/list',
    method: 'get',
    params: query
  })
}

export function getNavigation(navId) {
  return request({
    url: '/cms/navigation/' + navId,
    method: 'get'
  })
}

export function addNavigation(data) {
  return request({
    url: '/cms/navigation',
    method: 'post',
    data: data
  })
}

export function updateNavigation(data) {
  return request({
    url: '/cms/navigation',
    method: 'put',
    data: data
  })
}

export function delNavigation(navId) {
  return request({
    url: '/cms/navigation/' + navId,
    method: 'delete'
  })
}
