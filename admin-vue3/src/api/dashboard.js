import request from '@/utils/request'

export function getStatistics() {
  return request({
    url: '/dashboard/statistics',
    method: 'get'
  })
}

export function getRecentLogs() {
  return request({
    url: '/dashboard/recentLogs',
    method: 'get'
  })
}

export function getTodoList() {
  return request({
    url: '/dashboard/todoList',
    method: 'get'
  })
}
