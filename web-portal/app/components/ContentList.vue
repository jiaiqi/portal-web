<script setup lang="ts">
interface ListItem {
  id: number
  title: string
  date: string
  image?: string
}

interface Props {
  items: ListItem[]
  basePath?: string
}

withDefaults(defineProps<Props>(), {
  basePath: '/news'
})

// 获取完整图片URL
function getFullImageUrl(url: string | undefined) {
  if (!url) return ''
  if (url.startsWith('http')) return url
  if (url.startsWith('/')) {
    const config = useRuntimeConfig()
    return (config.public.apiBase || 'http://localhost:8080') + url
  }
  return url
}
</script>

<template>
  <div class="content-list">
    <div class="ant-list">
      <NuxtLink
        v-for="item in items"
        :key="item.id"
        :to="`${basePath}/${item.id}`"
        class="ant-list-item"
      >
        <div class="ant-list-item-meta">
          <div class="ant-list-item-meta-avatar">
            <div v-if="item.image" class="image-wrapper">
              <img :src="getFullImageUrl(item.image)" :alt="item.title" />
            </div>
            <div v-else class="image-placeholder"></div>
          </div>
          <div class="ant-list-item-meta-content">
            <h4 class="ant-list-item-meta-title">
              <h1 class="title">{{ item.title }}</h1>
            </h4>
            <div class="ant-list-item-meta-description">
              <p class="date">{{ item.date }}</p>
            </div>
          </div>
        </div>
      </NuxtLink>
    </div>
    <slot />
  </div>
</template>

<style scoped>
.content-list {
  padding: 30px 0;
}

.ant-list-item {
  padding: 15px 0;
  border-bottom: 1px solid #f0f0f0;
  cursor: pointer;
  transition: all 0.3s;
}

.ant-list-item:hover .title {
  color: #c00;
}

.ant-list-item-meta {
  display: flex;
  align-items: flex-start;
}

.ant-list-item-meta-avatar {
  width: 180px;
  flex-shrink: 0;
  margin-right: 15px;
}

.image-wrapper {
  width: 180px;
  height: 110px;
  overflow: hidden;
}

.image-wrapper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.image-placeholder {
  width: 180px;
  height: 110px;
}

.ant-list-item-meta-content {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.title {
  font-size: 16px;
  font-weight: normal;
  color: #333;
  margin: 0;
  line-height: 1.5;
  cursor: pointer;
  transition: all 0.5s;
}

.date {
  font-size: 12px;
  color: #999;
  text-align: right;
  margin: 10px 0 0;
}
</style>
