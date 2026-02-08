<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:navigation:add']">新增</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="navigationList">
      <el-table-column label="ID" align="center" prop="navId" width="80" />
      <el-table-column label="导航名称" align="left" prop="navName" />
      <el-table-column label="导航路径" align="left" prop="navPath" :show-overflow-tooltip="true" />
      <el-table-column label="导航类型" align="center" prop="navType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.navType === 'internal'" type="primary">内部链接</el-tag>
          <el-tag v-else type="success">外部链接</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="打开方式" align="center" prop="navTarget" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.navTarget === '_self'" type="info">当前页</el-tag>
          <el-tag v-else type="warning">新标签页</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="是否固定" align="center" prop="isFixed" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.isFixed === '1'" type="danger">是</el-tag>
          <el-tag v-else type="success">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:navigation:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:navigation:remove']" :disabled="scope.row.isFixed === '1'">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="navigationRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="导航名称" prop="navName">
          <el-input v-model="form.navName" placeholder="请输入导航名称" />
        </el-form-item>
        <el-form-item label="导航路径" prop="navPath">
          <el-input v-model="form.navPath" placeholder="请输入导航路径" />
        </el-form-item>
        <el-form-item label="导航类型" prop="navType">
          <el-radio-group v-model="form.navType">
            <el-radio label="internal">内部链接</el-radio>
            <el-radio label="external">外部链接</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="打开方式" prop="navTarget">
          <el-radio-group v-model="form.navTarget">
            <el-radio label="_self">当前页</el-radio>
            <el-radio label="_blank">新标签页</el-radio>
          </el-radio-group>
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
import { listNavigation, getNavigation, addNavigation, updateNavigation, delNavigation } from '@/api/cms/navigation'
const { proxy } = getCurrentInstance()
const navigationList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')
const data = reactive({
  form: {},
  rules: {
    navName: [{ required: true, message: '导航名称不能为空', trigger: 'blur' }],
    navPath: [{ required: true, message: '导航路径不能为空', trigger: 'blur' }]
  }
})
const { form, rules } = toRefs(data)

function getList() {
  loading.value = true
  listNavigation().then(res => {
    navigationList.value = res.data || res.list || []
    loading.value = false
  })
}

function handleAdd() {
  reset()
  open.value = true
  title.value = '添加导航'
}

function handleUpdate(row) {
  reset()
  getNavigation(row.navId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改导航'
  })
}

function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除名称为"' + row.navName + '"的数据项？').then(function() {
    return delNavigation(row.navId)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitForm() {
  proxy.$refs['navigationRef'].validate(valid => {
    if (valid) {
      if (form.value.navId) {
        updateNavigation(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addNavigation(form.value).then(() => {
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
    navId: undefined,
    navName: undefined,
    navPath: undefined,
    navType: 'internal',
    navTarget: '_self',
    sortOrder: 0,
    status: '1'
  }
  proxy.resetForm('navigationRef')
}

getList()
</script>
