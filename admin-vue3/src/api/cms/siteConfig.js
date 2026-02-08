import request from '@/utils/request'

export function listSiteConfig(query) {
  return request({
    url: '/cms/site-config/list',
    method: 'get',
    params: query
  })
}

export function getSiteConfig(configId) {
  return request({
    url: '/cms/site-config/' + configId,
    method: 'get'
  })
}

export function addSiteConfig(data) {
  return request({
    url: '/cms/site-config',
    method: 'post',
    data: data
  })
}

export function updateSiteConfig(data) {
  return request({
    url: '/cms/site-config',
    method: 'put',
    data: data
  })
}

export function delSiteConfig(configId) {
  return request({
    url: '/cms/site-config/' + configId,
    method: 'delete'
  })
}
