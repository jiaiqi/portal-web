<script setup lang="ts">
import { getNavigation } from '~/api/navigation'

interface NavItem {
  name: string
  path: string
  target?: string
}

const route = useRoute()
const isMenuOpen = ref(false)
const navItems = ref<NavItem[]>([])

onMounted(() => {
  fetchNavigation()
})

async function fetchNavigation() {
  try {
    const res = await getNavigation()
    navItems.value = res || []
  } catch (error) {
    console.error('获取导航失败:', error)
  }
}

function isActive(path: string) {
  if (path === "/") {
    return route.path === "/"
  }
  return route.path.startsWith(path)
}

function toggleMenu() {
  isMenuOpen.value = !isMenuOpen.value
}

watch(
  () => route.path,
  () => {
    isMenuOpen.value = false
  },
)
</script>

<template>
  <header class="w-full relative z-50">
    <div class="header-top bg-[#F5EEE1] relative z-50">
      <div class="mx-auto px-4 max-w-[1200px]">
        <div class="py-4 flex items-center justify-between">
          <div>
            <div class="flex gap-4 items-center">
              <div class="flex-shrink-0">
                <img src="~/assets/images/logo.png" alt="中国文艺志愿者" class="h-16 w-auto" />
              </div>
              <div class="flex flex-col">
                <h1 class="text-2xl text-gray-900 tracking-wider font-bold">
                  中国文艺志愿者
                </h1>
                <p class="text-xs text-gray-500 tracking-widest mt-1">
                  CHINA LITERARY AND ART VOLUNTEERS
                </p>
              </div>

            </div>
            <p class="text-xs text-gray-700 tracking-widest mt-1">江夏区社工部 江夏区文学艺术界联合会主管 江夏区文艺志愿者协会主办 普生创艺园 海移教育 协办</p>
          </div>

          <button class="lg:hidden p-2 text-gray-600 hover:text-[#c31f1f]" @click="toggleMenu" aria-label="Menu">
            <div class="i-carbon-menu text-2xl" v-if="!isMenuOpen" />
            <div class="i-carbon-close text-2xl" v-else />
          </button>
        </div>
      </div>
    </div>

    <nav class="bg-[#c31f1f] hidden lg:block">
      <div class="mx-auto px-4 max-w-[1200px]">
        <div class="flex h-[50px] items-center">
          <div class="flex items-center w-full justify-between">
            <div class="flex items-center">
              <NuxtLink v-for="item in navItems" :key="item.navPath" :to="item.navPath" :target="item.target"
                class="group text-base text-white px-6 py-3 transition-all duration-200 font-medium">
                <span class="relative">
                  {{ item.name || item.navName || '' }}
                  <span
                    class="absolute -bottom-3 left-0 w-full h-[2px] bg-white transition-transform duration-300 ease-in-out origin-center scale-x-0 group-hover:scale-x-100"
                    :class="{ 'scale-x-100': isActive(item.navPath) }" />
                </span>
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <div
      class="lg:hidden absolute top-full left-0 w-full bg-white shadow-lg overflow-hidden transition-all duration-300 ease-in-out"
      :class="isMenuOpen ? 'max-h-[500px] opacity-100' : 'max-h-0 opacity-0'">
      <div class="py-2 flex flex-col">
        <NuxtLink v-for="item in navItems" :key="item.navPath" :to="item.navPath" :target="item.target"
          class="px-6 py-3 text-gray-700 hover:bg-gray-50 hover:text-[#c31f1f] border-b border-gray-100 last:border-0"
          :class="{
            'text-[#c31f1f] bg-red-50 font-medium': isActive(item.navPath),
          }">
          {{ item.name || item.navName || '' }}
        </NuxtLink>
      </div>
    </div>

    <div v-if="isMenuOpen" class="lg:hidden fixed inset-0 bg-black/50 z-40" @click="isMenuOpen = false" />
  </header>
</template>

<style scoped>
.header-top {
  border-bottom: 1px solid #eee;
}
</style>
