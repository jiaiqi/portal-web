<template>
  <div class="bg-gray-50 flex flex-col min-h-screen">
    <AppHeader />
    <main class="flex-1 bg-white">
      <slot />
    </main>
    <AppFooter />
  </div>
</template>
