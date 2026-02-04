<script setup lang="ts">
defineProps<{
  title: string
  menuItems: MenuItem[]
  basePath: string
}>()

const route = useRoute()

interface MenuItem {
  name: string
  path: string
}

function isActive(path: string) {
  return route.path === path
}
</script>

<template>
  <div class="flex-shrink-0 w-52">
    <div class="mb-4 pl-3 border-l-4 border-[#c41e3a]">
      <h2 class="text-lg text-gray-800 font-bold">
        {{ title }}
      </h2>
    </div>
    <nav class="border border-gray-200 rounded overflow-hidden">
      <NuxtLink
        v-for="item in menuItems"
        :key="item.path"
        :to="item.path"
        class="text-sm px-4 py-3 border-b border-gray-100 block transition-all duration-200 last:border-b-0"
        :class="isActive(item.path)
          ? 'bg-[#c41e3a] text-white'
          : 'text-gray-700 hover:bg-gray-50 hover:text-[#c41e3a]'
        "
      >
        {{ item.name }}
      </NuxtLink>
    </nav>
  </div>
</template>
