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
      <el-table-column label="操作" align="center" width="360">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdateSpecial(scope.row)" v-hasPermi="['cms:special:edit']">修改</el-button>
          <el-button link type="primary" icon="Document" @click="handleManageArticles(scope.row)" v-hasPermi="['cms:special:edit']">文章</el-button>
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

    <!-- 文章管理对话框 -->
    <el-dialog title="文章管理" v-model="articleOpen" width="900px" append-to-body>
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button type="primary" plain icon="Plus" @click="handleAddArticle">添加文章</el-button>
        </el-col>
      </el-row>
      <el-table v-loading="articleLoading" :data="articleList">
        <el-table-column label="ID" align="center" prop="id" width="80" />
        <el-table-column label="文章标题" align="left" prop="article.title" />
        <el-table-column label="栏目" align="left" prop="categoryName" width="120">
          <template #default="scope">
            {{ scope.row.category ? scope.row.category.categoryName : '-' }}
          </template>
        </el-table-column>
        <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
        <el-table-column label="操作" align="center" width="100">
          <template #default="scope">
            <el-button link type="primary" icon="Delete" @click="handleDeleteArticle(scope.row)">移除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <!-- 添加文章对话框 -->
    <el-dialog title="添加文章" v-model="articleDialogOpen" width="800px" append-to-body>
      <el-form ref="articleRef" :model="articleForm" label-width="100px">
        <!-- 文章来源选择 -->
        <el-form-item label="文章来源">
          <el-radio-group v-model="articleForm.sourceType">
            <el-radio label="existing">从文章库选择</el-radio>
            <el-radio label="new">新建文章</el-radio>
          </el-radio-group>
        </el-form-item>

        <!-- 从文章库选择 -->
        <template v-if="articleForm.sourceType === 'existing'">
          <el-form-item label="选择文章">
            <el-select v-model="articleForm.articleId" filterable remote :remote-method="searchArticles" placeholder="请输入文章标题搜索" style="width: 100%">
              <el-option v-for="item in articleOptions" :key="item.articleId" :label="item.title" :value="item.articleId" />
            </el-select>
          </el-form-item>
        </template>

        <!-- 新建文章 -->
        <template v-if="articleForm.sourceType === 'new'">
          <el-form-item label="文章标题">
            <el-input v-model="articleForm.title" placeholder="请输入文章标题" />
          </el-form-item>
          <el-form-item label="文章摘要">
            <el-input v-model="articleForm.summary" type="textarea" :rows="3" placeholder="请输入文章摘要" />
          </el-form-item>
          <el-form-item label="封面图片来源">
            <el-radio-group v-model="articleForm.coverImageSourceType">
              <el-radio label="upload">本地上传</el-radio>
              <el-radio label="link">外部链接</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="封面图">
            <image-upload v-if="articleForm.coverImageSourceType === 'upload'" v-model="articleForm.coverImage" />
            <el-input v-else v-model="articleForm.coverImage" placeholder="请输入封面图URL地址" />
          </el-form-item>
          <el-form-item label="内容类型">
            <el-radio-group v-model="articleForm.contentType">
              <el-radio label="editor">编辑器</el-radio>
              <el-radio label="link">外部链接</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item v-if="articleForm.contentType === 'editor'" label="文章内容">
            <editor v-model="articleForm.content" :min-height="300" />
          </el-form-item>
          <el-form-item v-if="articleForm.contentType === 'link'" label="外部链接">
            <el-input v-model="articleForm.externalLink" placeholder="请输入外部链接URL" />
          </el-form-item>
          <el-form-item label="作者">
            <el-input v-model="articleForm.author" placeholder="请输入作者" />
          </el-form-item>
          <el-form-item label="来源">
            <el-input v-model="articleForm.source" placeholder="请输入文章来源" />
          </el-form-item>
          <el-form-item label="发布时间">
            <el-date-picker v-model="articleForm.publishTime" type="datetime" placeholder="选择发布时间" style="width: 100%" />
          </el-form-item>
        </template>

        <!-- 公共字段 -->
        <el-form-item label="所属栏目">
          <el-select v-model="articleForm.categoryId" placeholder="请选择栏目（可选）" style="width: 100%">
            <el-option v-for="item in categoryList" :key="item.categoryId" :label="item.categoryName" :value="item.categoryId" />
          </el-select>
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="articleForm.sortOrder" :min="0" :max="999" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitArticleForm">确 定</el-button>
          <el-button @click="articleDialogOpen = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { listSpecial, getSpecial, addSpecial, updateSpecial, delSpecial, listSpecialArticles, addSpecialArticle, delSpecialArticle } from '@/api/cms/special'
import { listSpecialCategory, getSpecialCategory, addSpecialCategory, updateSpecialCategory, delSpecialCategory } from '@/api/cms/specialCategory'
import { listArticle, addArticle } from '@/api/cms/article'
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

// 文章管理相关
const articleOpen = ref(false)
const articleDialogOpen = ref(false)
const articleLoading = ref(false)
const articleList = ref([])
const articleOptions = ref([])
const articleData = reactive({
  form: {
    sourceType: 'existing' // 默认从文章库选择
  }
})
const { form: articleForm } = toRefs(articleData)

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

// 文章管理方法
function handleManageArticles(row) {
  currentSpecialId.value = row.specialId
  getArticleList(row.specialId)
  getCategoryList(row.specialId)
  articleOpen.value = true
}

function getArticleList(specialId) {
  articleLoading.value = true
  listSpecialArticles(specialId).then(res => {
    articleList.value = res.data?.list || res.list || []
    articleLoading.value = false
  })
}

function handleAddArticle() {
  resetArticleForm()
  articleDialogOpen.value = true
}

function handleDeleteArticle(row) {
  proxy.$modal.confirm('是否确认从专题中移除该文章？').then(() => {
    return delSpecialArticle(row.id)
  }).then(() => {
    getArticleList(currentSpecialId.value)
    proxy.$modal.msgSuccess('移除成功')
  }).catch(() => {})
}

function searchArticles(query) {
  if (query) {
    listArticle({ title: query, pageNum: 1, pageSize: 20 }).then(res => {
      articleOptions.value = res.data?.list || res.list || []
    })
  }
}

function submitArticleForm() {
  // 根据来源类型设置验证规则
  if (articleForm.value.sourceType === 'existing') {
    if (!articleForm.value.articleId) {
      proxy.$modal.msgError('请选择文章')
      return
    }
    // 从文章库选择
    const data = {
      specialId: currentSpecialId.value,
      articleId: articleForm.value.articleId,
      categoryId: articleForm.value.categoryId,
      sortOrder: articleForm.value.sortOrder || 0
    }
    addSpecialArticle(data).then(() => {
      proxy.$modal.msgSuccess('添加成功')
      articleDialogOpen.value = false
      getArticleList(currentSpecialId.value)
    })
  } else {
    // 新建文章 - 验证必填项
    if (!articleForm.value.title) {
      proxy.$modal.msgError('请输入文章标题')
      return
    }
    // 根据内容类型验证
    if (articleForm.value.contentType === 'link' && !articleForm.value.externalLink) {
      proxy.$modal.msgError('请输入外部链接')
      return
    }
    // 清理外部链接，去除反引号和多余空格
    const cleanExternalLink = articleForm.value.externalLink ? articleForm.value.externalLink.replace(/[`\s]/g, '') : undefined
    const articleData = {
      title: articleForm.value.title,
      summary: articleForm.value.summary,
      coverImageSourceType: articleForm.value.coverImageSourceType || 'upload',
      coverImage: articleForm.value.coverImage,
      contentType: articleForm.value.contentType || 'editor',
      content: articleForm.value.content,
      externalLink: cleanExternalLink,
      author: articleForm.value.author,
      source: articleForm.value.source,
      publishTime: articleForm.value.publishTime,
      status: '1'
    }
    addArticle(articleData).then(res => {
      const articleId = res.data?.articleId || res.articleId
      if (articleId) {
        // 再将文章添加到专题
        const specialArticleData = {
          specialId: currentSpecialId.value,
          articleId: articleId,
          categoryId: articleForm.value.categoryId,
          sortOrder: articleForm.value.sortOrder || 0
        }
        return addSpecialArticle(specialArticleData)
      }
    }).then(() => {
      proxy.$modal.msgSuccess('新建文章并添加到专题成功')
      articleDialogOpen.value = false
      getArticleList(currentSpecialId.value)
    })
  }
}

function resetArticleForm() {
  articleForm.value = {
    sourceType: 'existing',
    articleId: undefined,
    title: undefined,
    summary: undefined,
    coverImageSourceType: 'upload',
    coverImage: undefined,
    contentType: 'editor',
    content: undefined,
    externalLink: undefined,
    author: undefined,
    source: undefined,
    publishTime: undefined,
    categoryId: undefined,
    sortOrder: 0
  }
  articleOptions.value = []
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
