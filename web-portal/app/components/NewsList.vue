<script setup lang="ts">
interface NewsItem {
  id: string | number
  title: string
  date: string
  link: string
  image?: string
}

defineProps<{
  title: string
  items: NewsItem[]
  moreLink: string
}>()
</script>

<template>
  <div class="bg-white">
    <div class="mb-4 pb-3 border-b border-gray-200 flex items-center justify-between">
      <div class="flex gap-2 items-center">
        <span class="rounded bg-red-700 h-5 w-1" />
        <h2 class="text-lg text-gray-800 font-bold">
          {{ title }}
        </h2>
      </div>
      <NuxtLink :to="moreLink" class="text-sm text-gray-500 flex gap-1 transition-colors items-center hover:text-red-700">
        更多
        <div class="i-carbon-chevron-right h-4 w-4" />
      </NuxtLink>
    </div>
    <div class="space-y-4">
      <NuxtLink
        v-for="item in items"
        :key="item.id"
        :to="item.link"
        class="group flex gap-4"
      >
        <div v-if="item.image" class="rounded flex-shrink-0 h-20 w-32 overflow-hidden">
          <img :src="item.image" :alt="item.title" class="h-full w-full transition-transform duration-300 object-cover group-hover:scale-105">
        </div>
        <div class="flex-1 min-w-0">
          <h3 class="text-sm text-gray-800 mb-2 transition-colors line-clamp-2 group-hover:text-red-700">
            {{ item.title }}
          </h3>
          <p class="text-xs text-gray-400">
            {{ item.date }}
          </p>
        </div>
      </NuxtLink>
    </div>
  </div>
</template>
