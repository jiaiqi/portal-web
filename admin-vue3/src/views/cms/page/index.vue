<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:page:add']">新增</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="pageList">
      <el-table-column label="ID" align="center" prop="pageId" width="80" />
      <el-table-column label="页面名称" align="left" prop="pageName" />
      <el-table-column label="页面标识" align="center" prop="pageKey" width="150" />
      <el-table-column label="操作" align="center" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:page:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:page:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" v-model="open" width="800px" append-to-body>
      <el-form ref="pageRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="页面名称" prop="pageName">
          <el-input v-model="form.pageName" placeholder="请输入页面名称" />
        </el-form-item>
        <el-form-item label="页面标识" prop="pageKey">
          <el-input v-model="form.pageKey" placeholder="请输入页面标识" />
        </el-form-item>
        <el-form-item label="内容">
          <el-input v-model="form.content" type="textarea" :rows="15" placeholder="请输入页面内容（支持HTML）" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { listPage, getPage, addPage, updatePage, delPage } from '@/api/cms/page'
const { proxy } = getCurrentInstance()
const pageList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')
const data = reactive({
  form: {},
  rules: {
    pageName: [{ required: true, message: '页面名称不能为空', trigger: 'blur' }],
    pageKey: [{ required: true, message: '页面标识不能为空', trigger: 'blur' }]
  }
})
const { form, rules } = toRefs(data)
function getList() {
  loading.value = true
  listPage().then(res => {
    pageList.value = res.list || []
    loading.value = false
  })
}
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加单页'
}
function handleUpdate(row) {
  reset()
  getPage(row.pageId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改单页'
  })
}
function submitForm() {
  proxy.$refs['pageRef'].validate(valid => {
    if (valid) {
      if (form.value.pageId) {
        updatePage(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addPage(form.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          open.value = false
          getList()
        })
      }
    }
  })
}
function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除该单页？').then(() => {
    return delPage(row.pageId)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}
function cancel() {
  open.value = false
  reset()
}
function reset() {
  form.value = {
    pageId: undefined,
    pageName: undefined,
    pageKey: undefined,
    content: undefined
  }
}
getList()
</script>
