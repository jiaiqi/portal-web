<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:link:add']">新增</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="linkList">
      <el-table-column label="ID" align="center" prop="linkId" width="80" />
      <el-table-column label="链接名称" align="left" prop="linkName" />
      <el-table-column label="链接地址" align="left" prop="linkUrl" :show-overflow-tooltip="true" />
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:link:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:link:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="linkRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="链接名称" prop="linkName">
          <el-input v-model="form.linkName" placeholder="请输入链接名称" />
        </el-form-item>
        <el-form-item label="链接地址" prop="linkUrl">
          <el-input v-model="form.linkUrl" placeholder="请输入链接地址" />
        </el-form-item>
        <el-form-item label="Logo">
          <el-input v-model="form.linkLogo" placeholder="请输入Logo URL" />
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="form.sortOrder" :min="0" :max="999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="form.status">
            <el-radio label="1">启用</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
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
import { listLink, getLink, addLink, updateLink, delLink } from '@/api/cms/link'
const { proxy } = getCurrentInstance()
const linkList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')
const data = reactive({
  form: {},
  rules: {
    linkName: [{ required: true, message: '链接名称不能为空', trigger: 'blur' }],
    linkUrl: [{ required: true, message: '链接地址不能为空', trigger: 'blur' }]
  }
})
const { form, rules } = toRefs(data)
function getList() {
  loading.value = true
  listLink().then(res => {
    linkList.value = res.list || []
    loading.value = false
  })
}
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加友情链接'
}
function handleUpdate(row) {
  reset()
  getLink(row.linkId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改友情链接'
  })
}
function submitForm() {
  proxy.$refs['linkRef'].validate(valid => {
    if (valid) {
      if (form.value.linkId) {
        updateLink(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addLink(form.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          open.value = false
          getList()
        })
      }
    }
  })
}
function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除该友情链接？').then(() => {
    return delLink(row.linkId)
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
    linkId: undefined,
    linkName: undefined,
    linkUrl: undefined,
    linkLogo: undefined,
    sortOrder: 0,
    status: '1'
  }
}
getList()
</script>
