<script setup lang="ts">
interface Props {
  items: { name: string; path?: string }[]
}

defineProps<Props>()
</script>

<template>
  <div class="breadcrumb-container mb-4">
    <div class="mx-auto px-4 max-w-[1200px]">
      <div class="flex items-center text-sm text-gray-500 py-3">
        <template v-for="(item, index) in items" :key="index">
          <NuxtLink
            v-if="item.path"
            :to="item.path"
            class="hover:text-[#c31f1f] transition-colors"
          >
            {{ item.name }}
          </NuxtLink>
          <span v-else class="text-[#c31f1f] font-medium">
            {{ item.name }}
          </span>
          <span v-if="index < items.length - 1" class="mx-2">/</span>
        </template>
      </div>
    </div>
  </div>
</template>

<style scoped>
.breadcrumb-container {
  background: #fafafa;
}
</style>
