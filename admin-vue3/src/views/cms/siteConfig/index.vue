<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:siteConfig:add']">新增</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="configList">
      <el-table-column label="ID" align="center" prop="configId" width="80" />
      <el-table-column label="配置名称" align="left" prop="configName" />
      <el-table-column label="配置键" align="left" prop="configKey" />
      <el-table-column label="配置值" align="left" prop="configValue" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" width="180">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:siteConfig:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:siteConfig:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="configRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="配置名称" prop="configName">
          <el-input v-model="form.configName" placeholder="请输入配置名称" />
        </el-form-item>
        <el-form-item label="配置键" prop="configKey">
          <el-input v-model="form.configKey" placeholder="请输入配置键" :disabled="!!form.configId" />
        </el-form-item>
        <el-form-item label="配置值" prop="configValue">
          <el-input v-model="form.configValue" type="textarea" :rows="5" placeholder="请输入配置值" />
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
import { listSiteConfig, getSiteConfig, addSiteConfig, updateSiteConfig, delSiteConfig } from '@/api/cms/siteConfig'
const { proxy } = getCurrentInstance()
const configList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')
const data = reactive({
  form: {},
  rules: {
    configName: [{ required: true, message: '配置名称不能为空', trigger: 'blur' }],
    configKey: [{ required: true, message: '配置键不能为空', trigger: 'blur' }],
    configValue: [{ required: true, message: '配置值不能为空', trigger: 'blur' }]
  }
})
const { form, rules } = toRefs(data)

function getList() {
  loading.value = true
  listSiteConfig().then(res => {
    configList.value = res.data || res.list || []
    loading.value = false
  })
}

function handleAdd() {
  reset()
  open.value = true
  title.value = '添加网站配置'
}

function handleUpdate(row) {
  reset()
  getSiteConfig(row.configId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改网站配置'
  })
}

function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除该配置？').then(() => {
    return delSiteConfig(row.configId)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitForm() {
  proxy.$refs['configRef'].validate(valid => {
    if (valid) {
      if (form.value.configId) {
        updateSiteConfig(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addSiteConfig(form.value).then(() => {
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
    configId: undefined,
    configName: undefined,
    configKey: undefined,
    configValue: undefined
  }
  proxy.resetForm('configRef')
}

getList()
</script>
