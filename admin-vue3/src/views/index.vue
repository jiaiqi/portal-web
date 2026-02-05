<template>
  <div class="dashboard-container">
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24" class="mb20">
        <div class="welcome-card">
          <div class="welcome-content">
            <div class="welcome-text">
              <h2>欢迎回来，{{ userName }}！</h2>
              <p class="greeting">{{ greeting }}</p>
            </div>
            <div class="welcome-time">
              <div class="time">{{ currentTime }}</div>
              <div class="date">{{ currentDate }}</div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-blue">
            <el-icon :size="28"><Document /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.total || 0 }}</div>
            <div class="stat-label">文章总数</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-green">
            <el-icon :size="28"><CircleCheck /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.published || 0 }}</div>
            <div class="stat-label">已发布</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-orange">
            <el-icon :size="28"><EditPen /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.draft || 0 }}</div>
            <div class="stat-label">草稿箱</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-purple">
            <el-icon :size="28"><Bell /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.notice || 0 }}</div>
            <div class="stat-label">公告数量</div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-cyan">
            <el-icon :size="28"><Picture /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.focus || 0 }}</div>
            <div class="stat-label">焦点图</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-pink">
            <el-icon :size="28"><Film /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.banner || 0 }}</div>
            <div class="stat-label">轮播图</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-teal">
            <el-icon :size="28"><Folder /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.category || 0 }}</div>
            <div class="stat-label">分类数量</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="6" :xl="6">
        <div class="stat-card">
          <div class="stat-icon stat-icon-indigo">
            <el-icon :size="28"><Link /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.link || 0 }}</div>
            <div class="stat-label">友情链接</div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :sm="24" :md="16" :lg="16" :xl="16">
        <el-card class="chart-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">文章发布趋势</span>
              <el-radio-group v-model="chartType" size="small">
                <el-radio-button label="week">本周</el-radio-button>
                <el-radio-button label="month">本月</el-radio-button>
                <el-radio-button label="year">全年</el-radio-button>
              </el-radio-group>
            </div>
          </template>
          <div class="chart-container">
            <div class="chart-placeholder">
              <el-empty description="图表数据加载中..." />
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
        <el-card class="todo-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">待办事项</span>
              <el-link type="primary" :underline="false" @click="handleViewAllTodo">查看全部</el-link>
            </div>
          </template>
          <div class="todo-list">
            <div v-for="item in todoList" :key="item.id" class="todo-item" @click="handleTodoClick(item)">
              <div class="todo-icon">
                <el-icon v-if="item.type === 'article'" color="#409EFF"><Document /></el-icon>
                <el-icon v-else-if="item.type === 'banner'" color="#67C23A"><Film /></el-icon>
                <el-icon v-else-if="item.type === 'notice'" color="#E6A23C"><Bell /></el-icon>
                <el-icon v-else color="#909399"><Link /></el-icon>
              </div>
              <div class="todo-content">
                <div class="todo-title">{{ item.title }}</div>
                <div class="todo-meta">
                  <el-tag :type="getPriorityType(item.priority)" size="small">{{ getPriorityText(item.priority) }}</el-tag>
                </div>
              </div>
              <div class="todo-arrow">
                <el-icon><ArrowRight /></el-icon>
              </div>
            </div>
            <el-empty v-if="todoList.length === 0" description="暂无待办事项" :image-size="80" />
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-card class="recent-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">最近操作</span>
              <el-link type="primary" :underline="false" @click="handleViewAllLogs">查看全部</el-link>
            </div>
          </template>
          <div class="recent-list">
            <div v-for="log in recentLogs" :key="log.id" class="recent-item">
              <div class="recent-icon">
                <el-icon color="#409EFF"><Document /></el-icon>
              </div>
              <div class="recent-content">
                <div class="recent-title">{{ log.title }}</div>
                <div class="recent-meta">
                  <span class="recent-author">{{ log.author }}</span>
                  <span class="recent-time">{{ formatTime(log.createTime) }}</span>
                </div>
              </div>
              <div class="recent-status">
                <el-tag :type="log.status === 'published' ? 'success' : 'info'" size="small">
                  {{ log.status === 'published' ? '已发布' : '草稿' }}
                </el-tag>
              </div>
            </div>
            <el-empty v-if="recentLogs.length === 0" description="暂无操作记录" :image-size="80" />
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
        <el-card class="quick-card" shadow="hover">
          <template #header>
            <span class="card-title">快捷入口</span>
          </template>
          <div class="quick-grid">
            <div class="quick-item" @click="handleQuickLink('/cms/article')">
              <div class="quick-icon quick-icon-blue">
                <el-icon :size="20"><Document /></el-icon>
              </div>
              <div class="quick-label">文章管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/notice')">
              <div class="quick-icon quick-icon-green">
                <el-icon :size="20"><Bell /></el-icon>
              </div>
              <div class="quick-label">公告管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/banner')">
              <div class="quick-icon quick-icon-orange">
                <el-icon :size="20"><Film /></el-icon>
              </div>
              <div class="quick-label">轮播图</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/focus')">
              <div class="quick-icon quick-icon-purple">
                <el-icon :size="20"><Picture /></el-icon>
              </div>
              <div class="quick-label">焦点图</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/category')">
              <div class="quick-icon quick-icon-cyan">
                <el-icon :size="20"><Folder /></el-icon>
              </div>
              <div class="quick-label">分类管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/link')">
              <div class="quick-icon quick-icon-pink">
                <el-icon :size="20"><Link /></el-icon>
              </div>
              <div class="quick-label">友情链接</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/page')">
              <div class="quick-icon quick-icon-teal">
                <el-icon :size="20"><Files /></el-icon>
              </div>
              <div class="quick-label">单页管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/special')">
              <div class="quick-icon quick-icon-indigo">
                <el-icon :size="20"><Star /></el-icon>
              </div>
              <div class="quick-label">专题管理</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Dashboard">
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { getStatistics, getRecentLogs, getTodoList } from '@/api/dashboard'
import useUserStore from '@/store/modules/user'

const router = useRouter()
const userStore = useUserStore()

const userName = computed(() => userStore.name || '管理员')
const greeting = ref('')
const currentTime = ref('')
const currentDate = ref('')
const chartType = ref('week')
const statistics = ref({})
const recentLogs = ref([])
const todoList = ref([])
let timer = null

function updateGreeting() {
  const hour = new Date().getHours()
  if (hour < 6) {
    greeting.value = '夜深了，注意休息哦！'
  } else if (hour < 9) {
    greeting.value = '早上好，开启美好的一天！'
  } else if (hour < 12) {
    greeting.value = '上午好，工作顺利！'
  } else if (hour < 14) {
    greeting.value = '中午好，记得休息一下！'
  } else if (hour < 18) {
    greeting.value = '下午好，继续加油！'
  } else if (hour < 22) {
    greeting.value = '晚上好，辛苦了！'
  } else {
    greeting.value = '夜深了，早点休息！'
  }
}

function updateTime() {
  const now = new Date()
  currentTime.value = now.toLocaleTimeString('zh-CN', { hour: '2-digit', minute: '2-digit', second: '2-digit' })
  currentDate.value = now.toLocaleDateString('zh-CN', { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' })
}

function getStatisticsData() {
  getStatistics().then(response => {
    statistics.value = response.data || {}
  })
}

function getRecentLogsData() {
  getRecentLogs().then(response => {
    recentLogs.value = response.data || []
  })
}

function getTodoListData() {
  getTodoList().then(response => {
    todoList.value = response.data || []
  })
}

function formatTime(time) {
  if (!time) return ''
  const date = new Date(time)
  const now = new Date()
  const diff = now - date
  const minutes = Math.floor(diff / 60000)
  const hours = Math.floor(diff / 3600000)
  const days = Math.floor(diff / 86400000)

  if (minutes < 1) return '刚刚'
  if (minutes < 60) return `${minutes}分钟前`
  if (hours < 24) return `${hours}小时前`
  if (days < 7) return `${days}天前`
  return date.toLocaleDateString('zh-CN')
}

function getPriorityType(priority) {
  const map = {
    high: 'danger',
    medium: 'warning',
    low: 'info'
  }
  return map[priority] || 'info'
}

function getPriorityText(priority) {
  const map = {
    high: '高优先级',
    medium: '中优先级',
    low: '低优先级'
  }
  return map[priority] || '普通'
}

function handleQuickLink(path) {
  router.push(path)
}

function handleTodoClick(item) {
  router.push(item.link)
}

function handleViewAllTodo() {
  router.push('/cms/article')
}

function handleViewAllLogs() {
  router.push('/monitor/operlog')
}

onMounted(() => {
  updateGreeting()
  updateTime()
  timer = setInterval(updateTime, 1000)
  getStatisticsData()
  getRecentLogsData()
  getTodoListData()
})

onUnmounted(() => {
  if (timer) {
    clearInterval(timer)
  }
})
</script>

<style scoped lang="scss">
.dashboard-container {
  padding: 20px;
  background: #f5f7fa;
  min-height: calc(100vh - 84px);
}

.mb20 {
  margin-bottom: 20px;
}

.welcome-card {
  background: #ffffff;
  border-radius: 8px;
  padding: 24px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);

  .welcome-content {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .welcome-text {
      h2 {
        font-size: 24px;
        margin: 0 0 8px 0;
        font-weight: 600;
        color: #303133;
      }

      .greeting {
        font-size: 14px;
        color: #909399;
        margin: 0;
      }
    }

    .welcome-time {
      text-align: right;

      .time {
        font-size: 32px;
        font-weight: 600;
        line-height: 1;
        margin-bottom: 4px;
        color: #303133;
      }

      .date {
        font-size: 13px;
        color: #909399;
      }
    }
  }
}

.stat-card {
  background: white;
  border-radius: 8px;
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 16px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.08);
  transition: all 0.3s;
  cursor: pointer;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.12);
  }

  .stat-icon {
    width: 56px;
    height: 56px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
  }

  .stat-content {
    flex: 1;

    .stat-value {
      font-size: 28px;
      font-weight: 600;
      margin-bottom: 4px;
      color: #303133;
    }

    .stat-label {
      font-size: 13px;
      color: #909399;
    }
  }

  .stat-icon-blue {
    background: #409EFF;
  }

  .stat-icon-green {
    background: #67C23A;
  }

  .stat-icon-orange {
    background: #E6A23C;
  }

  .stat-icon-purple {
    background: #909399;
  }

  .stat-icon-cyan {
    background: #00B578;
  }

  .stat-icon-pink {
    background: #F56C6C;
  }

  .stat-icon-teal {
    background: #1890FF;
  }

  .stat-icon-indigo {
    background: #722ED1;
  }
}

.chart-card,
.todo-card,
.recent-card,
.quick-card {
  border-radius: 8px;
  overflow: hidden;

  .card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .card-title {
      font-size: 15px;
      font-weight: 600;
      color: #303133;
    }
  }
}

.chart-container {
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;

  .chart-placeholder {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
  }
}

.todo-list {
  max-height: 400px;
  overflow-y: auto;

  .todo-item {
    display: flex;
    align-items: center;
    padding: 14px;
    border-radius: 6px;
    transition: all 0.3s;
    cursor: pointer;

    &:hover {
      background: #f5f7fa;
    }

    &:not(:last-child) {
      border-bottom: 1px solid #f0f0f0;
    }

    .todo-icon {
      width: 36px;
      height: 36px;
      border-radius: 6px;
      background: #f0f2f5;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 10px;
    }

    .todo-content {
      flex: 1;

      .todo-title {
        font-size: 14px;
        color: #303133;
        margin-bottom: 4px;
      }

      .todo-meta {
        display: flex;
        gap: 6px;
      }
    }

    .todo-arrow {
      color: #c0c4cc;
    }
  }
}

.recent-list {
  max-height: 400px;
  overflow-y: auto;

  .recent-item {
    display: flex;
    align-items: center;
    padding: 14px;
    border-radius: 6px;
    transition: all 0.3s;

    &:hover {
      background: #f5f7fa;
    }

    &:not(:last-child) {
      border-bottom: 1px solid #f0f0f0;
    }

    .recent-icon {
      width: 36px;
      height: 36px;
      border-radius: 6px;
      background: #ecf5ff;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 10px;
    }

    .recent-content {
      flex: 1;

      .recent-title {
        font-size: 14px;
        color: #303133;
        margin-bottom: 4px;
      }

      .recent-meta {
        display: flex;
        justify-content: space-between;
        font-size: 12px;
        color: #909399;
      }
    }

    .recent-status {
      margin-left: 10px;
    }
  }
}

.quick-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 12px;

  .quick-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 16px;
    border-radius: 6px;
    transition: all 0.3s;
    cursor: pointer;

    &:hover {
      background: #f5f7fa;
      transform: translateY(-2px);
    }

    .quick-icon {
      width: 44px;
      height: 44px;
      border-radius: 8px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      margin-bottom: 8px;

      &.quick-icon-blue {
        background: #409EFF;
      }

      &.quick-icon-green {
        background: #67C23A;
      }

      &.quick-icon-orange {
        background: #E6A23C;
      }

      &.quick-icon-purple {
        background: #909399;
      }

      &.quick-icon-cyan {
        background: #00B578;
      }

      &.quick-icon-pink {
        background: #F56C6C;
      }

      &.quick-icon-teal {
        background: #1890FF;
      }

      &.quick-icon-indigo {
        background: #722ED1;
      }
    }

    .quick-label {
      font-size: 13px;
      color: #606266;
    }
  }
}

@media (max-width: 768px) {
  .welcome-content {
    flex-direction: column;
    text-align: center;
  }

  .welcome-time {
    text-align: center !important;
    margin-top: 16px;
  }

  .quick-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
</style>
