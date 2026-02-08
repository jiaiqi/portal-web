<script setup>
import { listArticle, auditArticle, publishArticle } from '@/api/cms/article'
import { listCategory } from '@/api/cms/category'

const { proxy } = getCurrentInstance()

const loading = ref(false)
const articleList = ref([])
const total = ref(0)
const selectedArticles = ref([])

const queryParams = reactive({
  pageNum: 1,
  pageSize: 10,
  title: undefined,
  categoryId: undefined,
  status: undefined,
  auditStatus: undefined
})

const categoryList = ref([])

// 状态选项
const statusOptions = [
  { label: '草稿', value: '0' },
  { label: '已发布', value: '1' },
  { label: '待审核', value: '2' },
  { label: '审核通过', value: '3' },
  { label: '审核不通过', value: '4' }
]

// 审核状态选项
const auditStatusOptions = [
  { label: '待审核', value: '0' },
  { label: '审核通过', value: '1' },
  { label: '审核不通过', value: '2' }
]

// 获取分类列表
function getCategoryList() {
  listCategory({ pageSize: 100 }).then(res => {
    categoryList.value = res.data?.list || res.rows || []
  })
}

// 获取文章列表
function getList() {
  loading.value = true
  listArticle(queryParams).then(res => {
    articleList.value = res.data?.list || res.rows || []
    total.value = res.data?.total || res.total || 0
    loading.value = false
  }).catch(() => {
    loading.value = false
  })
}

// 搜索
function handleQuery() {
  queryParams.pageNum = 1
  getList()
}

// 重置
function resetQuery() {
  proxy.resetForm('queryRef')
  handleQuery()
}

// 选择变化
function handleSelectionChange(selection) {
  selectedArticles.value = selection
}

// 审核对话框
const auditDialogVisible = ref(false)
const auditForm = reactive({
  articleIds: [],
  auditStatus: '1',
  auditReason: ''
})

// 打开审核对话框
function handleAudit(row) {
  auditForm.articleIds = row ? [row.articleId] : selectedArticles.value.map(item => item.articleId)
  if (auditForm.articleIds.length === 0) {
    proxy.$modal.msgError('请选择要审核的文章')
    return
  }
  auditForm.auditStatus = '1'
  auditForm.auditReason = ''
  auditDialogVisible.value = true
}

// 提交审核
function submitAudit() {
  if (auditForm.auditStatus === '2' && !auditForm.auditReason) {
    proxy.$modal.msgError('审核不通过时必须填写原因')
    return
  }
  auditArticle(auditForm).then(() => {
    proxy.$modal.msgSuccess('审核成功')
    auditDialogVisible.value = false
    getList()
  })
}

// 发布文章
function handlePublish(row) {
  const articleIds = row ? [row.articleId] : selectedArticles.value.map(item => item.articleId)
  if (articleIds.length === 0) {
    proxy.$modal.msgError('请选择要发布的文章')
    return
  }
  // 检查是否都是审核通过的文章
  const articles = row ? [row] : selectedArticles.value
  const notApproved = articles.filter(a => a.auditStatus !== '1')
  if (notApproved.length > 0) {
    proxy.$modal.msgError('只能发布审核通过的文章')
    return
  }
  proxy.$modal.confirm('确认发布选中的文章吗？').then(() => {
    publishArticle({ articleIds }).then(() => {
      proxy.$modal.msgSuccess('发布成功')
      getList()
    })
  })
}

// 获取状态标签
function getStatusLabel(status) {
  const option = statusOptions.find(item => item.value === status)
  return option?.label || status
}

// 获取状态类型
function getStatusType(status) {
  const typeMap = {
    '0': 'info',
    '1': 'success',
    '2': 'warning',
    '3': 'success',
    '4': 'danger'
  }
  return typeMap[status] || 'info'
}

// 获取审核状态标签
function getAuditStatusLabel(auditStatus) {
  const option = auditStatusOptions.find(item => item.value === auditStatus)
  return option?.label || auditStatus || '待审核'
}

// 获取审核状态类型
function getAuditStatusType(auditStatus) {
  const typeMap = {
    '0': 'warning',
    '1': 'success',
    '2': 'danger'
  }
  return typeMap[auditStatus] || 'info'
}

getCategoryList()
getList()
</script>

<template>
  <div class="app-container">
    <el-form ref="queryRef" :model="queryParams" inline label-width="80px">
      <el-form-item label="文章标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入文章标题"
          clearable
          style="width: 200px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择分类" clearable style="width: 150px">
          <el-option
            v-for="item in categoryList"
            :key="item.categoryId"
            :label="item.categoryName"
            :value="item.categoryId"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 150px">
          <el-option
            v-for="item in statusOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="审核状态" prop="auditStatus">
        <el-select v-model="queryParams.auditStatus" placeholder="请选择审核状态" clearable style="width: 150px">
          <el-option
            v-for="item in auditStatusOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Check" @click="handleAudit()">批量审核</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Promotion" @click="handlePublish()">批量发布</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文章ID" prop="articleId" width="80" />
      <el-table-column label="标题" prop="title" :show-overflow-tooltip="true" />
      <el-table-column label="分类" prop="categoryName" width="120" />
      <el-table-column label="状态" width="100" align="center">
        <template #default="scope">
          <el-tag :type="getStatusType(scope.row.status)">
            {{ getStatusLabel(scope.row.status) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="审核状态" width="100" align="center">
        <template #default="scope">
          <el-tag :type="getAuditStatusType(scope.row.auditStatus)">
            {{ getAuditStatusLabel(scope.row.auditStatus) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="审核原因" prop="auditReason" :show-overflow-tooltip="true" />
      <el-table-column label="审核人" prop="auditBy" width="100" />
      <el-table-column label="审核时间" prop="auditTime" width="160">
        <template #default="scope">
          <span>{{ scope.row.auditTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Check" @click="handleAudit(scope.row)">审核</el-button>
          <el-button
            v-if="scope.row.auditStatus === '1'"
            link
            type="success"
            icon="Promotion"
            @click="handlePublish(scope.row)"
          >
            发布
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 审核对话框 -->
    <el-dialog v-model="auditDialogVisible" title="文章审核" width="500px" append-to-body>
      <el-form :model="auditForm" label-width="100px">
        <el-form-item label="审核结果">
          <el-radio-group v-model="auditForm.auditStatus">
            <el-radio label="1">审核通过</el-radio>
            <el-radio label="2">审核不通过</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item v-if="auditForm.auditStatus === '2'" label="审核原因" required>
          <el-input
            v-model="auditForm.auditReason"
            type="textarea"
            :rows="4"
            placeholder="请输入审核不通过的原因"
          />
        </el-form-item>
        <el-form-item v-else label="审核原因">
          <el-input
            v-model="auditForm.auditReason"
            type="textarea"
            :rows="4"
            placeholder="可选：输入审核通过的备注"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitAudit">确 定</el-button>
          <el-button @click="auditDialogVisible = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
