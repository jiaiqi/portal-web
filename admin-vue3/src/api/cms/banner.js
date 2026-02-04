import request from '@/utils/request'

export function listBanner(query) {
  return request({
    url: '/cms/banner/list',
    method: 'get',
    params: query
  })
}

export function getBanner(bannerId) {
  return request({
    url: '/cms/banner/' + bannerId,
    method: 'get'
  })
}

export function addBanner(data) {
  return request({
    url: '/cms/banner',
    method: 'post',
    data: data
  })
}

export function updateBanner(data) {
  return request({
    url: '/cms/banner',
    method: 'put',
    data: data
  })
}

export function delBanner(bannerId) {
  return request({
    url: '/cms/banner/' + bannerId,
    method: 'delete'
  })
}
