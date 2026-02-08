<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="栏目名称" prop="sectionName">
        <el-input v-model="queryParams.sectionName" placeholder="请输入栏目名称" clearable style="width: 240px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 240px">
          <el-option label="启用" value="1" />
          <el-option label="禁用" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:about:add']">新增</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sectionList">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="sectionId" width="80" />
      <el-table-column label="栏目标识" align="center" prop="sectionKey" width="120" />
      <el-table-column label="栏目名称" align="left" prop="sectionName" />
      <el-table-column label="栏目类型" align="center" prop="sectionType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.sectionType === 'richText'" type="success">富文本</el-tag>
          <el-tag v-else type="warning">列表</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:about:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:about:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- 添加/修改对话框 -->
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="sectionRef" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="栏目标识" prop="sectionKey">
              <el-input v-model="form.sectionKey" placeholder="请输入栏目标识" :disabled="form.sectionId != undefined" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="栏目名称" prop="sectionName">
              <el-input v-model="form.sectionName" placeholder="请输入栏目名称" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="栏目类型" prop="sectionType">
              <el-radio-group v-model="form.sectionType" :disabled="form.sectionId != undefined">
                <el-radio label="richText">富文本</el-radio>
                <el-radio label="list">列表</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排序" prop="sortOrder">
              <el-input-number v-model="form.sortOrder" :min="0" :max="999" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="1">启用</el-radio>
                <el-radio label="0">禁用</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="form.sectionType === 'richText'">
          <el-col :span="24">
            <el-form-item label="内容" prop="content">
              <editor v-model="form.content" :min-height="400" />
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

<script setup name="AboutSection">
import { listSection, getSection, addSection, updateSection, delSection } from '@/api/cms/about'

const { proxy } = getCurrentInstance()

const sectionList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const total = ref(0)
const title = ref('')
const queryRef = ref(null)
const sectionRef = ref(null)

const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
  sectionName: undefined,
  status: undefined
})

const form = ref({})

const rules = ref({
  sectionKey: [{ required: true, message: '栏目标识不能为空', trigger: 'blur' }],
  sectionName: [{ required: true, message: '栏目名称不能为空', trigger: 'blur' }],
  sectionType: [{ required: true, message: '栏目类型不能为空', trigger: 'change' }],
  status: [{ required: true, message: '状态不能为空', trigger: 'change' }]
})

function getList() {
  loading.value = true
  listSection(queryParams.value).then(response => {
    sectionList.value = response.data?.list || []
    total.value = response.data?.total || 0
    loading.value = false
  }).catch(() => {
    loading.value = false
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

function handleAdd() {
  reset()
  open.value = true
  title.value = '添加栏目'
}

function handleUpdate(row) {
  reset()
  getSection(row.sectionId).then(response => {
    form.value = response.data || {}
    open.value = true
    title.value = '修改栏目'
  })
}

function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除栏目"' + row.sectionName + '"？').then(function() {
    return delSection(row.sectionId)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitForm() {
  sectionRef.value.validate(valid => {
    if (valid) {
      if (form.value.sectionId != undefined) {
        updateSection(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addSection(form.value).then(() => {
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
    sectionId: undefined,
    sectionKey: undefined,
    sectionName: undefined,
    sectionType: 'richText',
    content: undefined,
    sortOrder: 0,
    status: '1'
  }
}

getList()
</script>
