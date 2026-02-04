<script setup lang="ts">
defineProps<{
  title: string
}>()
</script>

<template>
  <div class="p-8 bg-white">
    <h1 class="text-2xl text-gray-900 font-bold mb-8 text-center">
      {{ title }}
    </h1>
    <div class="max-w-none prose prose-gray">
      <slot />
    </div>
  </div>
</template>
