import request from '@/utils/request'

// 获取焦点图列表
export function listFocus(query) {
  return request({
    url: '/cms/focus/list',
    method: 'get',
    params: query
  })
}

// 获取焦点图详情
export function getFocus(focusId) {
  return request({
    url: '/cms/focus/' + focusId,
    method: 'get'
  })
}

// 修改焦点图
export function updateFocus(data) {
  return request({
    url: '/cms/focus',
    method: 'put',
    data: data
  })
}

// 获取历史记录列表
export function listHistory(query) {
  return request({
    url: '/cms/focus/history/list',
    method: 'get',
    params: query
  })
}

// 从历史记录恢复
export function restoreHistory(data) {
  return request({
    url: '/cms/focus/history/restore',
    method: 'put',
    data: data
  })
}

// 删除历史记录
export function delHistory(historyId) {
  return request({
    url: '/cms/focus/history/' + historyId,
    method: 'delete'
  })
}
