<template>
  <div style="border: 1px solid #ccc">
    <Toolbar
      style="border-bottom: 1px solid #ccc"
      :editor="editorRef"
      :defaultConfig="toolbarConfig"
      :mode="mode"
    />
    <Editor
      :style="{ height: height + 'px', overflowY: 'hidden' }"
      v-model="valueHtml"
      :defaultConfig="editorConfig"
      :mode="mode"
      @onCreated="handleCreated"
      @onChange="handleChange"
    />
  </div>
</template>

<script setup>
import '@wangeditor/editor/dist/css/style.css'
import { Editor, Toolbar } from '@wangeditor/editor-for-vue'
import { getToken } from '@/utils/auth'
import axios from 'axios'

const props = defineProps({
  modelValue: {
    type: String,
    default: ''
  },
  height: {
    type: Number,
    default: 500
  },
  placeholder: {
    type: String,
    default: '请输入内容...'
  },
  mode: {
    type: String,
    default: 'default'
  }
})

const emit = defineEmits(['update:modelValue'])

const editorRef = shallowRef()
const valueHtml = ref('')

const toolbarConfig = {
  excludeKeys: [
    'group-video'
  ]
}

const uploadFile = async (file, insertFn) => {
  const formData = new FormData()
  formData.append('file', file)

  try {
    const response = await axios.post(
      import.meta.env.VITE_APP_BASE_API + '/common/upload',
      formData,
      {
        headers: {
          'Content-Type': 'multipart/form-data',
          Authorization: 'Bearer ' + getToken()
        }
      }
    )

    if (response.data.code === 200) {
      const data = response.data.data || response.data
      // 构建完整的图片URL
      let url = data.url || data.fileName
      if (!url) {
        ElMessage.error('上传成功但未获取到图片地址')
        return
      }
      if (!url.startsWith('http')) {
        url = import.meta.env.VITE_APP_BASE_API + url
      }
      const name = data.fileName || data.newFileName || file.name
      // insertFn 参数: url, alt, href
      insertFn(url, name, url)
    } else {
      ElMessage.error(response.data.msg || '上传失败')
    }
  } catch (error) {
    ElMessage.error('上传失败')
    console.error('Upload error:', error)
  }
}

const editorConfig = {
  placeholder: props.placeholder,
  MENU_CONF: {
    uploadImage: {
      maxFileSize: 10 * 1024 * 1024,
      customUpload(file, insertFn) {
        uploadFile(file, insertFn)
      },
      onExceedSize(file) {
        ElMessage.error('图片大小不能超过 10MB')
      }
    },
    uploadVideo: {
      maxFileSize: 50 * 1024 * 1024,
      customUpload(file, insertFn) {
        uploadFile(file, insertFn)
      },
      onExceedSize(file) {
        ElMessage.error('视频大小不能超过 50MB')
      }
    }
  }
}

watch(() => props.modelValue, (val) => {
  if (val !== valueHtml.value) {
    valueHtml.value = val
  }
}, { immediate: true })

watch(valueHtml, (val) => {
  emit('update:modelValue', val)
})

const handleCreated = (editor) => {
  editorRef.value = editor
}

const handleChange = (editor) => {
  emit('update:modelValue', editor.getHtml())
}

onBeforeUnmount(() => {
  const editor = editorRef.value
  if (editor == null) return
  editor.destroy()
})
</script>

<style scoped>
.w-e-text-container {
  background-color: #fff;
}
</style>
