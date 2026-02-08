<template>
  <div class="dashboard-container">
    <!-- 欢迎区域 -->
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

    <!-- 核心数据统计 -->
    <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/article-audit')">
          <div class="stat-icon stat-icon-blue">
            <el-icon :size="24"><Document /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.total || 0 }}</div>
            <div class="stat-label">文章总数</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/article-audit')">
          <div class="stat-icon stat-icon-green">
            <el-icon :size="24"><CircleCheck /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.published || 0 }}</div>
            <div class="stat-label">已发布</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/article-audit')">
          <div class="stat-icon stat-icon-orange">
            <el-icon :size="24"><EditPen /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.article?.draft || 0 }}</div>
            <div class="stat-label">草稿箱</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/announcements?categoryCode=notice')">
          <div class="stat-icon stat-icon-purple">
            <el-icon :size="24"><Bell /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.notice || 0 }}</div>
            <div class="stat-label">公告</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/focus')">
          <div class="stat-icon stat-icon-cyan">
            <el-icon :size="24"><Picture /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.focus || 0 }}</div>
            <div class="stat-label">焦点图</div>
          </div>
        </div>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="4" :xl="4">
        <div class="stat-card" @click="handleQuickLink('/cms/category')">
          <div class="stat-icon stat-icon-pink">
            <el-icon :size="24"><Folder /></el-icon>
          </div>
          <div class="stat-content">
            <div class="stat-value">{{ statistics.content?.category || 0 }}</div>
            <div class="stat-label">分类</div>
          </div>
        </div>
      </el-col>
    </el-row>

    <!-- 快捷入口 -->
    <!-- <el-row :gutter="20" class="mb20">
      <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
        <el-card class="quick-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><Grid /></el-icon>
                快捷入口
              </span>
            </div>
          </template>
          <div class="quick-grid">
            <div class="quick-item" @click="handleQuickLink('/cms/article-audit')">
              <div class="quick-icon quick-icon-blue">
                <el-icon :size="22"><Document /></el-icon>
              </div>
              <div class="quick-label">文章管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/article-audit/index')">
              <div class="quick-icon quick-icon-orange">
                <el-icon :size="22"><Check /></el-icon>
              </div>
              <div class="quick-label">文章审核</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/announcements?categoryCode=notice')">
              <div class="quick-icon quick-icon-green">
                <el-icon :size="22"><Bell /></el-icon>
              </div>
              <div class="quick-label">公告管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/focus')">
              <div class="quick-icon quick-icon-purple">
                <el-icon :size="22"><Picture /></el-icon>
              </div>
              <div class="quick-label">焦点图</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/category')">
              <div class="quick-icon quick-icon-cyan">
                <el-icon :size="22"><Folder /></el-icon>
              </div>
              <div class="quick-label">分类管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/special/index')">
              <div class="quick-icon quick-icon-indigo">
                <el-icon :size="22"><Star /></el-icon>
              </div>
              <div class="quick-label">专题管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/page/index')">
              <div class="quick-icon quick-icon-teal">
                <el-icon :size="22"><Files /></el-icon>
              </div>
              <div class="quick-label">单页管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/link/index')">
              <div class="quick-icon quick-icon-blue">
                <el-icon :size="22"><Link /></el-icon>
              </div>
              <div class="quick-label">友情链接</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/navigation/index')">
              <div class="quick-icon quick-icon-green">
                <el-icon :size="22"><Compass /></el-icon>
              </div>
              <div class="quick-label">导航管理</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/siteConfig/index')">
              <div class="quick-icon quick-icon-orange">
                <el-icon :size="22"><Setting /></el-icon>
              </div>
              <div class="quick-label">站点配置</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/cms/about/index')">
              <div class="quick-icon quick-icon-pink">
                <el-icon :size="22"><InfoFilled /></el-icon>
              </div>
              <div class="quick-label">关于我们</div>
            </div>
            <div class="quick-item" @click="handleQuickLink('/system/user/index')">
              <div class="quick-icon quick-icon-purple">
                <el-icon :size="22"><User /></el-icon>
              </div>
              <div class="quick-label">用户管理</div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row> -->

    <!-- 内容区域：文章趋势 + 最近动态 -->
    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="16" :lg="16" :xl="16" class="mb20">
        <el-card class="chart-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><TrendCharts /></el-icon>
                文章发布趋势
              </span>
              <el-radio-group v-model="chartType" size="small">
                <el-radio-button label="week">本周</el-radio-button>
                <el-radio-button label="month">本月</el-radio-button>
                <el-radio-button label="year">全年</el-radio-button>
              </el-radio-group>
            </div>
          </template>
          <div class="chart-container" v-loading="chartLoading">
            <div ref="chartRef" class="chart-content"></div>
            <el-empty v-if="!chartData.length" description="暂无数据" />
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8" class="mb20">
        <el-card class="recent-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><Timer /></el-icon>
                最近操作
              </span>
              <el-link type="primary" :underline="false" @click="handleViewAllLogs">查看全部</el-link>
            </div>
          </template>
          <div class="recent-list" v-loading="logsLoading">
            <div v-for="log in recentLogs" :key="log.operId" class="recent-item">
              <div class="recent-icon" :class="getLogIconClass(log.businessType)">
                <el-icon :size="16">
                  <Document v-if="log.businessType === '文章'" />
                  <Bell v-else-if="log.businessType === '公告'" />
                  <Picture v-else-if="log.businessType === '焦点图'" />
                  <Film v-else-if="log.businessType === '轮播图'" />
                  <User v-else-if="log.businessType === '用户'" />
                  <Setting v-else />
                </el-icon>
              </div>
              <div class="recent-content">
                <div class="recent-title">{{ log.title }}</div>
                <div class="recent-meta">
                  <span class="recent-type">{{ log.businessType }}</span>
                  <span class="recent-time">{{ formatTime(log.operTime) }}</span>
                </div>
              </div>
              <div class="recent-status">
                <el-tag :type="log.status === '0' ? 'success' : 'danger'" size="small">
                  {{ log.status === '0' ? '成功' : '失败' }}
                </el-tag>
              </div>
            </div>
            <el-empty v-if="recentLogs.length === 0" description="暂无操作记录" :image-size="80" />
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 系统监控信息 -->
    <el-row :gutter="20">
      <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
        <el-card class="monitor-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><UserFilled /></el-icon>
                在线用户
              </span>
              <el-link type="primary" :underline="false" @click="handleQuickLink('/monitor/online')">查看</el-link>
            </div>
          </template>
          <div class="monitor-content">
            <div class="monitor-value">{{ statistics.onlineUser || 0 }}</div>
            <div class="monitor-label">当前在线</div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
        <el-card class="monitor-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><Calendar /></el-icon>
                定时任务
              </span>
              <el-link type="primary" :underline="false" @click="handleQuickLink('/monitor/job')">查看</el-link>
            </div>
          </template>
          <div class="monitor-content">
            <div class="monitor-value">{{ statistics.jobCount || 0 }}</div>
            <div class="monitor-label">任务数量</div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
        <el-card class="monitor-card" shadow="hover">
          <template #header>
            <div class="card-header">
              <span class="card-title">
                <el-icon><DataLine /></el-icon>
                系统状态
              </span>
              <el-link type="primary" :underline="false" @click="handleQuickLink('/monitor/server')">查看</el-link>
            </div>
          </template>
          <div class="monitor-content">
            <div class="monitor-status" :class="systemStatus.class">
              <el-icon :size="24"><CircleCheck v-if="systemStatus.ok" /><Warning v-else /></el-icon>
              <span>{{ systemStatus.text }}</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup name="Dashboard">
import { ref, onMounted, onUnmounted, computed, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import * as echarts from 'echarts'
import { getStatistics, getRecentLogs, getArticleTrend, getSystemStatus } from '@/api/dashboard'
import useUserStore from '@/store/modules/user'

const router = useRouter()
const userStore = useUserStore()
const chartRef = ref(null)
let chartInstance = null

const userName = computed(() => userStore.name || '管理员')
const greeting = ref('')
const currentTime = ref('')
const currentDate = ref('')
const chartType = ref('week')
const chartLoading = ref(false)
const logsLoading = ref(false)
const statistics = ref({
  article: { total: 0, published: 0, draft: 0 },
  content: { notice: 0, focus: 0, category: 0 },
  onlineUser: 0,
  jobCount: 0
})
const recentLogs = ref([])
const chartData = ref([])
const systemStatus = ref({ ok: true, text: '运行正常', class: 'status-normal' })
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

async function getStatisticsData() {
  try {
    const res = await getStatistics()
    statistics.value = { ...statistics.value, ...res.data }
  } catch (error) {
    console.error('获取统计数据失败:', error)
  }
}

async function getRecentLogsData() {
  logsLoading.value = true
  try {
    const res = await getRecentLogs({ pageSize: 10 })
    recentLogs.value = res.rows || []
  } catch (error) {
    console.error('获取最近操作失败:', error)
  } finally {
    logsLoading.value = false
  }
}

async function getArticleTrendData() {
  chartLoading.value = true
  try {
    const res = await getArticleTrend({ type: chartType.value })
    chartData.value = res.data || []
    initChart()
  } catch (error) {
    console.error('获取文章趋势失败:', error)
  } finally {
    chartLoading.value = false
  }
}

async function getSystemStatusData() {
  try {
    const res = await getSystemStatus()
    const status = res.data
    systemStatus.value = {
      ok: status.cpuUsage < 80 && status.memoryUsage < 80,
      text: status.cpuUsage < 80 && status.memoryUsage < 80 ? '运行正常' : '负载较高',
      class: status.cpuUsage < 80 && status.memoryUsage < 80 ? 'status-normal' : 'status-warning'
    }
  } catch (error) {
    console.error('获取系统状态失败:', error)
  }
}

function initChart() {
  if (!chartRef.value || !chartData.value.length) return
  
  if (chartInstance) {
    chartInstance.dispose()
  }
  
  chartInstance = echarts.init(chartRef.value)
  const option = {
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' }
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: chartData.value.map(item => item.date),
      axisLine: { lineStyle: { color: '#E4E7ED' } },
      axisLabel: { color: '#606266' }
    },
    yAxis: {
      type: 'value',
      axisLine: { show: false },
      axisTick: { show: false },
      splitLine: { lineStyle: { color: '#E4E7ED', type: 'dashed' } },
      axisLabel: { color: '#606266' }
    },
    series: [{
      name: '文章数',
      type: 'line',
      smooth: true,
      symbol: 'circle',
      symbolSize: 8,
      itemStyle: { color: '#409EFF' },
      lineStyle: { width: 3 },
      areaStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          { offset: 0, color: 'rgba(64, 158, 255, 0.3)' },
          { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
        ])
      },
      data: chartData.value.map(item => item.count)
    }]
  }
  chartInstance.setOption(option)
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

function getLogIconClass(businessType) {
  const map = {
    '文章': 'icon-blue',
    '公告': 'icon-green',
    '焦点图': 'icon-purple',
    '轮播图': 'icon-pink',
    '用户': 'icon-orange',
    '系统': 'icon-cyan'
  }
  return map[businessType] || 'icon-gray'
}

function handleQuickLink(path) {
  router.push(path)
}

function handleViewAllLogs() {
  router.push('/monitor/operlog')
}

watch(chartType, () => {
  getArticleTrendData()
})

onMounted(() => {
  updateGreeting()
  updateTime()
  timer = setInterval(updateTime, 1000)
  getStatisticsData()
  getRecentLogsData()
  getArticleTrendData()
  getSystemStatusData()
  
  window.addEventListener('resize', () => {
    chartInstance?.resize()
  })
})

onUnmounted(() => {
  if (timer) clearInterval(timer)
  if (chartInstance) chartInstance.dispose()
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

// 欢迎卡片
.welcome-card {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border-radius: 12px;
  padding: 24px;
  color: white;
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);

  .welcome-content {
    display: flex;
    justify-content: space-between;
    align-items: center;

    .welcome-text {
      h2 {
        font-size: 26px;
        margin: 0 0 8px 0;
        font-weight: 600;
      }

      .greeting {
        font-size: 14px;
        opacity: 0.9;
        margin: 0;
      }
    }

    .welcome-time {
      text-align: right;

      .time {
        font-size: 36px;
        font-weight: 600;
        line-height: 1;
        margin-bottom: 4px;
      }

      .date {
        font-size: 13px;
        opacity: 0.9;
      }
    }
  }
}

// 统计卡片
.stat-card {
  background: white;
  border-radius: 10px;
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 14px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
  transition: all 0.3s;
  cursor: pointer;

  &:hover {
    transform: translateY(-3px);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  }

  .stat-icon {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
  }

  .stat-content {
    flex: 1;

    .stat-value {
      font-size: 26px;
      font-weight: 600;
      margin-bottom: 4px;
      color: #303133;
    }

    .stat-label {
      font-size: 13px;
      color: #909399;
    }
  }

  .stat-icon-blue { background: linear-gradient(135deg, #409EFF 0%, #64b5f6 100%); }
  .stat-icon-green { background: linear-gradient(135deg, #67C23A 0%, #81c784 100%); }
  .stat-icon-orange { background: linear-gradient(135deg, #E6A23C 0%, #ffb74d 100%); }
  .stat-icon-purple { background: linear-gradient(135deg, #9c27b0 0%, #ba68c8 100%); }
  .stat-icon-cyan { background: linear-gradient(135deg, #00BCD4 0%, #4dd0e1 100%); }
  .stat-icon-pink { background: linear-gradient(135deg, #F56C6C 0%, #e57373 100%); }
}

// 卡片通用样式
.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;

  .card-title {
    font-size: 15px;
    font-weight: 600;
    color: #303133;
    display: flex;
    align-items: center;
    gap: 6px;
  }
}

// 快捷入口
.quick-card {
  border-radius: 10px;
  overflow: hidden;

  .quick-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 16px;

    .quick-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px 12px;
      border-radius: 8px;
      transition: all 0.3s;
      cursor: pointer;

      &:hover {
        background: #f5f7fa;
        transform: translateY(-3px);
      }

      .quick-icon {
        width: 48px;
        height: 48px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        margin-bottom: 10px;
        transition: all 0.3s;

        &.quick-icon-blue { background: linear-gradient(135deg, #409EFF 0%, #64b5f6 100%); }
        &.quick-icon-green { background: linear-gradient(135deg, #67C23A 0%, #81c784 100%); }
        &.quick-icon-orange { background: linear-gradient(135deg, #E6A23C 0%, #ffb74d 100%); }
        &.quick-icon-purple { background: linear-gradient(135deg, #9c27b0 0%, #ba68c8 100%); }
        &.quick-icon-pink { background: linear-gradient(135deg, #F56C6C 0%, #e57373 100%); }
        &.quick-icon-cyan { background: linear-gradient(135deg, #00BCD4 0%, #4dd0e1 100%); }
        &.quick-icon-teal { background: linear-gradient(135deg, #009688 0%, #4db6ac 100%); }
        &.quick-icon-indigo { background: linear-gradient(135deg, #3f51b5 0%, #7986cb 100%); }
      }

      .quick-label {
        font-size: 13px;
        color: #606266;
        font-weight: 500;
      }
    }
  }
}

// 图表卡片
.chart-card {
  border-radius: 10px;
  overflow: hidden;

  .chart-container {
    height: 320px;
    position: relative;

    .chart-content {
      width: 100%;
      height: 100%;
    }
  }
}

// 最近操作
.recent-card {
  border-radius: 10px;
  overflow: hidden;

  .recent-list {
    max-height: 320px;
    overflow-y: auto;

    .recent-item {
      display: flex;
      align-items: center;
      padding: 12px;
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
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 12px;
        color: white;

        &.icon-blue { background: linear-gradient(135deg, #409EFF 0%, #64b5f6 100%); }
        &.icon-green { background: linear-gradient(135deg, #67C23A 0%, #81c784 100%); }
        &.icon-purple { background: linear-gradient(135deg, #9c27b0 0%, #ba68c8 100%); }
        &.icon-pink { background: linear-gradient(135deg, #F56C6C 0%, #e57373 100%); }
        &.icon-orange { background: linear-gradient(135deg, #E6A23C 0%, #ffb74d 100%); }
        &.icon-cyan { background: linear-gradient(135deg, #00BCD4 0%, #4dd0e1 100%); }
        &.icon-gray { background: #909399; }
      }

      .recent-content {
        flex: 1;
        min-width: 0;

        .recent-title {
          font-size: 14px;
          color: #303133;
          margin-bottom: 4px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis;
        }

        .recent-meta {
          display: flex;
          gap: 8px;
          font-size: 12px;
          color: #909399;
        }
      }

      .recent-status {
        margin-left: 8px;
      }
    }
  }
}

// 监控卡片
.monitor-card {
  border-radius: 10px;
  overflow: hidden;

  .monitor-content {
    padding: 20px;
    text-align: center;

    .monitor-value {
      font-size: 36px;
      font-weight: 600;
      color: #303133;
      margin-bottom: 8px;
    }

    .monitor-label {
      font-size: 14px;
      color: #909399;
    }

    .monitor-status {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      padding: 20px;
      font-size: 16px;
      font-weight: 500;

      &.status-normal {
        color: #67C23A;
      }

      &.status-warning {
        color: #E6A23C;
      }
    }
  }
}

@media (max-width: 1200px) {
  .quick-grid {
    grid-template-columns: repeat(4, 1fr) !important;
  }
}

@media (max-width: 768px) {
  .welcome-content {
    flex-direction: column;
    text-align: center;

    .welcome-time {
      text-align: center !important;
      margin-top: 16px;
    }
  }

  .quick-grid {
    grid-template-columns: repeat(3, 1fr) !important;
  }
}

@media (max-width: 480px) {
  .quick-grid {
    grid-template-columns: repeat(2, 1fr) !important;
  }
}
</style>