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

// 提取相对路径（去掉域名和接口前缀）
const getRelativePath = (url) => {
  if (!url) return ''
  // 如果已经是相对路径，直接返回
  if (url.startsWith('/')) return url
  // 如果是完整URL，提取路径部分
  if (url.startsWith('http')) {
    try {
      const urlObj = new URL(url)
      return urlObj.pathname
    } catch (e) {
      // 如果URL格式不正确，尝试手动提取
      const match = url.match(/https?:\/\/[^/]+(.+)/)
      return match ? match[1] : url
    }
  }
  // 如果以 localhost 开头（后端配置问题）
  if (url.includes('localhost:')) {
    const parts = url.split('/')
    const publicIndex = parts.indexOf('public')
    if (publicIndex !== -1) {
      return '/' + parts.slice(publicIndex).join('/')
    }
    return '/' + url
  }
  return url
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
      // 获取原始URL
      const rawUrl = data.url || data.fileName
      if (!rawUrl) {
        ElMessage.error('上传成功但未获取到图片地址')
        return
      }
      // 转换为相对路径保存
      const relativeUrl = getRelativePath(rawUrl)
      const name = data.fileName || data.newFileName || file.name
      // insertFn 参数: url, alt, href
      // 这里传入完整URL用于预览，但实际保存时会处理
      const previewUrl = import.meta.env.VITE_APP_BASE_API + relativeUrl
      insertFn(previewUrl, name, previewUrl)
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

// 处理HTML内容，将完整URL转换为相对路径
const processHtml = (html) => {
  if (!html) return html
  const baseUrl = import.meta.env.VITE_APP_BASE_API
  // 替换图片src
  html = html.replace(new RegExp(`src="${baseUrl}([^"]+)"`, 'g'), 'src="$1"')
  html = html.replace(new RegExp(`src='${baseUrl}([^']+)'`, 'g'), "src='$1'")
  // 替换链接href
  html = html.replace(new RegExp(`href="${baseUrl}([^"]+)"`, 'g'), 'href="$1"')
  html = html.replace(new RegExp(`href='${baseUrl}([^']+)'`, 'g'), "href='$1'")
  return html
}

// 处理HTML内容，将相对路径转换为完整URL（用于显示）
const restoreHtml = (html) => {
  if (!html) return html
  const baseUrl = import.meta.env.VITE_APP_BASE_API
  // 替换图片src - 只替换以/开头的路径
  html = html.replace(/src="(\/[^"]+)"/g, `src="${baseUrl}$1"`)
  html = html.replace(/src='(\/[^']+)'/g, `src="${baseUrl}$1"`)
  // 替换链接href
  html = html.replace(/href="(\/[^"]+)"/g, `href="${baseUrl}$1"`)
  html = html.replace(/href='(\/[^']+)'/g, `href="${baseUrl}$1"`)
  return html
}

watch(() => props.modelValue, (val) => {
  if (val !== valueHtml.value) {
    // 将相对路径转换为完整URL用于显示
    valueHtml.value = restoreHtml(val)
  }
}, { immediate: true })

watch(valueHtml, (val) => {
  // 将完整URL转换为相对路径保存
  const processedHtml = processHtml(val)
  emit('update:modelValue', processedHtml)
})

const handleCreated = (editor) => {
  editorRef.value = editor
}

const handleChange = (editor) => {
  const html = editor.getHtml()
  // 将完整URL转换为相对路径保存
  const processedHtml = processHtml(html)
  emit('update:modelValue', processedHtml)
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
