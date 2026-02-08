<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card class="focus-card" v-for="item in focusList" :key="item.focusId">
          <template #header>
            <div class="card-header">
              <span class="focus-name">{{ item.focusName }}</span>
              <el-tag size="small" type="info">{{ item.focusKey }}</el-tag>
            </div>
          </template>

          <div class="focus-content">
            <el-row :gutter="20">
              <el-col :span="12">
                <div class="image-preview">
                  <el-image
                    v-if="item.imageUrl"
                    :src="getFullImageUrl(item.imageUrl)"
                    fit="cover"
                    style="width: 100%; height: 150px; border-radius: 4px;"
                  />
                  <div v-else class="no-image">暂无图片</div>
                </div>
              </el-col>
              <el-col :span="12">
                <div class="focus-info">
                  <p><strong>图片来源：</strong>{{ item.imageSourceType === 'upload' ? '本地上传' : '外部链接' }}</p>
                  <p><strong>链接类型：</strong>{{ item.linkType === 'internal' ? '内部文章' : '外部地址' }}</p>
                  <p><strong>链接值：</strong>{{ item.linkValue || '-' }}</p>
                  <p><strong>打开方式：</strong>{{ item.openType === 'new' ? '新标签页' : '当前页' }}</p>
                </div>
              </el-col>
            </el-row>
          </div>

          <div class="card-footer">
            <el-button type="primary" @click="handleUpdate(item)">编辑</el-button>
            <el-button @click="handleHistory(item)">历史记录</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 编辑对话框 -->
    <el-dialog :title="'编辑 - ' + form.focusName" v-model="open" width="700px" append-to-body>
      <el-form ref="focusRef" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="图片来源" prop="imageSourceType">
          <el-radio-group v-model="form.imageSourceType" @change="handleImageSourceTypeChange">
            <el-radio label="upload">本地上传</el-radio>
            <el-radio label="link">外部链接</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="图片" prop="imageUrl">
          <image-upload v-if="form.imageSourceType === 'upload'" v-model="form.imageUrl" />
          <el-input v-else v-model="form.imageUrl" placeholder="请输入图片URL地址" />
        </el-form-item>

        <el-form-item label="链接类型" prop="linkType">
          <el-radio-group v-model="form.linkType" @change="handleLinkTypeChange">
            <el-radio label="external">外部地址</el-radio>
            <el-radio label="internal">内部文章</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="链接值" prop="linkValue">
          <el-input
            v-if="form.linkType === 'external'"
            v-model="form.linkValue"
            placeholder="请输入外部URL地址"
          />
          <el-select
            v-else
            v-model="form.linkValue"
            filterable
            remote
            :remote-method="searchArticles"
            placeholder="搜索并选择文章"
            style="width: 100%"
          >
            <el-option
              v-for="article in articleOptions"
              :key="article.articleId"
              :label="article.title"
              :value="String(article.articleId)"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="打开方式" prop="openType">
          <el-radio-group v-model="form.openType">
            <el-radio label="new">新标签页</el-radio>
            <el-radio label="current">当前页</el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="修改备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" :rows="2" placeholder="请输入修改备注（可选）" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </template>
    </el-dialog>

    <!-- 历史记录对话框 -->
    <el-dialog title="历史记录" v-model="historyOpen" width="900px" append-to-body>
      <el-table :data="historyList" v-loading="historyLoading">
        <el-table-column label="图片" align="center" width="150">
          <template #default="scope">
            <el-image :src="getFullImageUrl(scope.row.imageUrl)" style="width: 100px; height: 60px; object-fit: cover;" />
          </template>
        </el-table-column>
        <el-table-column label="链接类型" align="center" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.linkType === 'internal'" type="success">内部文章</el-tag>
            <el-tag v-else type="warning">外部地址</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="链接值" prop="linkValue" :show-overflow-tooltip="true" />
        <el-table-column label="打开方式" align="center" width="100">
          <template #default="scope">
            {{ scope.row.openType === 'new' ? '新标签页' : '当前页' }}
          </template>
        </el-table-column>
        <el-table-column label="备注" prop="remark" width="150" :show-overflow-tooltip="true" />
        <el-table-column label="修改时间" align="center" width="160">
          <template #default="scope">
            {{ parseTime(scope.row.createTime) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="120">
          <template #default="scope">
            <el-button link type="primary" @click="handleRestore(scope.row)">恢复</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="historyTotal > 0"
        :total="historyTotal"
        v-model:page="historyQuery.pageNum"
        v-model:limit="historyQuery.pageSize"
        @pagination="getHistoryList"
      />
    </el-dialog>
  </div>
</template>

<script setup name="Focus">
import { listFocus, updateFocus, listHistory, restoreHistory } from '@/api/cms/focus'
import { listArticle } from '@/api/cms/article'

const { proxy } = getCurrentInstance()

const focusList = ref([])
const loading = ref(true)
const open = ref(false)
const historyOpen = ref(false)
const historyLoading = ref(false)
const title = ref('')
const articleOptions = ref([])

const historyList = ref([])
const historyTotal = ref(0)
const currentFocusId = ref(null)

const historyQuery = ref({
  pageNum: 1,
  pageSize: 10,
  focusId: null
})

const form = ref({})
const focusRef = ref(null)

// 基础URL
const baseUrl = import.meta.env.VITE_APP_BASE_API

// 获取完整图片URL
function getFullImageUrl(url) {
  if (!url) return ''
  if (url.startsWith('http')) return url
  return baseUrl + url
}

const rules = ref({
  imageSourceType: [{ required: true, message: '图片来源不能为空', trigger: 'change' }],
  imageUrl: [{ required: true, message: '图片不能为空', trigger: 'blur' }],
  linkType: [{ required: true, message: '链接类型不能为空', trigger: 'change' }],
  linkValue: [{ required: true, message: '链接值不能为空', trigger: 'blur' }],
  openType: [{ required: true, message: '打开方式不能为空', trigger: 'change' }],
})

function getList() {
  loading.value = true
  listFocus().then(response => {
    focusList.value = response.data || response.list || []
    loading.value = false
  })
}

function handleUpdate(row) {
  reset()
  form.value = {
    focusId: row.focusId,
    focusName: row.focusName,
    focusKey: row.focusKey,
    imageUrl: row.imageUrl,
    imageSourceType: row.imageSourceType || 'upload',
    linkType: row.linkType || 'external',
    linkValue: row.linkValue,
    openType: row.openType || 'new',
    remark: ''
  }
  open.value = true
  title.value = '编辑焦点图'

  // 如果是内部文章，加载文章列表
  if (form.value.linkType === 'internal' && form.value.linkValue) {
    loadArticleById(form.value.linkValue)
  }
}

function handleHistory(row) {
  currentFocusId.value = row.focusId
  historyQuery.value.focusId = row.focusId
  historyOpen.value = true
  getHistoryList()
}

function getHistoryList() {
  historyLoading.value = true
  listHistory(historyQuery.value).then(response => {
    historyList.value = response.data?.list || []
    historyTotal.value = response.data?.total || 0
    historyLoading.value = false
  })
}

function handleRestore(row) {
  proxy.$modal.confirm('确定要恢复到该历史版本吗？').then(() => {
    restoreHistory({
      historyId: row.historyId,
      remark: '手动恢复'
    }).then(() => {
      proxy.$modal.msgSuccess('恢复成功')
      getList()
      getHistoryList()
    })
  })
}

function handleImageSourceTypeChange(val) {
  form.value.imageUrl = ''
}

function handleLinkTypeChange(val) {
  form.value.linkValue = ''
  if (val === 'internal') {
    searchArticles('')
  }
}

function searchArticles(query) {
  listArticle({
    pageNum: 1,
    pageSize: 20,
    title: query,
    status: '1'
  }).then(response => {
    articleOptions.value = response.data?.list || []
  })
}

function loadArticleById(articleId) {
  listArticle({
    pageNum: 1,
    pageSize: 1,
    articleId: articleId
  }).then(response => {
    if (response.data?.list && response.data.list.length > 0) {
      articleOptions.value = [response.data.list[0]]
    }
  })
}

function submitForm() {
  focusRef.value.validate(valid => {
    if (valid) {
      updateFocus(form.value).then(() => {
        proxy.$modal.msgSuccess('修改成功')
        open.value = false
        getList()
      })
    }
  })
}

function cancel() {
  open.value = false
  reset()
}

function reset() {
  form.value = {
    focusId: undefined,
    focusName: '',
    focusKey: '',
    imageUrl: '',
    imageSourceType: 'upload',
    linkType: 'external',
    linkValue: '',
    openType: 'new',
    remark: ''
  }
  articleOptions.value = []
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
</script>

<style scoped>
.focus-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.focus-name {
  font-size: 16px;
  font-weight: bold;
}

.focus-content {
  padding: 10px 0;
}

.image-preview {
  background: #f5f5f5;
  border-radius: 4px;
  overflow: hidden;
}

.no-image {
  width: 100%;
  height: 150px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #999;
  background: #f5f5f5;
  border-radius: 4px;
}

.focus-info {
  font-size: 14px;
  line-height: 2;
}

.focus-info p {
  margin: 5px 0;
}

.card-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  padding-top: 15px;
  border-top: 1px solid #eee;
}
</style>
