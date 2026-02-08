<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAddSection" v-hasPermi="['cms:about:add']">新增栏目</el-button>
      </el-col>
    </el-row>
    <el-table v-loading="loading" :data="sectionList">
      <el-table-column label="ID" align="center" prop="sectionId" width="80" />
      <el-table-column label="栏目标识" align="left" prop="sectionKey" />
      <el-table-column label="栏目名称" align="left" prop="sectionName" />
      <el-table-column label="栏目类型" align="center" prop="sectionType" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.sectionType === 'richText'" type="primary">富文本</el-tag>
          <el-tag v-else type="success">列表</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
      <el-table-column label="状态" align="center" prop="status" width="100">
        <template #default="scope">
          <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
          <el-tag v-else type="info">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" width="280">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdateSection(scope.row)" v-hasPermi="['cms:about:edit']">修改</el-button>
          <el-button link type="primary" icon="Document" @click="handleEditContent(scope.row)" v-if="scope.row.sectionType === 'richText'" v-hasPermi="['cms:about:edit']">内容</el-button>
          <el-button link type="primary" icon="List" @click="handleManageArticles(scope.row)" v-if="scope.row.sectionType === 'list'" v-hasPermi="['cms:about:edit']">文章</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDeleteSection(scope.row)" v-hasPermi="['cms:about:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog :title="sectionTitle" v-model="sectionOpen" width="600px" append-to-body>
      <el-form ref="sectionRef" :model="sectionForm" :rules="sectionRules" label-width="100px">
        <el-form-item label="栏目名称" prop="sectionName">
          <el-input v-model="sectionForm.sectionName" placeholder="请输入栏目名称" />
        </el-form-item>
        <el-form-item label="栏目标识" prop="sectionKey">
          <el-input v-model="sectionForm.sectionKey" placeholder="请输入栏目标识" :disabled="!!sectionForm.sectionId" />
        </el-form-item>
        <el-form-item label="栏目类型" prop="sectionType">
          <el-radio-group v-model="sectionForm.sectionType">
            <el-radio label="richText">富文本</el-radio>
            <el-radio label="list">列表</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="sectionForm.sortOrder" :min="0" :max="999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="sectionForm.status">
            <el-radio label="1">启用</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitSectionForm">确 定</el-button>
          <el-button @click="sectionOpen = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog :title="contentTitle" v-model="contentOpen" width="800px" append-to-body>
      <el-form ref="contentRef" :model="contentForm" :rules="contentRules" label-width="100px">
        <el-form-item label="栏目内容" prop="content">
          <el-input v-model="contentForm.content" type="textarea" :rows="10" placeholder="请输入栏目内容" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitContentForm">确 定</el-button>
          <el-button @click="contentOpen = false">取 消</el-button>
        </div>
      </template>
    </el-dialog>

    <el-dialog :title="articleTitle" v-model="articleOpen" width="900px" append-to-body>
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button type="primary" plain icon="Plus" @click="handleAddArticle">新增文章</el-button>
        </el-col>
      </el-row>
      <el-table v-loading="articleLoading" :data="articleList">
        <el-table-column label="ID" align="center" prop="articleId" width="80" />
        <el-table-column label="文章标题" align="left" prop="title" />
        <el-table-column label="排序" align="center" prop="sortOrder" width="80" />
        <el-table-column label="状态" align="center" prop="status" width="100">
          <template #default="scope">
            <el-tag v-if="scope.row.status === '1'" type="success">启用</el-tag>
            <el-tag v-else type="info">禁用</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="180">
          <template #default="scope">
            <el-button link type="primary" icon="Edit" @click="handleUpdateArticle(scope.row)">修改</el-button>
            <el-button link type="primary" icon="Delete" @click="handleDeleteArticle(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <el-dialog :title="articleDialogTitle" v-model="articleDialogOpen" width="600px" append-to-body>
      <el-form ref="articleRef" :model="articleForm" :rules="articleRules" label-width="100px">
        <el-form-item label="文章标题" prop="title">
          <el-input v-model="articleForm.title" placeholder="请输入文章标题" />
        </el-form-item>
        <el-form-item label="文章内容" prop="content">
          <el-input v-model="articleForm.content" type="textarea" :rows="10" placeholder="请输入文章内容" />
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="articleForm.sortOrder" :min="0" :max="999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="articleForm.status">
            <el-radio label="1">启用</el-radio>
            <el-radio label="0">禁用</el-radio>
          </el-radio-group>
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
import { listSection, getSection, addSection, updateSection, delSection } from '@/api/cms/about'
import { listAboutArticle, getAboutArticle, addAboutArticle, updateAboutArticle, delAboutArticle } from '@/api/cms/about'
const { proxy } = getCurrentInstance()
const sectionList = ref([])
const articleList = ref([])
const sectionOpen = ref(false)
const contentOpen = ref(false)
const articleOpen = ref(false)
const articleDialogOpen = ref(false)
const loading = ref(true)
const articleLoading = ref(true)
const sectionTitle = ref('')
const contentTitle = ref('')
const articleTitle = ref('')
const articleDialogTitle = ref('')
const currentSectionKey = ref(null)

const sectionData = reactive({
  form: {},
  rules: {
    sectionName: [{ required: true, message: '栏目名称不能为空', trigger: 'blur' }],
    sectionKey: [{ required: true, message: '栏目标识不能为空', trigger: 'blur' }],
    sectionType: [{ required: true, message: '栏目类型不能为空', trigger: 'change' }]
  }
})
const contentData = reactive({
  form: {},
  rules: {
    content: [{ required: true, message: '栏目内容不能为空', trigger: 'blur' }]
  }
})
const articleData = reactive({
  form: {},
  rules: {
    title: [{ required: true, message: '文章标题不能为空', trigger: 'blur' }],
    content: [{ required: true, message: '文章内容不能为空', trigger: 'blur' }]
  }
})
const { form: sectionForm, rules: sectionRules } = toRefs(sectionData)
const { form: contentForm, rules: contentRules } = toRefs(contentData)
const { form: articleForm, rules: articleRules } = toRefs(articleData)

function getSectionList() {
  loading.value = true
  listSection().then(res => {
    sectionList.value = res.data?.list || []
    loading.value = false
  })
}

function getArticleList(sectionKey) {
  articleLoading.value = true
  listAboutArticle({ sectionKey }).then(res => {
    articleList.value = res.data || res.list || []
    articleLoading.value = false
  })
}

function handleAddSection() {
  resetSectionForm()
  sectionOpen.value = true
  sectionTitle.value = '添加栏目'
}

function handleUpdateSection(row) {
  resetSectionForm()
  getSection(row.sectionId).then(res => {
    sectionForm.value = res.data || res
    sectionOpen.value = true
    sectionTitle.value = '修改栏目'
  })
}

function handleDeleteSection(row) {
  proxy.$modal.confirm('是否确认删除该栏目？').then(() => {
    return delSection(row.sectionId)
  }).then(() => {
    getSectionList()
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function handleEditContent(row) {
  resetContentForm()
  getSection(row.sectionId).then(res => {
    const data = res.data || res
    contentForm.value = {
      sectionId: data.sectionId,
      content: data.content
    }
    contentOpen.value = true
    contentTitle.value = '编辑内容 - ' + row.sectionName
  })
}

function handleManageArticles(row) {
  currentSectionKey.value = row.sectionKey
  getArticleList(row.sectionKey)
  articleOpen.value = true
  articleTitle.value = '文章管理 - ' + row.sectionName
}

function handleAddArticle() {
  resetArticleForm()
  articleDialogOpen.value = true
  articleDialogTitle.value = '新增文章'
}

function handleUpdateArticle(row) {
  resetArticleForm()
  getAboutArticle(row.articleId).then(res => {
    articleForm.value = res.data || res
    articleDialogOpen.value = true
    articleDialogTitle.value = '修改文章'
  })
}

function handleDeleteArticle(row) {
  proxy.$modal.confirm('是否确认删除该文章？').then(() => {
    return delAboutArticle(row.articleId)
  }).then(() => {
    getArticleList(currentSectionKey.value)
    proxy.$modal.msgSuccess('删除成功')
  }).catch(() => {})
}

function submitSectionForm() {
  proxy.$refs['sectionRef'].validate(valid => {
    if (valid) {
      if (sectionForm.value.sectionId) {
        updateSection(sectionForm.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          sectionOpen.value = false
          getSectionList()
        })
      } else {
        addSection(sectionForm.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          sectionOpen.value = false
          getSectionList()
        })
      }
    }
  })
}

function submitContentForm() {
  proxy.$refs['contentRef'].validate(valid => {
    if (valid) {
      updateSection(contentForm.value).then(() => {
        proxy.$modal.msgSuccess('修改成功')
        contentOpen.value = false
        getSectionList()
      })
    }
  })
}

function submitArticleForm() {
  proxy.$refs['articleRef'].validate(valid => {
    if (valid) {
      articleForm.value.sectionKey = currentSectionKey.value
      if (articleForm.value.articleId) {
        updateAboutArticle(articleForm.value).then(() => {
          proxy.$modal.msgSuccess('修改成功')
          articleDialogOpen.value = false
          getArticleList(currentSectionKey.value)
        })
      } else {
        addAboutArticle(articleForm.value).then(() => {
          proxy.$modal.msgSuccess('新增成功')
          articleDialogOpen.value = false
          getArticleList(currentSectionKey.value)
        })
      }
    }
  })
}

function resetSectionForm() {
  sectionForm.value = {
    sectionId: undefined,
    sectionName: undefined,
    sectionKey: undefined,
    sectionType: 'richText',
    sortOrder: 0,
    status: '1'
  }
  proxy.resetForm('sectionRef')
}

function resetContentForm() {
  contentForm.value = {
    sectionId: undefined,
    content: undefined
  }
  proxy.resetForm('contentRef')
}

function resetArticleForm() {
  articleForm.value = {
    articleId: undefined,
    sectionKey: undefined,
    title: undefined,
    content: undefined,
    sortOrder: 0,
    status: '1'
  }
  proxy.resetForm('articleRef')
}

getSectionList()
</script>
