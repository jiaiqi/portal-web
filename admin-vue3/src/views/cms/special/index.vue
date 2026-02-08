<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:special:add']">新增</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="specialList">
      <el-table-column label="ID" align="center" prop="specialId" width="80" />
      <el-table-column label="专题名称" align="left" prop="title" />
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:special:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:special:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="specialRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="专题名称" prop="title">
          <el-input v-model="form.title" placeholder="请输入专题名称" />
        </el-form-item>
        <el-form-item label="描述">
          <el-input v-model="form.description" type="textarea" placeholder="请输入描述" />
        </el-form-item>
        <el-form-item label="封面">
          <el-input v-model="form.coverImage" placeholder="请输入封面图URL" />
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
import { listSpecial, getSpecial, addSpecial, updateSpecial, delSpecial } from '@/api/cms/special'
const { proxy } = getCurrentInstance()
const specialList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')
const data = reactive({
  form: {},
  rules: {
    title: [{ required: true, message: '专题名称不能为空', trigger: 'blur' }]
  }
})
const { form, rules } = toRefs(data)
function getList() {
  loading.value = true
  listSpecial().then(res => {
    specialList.value = res.data || res.list|| []
    loading.value = false
  })
}
function handleAdd() {
  reset()
  open.value = true
  title.value = '添加专题'
}
function handleUpdate(row) {
  reset()
  getSpecial(row.specialId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改专题'
  })
}
function submitForm() {
  proxy.$refs['specialRef'].validate(valid => {
    if (valid) {
      if (form.value.specialId) {
        updateSpecial(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addSpecial(form.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          open.value = false
          getList()
        })
      }
    }
  })
}
function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除该专题？').then(() => {
    return delSpecial(row.specialId)
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
    specialId: undefined,
    title: undefined,
    description: undefined,
    coverImage: undefined,
    sortOrder: 0,
    status: '1'
  }
}
getList()
</script>
