<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['cms:banner:add']">新增</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="bannerList">
      <el-table-column label="ID" align="center" prop="bannerId" width="80" />
      <el-table-column label="图片" align="center" prop="image" width="200">
        <template #default="scope">
          <el-image v-if="scope.row.image" :src="scope.row.image" style="width: 180px; height: 60px; object-fit: cover;" />
        </template>
      </el-table-column>
      <el-table-column label="标题" align="left" prop="title" />
      <el-table-column label="链接" align="left" prop="linkUrl" :show-overflow-tooltip="true" />
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="180" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['cms:banner:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['cms:banner:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="title" v-model="open" width="600px" append-to-body>
      <el-form ref="bannerRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入标题" />
        </el-form-item>
        <el-form-item label="图片" prop="image">
          <el-input v-model="form.image" placeholder="请输入图片URL" />
        </el-form-item>
        <el-form-item label="链接">
          <el-input v-model="form.linkUrl" placeholder="请输入链接地址" />
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
import { listBanner, getBanner, addBanner, updateBanner, delBanner } from '@/api/cms/banner'

const { proxy } = getCurrentInstance()

const bannerList = ref([])
const open = ref(false)
const loading = ref(true)
const title = ref('')

const data = reactive({
  form: {},
  rules: {
    image: [{ required: true, message: '图片不能为空', trigger: 'blur' }]
  }
})

const { form, rules } = toRefs(data)

function getList() {
  loading.value = true
  listBanner().then(res => {
    bannerList.value = res || []
    loading.value = false
  })
}

function handleAdd() {
  reset()
  open.value = true
  title.value = '添加轮播图'
}

function handleUpdate(row) {
  reset()
  getBanner(row.bannerId).then(res => {
    form.value = res
    open.value = true
    title.value = '修改轮播图'
  })
}

function submitForm() {
  proxy.$refs['bannerRef'].validate(valid => {
    if (valid) {
      if (form.value.bannerId) {
        updateBanner(form.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          open.value = false
          getList()
        })
      } else {
        addBanner(form.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          open.value = false
          getList()
        })
      }
    }
  })
}

function handleDelete(row) {
  proxy.$modal.confirm('是否确认删除该轮播图？').then(() => {
    return delBanner(row.bannerId)
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
    bannerId: undefined,
    title: undefined,
    image: undefined,
    linkUrl: undefined,
    sortOrder: 0,
    status: '1'
  }
}

getList()
</script>
