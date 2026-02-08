<script setup lang="ts">
const router = useRouter()
</script>

<template>
  <main class="mx-auto px-4 max-w-[1200px] py-10 text-center text-teal-700 dark:text-gray-200">
    <div text-4xl>
      <div i-carbon-warning inline-block />
    </div>
    <div>Not found</div>
    <div>
      <button text-sm btn m="3 t8" @click="router.back()">
        Back
      </button>
    </div>
  </main>
</template>
