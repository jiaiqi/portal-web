<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAddSpecial" v-hasPermi="['cms:special:add']">新增专题</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="specialList">
      <el-table-column label="ID" align="center" prop="specialId" width="80" />
      <el-table-column label="专题名称" align="left" prop="title" />
      <el-table-column label="描述" align="left" prop="description" :show-overflow-tooltip="true" />
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="280">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdateSpecial(scope.row)" v-hasPermi="['cms:special:edit']">修改</el-button>
          <el-button link type="primary" icon="Setting" @click="handleManageCategory(scope.row)" v-hasPermi="['cms:special:edit']">栏目</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDeleteSpecial(scope.row)" v-hasPermi="['cms:special:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="specialTitle" v-model="specialOpen" width="600px" append-to-body>
      <el-form ref="specialRef" :model="specialForm" :rules="specialRules" label-width="80px">
        <el-form-item label="专题名称" prop="title">
          <el-input v-model="specialForm.title" placeholder="请输入专题名称" />
        </el-form-item>
        <el-form-item label="描述">
          <el-input v-model="specialForm.description" type="textarea" placeholder="请输入描述" />
        </el-form-item>
        <el-form-item label="封面">
          <el-input v-model="specialForm.coverImage" placeholder="请输入封面图URL" />
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="specialForm.sortOrder" :min="0" :max="999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="specialForm.status">
            <el-radio label="1">启用</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitSpecialForm">确 定</el-button>
          <el-button @click="specialOpen = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog title="栏目管理" v-model="categoryOpen" width="900px" append-to-body>
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button type="primary" plain icon="Plus" @click="handleAddCategory">新增栏目</el-button>
        </el-col>
      </el-row>
      <el-table v-loading="categoryLoading" :data="categoryList">
        <el-table-column label="ID" align="center" prop="categoryId" width="80" />
        <el-table-column label="栏目名称" align="left" prop="categoryName" />
        <el-table-column label="栏目编码" align="left" prop="categoryCode" />
        <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
        <el-table-column label="状态" align="center" prop="status" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
            <el-tag v-else type="info">禁用</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="Edit" @click="handleUpdateCategory(scope.row)">修改</el-button>
            <el-button link type="primary" icon="Delete" @click="handleDeleteCategory(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :title="categoryTitle" v-model="categoryDialogOpen" width="600px" append-to-body>
      <el-form ref="categoryRef" :model="categoryForm" :rules="categoryRules" label-width="100px">
        <el-form-item label="栏目名称" prop="categoryName">
          <el-input v-model="categoryForm.categoryName" placeholder="请输入栏目名称" />
        </el-form-item>
        <el-form-item label="栏目编码" prop="categoryCode">
          <el-input v-model="categoryForm.categoryCode" placeholder="请输入栏目编码" />
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="categoryForm.sortOrder" :min="0" :max="999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="categoryForm.status">
            <el-radio label="1">启用</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitCategoryForm">确 定</el-button>
          <el-button @click="categoryDialogOpen = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { listSpecial, getSpecial, addSpecial, updateSpecial, delSpecial } from '@/api/cms/special'
import { listSpecialCategory, getSpecialCategory, addSpecialCategory, updateSpecialCategory, delSpecialCategory } from '@/api/cms/specialCategory'
const { proxy } = getCurrentInstance()
const specialList = ref([])
const categoryList = ref([])
const specialOpen = ref(false)
const categoryOpen = ref(false)
const categoryDialogOpen = ref(false)
const loading = ref(true)
const categoryLoading = ref(true)
const specialTitle = ref('')
const categoryTitle = ref('')
const currentSpecialId = ref(null)

const specialData = reactive({
  form: {},
  rules: {
    title: [{ required: true, message: '专题名称不能为空', trigger: 'blur' }]
  }
})
const categoryData = reactive({
  form: {},
  rules: {
    categoryName: [{ required: true, message: '栏目名称不能为空', trigger: 'blur' }],
    categoryCode: [{ required: true, message: '栏目编码不能为空', trigger: 'blur' }]
  }
})
const { form: specialForm, rules: specialRules } = toRefs(specialData)
const { form: categoryForm, rules: categoryRules } = toRefs(categoryData)

function getSpecialList() {
  loading.value = true
  listSpecial().then(res => {
    specialList.value = res.data || res.list || []
    loading.value = false
  })
}

function getCategoryList(specialId) {
  categoryLoading.value = true
  listSpecialCategory({ specialId }).then(res => {
    categoryList.value = res.data || res.list || []
    categoryLoading.value = false
  })
}

function handleAddSpecial() {
  resetSpecialForm()
  specialOpen.value = true
  specialTitle.value = '添加专题'
}

function handleUpdateSpecial(row) {
  resetSpecialForm()
  getSpecial(row.specialId).then(res => {
    specialForm.value = res
    specialOpen.value = true
    specialTitle.value = '修改专题'
  })
}

function handleDeleteSpecial(row) {
  proxy.$modal.confirm('是否确认删除该专题？').then(() => {
    return delSpecial(row.specialId)
  }).then(() => {
    getSpecialList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function handleManageCategory(row) {
  currentSpecialId.value = row.specialId
  getCategoryList(row.specialId)
  categoryOpen.value = true
}

function handleAddCategory() {
  resetCategoryForm()
  categoryDialogOpen.value = true
  categoryTitle.value = '添加栏目'
}

function handleUpdateCategory(row) {
  resetCategoryForm()
  getSpecialCategory(row.categoryId).then(res => {
    categoryForm.value = res
    categoryDialogOpen.value = true
    categoryTitle.value = '修改栏目'
  })
}

function handleDeleteCategory(row) {
  proxy.$modal.confirm('是否确认删除该栏目？').then(() => {
    return delSpecialCategory(row.categoryId)
  }).then(() => {
    getCategoryList(currentSpecialId.value)
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitSpecialForm() {
  proxy.$refs['specialRef'].validate(valid => {
    if (valid) {
      if (specialForm.value.specialId) {
        updateSpecial(specialForm.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          specialOpen.value = false
          getSpecialList()
        })
      } else {
        addSpecial(specialForm.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          specialOpen.value = false
          getSpecialList()
        })
      }
    }
  })
}

function submitCategoryForm() {
  proxy.$refs['categoryRef'].validate(valid => {
    if (valid) {
      categoryForm.value.specialId = currentSpecialId.value
      if (categoryForm.value.categoryId) {
        updateSpecialCategory(categoryForm.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          categoryDialogOpen.value = false
          getCategoryList(currentSpecialId.value)
        })
      } else {
        addSpecialCategory(categoryForm.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          categoryDialogOpen.value = false
          getCategoryList(currentSpecialId.value)
        })
      }
    }
  })
}

function resetSpecialForm() {
  specialForm.value = {
    specialId: undefined,
    title: undefined,
    description: undefined,
    coverImage: undefined,
    sortOrder: 0,
    status: '1'
  }
  proxy.resetForm('specialRef')
}

function resetCategoryForm() {
  categoryForm.value = {
    categoryId: undefined,
    specialId: undefined,
    categoryName: undefined,
    categoryCode: undefined,
    sortOrder: 0,
    status: '1'
  }
  proxy.resetForm('categoryRef')
}

getSpecialList()
</script>
