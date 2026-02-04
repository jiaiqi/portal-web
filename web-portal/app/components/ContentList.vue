<script setup lang="ts">
interface ContentItem {
  id: string | number
  title: string
  date: string
  link: string
}

defineProps<{
  items: ContentItem[]
}>()
</script>

<template>
  <div class="rounded-lg bg-white">
    <div class="divide-gray-100 divide-y">
      <NuxtLink
        v-for="item in items"
        :key="item.id"
        :to="item.link"
        class="group px-6 py-4 flex transition-colors items-center justify-between hover:bg-gray-50"
      >
        <div class="flex flex-1 gap-3 min-w-0 items-center">
          <span class="rounded-full bg-gray-300 flex-shrink-0 h-1.5 w-1.5 transition-colors group-hover:bg-[#c41e3a]" />
          <h3 class="text-sm text-gray-700 truncate transition-colors group-hover:text-[#c41e3a]">
            {{ item.title }}
          </h3>
        </div>
        <span class="text-xs text-gray-400 ml-4 whitespace-nowrap">
          {{ item.date }}
        </span>
      </NuxtLink>
    </div>
  </div>
</template>
