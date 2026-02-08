import request from '@/utils/request'

export function getStatistics() {
  return request({
    url: '/dashboard/statistics',
    method: 'get'
  })
}

export function getRecentLogs(params) {
  return request({
    url: '/dashboard/recentLogs',
    method: 'get',
    params
  })
}

export function getArticleTrend(params) {
  return request({
    url: '/dashboard/articleTrend',
    method: 'get',
    params
  })
}

export function getSystemStatus() {
  return request({
    url: '/dashboard/systemStatus',
    method: 'get'
  })
}

export function getTodoList() {
  return request({
    url: '/dashboard/todoList',
    method: 'get'
  })
}
