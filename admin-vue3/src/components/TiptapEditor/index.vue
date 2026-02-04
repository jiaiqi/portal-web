<template>
  <div class="umeditor-wrapper">
    <umo-editor v-bind="options" />
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { UmoEditor } from '@umoteam/editor'
import '@umoteam/editor/style'
import { getToken } from '@/utils/auth'

const props = defineProps({
  modelValue: {
    type: String,
    default: ''
  },
  placeholder: {
    type: String,
    default: '请输入内容...'
  },
  uploadUrl: {
    type: String,
    default: import.meta.env.VITE_APP_BASE_API + '/common/upload'
  }
})

const emit = defineEmits(['update:modelValue'])

// 编辑器内容
const content = ref(props.modelValue)

// 监听外部值变化
watch(() => props.modelValue, (newValue) => {
  if (content.value !== newValue) {
    content.value = newValue
  }
})

// 配置项
const options = ref({
  // 编辑器唯一标识
  editorKey: 'article-editor',
  // 内容
  content: content.value,
  // 语言
  locale: 'zh-CN',
  // 主题
  theme: 'light',
  // 高度
  height: '400px',
  // 最小高度
  minHeight: '300px',
  // 最大高度
  maxHeight: '600px',
  // 是否显示工具栏
  showToolbar: true,
  // 是否显示底部状态栏
  showFooter: false,
  // 是否可编辑
  editable: true,
  // 是否只读
  readOnly: false,
  // 是否支持全屏
  fullscreen: true,
  // 是否支持打印
  print: false,
  // 工具栏配置
  toolbar: {
    // 显示的工具栏项
    // items: [
    //   'bold',
    //   'italic',
    //   'underline',
    //   'strike',
    //   'color',
    //   'highlight',
    //   '|',
    //   'heading',
    //   '|',
    //   'align',
    //   '|',
    //   'bulletList',
    //   'orderedList',
    //   '|',
    //   'link',
    //   'image',
    //   'video',
    //   'table',
    //   '|',
    //   'code',
    //   'codeBlock',
    //   'blockquote',
    //   'horizontalRule',
    //   '|',
    //   'undo',
    //   'redo',
    //   '|',
    //   'fullscreen'
    // ]
  },
  // 图片上传配置
  image: {
    // 是否允许上传
    upload: true,
    // 上传配置
    uploadAction: props.uploadUrl,
    // 上传请求头
    uploadHeaders: {
      Authorization: 'Bearer ' + getToken()
    },
    // 上传字段名
    uploadFieldName: 'file',
    // 上传成功处理
    uploadHandler: (response) => {
      if (response.code === 200) {
        return {
          src: response.url,
          alt: response.fileName || ''
        }
      }
      throw new Error(response.msg || '上传失败')
    }
  },
  // 视频上传配置
  video: {
    upload: true,
    uploadAction: props.uploadUrl,
    uploadHeaders: {
      Authorization: 'Bearer ' + getToken()
    },
    uploadFieldName: 'file',
    uploadHandler: (response) => {
      if (response.code === 200) {
        return {
          src: response.url
        }
      }
      throw new Error(response.msg || '上传失败')
    }
  },
  // 内容变化回调
  onChange: (value) => {
    content.value = value
    emit('update:modelValue', value)
  },
  // 内容更新回调
  onUpdate: (value) => {
    content.value = value
    emit('update:modelValue', value)
  }
})

// 监听内容变化并更新配置
watch(() => props.modelValue, (newValue) => {
  options.value.content = newValue
})
</script>

<style scoped>
.umeditor-wrapper {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  overflow: hidden;
}

.umeditor-wrapper :deep(.umo-editor) {
  min-height: 300px;
}

.umeditor-wrapper :deep(.umo-editor-toolbar) {
  background-color: #f5f7fa;
  border-bottom: 1px solid #dcdfe6;
}

.umeditor-wrapper :deep(.umo-editor-content) {
  padding: 16px;
  min-height: 300px;
}

.umeditor-wrapper :deep(.umo-editor-content img) {
  max-width: 100%;
  height: auto;
  border-radius: 4px;
}

.umeditor-wrapper :deep(.umo-editor-content video) {
  max-width: 100%;
  border-radius: 4px;
}

.umeditor-wrapper :deep(.umo-editor-content table) {
  border-collapse: collapse;
  width: 100%;
  margin: 1em 0;
}

.umeditor-wrapper :deep(.umo-editor-content th),
.umeditor-wrapper :deep(.umo-editor-content td) {
  border: 1px solid #dcdfe6;
  padding: 8px 12px;
  text-align: left;
}

.umeditor-wrapper :deep(.umo-editor-content th) {
  background-color: #f5f7fa;
  font-weight: 600;
}

.umeditor-wrapper :deep(.umo-editor-content blockquote) {
  border-left: 4px solid #dcdfe6;
  padding-left: 16px;
  margin: 1em 0;
  color: #606266;
}

.umeditor-wrapper :deep(.umo-editor-content pre) {
  background-color: #f5f7fa;
  padding: 16px;
  border-radius: 4px;
  overflow-x: auto;
}

.umeditor-wrapper :deep(.umo-editor-content code) {
  background-color: #f5f7fa;
  padding: 2px 6px;
  border-radius: 3px;
  font-family: monospace;
}
</style>
