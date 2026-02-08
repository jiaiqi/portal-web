import request from '@/utils/request'

export function listSpecialCategory(query) {
  return request({
    url: '/cms/special-category/list',
    method: 'get',
    params: query
  })
}

export function getSpecialCategory(categoryId) {
  return request({
    url: '/cms/special-category/' + categoryId,
    method: 'get'
  })
}

export function getSpecialCategoryBySpecialId(specialId) {
  return request({
    url: '/cms/special-category/special/' + specialId,
    method: 'get'
  })
}

export function addSpecialCategory(data) {
  return request({
    url: '/cms/special-category',
    method: 'post',
    data: data
  })
}

export function updateSpecialCategory(data) {
  return request({
    url: '/cms/special-category',
    method: 'put',
    data: data
  })
}

export function delSpecialCategory(categoryId) {
  return request({
    url: '/cms/special-category/' + categoryId,
    method: 'delete'
  })
}
