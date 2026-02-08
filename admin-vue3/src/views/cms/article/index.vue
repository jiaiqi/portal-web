<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章标题" prop="title">
        <el-input v-model="queryParams.title" placeholder="请输入文章标题" clearable style="width: 240px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择分类" clearable style="width: 240px">
          <el-option v-for="item in categoryList" :key="item.categoryId" :label="item.categoryName" :value="item.categoryId" />
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 240px">
          <el-option label="草稿" value="0" />
          <el-option label="已发布" value="1" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:article:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate" v-hasPermi="['cms:article:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete" v-hasPermi="['cms:article:remove']">删除</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="articleList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="articleId" width="80" />
      <el-table-column label="封面图" align="center" prop="coverImage" width="120">
        <template #default="scope">
          <el-image v-if="scope.row.coverImage" :src="getFullImageUrl(scope.row.coverImage)" style="width: 80px; height: 50px; object-fit: cover;" />
          <span v-else>-</span>
        </template>
      </el-table-column>
      <el-table-column label="文章标题" align="left" prop="title" :show-overflow-tooltip="true" />
      <el-table-column label="分类" align="center" prop="categoryName" width="120" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">已发布</el-tag>
          <el-tag v-else type="info">草稿</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="发布时间" align="center" prop="publishTime" width="160">
        <template #default="scope">
          <span>{{ parseTime(scope.row.publishTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:article:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:article:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改文章对话框 -->
    <el-dialog :title="title" v-model="open" width="900px" append-to-body>
      <el-form ref="articleRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="24">
            <el-form-item label="文章标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入文章标题" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章分类" prop="categoryId">
              <el-select v-model="form.categoryId" placeholder="请选择分类" style="width: 100%">
                <el-option v-for="item in categoryList" :key="item.categoryId" :label="item.categoryName" :value="item.categoryId" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="0">草稿</el-radio>
                <el-radio label="1">已发布</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="封面图片来源" prop="coverImageSourceType">
              <el-radio-group v-model="form.coverImageSourceType" @change="handleCoverImageSourceTypeChange">
                <el-radio label="upload">本地上传</el-radio>
                <el-radio label="link">外部链接</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="封面图" prop="coverImage">
              <image-upload v-if="form.coverImageSourceType === 'upload'" v-model="form.coverImage" />
              <el-input v-else v-model="form.coverImage" placeholder="请输入封面图URL地址" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="文章摘要" prop="summary">
              <el-input v-model="form.summary" type="textarea" :rows="3" placeholder="请输入文章摘要" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="文章内容" prop="content">
              <editor v-model="form.content" :min-height="300" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="作者" prop="author">
              <el-input v-model="form.author" placeholder="请输入作者" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="来源" prop="source">
              <el-input v-model="form.source" placeholder="请输入文章来源" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="发布时间" prop="publishTime">
              <el-date-picker v-model="form.publishTime" type="datetime" placeholder="选择发布时间" style="width: 100%" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="是否置顶" prop="isTop">
              <el-radio-group v-model="form.isTop">
                <el-radio label="0">否</el-radio>
                <el-radio label="1">是</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <template #footer>
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Article">
import { listArticle, getArticle, delArticle, addArticle, updateArticle } from '@/api/cms/article'
import { listAllCategory } from '@/api/cms/category'

const { proxy } = getCurrentInstance()

// 基础URL
const baseUrl = import.meta.env.VITE_APP_BASE_API

// 获取完整图片URL
function getFullImageUrl(url) {
  if (!url) return ''
  if (url.startsWith('http')) return url
  return baseUrl + url
}

const articleList = ref([])
const categoryList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref('')
const queryRef = ref(null)
const articleRef = ref(null)

const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
  title: undefined,
  categoryId: undefined,
  status: undefined,
})

const form = ref({})

const rules = ref({
  title: [{ required: true, message: '文章标题不能为空', trigger: 'blur' }],
  categoryId: [{ required: true, message: '文章分类不能为空', trigger: 'change' }],
  status: [{ required: true, message: '状态不能为空', trigger: 'change' }],
})

function getList() {
  loading.value = true
  listArticle(queryParams.value).then(response => {
    articleList.value = response.data?.list || []
    total.value = response.data?.total || 0
    loading.value = false
  }).catch(() => {
    loading.value = false
  })
}

function getCategoryList() {
  listAllCategory().then(response => {
    categoryList.value = response.data || response.list || []
  })
}

function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

function resetQuery() {
  queryRef.value.resetFields()
  handleQuery()
}

function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.articleId)
  single.value = selection.length !== 1
  multiple.value = !selection.length
}

function handleAdd() {
  reset()
  open.value = true
  title.value = '添加文章'
}

function handleUpdate(row) {
  reset()
  const articleId = row.articleId || ids.value[0]
  getArticle(articleId).then(response => {
    form.value = response.data || {}
    open.value = true
    title.value = '修改文章'
  })
}

function handleCoverImageSourceTypeChange(val) {
  form.value.coverImage = ''
}

function handleDelete(row) {
  const articleIds = row.articleId ? [row.articleId] : ids.value
  proxy.$modal.confirm('是否确认删除文章编号为"' + articleIds + '"的数据项？').then(function() {
    return delArticle(articleIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitForm() {
  articleRef.value.validate(valid => {
    if (valid) {
      if (form.value.articleId != undefined) {
        updateArticle(form.value).then(response => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addArticle(form.value).then(response => {
          proxy.$modal.msgSuccess('新增成功')
          open.value = false
          getList()
        })
      }
    }
  })
}

function cancel() {
  open.value = false
  reset()
}

function reset() {
  form.value = {
    articleId: undefined,
    title: undefined,
    categoryId: undefined,
    coverImage: undefined,
    coverImageSourceType: 'upload',
    summary: undefined,
    content: undefined,
    source: undefined,
    author: undefined,
    publishTime: undefined,
    status: '0',
    isTop: '0',
  }
  articleRef.value?.resetFields()
}

function parseTime(time) {
  if (!time) return ''
  const date = new Date(time)
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}`
}

getList()
getCategoryList()
</script>
